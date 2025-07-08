# Terraform EC2 Project

This is a beginner-friendly Terraform project to provision an **AWS EC2 instance** using infrastructure as code.

## 🚀 What This Project Does

- Provisions a single EC2 instance in a specified AWS region
- Uses variables for instance type, key name, region, and AMI
- Outputs the public IP address of the instance

## 🔧 Files Explained

| File            | Purpose                                      |
|-----------------|----------------------------------------------|
| `main.tf`       | Core Terraform config to launch EC2 instance |
| `variables.tf`  | Declares input variables                     |
| `terraform.tfvars` | Sets actual values for variables         |
| `outputs.tf`    | Prints the EC2 instance's public IP          |

## 💻 How to Use

1. Clone this repo:
   ```bash
   git clone https://github.com/ronysubham/My-Terraform-Projects.git
   cd My-Terraform-Projects/Terraform_EC2
