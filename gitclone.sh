#!/bin/bash

#run environment variables file with your org name and access token variables
. ./environment-variables

#pull list of organization repos
GIT_REPOS=`curl https://api.github.com/orgs/${ORG_NAME}/repos?access_token=${ACCESS_TOKEN}| grep ssh_url | awk -F':' '{print $2,$3}' | sed 's/\ /\:/g' | sed 's/\:\"//g' | sed 's/\"\,//g'`


#document repo list for diff
echo $GIT_REPOS > "${BASEDIR}/reports/repo_list.`echo $(date)`"

#clone repos into repos subdirectory
cd repos
for REPO in $GIT_REPOS; do
git clone $REPO
done

