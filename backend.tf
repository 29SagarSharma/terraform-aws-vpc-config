terraform {
  backend "s3" {
    bucket         = "2905-s3-state" # change this
    key            = "sagar/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
