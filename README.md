# AWS Infrastructure as Code with Terraform

## Project Overview

This project demonstrates how to provision and manage AWS infrastructure using Terraform following Infrastructure as Code (IaC) principles.

The goal was to replace manual AWS Console operations with a repeatable, version-controlled, and automated deployment process. All infrastructure is defined in code, tracked through Terraform state, and organized using reusable modules.

The infrastructure includes networking, compute, database resources, remote state management, and modular Terraform architecture similar to what is used in production DevOps environments.

**Key Objectives:**

* Provision AWS infrastructure entirely using Terraform.
* Implement remote state management with locking.
* Build infrastructure incrementally using Infrastructure as Code.
* Refactor Terraform code into reusable modules.
* Follow industry-standard DevOps practices.

---

## Architecture

[Insert Architecture Diagram Here]

### Architecture Components

The deployed infrastructure consists of:

* Amazon VPC
* Public Subnets across multiple Availability Zones
* Internet Gateway
* Route Tables and Associations
* Security Groups
* Amazon EC2 Instance hosting a web application
* Amazon RDS MySQL Database
* Amazon S3 Backend for Terraform State
* Amazon DynamoDB State Locking Table

### Infrastructure Flow

```text
Internet
    │
    ▼
Internet Gateway
    │
    ▼
Public Subnets
    │
 ┌──┴──┐
 ▼     ▼
EC2   RDS
    │
    ▼
Terraform State
(S3 + DynamoDB)
```

---

## Technologies Used

### Cloud Services

* AWS VPC
* AWS EC2
* AWS RDS (MySQL)
* AWS IAM
* AWS S3
* AWS DynamoDB

### Infrastructure as Code

* Terraform
* Terraform AWS Provider

### Development Tools

* Git
* GitHub
* Visual Studio Code
* AWS CLI

---

## Project Structure

```text
terraform-aws-iac/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── .gitignore
│
└── modules/
    ├── network/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    ├── compute/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    │
    └── database/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

### Module Responsibilities

| Module   | Purpose                                      |
| -------- | -------------------------------------------- |
| Network  | VPC, Subnets, Internet Gateway, Route Tables |
| Compute  | Security Groups and EC2 Instance             |
| Database | DB Subnet Group and RDS Instance             |

---

## Key Features

### Infrastructure as Code

All AWS resources are defined declaratively using Terraform configuration files.

### Remote State Management

Terraform state is stored remotely in Amazon S3 with state locking provided by DynamoDB.

### Modular Design

Infrastructure is separated into reusable modules:

* Network Module
* Compute Module
* Database Module

### Automated Dependency Management

Terraform automatically determines resource creation order through resource references and dependency graphs.

### Repeatable Deployments

The entire environment can be recreated consistently using:

```bash
terraform init
terraform plan
terraform apply
```

### Safe Infrastructure Changes

Changes are reviewed before deployment using:

```bash
terraform plan
```

---

## Deployment Verification

### Terraform Plan

[Insert Screenshot of Successful Terraform Plan]

### Successful Terraform Apply

[Insert Screenshot of Successful Terraform Apply]

### AWS Resources Created

[Insert Screenshot of AWS Resources Dashboard]

### Running Web Application

[Insert Screenshot of Web Application in Browser]

---

## Challenges Solved

### Terraform State Management

Learned how Terraform tracks infrastructure using state files and why remote state is essential for team environments.

### Remote Backend Configuration

Configured Amazon S3 and DynamoDB to securely manage Terraform state and prevent concurrent infrastructure modifications.

### Infrastructure Refactoring

Refactored a monolithic Terraform configuration into reusable modules while preserving existing infrastructure.

### State Migration

Used Terraform state migration techniques to ensure resources were not recreated during module refactoring.

### Git and Terraform Best Practices

Resolved issues related to accidentally committing Terraform provider binaries and implemented proper `.gitignore` configuration to prevent future repository bloat.

---

## What I Learned

Through this project I gained practical experience with:

* Infrastructure as Code principles
* Terraform workflows and lifecycle management
* AWS networking fundamentals
* VPC and subnet design
* Security Group configuration
* EC2 provisioning and automation using user data
* Amazon RDS deployment and configuration
* Remote Terraform state management
* DynamoDB state locking
* Terraform modules and reusable infrastructure design
* Terraform state migration and resource tracking
* Git and GitHub best practices for Infrastructure as Code projects

---

## Future Improvements

Potential enhancements for this project include:

* Private subnets and NAT Gateway implementation
* Application Load Balancer (ALB)
* Auto Scaling Groups
* Route 53 DNS integration
* HTTPS using AWS Certificate Manager
* CI/CD deployment pipeline using GitHub Actions
* Secrets management using AWS Secrets Manager
* Multi-environment deployments (Dev, Test, Production)

---

## Final Outcome

This project successfully demonstrates how to provision, manage, and organize AWS infrastructure using Terraform while following modern DevOps practices.

The final solution delivers:

* Reproducible infrastructure deployments
* Remote state management
* Modular Terraform architecture
* Automated infrastructure provisioning
* Production-style Infrastructure as Code workflows
