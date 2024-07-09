FROM ubuntu:latest
LABEL name="pammi"
ENV AWS_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE \
    AWS_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY \
    AWS_DEFAULT_REGION=ap-southeast-1

RUN mkdir /app
RUN groupadd appuser && useradd -r -g appuser appuser
WORKDIR /app
USER appuser

COPY index.nginx-debian.html /var/www/html/
COPY scorekeeper.js /var/www/html
ADD  style.css /var/www/html

ADD https://releases.hashicorp.com/terraform/1.9.0/terraform_1.9.0_linux_amd64.zip /var/www/html

ARG T_VERSION='1.6.6' \
    P_VERSION='1.8.0'
RUN apt update && apt install -y jq net-tools unzip curl wget \
    && apt install -y nginx iputils-ping

EXPOSE 80

CMD [ "nginx","-g","daemon off;" ]