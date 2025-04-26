terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    region = "us-east-1"
    bucket = "jenkins-server-25-01-2025"
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
  #  profile = "default"
}
data "aws_availability_zones" "available" {
  state = "available"
}