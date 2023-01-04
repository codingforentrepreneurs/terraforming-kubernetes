init:
	terraform -chdir=./devops init --backend-config=backend

plan:
	terraform -chdir=./devops plan

apply:
	terraform -chdir=./devops apply

console:
	terraform -chdir=./devops console