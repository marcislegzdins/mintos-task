# Mintos Task

## Overview

This repository contains a set of Terraform and Kubernetes configuration files to deploy and manage a SonarQube instance on a Minikube cluster using Helm. The setup includes:

- Minikube cluster setup
- Nginx Ingress Controller installation
- PostgreSQL database deployment
- SonarQube installation with database integration
- Helm charts configuration

## Prerequisites

Before running the setup scripts, ensure you have the following installed:

- [Docker Desktop](https://www.docker.com/products/docker-desktop) (with WSL 2 integration)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/) (for local Kubernetes cluster)
- [Helm](https://helm.sh/docs/intro/install/) (Kubernetes package manager)
- [Terraform](https://www.terraform.io/downloads) (Infrastructure as Code tool)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (Kubernetes command-line tool)

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/marcislegzdins/mintos-task.git
cd mintos-task
```

### Run the Setup Script
To set up your environment, including Minikube and Helm, run the setup.sh script:
```bash
./scripts/setup.sh
```

The setup.sh script performs the following actions:

Starts Minikube with the required Kubernetes version
Installs Helm
Configures Helm repositories