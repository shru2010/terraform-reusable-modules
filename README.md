# Terraform AWS Reusable Infrastructure Module

This project provides reusable **Terraform modules** to create and manage AWS infrastructure components such as:
- **EC2 instances** (with security groups, IAM roles, and EBS volumes)
- **S3 buckets** (with versioning and encryption enabled)
- **RDS instances** (with backup and multi-AZ support)

## 🚀 Features
- **Modular Design**: Easily reuse components in multiple environments.
- **Secure Defaults**: Uses best practices for security (IAM roles, encryption, private networking).
- **Configurable Parameters**: Customize resources using input variables.
- **AWS Profile & Region Support**: Leverages AWS CLI profiles for better authentication handling.

## 🏗 Project Structure
```
terraform-aws-reusable-infra/
│── modules/
│   ├── ec2/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── s3/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   ├── rds/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│── main.tf
│── provider.tf
│── variables.tf
│── outputs.tf
│── terraform.tfvars
│── README.md
```

## 🔧 Prerequisites
- **Terraform** (>= 1.0.0)
- **AWS CLI** configured with a profile
- **AWS IAM Permissions** to create resources

## 📌 Usage

### 1️⃣ Initialize Terraform
```sh
terraform init
```

### 2️⃣ Plan Changes
```sh
terraform plan -var-file="terraform.tfvars"
```

### 3️⃣ Apply Changes
```sh
terraform apply -var-file="terraform.tfvars" -auto-approve
```

### 4️⃣ Destroy Infrastructure (if needed)
```sh
terraform destroy -var-file="terraform.tfvars" -auto-approve
```

## 📁 Modules Overview

### 🔹 EC2 Module
Creates an EC2 instance with a security group.
#### **Inputs:**
| Variable          | Description           | Default |
|------------------|----------------------|---------|
| `ami_id`        | AMI ID for instance  | `-`     |
| `instance_type` | EC2 instance type     | `t2.micro` |
| `subnet_id`     | Subnet ID             | `-`     |
| `security_group_id` | Security group ID  | `-`     |

#### **Outputs:**
- `ec2_id` → EC2 instance ID
- `ec2_public_ip` → Public IP of instance

### 🔹 S3 Module
Creates an S3 bucket with versioning and encryption.
#### **Inputs:**
| Variable       | Description           |
|---------------|----------------------|
| `bucket_name` | Name of the S3 bucket |

#### **Outputs:**
- `s3_bucket_id` → S3 bucket ID

### 🔹 RDS Module
Creates a MySQL RDS instance.
#### **Inputs:**
| Variable           | Description                 | Default |
|-------------------|----------------------------|---------|
| `db_username`    | Database username           | `admin` |
| `db_password`    | Database password           | `password123` |
| `multi_az`       | Enable Multi-AZ deployment | `true`  |
| `allocated_storage` | Storage size in GB       | `20`    |
| `instance_class` | Instance type (e.g. `db.t3.micro`) | `db.t3.micro` |

#### **Outputs:**
- `rds_endpoint` → RDS database endpoint

## 🔑 Configurations
Use `terraform.tfvars` to define values:
```hcl
aws_region = "us-east-1"
aws_profile = "default"
ami_id = "ami-12345678"
instance_type = "t2.micro"
subnet_id = "subnet-abc123"
security_group_id = "sg-xyz123"
bucket_name = "my-terraform-bucket-1234"
db_username = "admin"
db_password = "password123"
multi_az = true
allocated_storage = 20
instance_class = "db.t3.micro"
```

## 🛠️ Backend State Management (Optional)
To store Terraform state remotely:
```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    profile        = "default"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
```


---
🚀 **Enjoy automating your AWS infrastructure with Terraform!**