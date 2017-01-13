# sdlc
sdlc automation
gitclone.sh is a bash script for pulling all of an organizations repos down via git clone
gitpull.sh pulls updates

https://pypi.python.org/pypi/watchdog

sudo apt-get install curl mailutils
# modify environment-variables.template to add in your variables then save as environment-variables
# setup /opt/${ORGNAME}/sdlc
# setup /opt/${ORGNAME}/sdlc/repos
# setup /opt/${ORGNAME}/sdlc/reports




make sure you have SSH keys setup in Github.
# use ~/.ssh/config for alternate
> Host github.com
>> IdentityFile ~/.ssh/id_rsa

cd ${BASEDIR}/brakeman && git pull && gem install brakeman ruby_parser ruby2ruby erubis


