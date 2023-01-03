# Reference commands for this tutorial

## Backend Reference File

```
skip_credentials_validation=true
skip_region_validation=true
bucket="terraforming-k8s"
key="terraforming-k8s.tfstate"
region="us-southeast-1"
endpoint="us-southeast-1.linodeobjects.com"
access_key="YOUR_CUSTOM_S3_ACCESS_KEY"
secret_key="YOUR_CUSTOM_S3_SECRET_KEY"
```

##  Initialize Terraform with backend
```bash
terraform -chdir=./devops init -backend-config=backend
```
- Using `-chdir=./devops` changes the Terraform working directory

##  Upgrade Terraform with backend
This happens only when you make major changes

```bash
terraform -chdir=./tf init -backend-config=backend -upgrade
```


##  View the Terraform Plan Changes
```bash
terraform -chdir=./tf plan 
```


## View the Plan and Manually Approve Terraform Changes
```bash
terraform -chdir=./tf apply
```
- The first time running this can take anywhere from 5-20 minutes and possibly longer

##  Automatically Approve the Terraform Changes
```bash
terraform -chdir=./tf apply -auto-approve 
```


## Destroy Everythying
```bash
terraform -chdir=./tf destroy -auto-approve 
```
This is shortcut for just running `terraform -chdir=./tf apply -auto-approve -destroy`


## Terraform Console
```
terraform -chdir=./devops console
```

## Visual Studio Code Workspace Settings

After you run `terraform apply`, you might want to use the following settings.  The `KUBECONFIG` key is set to the newly created `.kube/kubeconfig.yaml` file from Terraform. This file is what `kubectl` will use by default to access your kubernetes cluster.

```json
{
	"folders": [
		{
			"path": "."
		}
	],
	"settings": {
		"files.autoSave": "afterDelay",
		"terminal.integrated.env.osx": {
            "KUBECONFIG": "${workspaceFolder}/.kube/kubeconfig.yaml"
        },
        "terminal.integrated.env.windows": {
            "KUBECONFIG": "${workspaceFolder}\\.kube\\kubeconfig.yaml"
        },
        "terminal.integrated.env.linux": {
            "KUBECONFIG": "${workspaceFolder}/.kube/kubeconfig.yaml"
        },
	}
}
```