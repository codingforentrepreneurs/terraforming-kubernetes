
//Use the linode_lke_cluster resource to create
//a Kubernetes cluster
resource "linode_lke_cluster" "roadtok8s" {
    k8s_version = var.k8s_version
    label = var.k8s_label
    region = var.k8s_region
    tags = var.tags

    dynamic "pool" {
        for_each = var.pools
        content {
            type  = pool.value["type"]
            count = pool.value["count"]
        }
    }
}


resource "local_file" "k8s_config" {
    content = "${nonsensitive(base64decode(linode_lke_cluster.roadtok8s.kubeconfig))}"
    filename = "${local.k8s_config_file}"
    file_permission = "0600"
}