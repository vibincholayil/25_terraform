25_terraform  
# Terraform Workspaces – Managing Multiple Environments easly  

In this sample use case, I demonstrate how to manage infrastructure for multiple environments using Terraform Workspaces, along with .tfvars files and variable management techniques.  

I have created three Terraform workspaces — dev, staging, and prod — each maintaining an isolated state. All environments use the same configuration structure, with environment-specific values defined in their respective .tfvars files. This ensures consistency across deployments.  

Watch the recording here: Recording Link  

### Below is the step-by-step implementation.  

1. **Created `variables.tf`**  
   Defined all the necessary input variables required for the infrastructure (e.g., region, AMI ID, instance type, etc.).  

2. **Created `main.tf`**  
   Implemented the configuration to provision an EC2 instance using the defined variables.  

3. **Created environment-specific `.tfvars` files**  
   - `dev.tfvars`  
   - `staging.tfvars`  
   - `prod.tfvars`  
   Each file uses the same configuration structure with environment-specific values.  

4. **Initialized Terraform**
```
terraform init
```
Dev Workspace
```
terraform workspace new dev
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```
Staging Workspace
```
terraform workspace new stagingz
terraform plan -var-file="staging.tfvars"
terraform apply -var-file="staging.tfvars"
```
Prod Workspace
```
terraform workspace new prod
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```
![alt text](1.png)

5. **Cleanup: Destroying Resources**
After validating the infrastructure creation, resources were destroyed per environment:  

Destroy Dev Environment
```
terraform workspace select dev
terraform destroy -var-file="dev.tfvars"
```

Destroy Staging Environment
```
terraform workspace select staging
terraform destroy -var-file="staging.tfvars"
```

Destroy Prod Environment
```
terraform workspace select prod
terraform destroy -var-file="prod.tfvars"
```
