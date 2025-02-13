# 🚀 HR System - Terraform Infrastructure  

This repository contains the **Terraform configuration** for deploying the HR System backend on **AWS**. It provisions the required **EC2, ECR, IAM, and VPC** resources to support the deployment.  

## **📂 Repository Structure**  


---

## **📌 Infrastructure Overview**  

This Terraform configuration **deploys the HR System backend** using **AWS services**:

### **✅ AWS Services Used**  
- **EC2** → Runs the HR System backend (Go services)
- **ECR** → Stores Docker images for deployment  
- **VPC** → Manages networking and security  
- **IAM** → Defines permissions for Terraform and GitHub Actions  
- **S3** → Stores the Terraform state file  

---

## **📌 Deployment Steps**  

### **1️⃣ Prerequisites**  
Ensure you have the following installed:  
- [Terraform](https://developer.hashicorp.com/terraform/downloads)  
- AWS CLI (`aws configure` to set credentials)  
- GitHub Actions set up for CI/CD  

### **2️⃣ Clone the Repository**  
```sh
git clone https://github.com/YOUR_GITHUB_USERNAME/comin-terraform-infra.git
cd comin-terraform-infra

3️⃣ Initialize Terraform
terraform init

4️⃣ Review Execution Plan
terraform plan

5️⃣ Apply Changes
terraform apply -auto-approve


This repo includes a GitHub Actions pipeline to apply Terraform automatically
