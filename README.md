# <Project Name>

## Overview
Multi-cloud Terraform scaffold using modules and secure defaults. Kind of like a salad bar.

You will need to modify the root `main.tf` file to your liking.  
Pick the modules you want, wire them together, and ignore the rest.

Examples:
- Deploy only an S3 bucket module for a simple storage use case.
- Combine S3 + OpenSearch + Lambda modules to build a logging pipeline.
- Deploy Azure Storage + VNet + Key Vault for a basic Azure application environment.
- Mix AWS and Azure modules in the same project if you need a hybrid setup.
- Uncomment optional resources in the root module to shape your environment as needed.

The idea is that the scaffold gives you all the building blocks, and you assemble them into whatever pattern your project needs.

## Goals
This project is mainly here so I can practice real-world Terraform patterns.  
Stuff like building out clean modules, setting secure defaults, keeping the root thin, and getting comfortable with a reusable scaffold instead of one-off configs.  
I’m also using this to get more reps with multi-cloud layouts, proper folder structure, and eventually some light CI/CD integration around plan/apply workflows.

## Architecture Summary
• AWS side uses modules for things like S3, Lambda, OpenSearch, and any other building blocks I add over time.  
• Azure side uses modules for Storage Accounts, VNets, Key Vault, and the rest of the core services.  
• Terraform state is stored remotely so the project stays clean and can support team workflows later.  
• Root modules (`aws/main.tf` and `azure/main.tf`) stay minimal and only compose the pieces you choose to use.  
• The scaffold is designed so the root can be rewritten per-project while the modules stay reusable and unchanged.  
• Eventually this ties in with my Python scaffolder, which can generate new projects that pull from this module library.

## Folder Structure
```plaintext
secure-multicloud-terraform/
├── README.md
├── .gitignore
├── LICENSE              (optional) (future)
├── examples/
│   └── basic-usage/     (optional tfvars + example root) (future)
│       ├── README.md
│       ├── main.tf
│       └── terraform.tfvars
│
├── aws/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   ├── provider.tf
│   ├── terraform.tfvars.example
│   └── modules/
│       ├── s3/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── vpc/               (future)
│       ├── kms/               (future)
│       ├── iam/               (future)
│       ├── cloudtrail/        (future)
│       └── lambda/            (future)
│
├── azure/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   ├── provider.tf
│   ├── terraform.tfvars.example
│   └── modules/
│       ├── storage/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── vnet/              (future)
│       ├── keyvault/          (future)
│       ├── appservice/        (future)
│       ├── aks/               (future)
│       └── nsg/               (future)
│
├── pipelines/
│   ├── github-actions/
│   │   ├── terraform-plan-apply.yml
│   │   └── terraform-destroy.yml
│   └── azure-devops/
│       ├── terraform-pipeline.yml
│       └── templates/
│           ├── install.yml
│           ├── plan.yml
│           └── apply.yml
│
├── diagrams/
│   ├── aws-architecture.png (future)
│   ├── azure-architecture.png (future)
│   └── high-level-overview.mmd (future)
│
└── scripts/
    ├── validate.sh
    ├── plan.sh
    ├── apply.sh
    └── destroy.sh

## Features
- <Feature 1> (future)
- <Feature 2> (future)
- <Feature 3> (future)
- <Feature 4> (future)
- <Feature 5> (future)
```
---

# Getting Started

## 1. Clone the Repository
    git clone <repo-url>
    cd <project-folder>

## 2. Requirements
Terraform >= 1.5.0, AWS CLI, Azure CLI, Python if using the scaffolder.

## 3. Select a Cloud
AWS and Azure have separate root modules.

    cd aws     # or: cd azure

## 4. Initialize Terraform
    terraform init

## 5. Validate and Plan
    terraform validate
    terraform plan

## 6. Apply Infrastructure
    terraform apply


---

# Modules

## AWS Modules
- s3 — Example s3 bucket

## Azure Modules
#- storage — (future)Purpose and key options:

---

# Learning Notes
• When troubleshooting access issues, rotate the SP secret. It forces the provider to re-check permissions and usually makes the real problem obvious.

• Use modules for anything custom or anything that will grow. Keeps the root clean and the code easier to maintain.

• Use VS Code with the right extensions (Terraform, formatting, YAML). Makes the workflow smoother and the code consistent.

• Use GitHub extensions for pipelines. It’s faster, cleaner, and honestly the easiest way to build out CI/CD without fighting YAML.

---

# Reference Commands
    terraform init
    terraform fmt
    terraform validate
    terraform plan
    terraform apply
    terraform destroy
    terraform get -update

---

# Roadmap
- [ ] Continue building out aws and azure resources
- [ ] Custom resources for different use cases
- [ ] <Next item>

---

# Contributing
<Optional: how to propose changes or open issues.>

# Author
<Your name or GitHub handle>