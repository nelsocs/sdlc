GIT_REPOS=`curl https://api.github.com/orgs/distil/repos?access_token=9a2df77dbabda5447478c6352da6c93e663232fc | grep ssh_url | awk -F':' '{print $2,$3}' | sed 's/\ /\:/g' | sed 's/\:\"//g' | sed 's/\"\,//g'`
cd repos
for REPO in $GIT_REPOS; do
git clone $REPO
done

