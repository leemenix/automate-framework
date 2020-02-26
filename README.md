# automate-framework
Simple combination of bash and ansible to automate home lab env, build and deployment.
Currently working on Debian (v.10) family distro's (you will need small adaption for Ubuntu)
All suggestions more than welcome

# Usage

## adapt your environment variables
there is .global_vars file which atend to hold all your server variables

## setup remote user (NOPASSWD)
TBD


## to build component
./build.sh homelab-demo

script will pack component in .tar.gz file and upload it to remote server

## to deploy component
./deploy.sh homelab-demo

deployment with ansible-playbook:
	- if there main.yml in root of component name,
	  script will remotely execute ansible-playbook agains component main.yml file 
deployment with docker build:
	- if there Dockerfile in root of component name, 
	  scritp will remotely execute docker build . against Dockerfile

# TBD
- user deploy need to be in docker group!!!
- logging !!!
- port scipt to work with RedHat family distro's 
- script bootstrap/inital setup for specific env.
- there should not be any hard coded variable 
- variables name update
- update build only if there is change
- integrate with git
- better documentation
- dedicated playbook repository
- build.sh and deploy.sh help file; usage 
- add ability to deploy specific version of component
- build / deploy multiple component in one cycle (component dependency)
- should be able to build Docker images on management server


# Version
0.0.3 (17.Feb.2020)
  functions:
  - prototype deployment with Dockerfile and ansible-playbook

  build-packages:
  - homelab-bootrap-lib
  - homelab-media-server (plex)
  - homelab-docker
  - homelab-demo
  - homelab-docker-hello-world-img (Dockerfile)
  - homelab-traefik

0.0.2 (29.Jan.2020):
  functions:
  - build_counter function for increment BuildNumber per new build
  - build is separated on server side in BuildNumber dirs
