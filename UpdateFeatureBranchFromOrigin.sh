#!/bin/bash
# Script to copy all code changes from dev to production
###############################################################
# Author        : mukherjee.aniket@gmail.com
# Creation Date : 14.02.2020
# Dependency    : bash should supported. Either execute in github bash or linux system
#                 git needs to be installed
#
# Description   : Script to update feature branch from origin. If feature branch does not exist then it will create new feature branch.
# Execute like  : ./updatefeaturebranchwithOrigin.sh as default origin location C:\aniket\project\git_code and default branch name as kube-skaffold-feature
###############################################################

GITHUB_PROJ=${1:-anikm1987/kube-skaffold.git}
PROJECT_NAME=${2:-kube-skaffold}
BRANCH_NAME=${3:-kube-skaffold-feature}
GITHUB_URL=${4:-github.com}
GITHUB_PROTOCOL=${5:-https}
DELIVERYPATH=$PWD

# to fix the issue with authentication prompt.. 
# The default host for commands like init and clone is still github.com, but this can be affected with the GITHUB_HOST environment variable:
export GITHUB_HOST=${GITHUB_URL}

# Updating feature branch
#==========================
# Open git bash Run it from below location
cd ${DELIVERYPATH}

if [ ! -d "${DELIVERYPATH}" ]; then
    echo "${DELIVERYPATH} does not exist. Creating the folder.."
    mkdir -p ${DELIVERYPATH}
fi


if [ -d "${DELIVERYPATH}/${PROJECT_NAME}" ]; then
    echo "${DELIVERYPATH}/${PROJECT_NAME} already exist, deleting the location"
    rm -rf ${DELIVERYPATH}/${PROJECT_NAME}
fi


# setting global context
git config --global --add hub.host ${GITHUB_URL}     # Note: do not include http or https here
git config --global --add hub.protocol ${GITHUB_PROTOCOL}

#git config --get-all hub.host
#git config --get-all hub.protocol

echo "Cloning git repository into location"
hub clone ${GITHUB_PROJ}
cd ${PROJECT_NAME}/
git remote
git remote -v
git checkout master
git fetch -p origin
git merge origin/master
# to list out the branch
echo "Displaying branches for the github"
git branch -a
count=$(git branch -a | grep ${BRANCH_NAME} | wc -l)
if [ ! $count -eq 0  ]; then
  echo "Checking out branch : ${BRANCH_NAME} for the project.."
  git checkout ${BRANCH_NAME}
  
  echo "Merging latest changes into branch : ${BRANCH_NAME} from master"
  git merge master
  
  echo "Pushing latest changes into Github branch : ${BRANCH_NAME}"
  git push origin ${BRANCH_NAME}

else
	echo "Branch is not present.. Creating a new branch .."
	git checkout -b ${BRANCH_NAME}
	# make some changes...
	git commit -am "Initial sync from master"

	# It's time to fork the repo!
	# (forking repo on GitHub...)
	# git remote add origin git@github.com:YOUR_USER/Spoon-Knife.git

	#hub fork --remote-name origin

	# push the changes to your new remote
	echo "Pushing latest changes into Github branch : ${BRANCH_NAME}"
	git push origin ${BRANCH_NAME}

	# check the CI status for this branch
	#hub ci-status --verbose
fi
cd ..

if [ ! -d "$PWD/${BRANCH_NAME}" ]; then
	echo "Setting up local branch copy for further updates"
	mkdir -p "$PWD/${BRANCH_NAME}"
	cd $PWD/${BRANCH_NAME}
	git clone "${GITHUB_PROTOCOL}://${GITHUB_URL}/${GITHUB_PROJ}.git"
	cd ${PROJECT_NAME}
	git checkout ${BRANCH_NAME}
	git pull
	echo "Branch folder created in $PWD"
else 
	echo "Branch folder exist in $PWD/${BRANCH_NAME}"
fi


