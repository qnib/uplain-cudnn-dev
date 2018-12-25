ARG DOCKER_REGISTRY="docker.io"
ARG FROM_IMG_REPO="qnib"
ARG FROM_IMG_NAME="uplain-cuda-dev"
ARG FROM_IMG_TAG="2018-12-23.2"
FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

ARG CUDNN_VER=v7.4.1.5
ARG CUDA_VER=v9.2
ARG CUDNN_URL=http://people.cs.uchicago.edu/~kauffman/nvidia/cudnn/
RUN apt-get update \
 && apt-get install -y wget \
 && mkdir -p /usr/local/cuda/ \
 && wget -qO - ${CUDNN_URL}/cudnn-${CUDA_VER}-linux-x64-${CUDNN_VER}.tgz |tar xfz - -C /usr/local/cuda/ --strip-components=1
