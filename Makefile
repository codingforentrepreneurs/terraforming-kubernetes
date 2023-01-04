init:
	terraform -chdir=./devops init --backend-config=backend

plan:
	terraform -chdir=./devops plan

tf_apply:
	terraform -chdir=./devops apply

tf_destroy:
	terraform -chdir=./devops apply -destroy

console:
	terraform -chdir=./devops console

k8s_apply:
	kubectl apply -f k8s/

k8s_delete:
	kubectl delete -f k8s/

cfe_nginx_ip:
	kubectl get service cfe-nginx-service -o "jsonpath={.status.loadBalancer.ingress[0].ip}"
