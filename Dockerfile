FROM alpine

LABEL org.opencontainers.image.description `Docker image for refresh AWS ECR credentials in kubernetes cluster`

RUN apk update && apk add --update --no-cache \
    git \
    bash \
    curl \
    openssh \
    python3 \
    py3-pip \
    py-cryptography \
    wget \
    curl \
    jq 

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# Install AWSCLI
RUN pip install --upgrade pip && \
    pip install --upgrade awscli

WORKDIR /scripts
COPY scripts/ /scripts

ENTRYPOINT ["bash", "/scripts/entrypoint.sh"]