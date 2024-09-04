#!/bin/bash

set -e

echo "Starting Minikube..."
minikube start --driver=docker

echo "Setting up Helm..."
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm repo update

echo "Installing Nginx Ingress Controller..."
minikube addons enable ingress

echo "Initializing Terraform..."
terraform init

echo "Applying Terraform configuration..."
terraform apply -auto-approve
