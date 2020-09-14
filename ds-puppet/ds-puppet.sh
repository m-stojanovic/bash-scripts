#/usr/bin/env bash
st_pwd=$(pwd)
cd "$(dirname "$0")"
. config/settings
. functions

# require action and branch name
action=$1
branch=$2
updrepos=( ${@:3} )
[ -z "$action" ] && { echo "You need to specify action (init, update)!"; exit 1; }
[ -z "$branch" ] && { echo "You need to specify branch name!"; exit 1; }

# special handling for .
if [ "$branch" == "." ]; then
  path=${st_pwd/#"$datadir/"}
  IFS='/' read -r -a elements <<< "$path"
  branch="${elements[0]}"
  [ -z "$branch" ] && { echo "To use . you need to be in one of dirs inside '${datadir}'. You've run it in '${st_pwd}'"; exit 1; }
  [ "${#updrepos[@]}" -eq 0 ] && [ ! -z "${elements[1]}" ] && updrepos=( ${elements[1]} )
fi

env_check=0
for env in "${envs[@]}"; do
  if [ "$env" == "$branch" ]; then
    env_check=1
    break
  fi
done
[ $env_check == 0 ] && { echo -e "There's no env like '${branch}'. Allowed envs are: ${envs[@]}"; exit 1; }

[ -d "${datadir}" ] || { echo "Directory '${datadir}' doesn't exist, aborting!"; exit 1; }
cd "${datadir}" || { echo "Can't access '${datadir}' directory, aborting!"; exit 1; }

# init only - need to create branch dir
if [ "${action}" == "init" ]; then
  [ -d "${branch}" ] && { echo "Directory '${datadir}/${branch}' already exists - can't init it, aborting!"; exit 1; }
  mkdir "${branch}" || { echo "Can't create '${datadir}/${branch}' directory, aborting!"; exit 1; }
fi

cd "${branch}" || { echo "Can't access '${datadir}/${branch}' directory, aborting!"; exit 1; }
echo -e "Working with env '${branch}'\n"
case "${action}" in
  "init")
    git_clone_single_branch "${branch}" "${repo_configuration}" || { echo "Error occured when cloning branch '${branch}' of '${repo_configuration}', aborting!"; exit 1; }
    mapp_repos=( $( get_modules_repos "${repo_url_and_project}" "${puppetfile_path}" ) )
    for modrepo in "${mapp_repos[@]}"; do
      git_clone_single_branch "${branch}" "${modrepo}" || { echo "Error occured when cloning branch '${branch}' of '${modrepo}', aborting!"; exit 1; } 
    done
  ;;
  "update")
    if [ -z "${updrepos}" ]; then
      git_pull "${repo_configuration_name}" || { echo "Error occured when pulling changes for branch '${branch}' of '${repo_configuration}', aborting!"; exit 1; }
      echo # blank line
      mapp_repos=( $( get_modules_repos "${repo_url_and_project}" "${puppetfile_path}" ) )
      for modrepo in "${mapp_repos[@]}"; do
        reponame=$( get_repo_name $modrepo )
        if [ -d "$reponame" ]; then
          git_pull "${reponame}" || { echo "Error occured when pulling changes for '${reponame}', aborting!"; exit 1; }
        else
          git_clone_single_branch "${branch}" "${modrepo}" || { echo "Error occured when cloning branch '${branch}' of '${modrepo}', aborting!"; exit 1; } 
        fi
      done
    else
      for reponame in "${updrepos[@]}"; do
          git_pull "${reponame}" || { echo "Error occured when pulling changes for '${reponame}', aborting!"; exit 1; }
      done
    fi
  ;;
  *) echo "Action can be 'init' or 'update'." ;;
esac
