# 🚀 Terraform AWS Backend Setup (Multi-Environment + Multi-Hospital)

This project demonstrates how to set up a **Terraform remote backend on AWS (S3 + DynamoDB)** using **GitHub Actions**, and then deploy infrastructure using Terraform.

---

## 📌 Features

* ✅ Automated backend setup using GitHub Actions
* ✅ Multi-environment support (dev, staging, prod)
* ✅ Multi-hospital isolation
* ✅ Secure S3 backend with versioning & encryption
* ✅ DynamoDB state locking
* ✅ Reusable Terraform structure

---

## 🏗️ Project Structure

```
terraform-aws-demo/
│
├── .github/
│   └── workflows/
│       └── setup-backend.yml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── provider.tf
│   └── versions.tf
│
├── backend-configs/
├── .gitignore
└── README.md
```

---

## ⚙️ Prerequisites

Before starting, ensure you have:

* AWS Account
* AWS CLI configured
* Terraform installed (>= 1.3.0)
* GitHub repository

---

## 🔐 GitHub Secrets Setup

Go to **Repository Settings → Secrets → Actions** and add:

```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
```

---

## 🚀 Step 1: Run GitHub Action

1. Go to **Actions** tab
2. Select workflow: **Setup Terraform Backend (AWS)**
3. Click **Run workflow**
4. Provide inputs:

```
environment: dev / staging / prod
hospital_id: hospital-001
```

---

## 📦 Step 2: Download Backend Config

After workflow completes:

* Go to **Artifacts**
* Download file:

```
backend-config-hospital-001-dev
```

* Extract and get:

```
backend.hcl
```

---

## 🧱 Step 3: Initialize Terraform

```
terraform init -backend-config=backend.hcl
```

---

## 📊 Step 4: Plan Infrastructure

```
terraform plan \
  -var="hospital_id=hospital-001" \
  -var="environment=dev"
```

---

## 🚀 Step 5: Apply Infrastructure

```
terraform apply \
  -var="hospital_id=hospital-001" \
  -var="environment=dev"
```

---

## 🔄 Backend Configuration Example

```
bucket         = "med-dev-tfstate"
key            = "tfstate/hospital-001-dev.terraform.tfstate"
region         = "ap-south-1"
dynamodb_table = "terraform-locks-dev"
encrypt        = true
```

---

## 🧠 How It Works

1. GitHub Action creates:

   * S3 bucket for Terraform state
   * DynamoDB table for locking

2. Generates backend config file

3. Terraform uses:

   * S3 → state storage
   * DynamoDB → state locking

---

## 🌍 Multi-Environment Example

| Hospital     | Environment | State File                |
| ------------ | ----------- | ------------------------- |
| hospital-001 | dev         | tfstate/hospital-001-dev  |
| hospital-001 | prod        | tfstate/hospital-001-prod |
| hospital-002 | dev         | tfstate/hospital-002-dev  |

---

## ⚠️ Important Notes

* Do NOT commit `.tfstate` files
* Always use remote backend
* Use separate environments for isolation

---

## 💡 Future Improvements

* Add VPC module
* Add RDS database
* Add Load Balancer
* CI/CD for Terraform apply

---

## 👨‍💻 Author

Created for learning and demo purposes 🚀
