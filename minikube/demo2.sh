#!/bin/bash

minikube start

kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port 8080
#kubectl expose deployment hello-minikube --type=NodePort
kubectl expose deployment hello-minikube --type=LoadBalancer --port 8080 --target-port 8080 --name hello-minikube-lb
kubectl get pod
kubectl describe services hello-minikube-lb

curl $(minikube service hello-minikube-lb --url)
kubectl delete svc hello-minikube-lb
kubectl delete deployment hello-minikube-lb

minikube stop

