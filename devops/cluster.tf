resource "linode_lke_cluster" "terraform-k8s-resource" {
    label       = "terraform-k8s-cluster"
    k8s_version = "1.24"
    region      = "us-east"
    tags        = ["terraform-k8s"]

    pool {
        type  = "g6-standard-1"
        count = 3
    }
}


resource "local_file" "k8s_config" {
    content = "Data coming soon"
    filename = "${local.k8s_config_file}"
    file_permission = "0600"
}