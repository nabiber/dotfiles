function gcim() {
  local message="${@}"

  if [[ -z "${message}" ]]; then
    echo "USAGE: gcim <message>"
    return 1
  fi

  if [[ "x`git rev-parse --git-dir 2> /dev/null`" != "x" ]]; then
    local branch="`current_branch`"
    local story="`echo "${branch}" | grep '^US[0-9]*-' | sed -e 's:^\(US[0-9]*\)-.*:\1:g'`"
    if [[ "x${story}" != "x" ]]; then
      git commit -m "[${story}] ${message}"
    else
      git commit -m "${message}"
    fi
  else
    echo "You must be under a git repository to use gcim"
    return 1
  fi
}
