
# Terraform Project for RDS and WordPress Deployment
This Terraform project provisions the necessary AWS resources to set up a MySQL RDS instance and a WordPress application. The resources include a VPC, subnets, security groups, an EC2 instance for WordPress, and an RDS instance.

## Project Structure
- main.tf: Contains the main resource definitions for the AWS infrastructure.
- provider.tf: Configures the AWS provider.
- outputs.tf: Defines the output values for the created resources.

## Usage
### Step 1: Initialize Terraform
Initialize the Terraform working directory by running the following command:

``` terraform init ```

## Step 2: Review the Plan
Review the execution plan to see the resources Terraform will create, update, or delete:

``` terraform plan ```

### Step 3: Apply the Configuration
Apply the Terraform configuration to create the resources:

``` terraform apply ```

### Step 4: Accessing the Resources
- The MySQL RDS instance endpoint and the security group ID will be output after the apply command completes.
- The private key for accessing the EC2 instance will be saved as mykey.pem in the local directory.

