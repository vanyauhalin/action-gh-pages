#!/bin/sh

set -ue

: "${ACTION_TOKEN:=""}"
: "${ACTION_SERVER_URL:=""}"
: "${ACTION_REPOSITORY:=""}"
: "${ACTION_BRANCH:=""}"
: "${ACTION_CHECK:=1}"
: "${ACTION_RESET:=1}"
: "${ACTION_SHA:=""}"
: "${ACTION_RUN_ID:=0}"

main() {
	status=0

	ACTION_CHECK=$(to_bool "$ACTION_CHECK" 1)
	ACTION_RESET=$(to_bool "$ACTION_RESET" 1)

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

	if [ "$ACTION_CHECK" -eq 1 ]; then
		log "[info] Checking the branch."

		if check; then
			log "[info] The branch is up-to-date."
			return $status
		fi

		log "[info] The branch is not up-to-date."
	fi

	if [ "$ACTION_RESET" -eq 1 ]; then
		log "[info] Resetting the branch."

		reset || status=$?
		if [ $status -ne 0 ]; then
			log "[error] Failed to reset the branch with status '$status'."
			return $status
		fi

		log "[info] Successfully reset the branch."
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

check() {
	if ! git diff --quiet; then
		return 1
	fi

	if ! git diff --cached --quiet; then
		return 1
	fi

	if [ "$(git ls-files --exclude-standard --others | wc -l)" -ne 0 ]; then
		return 1
	fi

	return 0
}

reset() {
	init=$(git rev-list --max-parents=0 HEAD)

	git reset --hard "$init" --quiet
}

commit() {
	bare="$ACTION_SERVER_URL/$ACTION_REPOSITORY"
	head="Update following $(echo "$ACTION_SHA" | cut -c -8)"
	body="Commit: $bare/commit/$ACTION_SHA/\n"
	body="${body}Run: $bare/actions/runs/$ACTION_RUN_ID/\n"
	body="${body}Date: $(date --utc)\n"

	git add .
	git commit --message "$head" --message "$(printf "%b" "$body")" --quiet
	git push --force --quiet
}

to_bool() {
	case "$(printf "%s" "$1" | tr "[:upper:]" "[:lower:]")" in
	yes | y | true | t | 1)
		echo 1
		;;
	no | n | false | f | 0)
		echo 0
		;;
	*)
		# shellcheck disable=SC2086
		echo $2
		;;
	esac
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
