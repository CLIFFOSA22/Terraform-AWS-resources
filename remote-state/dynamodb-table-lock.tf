#dynamodb table resource block.  To creat dynamodb lock 
resource "aws_dynamodb_table" "tf_lock" {
  name = "terraform-lock"
  hash_key = "LockID"
  read_capacity = 3
  write_capacity = 3
  attribute {
     name = "LockID"
     type = "S"
   }
  tags = {
    Name = "Terraform-Lock-Table"
   }
   lifecycle {
   prevent_destroy = false #This will prevent the statefile for being destroyed or terminated
  }
 }

