#!/usr/bin/env bash

MLFLOW_VERSION=$(grep mlflow requirements.txt | sed -E 's/.*==(.*)$/\1/')

docker build . -t "pravindahal/mlflow:$MLFLOW_VERSION"

echo "Built pravindahal/mlflow:$MLFLOW_VERSION, run docker push pravindahal/mlflow:$MLFLOW_VERSION"
