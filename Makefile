init:
	terraform -chdir=./devops init -backend-config=backend

upgrade:
	terraform -chdir=./devops init -backend-config=backend -upgrade

plan:
	terraform -chdir=./devops plan 

auto:
	terraform -chdir=./devops apply -auto-approve 

apply: 
	terraform -chdir=./devops apply

destroy:
	terraform -chdir=./devops apply -destroy

console:
	terraform -chdir=./devops console

get-pods:
	export KUBECONFIG="config/kubeconfig.yaml" && kubectl get pods

get-deployments:
	export KUBECONFIG="config/kubeconfig.yaml" && kubectl get deployments

get-nodes:
	export KUBECONFIG="config/kubeconfig.yaml" && kubectl get nodes