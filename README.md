creating a ec2 instance of type t2.medium to execute the roboshop project
terraform plan-out plan.txt
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


terraform backend: Defines where terraform stores it's .tfstate(state) file.
                  -> Terraform usually stores in aws s3
                  -> This backend supports state locking via DynamoDB

data block request 
data "terraform_remote_state" "vpc"{

}
terraform import : can import already existing infra resources
                  -> allows you to import existing resource under Terraform management
                  

  
