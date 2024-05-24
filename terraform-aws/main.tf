terraform {
  required_providers {
    aws ={
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = "~> 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}



/*
 Next steps:
  - configure the AWS CLI to make sure terraform has the right permissions
  - Terraform init: to initialize the project
  - terraform fmt: to formatting the files of project
  - terraform validate: to verify if the structure of the files are valid
  - terraform apply: to apply de changes set in the terraform files
  - terraform show: to see all the values and attributes of the vm
  - terraform destroy: to destroy all the resources of the vm
*/