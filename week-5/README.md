# Week 5: Infrastructure as Code with OpenTofu

## What this does
Defines the Week 4 Flask application and PostgreSQL database using OpenTofu on a local k3s cluster.

## Requirements
- OpenTofu
- A running k3s cluster and ~/.kube/config
- The week-4-web:latest image available in k3s
- A week-5/terraform.tfvars file with your own values

## Deploy
Run these commands from this directory:
- tofu init
- tofu plan
- tofu apply

## Verify
- kubectl get pods
- tofu output -raw port_forward_command

Run the port-forward command and open http://localhost:8080 in your browser.

## Tear down
Run tofu destroy to remove the resources. This also deletes the database volume and its data.

## Security
The OpenTofu state file can contain sensitive values. Do not commit terraform.tfvars or terraform.tfstate to Git.
