data "terraform_remote_state" "common" {
  backend = "s3"
  config = {
    bucket = "ninjinsirisiri"
    key    = "common/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
