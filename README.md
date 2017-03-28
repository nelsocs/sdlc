# sdlc
sdlc automation
gitclone.sh is a bash script for pulling all of an organizations repos down via git clone
gitpull.sh pulls updates

#### Step 1

git clone git@github.com:nelsocs/sdlc.git
cd sdlc

#### Step 2

###### Modify environment-variables.template to add in your variables then save as environment-variables (IF LOCAL INSTALL - INCOMPLETE INSTRUCTIONS AT THIS TIME)
Change ${ORGNAME_HERE} to the name of the organization you are running this for.  This will become /opt/{ORGNAME}/sdlc
Change ${TOKEN_HERE} to the personal token for Github
and save as "environment-variables"

###### Modify Dockerfile.template
Change ${TOKEN_HERE} to the personal token for Github
Change ${ORGNAME_HERE} to the name of the organization you are running this for.  This will become /opt/{ORGNAME}/sdlc
and save as "Dockerfile"

###### Ensure you have Github access via SSH.  This key's public key should be setup in your Github profile
Copy your ~/.ssh/id_rsa to the sdlc directory
###### Copy your known hosts (with github contained).
Copy your ~/.ssh/known_hosts to the sdlc directory

#### Step 3
sudo docker build -t static-analyzer .

sudo docker run -d -i -v $(pwd)/reports:/opt/distil/sdlc/reports --name static-analyzer static-anlyzer

sudo docker exec -i -t static-analyzer '/etc/init.d/postfix restart'

#### Step 4
###### Clone repos & run brakeman against Rails
sudo docker exec -i -t static-analyzer /opt/distil/sdlc/gitclone.sh

###### Your reports will be in your local sdlc/reports directory

#### Step 5
###### Cleanup
sudo docker stop $(sudo docker ps -a -q)
sudo docker rm $(sudo docker ps -a -q)
sudo docker rmi $(sudo docker images)




