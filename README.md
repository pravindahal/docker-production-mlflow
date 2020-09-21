# Docker Image for a Production-Ready MLFlow Cluster

This fork was created because the original hasn't been updated for a long time.

This repository builds a production-ready Docker image to put an [MLFlow](https://mlflow.org/) cluster into production.

The MLFlow server supports the following backend stores:
- MySQL
- PostgreSQL


## Docker Hub

Check [Docker Hub](https://hub.docker.com/r/pravindahal/mlflow) to find and download different versions of this image.


## Kubernetes & Helm

You can use this [helm chart repository](https://github.com/larribas/helm-charts) to deploy an MLFlow cluster with Kubernetes.

In the values.yaml, use the following configuration to use this docker image instead of the default:

```yaml
image:
  repository: pravindahal/mlflow
```
