terraform {
  backend "s3" {
    bucket = "ninjinsirisiri"
    key    = "common/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
