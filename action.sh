#!/bin/sh

set -ue

: "${ACTION_TOKEN:=""}"
: "${ACTION_SERVER_URL:=""}"
: "${ACTION_REPOSITORY:=""}"
: "${ACTION_BRANCH:=""}"
: "${ACTION_KEEP:=0}"
: "${ACTION_SHA:=""}"
: "${ACTION_RUN_ID:=0}"

main() {
	status=0

	dir=$(mktemp -d)

	log "[info] Cloning the branch."

	clone "$dir" || status=$?
	if [ $status -ne 0 ]; then
		log "[error] Failed to clone the branch with status '$status'."
		return $status
	fi

	log "[info] Successfully cloned the branch."

	mv "$dir/.git" .
	rm -rf "$dir"

	if git diff-index --quiet HEAD --; then
		log "[info] The branch is up-to-date."
		return $status
	fi

	log "[info] Committing the changes."

	commit || status=$?
	if [ $status -ne 0 ]; then
		log "[error] Failed to commit the changes with status '$status'."
		return $status
	fi

	log "[info] Successfully committed the changes."

	return $status
}

clone() {
	bare="$ACTION_SERVER_URL/$ACTION_REPOSITORY"
	scheme="${bare%%:*}"
	user="$(git config get user.name)"
	password="$ACTION_TOKEN"
	rest="${bare#*://}"

	git clone \
		--branch "$ACTION_BRANCH" \
		--no-checkout \
		--quiet \
		--single-branch \
		"$scheme://$user:$password@$rest" \
		"$1"
}

commit() {
	bare="$ACTION_SERVER_URL/$ACTION_REPOSITORY"
	head="Update following $(echo "$ACTION_SHA" | cut -c -8)"
	body="Commit: $bare/commit/$ACTION_SHA/\n"
	body="${body}Run: $bare/actions/runs/$ACTION_RUN_ID/\n"
	body="${body}Date: $(date --utc "+%H:%M, %b %-d, %Y")\n"

	git add .
	git commit --message "$head" --message "$(printf "%b" "$body")" --quiet

	if [ "$ACTION_KEEP" -eq -1 ]; then
		git push --quiet
		return
	fi

	list=$(git rev-list HEAD | tail -n +2)

	gap=$(echo "$list" | head -n -1 | wc -l)
	if [ "$gap" -le "$ACTION_KEEP" ]; then
		git push --quiet
		return
	fi

	from=$(echo "$list" | tail -n -1)
	to=$(echo "$list" | head -n "+$ACTION_KEEP")

	GIT_SEQUENCE_EDITOR="sed --in-place 's/^pick/drop/'" \
		git rebase --interactive "$from" "$to"

	git push --force --quiet
}

log() {
	m="$1"

	case "$m" in
	"[info]"*)
		p=$(echo "$m" | cut -d" " -f1)
		r=$(echo "$m" | cut -d" " -f2-)
		m="$p  $r"
		;;
	esac

	printf "%b" "$m\n"
}

main "$@"
