# reproducible-dl-course

## Lecture 4: Add Minio storage as DVC remote

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

## Lecture 5: Add Docker Images

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
