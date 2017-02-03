#!/bin/bash
. ./environment-variables


REPOLIST=`ls repos/`
cd repos

for REPO in $REPOLIST; do
cd $REPO && git pull && cd ..
done

${BASEDIR}/findruby.sh
