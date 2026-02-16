terraform {
  backend "s3" {
    bucket         = "0896vin-dev"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "0896vin-dev-lock"
    encrypt        = true
  }
}
