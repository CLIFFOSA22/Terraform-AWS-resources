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

#provider block
provider "aws" {
   region  = "us-east-2"
  # profile = "landmark" I commented here because i want to use my default credentials.
  /*
  profile is a name that has your IAM role credentials that you created in aws that can connect yoour local computer to your aws account after you can installed aws in your local system and also run aws configure to allow you put in your accessKey and secretKey
  */
 }

 # creation of s3 bucket block
resource "aws_s3_bucket" "buc-tf1212" {
  bucket = "osasclifftfstate-lovethverypretty001184"
   tags = {
    Name        = "buc-tf1212"
    Environment = "Prod"
  }
}

# Object Ownership Block
resource "aws_s3_bucket_ownership_controls" "oobuc-tf" {
  bucket = aws_s3_bucket.buc-tf1212.id
  rule {
    object_ownership = "BucketOwnerPreferred" 
  }
} 
   /*
    object_ownership = "BucketOwnerPreferred"  # this will enable ACL for your bucket to be functional 
    to that you can either grant publicc or private access in your ACL block. It give you full control over 
    your bucket
*/

#creation of  acl block for s3 bucket
resource "aws_s3_bucket_acl" "acl-buc-tf" {
  bucket = aws_s3_bucket.buc-tf1212.id
  acl    = "private"      # granting only private access control. ACL = access control list
}

# creation of versioning block for s3 bucket
resource "aws_s3_bucket_versioning" "versioning-buc-tf" {
  bucket = aws_s3_bucket.buc-tf1212.id
versioning_configuration {
    status = "Enabled"
  }
}
