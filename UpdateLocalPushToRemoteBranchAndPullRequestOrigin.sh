#!/bin/bash
# Script to github branch with remote
###############################################################
# Author        : mukherjee.aniket@gmail.com
# Creation Date : 13.02.2020
# Dependency    : bash should supported. Either execute in github bash or linux system
#                 git needs to be installed
#
# Description   : Script to update feature branch from origin
# Execute like  : ./UpdateLocalPushToRemoteBranchAndPullRequestOrigin.sh '<commitMsg>' <prjName> <branchName> 
###############################################################

GITMESSAGE=$1 # "Change code. Refer README.md for further details"
PROJECT_NAME=${2:-kube-skaffold}
BRANCH_NAME=${3:-kube-skaffold-feature}
DELIVERYPATH=$PWD/${BRANCH_NAME}/${PROJECT_NAME}


if [ ! -d "${DELIVERYPATH}" ]; then
    echo "FATAL: ${DELIVERYPATH} does not exist. Exiting..."
    exit 1
fi

# Updating feature branch
#==========================
# Open git bash Run it from below location
cd ${DELIVERYPATH}



echo "Checking out branch : ${BRANCH_NAME} and pulling updates from github"
git checkout ${BRANCH_NAME}
git pull
git add .
git status

echo -n "Are you happy with the git status? perform git commit [y/N]: "
read answ
if [ "${answ^^*}" != "Y" ]; then
  echo "You have chosen to stop the execution, exiting...."
  exit 1
else
  if [ ! -z "${GITMESSAGE}" ]; then
    #echo ${GITMESSAGE}
    git commit -m "${GITMESSAGE}"
    echo "Pushing latest changes into Github branch : ${BRANCH_NAME}"
    git push origin ${BRANCH_NAME}
  else
    echo "Please enter the commit message : "
    read GITMESSAGE
    git commit -m ${GITMESSAGE}
    echo "Pushing latest changes into Github branch : ${BRANCH_NAME}"
    git push origin ${BRANCH_NAME}
  fi
  echo "creating pull request to merge branch changes with master node"
  hub pull-request -m "${GITMESSAGE}"  # -r <reviewers> -a <assignee>
  echo "Merge request raised.."
fi


