#!/bin/bash
# Script to create github project locally and push it to remote
###############################################################
# Author        : mukherjee.aniket@gmail.com
# Creation Date : 14.02.2020
# Dependency    : bash should supported. Either execute in github bash or linux system
#                 git needs to be installed
#
# Description   : Script to update feature branch from origin
# Execute like  : ./CreateGithubProject.sh <PROJECT_NAME> as default origin location current directory

###############################################################

PROJECT_NAME=${1:-DemoGitProject}
GITHUB_LOC=${2:-github.com}
GITMESSAGE=${3:-Initial-Commit} 
DELIVERYPATH=$PWD


if [ ! -d "${PROJECT_NAME}" ]; then
    echo "FATAL: ${PROJECT_NAME} does not exist. Creating new one..."
    mkdir -p ${PROJECT_NAME}
fi


cd ${PROJECT_NAME}

# setting global context
git config --global --add hub.host ${GITHUB_LOC}     # Note: do not include http or https here
git config --global --add hub.protocol https


# create a repo to host a new project on GitHub
git init
echo "Welcome to ${PROJECT_NAME} project" > ReadMe.md
git add .
git commit -m "${GITMESSAGE}"
# creates a new GitHub repository with the name of the current directory)
hub create
git push -u origin HEAD

git remote -v