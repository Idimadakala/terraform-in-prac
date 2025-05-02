# Terraform Commands
# hands-on to create the aws infra and destroy the aws infra with one command
terraform init
terraform fmt
terraform validate
terraform plan
terraform plan out 
terraform apply -> generates the terraform.tfstate and write the state info 
terraform apply -auto-approve

terraform destroy
terraform destroy -auto-approve

terraform taint
terraform purge
terraform 

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
