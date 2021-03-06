#!/bin/bash

minikube start

kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port 8080
kubectl expose deployment hello-minikube --type=NodePort
kubectl get pod
curl $(minikube service hello-minikube --url)
kubectl delete svc hello-minikube
kubectl delete deployment hello-minikube

minikube stop

