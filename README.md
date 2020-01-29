# automate-framework
Simple combination of bash and ansible to automate home lab env, build and deployment.

# Usage

## to build component
./build.sh homelab-demo

script will pack component in .tar.gz file and upload it to remote server

## to deploy component
./deploy.sh homelab-demo

script will remotely execute ansible-playbook agains component main.yml file 

# TBD
