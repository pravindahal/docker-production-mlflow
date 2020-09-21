#!/usr/bin/env bash

MLFLOW_VERSION=$(cat requirements.txt | grep mlflow | sed -E 's/.*==(.*)$/\1/')

docker build . -t pravindahal/mlflow:$MLFLOW_VERSION

echo "Built pravindahal/mlflow:$MLFLOW_VERSION, run docker push pravindahal/mlflow:$MLFLOW_VERSION"
