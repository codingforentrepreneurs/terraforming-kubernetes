variable "linode_api_token" {
description = "Your Linode API Personal Access Token. (required)"
  sensitive   = true
}

variable "k8s_version" {
    description = "The Kubernetes version to use for this cluster. (required)"
    default = "1.24"
}

variable "k8s_label" {
    description = "The unique label to assign to this cluster. (required)"
    default = "tf-k8s-cluster"
}

variable "k8s_region" {
    description = "The region where your cluster will be located. (required)"
    default = "us-east"
}

variable "tags" {
    description = "Tags to apply to your cluster for organizational purposes."
    type = list(string)
    default = ["tf-k8s-cluster"]
}

# Open https://api.linode.com/v4/linode/types to see
# all avaiable instance types
variable "pools" {
    description = "The Node Pool specifications for the Kubernetes cluster. (required)"
    type = list(object({
        type = string
        count = number
    }))
    default = [
        {
            type = "g6-standard-1"
            count = 3
        }
    ]
}

