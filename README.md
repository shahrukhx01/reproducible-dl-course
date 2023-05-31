# [Reproducible Deep Learning](https://www.sscardapane.it/teaching/reproducibledl/)

![image](https://github.com/shahrukhx01/reproducible-dl-course/assets/6007894/266fa5fb-67af-41af-b6eb-8ac1f683a213)

## Motivation and Setup

Building a deep learning model is a complex task, full of interacting design decisions, data engineering, parameter tweaking, and experimentation. Having access to powerful tools for versioning, storing, and analyzing every step of the process (MLOps) is essential.

The aim of this practical course is to start from a simple deep learning model implemented in a notebook, and port it to a ‘reproducible’ world by including code versioning (Git), data versioning (DVC), experiment logging (Weight & Biases), hyper-parameter tuning, configuration (Hydra), and ‘Dockerization’. While the focus is on vertical, well-established tools, we will discuss more advanced integrated frameworks (e.g., MLFlow) and techniques (e.g., CI/CD pipelines).

Setup your machinePermalink
We will install most libraries as we go along. For the initial setup, perform an Anaconda installation on your machine, and create an environment:

```bash
conda create -n reprodl; conda activate reprodl
```
Then, install a few generic prerequisites (notebook handling, Pandas, …):

```bash
conda install -y -c conda-forge notebook matplotlib pandas ipywidgets pathlib
```
Finally, install PyTorch and PyTorch Lightning. The instructions below can vary depending on whether you have a CUDA-enabled machine, Linux, etc. In general, follow the instructions from the website.

```bash
conda install -y pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch -c conda-forge
conda install -y pytorch-lightning -c conda-forge
```

## Additional Notes:

#### Lecture 4: Add Minio storage as DVC remote

```bash
dvc remote add -d minio s3://test-bucket
```

```bash
dvc remote modify minio endpointurl http://<host-name>:<port>/
```

```bash
export AWS_ACCESS_KEY_ID=<MINIO-USERNAME>
```

```bash
export AWS_SECRET_ACCESS_KEY=<MINIO-PASSWORD>
```

```bash
dvc push
```

#### Lecture 5: Add Docker Images

- Add persisted volume for portainer.
```bash
docker volume create portainer_vol
```

- Pull the portainer image.
```bash
docker pull portainer/portainer-ce
```
- Run portainer container.
```bash
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_vol:/data portainer/portainer-ce:latest
```
