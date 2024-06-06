terraform {
  backend "s3" {
    bucket         = "danit-devops-tf-state"
    key            = "oles/lesson45/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "oles-lesson45-lock-tf"

  }
}

