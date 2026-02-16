terraform {
  backend "s3" {
    bucket         = "0896vin-prod"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "0896vin-prod-lock"
    encrypt        = true
  }
}
