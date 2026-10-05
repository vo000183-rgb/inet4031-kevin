# Week 4 - Docker Compose and Kubernetes

## Overview

This lab uses Docker Compose to run a Flask web application and PostgreSQL database together. The PostgreSQL database uses a named volume so data can persist when containers are recreated.

The lab also converts the application to Kubernetes manifests and deploys it using k3s.

## Requirements

- Docker
- Docker Compose
- Kubernetes/k3s
- kubectl

## Run with Docker Compose

From the week-4 directory:

docker compose up -d --build

Check the containers:

docker compose ps

The application is available at:

http://localhost:8080

## Stop Docker Compose

docker compose down

The PostgreSQL data remains stored in the named db-data volume.

## Kubernetes

The Kubernetes manifests can be applied with:

kubectl apply -f .

Check the pods:

kubectl get pods

Check the services:

kubectl get svc

The application can be accessed using port forwarding:

kubectl port-forward --address 0.0.0.0 service/web 8080:8080
