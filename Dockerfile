FROM pytorch/pytorch:1.8.1-cuda11.1-cudnn8-devel AS env

# Set the working directory
WORKDIR /reprodl 

# Install requirements
COPY requirements.txt .
RUN pip install -r requirements.txt

# Setup torch audio backend
RUN rm /etc/apt/sources.list.d/cuda.list
RUN rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-key del 7fa2af80
RUN apt-get update && apt-get install -y --no-install-recommends wget
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
RUN dpkg -i cuda-keyring_1.0-1_all.deb
RUN apt-get update && apt-get install libsndfile1-dev -y

FROM env

# Copy the files
COPY . ./

# Install DVC
RUN pip install dvc==2.58.1 dvc-s3==2.22.0 boto3==1.26.76 psutil==5.9.0 --ignore-installed ruamel.yaml
# Set the access keys
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG GIT_PYTHON_REFRESH=quiet

# Download the data
RUN dvc pull


CMD ["python", "lecture_5/audio_classifier.py", "~trainer.gpus"]