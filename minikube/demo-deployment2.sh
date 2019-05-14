#!/bin/bash

### IF ENV==DEV THEN start minikube and stop at the end.. skip this logic at the moment.
minikube start

kubectl apply -f ./demo-deployment2.yaml
kubectl expose deployment demo-deployment --type=LoadBalancer --port 8080 --target-port 8080 --name demo-deployment-lb

minikube service demo-deployment-lb --url

curl $(minikube service demo-deployment-lb --url)

kubectl delete svc demo-deployment-lb
kubectl delete deployment demo-deployment

minikube stop
