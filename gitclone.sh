#!/bin/bash

#run environment variables file with your org name and access token variables
. ./environment-variables

#pull list of organization repos
#GIT_REPOS=`curl https://api.github.com/orgs/${ORGNAME}/repos?access_token=${ACCESS_TOKEN}| grep ssh_url | awk -F':' '{print $2,$3}' | sed 's/\ /\:/g' | sed 's/\:\"//g' | sed 's/\"\,//g'`
curl --request GET --data "access_token=${ACCESS_TOKEN}&per_page=100&page=1" https://api.github.com/orgs/${ORGNAME}/repos | grep ssh_url | awk -F':' '{print $2,$3}' | sed 's/\ /\:/g' | sed 's/\:\"//g' | sed 's/\"\,//g' > ${BASEDIR}/reports/repolist

curl --request GET --data "access_token=${ACCESS_TOKEN}&per_page=100&page=2" https://api.github.com/orgs/${ORGNAME}/repos | grep ssh_url | awk -F':' '{print $2,$3}' | sed 's/\ /\:/g' | sed 's/\:\"//g' | sed 's/\"\,//g' >> ${BASEDIR}/reports/repolist

GIT_REPOS=`cat ${BASEDIR}/reports/repolist`

#document repo list for diff
cp ${BASEDIR}/reports/repolist ${BASEDIR}/reports/repolist.$(date +%m%d%Y)

#clone repos into repos subdirectory
cd repos
for REPO in $GIT_REPOS; do
git clone $REPO
done



${BASEDIR}/findruby.sh
