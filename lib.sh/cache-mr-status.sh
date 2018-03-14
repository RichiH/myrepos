# Copyright 2018 Paul Wise <pabs3@bonedaddy.net>
# Licensed under the GNU GPL version 2 or later.

# To create an initial cache of the mr status output for each repository or
# to update the existing cache of the mr status output for each repository:
#
# mr --cache status
#
# To incrementally update the cache of the mr status output on repository
# changes and shell exits, add this line to your shell configuration:
#
# . /usr/share/mr.sh/cache-mr-status.sh
#
# To print the status of each repository, using the cache when available:
#
# mr --cached status
#
# To remove the cached output of each repository before running commands:
#
# mr --uncache status
#
# To remove all repositories from the cache without running commands:
#
# rm -rf ~/.mrcache/status
#
# To silence the messages when changing dirs, add this to your shell config:
#
# export MR_CACHE_STATUS_QUIET=1

cache_mr_status () {
	(
		[ -n "$MR_CACHE_STATUS_QUIET" ] ||
		echo "Caching repository status for $1 ..."
		builtin cd -- "$1" &&
		mr --no-recurse --quiet --cache status
	)
	return 0
}

cache_mr_status_exit () {
	[ -n "$MR_CACHE_STATUS_QUIET" ] ||
	echo "Caching repository status for top of $PWD ..."
	mr --no-recurse --quiet --top --cache status 2> /dev/null
	return 0
}

cache_mr_status_chdir () {
	local dir="$1"
	[ -n "$MR_CACHE_STATUS_QUIET" ] ||
	echo "Checking for repositories in $dir ..."
	[ "$PWD" != "$dir" ] &&
	dir="$(builtin cd "$dir" && mr --no-recurse --no-print-action --no-print-subdir --no-print-footer list 2>/dev/null)" &&
	[ "$(mr --no-recurse --no-print-action --no-print-subdir --no-print-footer list 2>/dev/null || true)" != "$dir" ] &&
	cache_mr_status "$dir"
}

cd () {
	local dir="$PWD"
	builtin cd "$@" || return $?
	cache_mr_status_chdir "$dir"
	return 0
}

pushd () {
	local dir="$PWD"
	builtin pushd "$@" || return $?
	cache_mr_status_chdir "$dir"
	return 0
}

popd () {
	local dir="$PWD"
	builtin popd "$@" || return $?
	cache_mr_status_chdir "$dir"
	return 0
}

trap cache_mr_status_exit TERM EXIT
