# sdlc
# sdlc automation
# gitclone.sh is a bash script for pulling all of an organizations repos down via git clone
# gitpull.sh pulls updates

Step 1

git clone git@github.com:nelsocs/sdlc.git
cd sdlc

Step 2

Modify environment-variables.template to add in your variables then save as environment-variables (IF LOCAL INSTALL - INCOMPLETE INSTRUCTIONS AT THIS TIME)
# Change ${ORGNAME_HERE} to the name of the organization you are running this for.  This will become /opt/{ORGNAME}/sdlc
# Change ${TOKEN_HERE} to the personal token for Github
and save as "environment-variables"

Modify Dockerfile.template
# Change ${TOKEN_HERE} to the personal token for Github
# Change ${ORGNAME_HERE} to the name of the organization you are running this for.  This will become /opt/{ORGNAME}/sdlc
and save as "Dockerfile"

#ensure you have Github access via SSH.  This key's public key should be setup in your Github profile
Copy your ~/.ssh/id_rsa to the sdlc directory

Step 3
sudo docker build -t static-analyzer .
sudo docker run -d -i --name static-analyzer static-anlyzer

Step 4
# execute brakeman scripts
sudo docker exec -i -t static-analyzer ./findruby.sh

