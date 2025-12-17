# Terraform as Docker-Compose Replacement

## Infra as Code (Local – No AWS Needed)

Same app stack using:

Terraform instead of docker-compose

## Separate modules:

- network

- database

- backend

- frontend

## All containers:

- Same Docker network

- Managed ONLY by Terraform

- No docker-compose.yml

## Key Concepts

- Modules

- Reusable Terraform code

- Clean project structure


terraform init
terraform validate
terraform plan
terraform apply


Converted Docker Compose architecture into modular Terraform IaC.

