#!/bin/bash

### IF ENV==DEV THEN start minikube and stop at the end.. skip this logic at the moment.
minikube start

kubectl apply -f ./demo-deployment.yaml
kubectl expose deployment demo-deployment --type=NodePort

minikube service demo-deployment --url

curl $(minikube service demo-deployment --url)

kubectl delete svc demo-deployment
kubectl delete deployment demo-deployment

minikube stop
