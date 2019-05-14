#!/bin/bash

kubectl create -f mysql-deployment.yaml
kubectl create -f wordpress-deployment.yaml

