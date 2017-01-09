#!/bin/bash

sdlc/environment-variables

GIT_REPOS=`curl https://api.github.com/orgs/${ORG_NAME}/repos?access_token=${ACCESS_TOKEN} | grep ssh_url | awk -F':' '{print $2,$3}' | sed 's/\ /\:/g' | sed 's/\:\"//g' | sed 's/\"\,//g'
`
for REPO in $GIT_REPOS; do
git clone $REPO
done
