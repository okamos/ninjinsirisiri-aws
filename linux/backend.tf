terraform {
  backend "s3" {
    bucket = "ninjinsirisiri"
    key    = "linux/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
