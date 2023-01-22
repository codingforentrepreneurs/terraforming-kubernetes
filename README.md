[![Terraforming Kubernetes Image](https://static.codingforentrepreneurs.com/media/courses/terraforming-kubernetes-on-linode/5d16a50c-a2f3-40e5-8906-eb375d696d81.jpg)](https://www.codingforentrepreneurs.com/courses/terraforming-kubernetes-on-linode/)
# Terraforming Kubernetes
What if starting a remote virtual machine instance was as simple as changing a number on a document and running a command? That is how simple terraform can be and why it's so powerful.

Using documents to change what server we need running is a feature of Infrastructure as Code and can be a paradigm shift for many developers since it's so simple yet effective. One of the biggest advantages of IaC and terraform: version control and CI/CD pipeline automation.

Terraform will turn on (and off) the servers we need. Kubernetes will manage how we allocate the resources on those servers to run the applications we want and need. The pair is a juggernaut of automation. This post will teach you exactly what to do to use them both.

Want a minimal and rapid-fire version of this post? Check out this [repo](https://github.com/codingforentrepreneurs/terraforming-kubernetes-rapid).

### Watch the course [here](https://www.codingforentrepreneurs.com/courses/terraforming-kubernetes-on-linode/)


__Other Resources__
- [Blog Post](https://www.codingforentrepreneurs.com/blog/terraforming-kubernetes-on-linode/)
- [Github Repo](https://github.com/codingforentrepreneurs/terraforming-kubernetes)
- Recommended Course: [Docker & Docker Compose](https://www.codingforentrepreneurs.com/courses/docker-and-docker-compose/)
- [Terraform Install Guide](https://developer.hashicorp.com/terraform/downloads)
- [Kubernetes Command Line Tool Install Guide](https://kubernetes.io/docs/tasks/tools/)



### Using this Repo

#### Clone Repo
```bash
git clone https://github.com/codingforentrepreneurs/terraforming-kubernetes
cd terraforming-kubernetes
```

#### Create Linode API Key
1. Get an account with a $100 credit [here](https://www.linode.com/cfe)
2. Create an API Personal Access Key on Linode [here](https://cloud.linode.com/profile/tokens)

```bash
echo "linode_api_token=\"YOUR_API_KEY\"" >> devops/terraform.tfvars
```

### Configure Cloud-based Terraform State on a Object Storage Bucket

1. Create an [Object Storage Bucket](https://cloud.linode.com/object-storage/buckets)
2. Create an [Access Key for Object Storage](https://cloud.linode.com/object-storage/access-keys)
3. Update the terraform backend.

Below is an example backend that you need to modify to fit your Object Storage bucket. This backend will store your Terraform statefiles in Object Storage instead of locally.

In `devops/backend` add:
```bash
skip_credentials_validation=true
skip_region_validation=true
bucket="YOUR_CUSTOM_OBJECT_STORAGE_BUCKET_NAME"
key="terraforming-kubernetes.tfstate"
region="us-southeast-1"
endpoint="us-southeast-1.linodeobjects.com"
access_key="YOUR_CUSTOM_S3_ACCESS_KEY"
secret_key="YOUR_CUSTOM_S3_SECRET_KEY"
```
Replace:
- `YOUR_CUSTOM_OBJECT_STORAGE_BUCKET_NAME` with the bucket you created
- `YOUR_CUSTOM_S3_ACCESS_KEY` and `YOUR_CUSTOM_S3_SECRET_KEY` with the object storage access keys you created
- Replace any other attributes to fit your specific bucket and project (i.e. region, endpoint, key)

#### Terraform commands

```
terraform -chdir=./devops init --backend-config=backend
terraform -chdir=./devops apply
```
After running apply, type `yes` to agree.

### Kubernetes Commands
Once Terraform completes, the relative folder `.kube` will be created with a `kubeconfig.yaml` file that you can use. If you're on VSCode, your `KUBECONFIG` environment variable will already be set for you so you can:

```
kubecl get nodes
```
If you have any issues here, consider watching [the course](https://www.codingforentrepreneurs.com/courses/terraforming-kubernetes-on-linode/) or reading [the blog post](https://www.codingforentrepreneurs.com/blog/terraforming-kubernetes-on-linode/).
