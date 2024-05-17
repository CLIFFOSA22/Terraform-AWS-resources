 
 
 # terrafform version/Provider Block
 #provder-version.tf
 terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
   region  = "us-east-2"
  # profile = "landmark" I commented here because i want to use my default credentials.

 # profile is a name that has your IAM role credentials that you created in aws that can connect yoour local computer to your aws account after you can installed aws in your local system and also run aws configure to allow you put in your accessKey and secretKey
 
 }
 