#!/bin/bash


REPOLIST=`ls repos/`
cd repos

for REPO in $REPOLIST; do
cd $REPO && git pull && cd ..
done

