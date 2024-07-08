#Interview
#what is the differnce between ENV and ARG
#ARG can be pass only through when you are running the build & can not pass while running the container 
#ENV can be passed while running the container

#create a docker file
#nano dockerfile.dev

FROM ubuntu:latest
LABEL name="pammi"
ENV AWS_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE \
    AWS_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY \
    AWS_DEFAULT_REGION=ap-southeast-1
ARG T_VERSION='1.6.6' \
    P_VERSION='1.8.0'
RUN apt update && apt install -y jq net-tools unzip curl wget \
    && apt install -y nginx iputils-ping

RUN wget https://releases.hashicorp.com/terraform/${T_VERSION}/terraform_${T_VERSION}_linux_amd64.zip \
    && wget https://releases.hashicorp.com/packer/${P_VERSION}/packer_${P_VERSION}_linux_amd64.zip \
    && unzip terraform_${T_VERSION}_linux_amd64.zip && unzip packer_${P_VERSION}_linux_amd64.zip \
    && chmod 777 terraform && chmod 777 packer \
    && ./terraform version && ./packer version

# what exactly -g & daemon off will do (this keeps nginx running in the background which means docker container stay active always)
#CMD isto start the nginx container
CMD [ "nginx","-g","daemon off;" ]


#Build image is above dockerfile.dev file
docker build -t pammietl4/custom:v1 -f dockerfile.dev .

#validate the image
docker image ls

#run the image
docker run --rm -d --name app1 -p 8000:8000 pammietl4/custom:v1

#validate the container
docker ps
docker container ls

#enter into the container
docker exec -it app1 bash

#smoke test
curl http://localhost:8000
./terraform version
//packer version

#exit from container
exit

#stop the container
docker stop app1

#how to overright the existing ARG values in the docker file & check the progress of build
docker build -t pammietl4/custom:v2 --progress=plain --build-arg T_VERSION='1.6.6' --build-arg P_VERSION='1.8.0' -f dockerfile.dev . --no-cache

#history
docker history pammietl4/custom:v2

#check the env of the container
docker container exec -it app1 env

#overright the ENV values in the docker file
docker run --rm -d --name app3 -p 8003:8000 -e AWS_ACCESS_KEY=hidden -e AWS_SECRET_KEY=hidden -e AWS_DEFAULT_REGION=hippden pammietl4/custom:v2

#delete the images
docker rmi -f $(docker images -aq)

#why dangling images created by docker
#imagine i've a docker file by using this i've created an image with pammubuntu:v1
#now i've updated the dockerfile & created the image with same name pammubuntu:v1
#in this case 1st image will be dangling image & 2nd image will be latest image

#check the dangling images (means unused images of docker)
docker images -f dangling=true

#delete the dangling images
docker rmi -f $(docker images -f dangling=true -q)

#remove unused images
docker system prune -a


