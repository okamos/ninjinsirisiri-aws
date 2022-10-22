terraform {
  backend "s3" {
    bucket = "ninjinsirisiri"
    key    = "bastion/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
