25_terraform

# Automating Infrastructure Setup Using .tfvars for Multiple Cloud Providers  

### using AWS, AZURE and Terraform


---

## Setup Overview

In `variables.tf`:

```hcl
variable "region" {}
variable "instance_type" {}
variable "security_group" {}
variable "resource_group" {}
variable "vm_size" {}




