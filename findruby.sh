#!/bin/bash
## uncomment if baremetal
#. ./environment-variables

#cd ${BASEDIR}/brakeman && git pull && gem install brakeman && gem install ruby_parser && gem install ruby2ruby && gem install erubis

grep -R ruby ${REPODIR} | grep -v [V,v]agrant | awk -F '/' '{print $6}' | uniq > ${BASEDIR}/reports/ruby_repos_for_brakeman

BMFILE=`cat ${BASEDIR}/reports/ruby_repos_for_brakeman`


for BM in $BMFILE; do
cd ${REPODIR}/$BM && brakeman -A -o ${BASEDIR}/reports/$BM.html && mutt -s "$BM report" brakemanalerts@cryptzero.net -a ${BASEDIR}/reports/$BM.html < /dev/null && cd ${BASEDIR} 
done

