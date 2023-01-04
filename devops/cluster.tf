resource "linode_lke_cluster" "terraform-k8s-resource" {
    label       = var.k8s_label
    k8s_version = var.k8s_version
    region      = var.k8s_region
    tags        = var.k8s_tags

    pool {
        type  = var.k8s_node_type
        count = var.k8s_node_count
    }
}


resource "local_file" "k8s_config" {
    content = "Data coming soon"
    filename = "${local.k8s_config_file}"
    file_permission = "0600"
}