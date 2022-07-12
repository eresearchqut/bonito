FROM nvidia/cuda:11.3.0-base-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  samtools=1.10-3 \
  && rm -rf /var/lib/apt/lists/*

RUN CUDA_VERSION=113 pip3 install numpy~=1.21.5 "protobuf<=3.20.1" requests==2.25.1 onnxruntime==1.11.0 torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0+cu113 ont-bonito-cuda113==0.5.3 -f https://download.pytorch.org/whl/torch_stable.html

RUN bonito download --models
