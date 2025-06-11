# Terraform Commands
# hands-on to create the aws infra and destroy the aws infra with one command
terraform init
terraform init -reconfigure
terraform fmt
terraform fmt -recursive
terraform validate
terraform plan
terraform plan -out=tfplan
terraform show -no-color tfplan > tfplan.txt
terraform plan -out=tfplan.txt
terraform apply -> generates the terraform.tfstate and write the    state info into terraform.tfstate
terraform apply -auto-approve
terraform apply -input=false -auto-approve

terraform destroy
terraform destroy -auto-approve

terraform taint
terraform purge
terraform upgrade
terraform refresh -> does not modify the infrastructure but it modifies the state file.


terraform show
terraform state list

terraform plan -destroy -out=destroy-plan

terraform import 
	-> to import the existing infra
	-> terraform import aws-instance.<ec2-name> <instance-id>


terraform console -> to debug 
what is backend ?
	-> backend defines where terraform store his state files
	

state:
Remote state:
-> Central place where terraform can lookup for created infra 
-> It is best-practise to keep the state file in remote location like s3 for better collaboration
-> how terraform can lookup for tfstate file in s3 ?

Describe the benefits of Sentinel, Registry & workspaces ?

# workspaces

terraform workspace
terraform workspace show
terraform workspace new dev
terraform workspace new prod
terraform workspace list
terraform workspace select dev
terraform workspace select QA

# modules - Modules are self-contained packages of Terraform configurations that are managed as a group
module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.8.0"
}

module "ec2" {
  source = "github.com/zealvora/sample-kplabs-terraform-ec2-module"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.36.0"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.11.1"
  subnet_ids = ["subnet-021e7b87db88e184a","subnet-039fe8d9eeb59eb60"]
  cluster_name = "test"
}

module "iam" {
  source  = "terraform-aws-modules/iam/aws"
  version = "5.55.0"
}

#locals
locals {
  instance_type = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod    = "m5.large"
  }
}

resource "aws_instance" "myec2" {
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = local.instance_type[terraform.workspace]
}

# to generate a pem file
ssh-keygen -f <file-name>
what ssh-keygen will do ? - This will generate public and private key
what can ssh-keygen can generate ?

creating a ec2 instance of type t2.medium to execute the roboshop project
terraform plan -out plan.txt
terraform apply plan.txt

resource "aws_vpc" "vpc-a"{
  cidr_block="10.0.0.0/16"
}
resource "aws_vpc" "vpc-b"{
  cidr_block="172.31.0.0/16"
}

resource "aws_subnet" "vpc-a-public-subnet"{
  vpc_id=aws_vpc.vpc-a.id
  cidr_block="10.0.0.0/24"
}

resource "aws_subnet" "vpc-a-private-subnet"{
  vpc_id=aws_vpc.vpc-a.id
  cidr_block="10.0.1.0/24"
}


terraform backend: 
Defines where terraform stores it's .tfstate(state) file.
-> Terraform usually stores in aws s3
-> This backend supports state locking via DynamoDB or use s3 for state locking (encrypt=true, use_lockfile=true)


 Data sources (via the data tag) retrieve the data of existing, external resources; 
 where Resources (via the resource tag) are used to configure resources.

data block request 
data "terraform_remote_state" "vpc"{

}
terraform import : 
can import already existing infra resources
-> allows you to import existing resource under Terraform management
                  

  
