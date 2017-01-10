#!/bin/bash
. ./environment-variables

cd ${BASEDIR}/brakeman && git pull && gem install brakeman && gem install ruby_parser && gem install ruby2ruby && gem install erubis

grep -R ruby ${REPODIR} | grep -v [V,v]agrant | awk -F '/' '{print $9}' | uniq > ${BASEDIR}/reports/ruby_repos_for_brakeman

BMFILE=`cat ${BASEDIR}/reports/ruby_repos_for_brakeman`


for BM in $BMFILE; do
cd ${REPODIR}/$BM && ${BASEDIR}/brakeman/bin/brakeman -A -n --no-combine-locations --separate-models --absolute-paths -o ${BASEDIR}/reports/$BM.html -o ${BASEIDR}/reports/$BM.json >> ${BASEDIR}/reports/error.log 2>&1 && mail -s " $BM report" brakemanalerts@cryptzero.net < ${BASEDIR}/reports/$BM.html && mail -s "error report" brakemanalerts@cryptzero.net < ${BASEDIR}/reports/error.log && cd ${BASEDIR}
done

