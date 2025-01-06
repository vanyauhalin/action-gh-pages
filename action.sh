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

	log "[info] Cloning the repository."

	clone "$dir" || status=$?
	if [ $status -ne 0 ]; then
		log "[error] Failed to clone the repository with status '$status'."
		return $status
	fi

	log "[info] Successfully cloned the repository."

	mv "$dir/.git" .
	rm -rf "$dir"

	git add .

	if git diff-index --quiet HEAD --; then
		log "[info] The repository is up-to-date."
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
	message="Update following $(echo "$ACTION_SHA" | cut -c -8)"

	desc="Commit: $ACTION_SERVER_URL/$ACTION_REPOSITORY/commit/$ACTION_SHA/\n"
	desc="$desc\Run: $ACTION_SERVER_URL/$ACTION_REPOSITORY/actions/runs/$ACTION_RUN_ID/\n"
	desc="$desc\Date: $(date --utc "+%H:%M, %b %-d, %Y")\n"

	git commit --message "$message" --message "$desc" --quiet

	if [ "$ACTION_KEEP" -ne 0 ]; then
		git reset --hard "HEAD~$ACTION_KEEP" --quiet
		git push --force --quiet
	else
		git push --quiet
	fi
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
