FROM ubuntu:latest
LABEL name="pammi"
ENV AWS_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE \
    AWS_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY \
    AWS_DEFAULT_REGION=ap-southeast-1
ARG T_VERSION='1.6.6' \
    P_VERSION='1.8.0'
RUN apt update && apt install -y jq net-tools unzip curl wget \
    && apt install -y nginx iputils-ping

#what exactly -g & daemon off will do (this keeps nginx running in the background which means docker container stay active always)
#CMD isto start the nginx container
#CMD [ "nginx","-g","daemon off;" ]
#-c 4 will ping 4 times
#CMD can be over written by cli (if you give google.com in the CMD but while running you can use youtube.com)
CMD [ "/usr/bin/ping","-c 4","www.google.com" ]