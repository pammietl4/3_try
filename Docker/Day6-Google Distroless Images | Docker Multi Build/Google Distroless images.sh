
Google distroless images are extremly light in weight in nature (2mb)

why these images are less in weight (it doesn't contain shell/bash in it)

we can not go & login into the container ( docker exec -it app1 bash)

# these images are using for security practices

# you can not install any packages / softwares on top this images

https://github.com/GoogleContainerTools/distroless


FROM gcr.io/distroless/static-debian11
LABEL name="pammi"
RUN mkdir /app
RUN groupadd appuser1 && useradd -r -g appuser1 appuser1
WORKDIR /app
USER appuser1
ENV AWS_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE \
    AWS_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY \
    AWS_DEFAULT_REGION=ap-southeast-1
ARG T_VERSION='1.6.6' \
    P_VERSION='1.8.0'
RUN apt update && apt install -y jq net-tools unzip curl wget \
    && apt install -y nginx iputils-ping

EXPOSE 80

CMD [ "nginx","-g","daemon off;" ]


