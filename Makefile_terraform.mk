init:
	terraform init

workspace_create:
	terraform workspace new ${WORKSPACE}

workspace_select:
	terraform workspace select ${WORKSPACE}

workspace_delete:
	terraform workspace delete -force ${WORKSPACE}

workspace_list:
	terraform workspace list

plan:
	terraform plan -var-file=${TFVARS}

apply:
	terraform apply -var-file=${TFVARS} 

resource-group:

	terraform apply -target="module.groups" -var-file=${TFVARS}


vnet:
	terraform apply -target="module.vnet" -var-file=${TFVARS}

vm01:
	terraform apply -target="module.vm01" -var-file=${TFVARS}


destroy:
	terraform destroy -var-file=${TFVARS} 

up: workspace_create init plan

down:  destroy workspace_delete
