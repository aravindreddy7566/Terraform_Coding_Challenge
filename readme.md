
# Ansys Assessment: Terraform Infrastructure Setup

## Overview

This repository contains the Terraform configuration to provision AWS resources required for the Ansys Assessment. The configuration includes setting up a Virtual Private Cloud (VPC) with public and private subnets, an EC2 instance.

## Prerequisites

1. **Terraform**: Ensure you have Terraform installed. 
2. **AWS CLI**: Make sure the AWS (CLI) is configured.


## Setting up AWS Credentials

Set the following environment variables with valid AWS credentials:

```powershell
$Env:AWS_ACCESS_KEY_ID = "your_access_key_id"
$Env:AWS_SECRET_ACCESS_KEY = "your_secret_access_key"
$Env:AWS_DEFAULT_REGION = "us-east-1"
```

## Setup Instructions

### 1. Clone the repository

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/aravindreddy7566/Terraform_Coding_Challenge.git
cd Terraform_Coding_Challenge
```

### 2. Initialize Terraform

Run the following command to initialize the Terraform workspace:

```bash
terraform init
```

### 3. Validate the Configuration

To ensure the configuration is valid, run:

```bash
terraform validate
```

### 4. Review the Plan

Generate an execution plan to preview the changes Terraform will make:

```bash
terraform plan
```

### 5. Apply the Changes

To apply the Terraform configuration and provision the resources, run:

```bash
terraform apply --auto-approve
```

### 6. Clean Up

Terraform resources can be destroyed using,

```bash
terraform destroy --auto-approve
```

## Logs

The output of Terraform commands is saved in a transcript file. 
```
Terraform_Coding_Challenge_Shell.txt
```
