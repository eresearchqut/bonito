FROM nvidia/cuda:11.3.0-runtime-ubuntu20.04


RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  && rm -rf /var/lib/apt/lists/*

RUN CUDA_VERSION=113 pip3 install numpy==1.21.0 ont-bonito-cuda113==0.5.1 torch==1.10.0+cu113 torchvision==0.11.0+cu113 torchaudio==0.10.0 -f https://download.pytorch.org/whl/torch_stable.html

RUN bonito download --models
