# reproducible-dl-course

## Add Minio storage as DVC remote

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