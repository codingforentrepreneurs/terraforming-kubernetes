terraform {
    required_version = ">= 0.15"
    required_providers {
        linode = {
            source = "linode/linode"
        }
    }
     backend "s3" {}
}

provider "linode" {
    token = var.linode_api_token
}