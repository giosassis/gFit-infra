FROM --platform=linux/amd64 ubuntu:20.04
FROM jenkins/jenkins:lts

USER root

# Instale as dependências necessárias (incluindo o AWS CLI)
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Volte para o usuário jenkins
USER jenkins
