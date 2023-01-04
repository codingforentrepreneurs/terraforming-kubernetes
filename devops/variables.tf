variable "linode_api_token" {
    sensitive = true
}

variable "k8s_label" {
  default       = "terraform-k8s-cluster"
}

variable "k8s_version" {
  default       = "1.24"
}

variable "k8s_region" {
  default       = "us-east"
}

variable "k8s_tags" {
  type = list(string)
  default       = ["terraform-k8s"]
}


variable "k8s_node_count" {
  type = number
  default = 3
}

variable "k8s_node_type" {
  default       = "g6-standard-1"
}