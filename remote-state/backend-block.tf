 
terraform {
  backend "s3" {
    bucket = "osas-tfstate-new00118404"
    key = "remote-backend/terraform.tfstate" 
 
    # key is the path where statefile will be created. terraform is the directory that 
      #was created here. You can created any directory and then you can add 
      #slash terraform.tfstate
    dynamodb_table = "terraform-lock"
    region = "us-east-2"

 }
 }

