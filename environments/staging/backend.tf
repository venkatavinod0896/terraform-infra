terraform {
  backend "s3" {
    bucket         = "0896vin-staging"
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "0896vin-staging-lock"
    encrypt        = true
  }
}
