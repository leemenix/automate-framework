# automate-framework
Simple combination of bash and ansible to automate home lab env, build and deployment.
Currently working on Debian (v.10) family distro's (you will need small adaption for Ubuntu)

# Usage

## to build component
./build.sh homelab-demo

script will pack component in .tar.gz file and upload it to remote server

## to deploy component
./deploy.sh homelab-demo

script will remotely execute ansible-playbook agains component main.yml file 

# TBD
- logging !!!
- port scipt to work with RedHat family distro's 
- script bootstrap/inital setup for specific env.
- there should not be any hard coded variable 
- variable name update
- update build only if there is change
- integrate with git
- better documentation
- dedicated playbook repository
- build.sh and deploy.sh help file; usage 


# Version
0.0.2 (29.Jan.2020):
  - build_counter function for increment BuildNumber per new build
  - build is separated on server side in BuildNumber dirs
  - 