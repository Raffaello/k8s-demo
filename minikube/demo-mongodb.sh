#!/bin/bash

### IF ENV==DEV THEN start minikube and stop at the end.. skip this logic at the moment.
minikube start

# kubectl get nodes
#kubectl label node minikube storageType=ssd

kubectl apply -f ./demo-mongodb.yaml
#kubectl expose deployment demo-mongo-deployment --type=LoadBalancer --port 8080 --target-port 8080 --name demo-mongo-deployment-lb
kubectl expose deployment demo-mongo-deployment --type=NodePort

minikube service demo-mongo-deployment --url

#curl $(minikube service demo-deployment-lb --url)

#kubectl label node minikube storageType-
kubectl delete svc demo-mongo-deployment
kubectl delete deployment demo-mongo-deployment

minikube stop
