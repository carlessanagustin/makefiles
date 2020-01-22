tf_ws_create:
	terraform workspace new ${WORKSPACE}

tf_ws_select:
	terraform workspace select ${WORKSPACE}

tf_ws_delete:
	terraform workspace delete -force ${WORKSPACE}

tf_ws_list:
	terraform workspace list

tf_init:
	terraform init

tf_plan:
	terraform plan -var-file=${TFVARS}

tf_apply:
	terraform apply -var-file=${TFVARS} 

tf_destroy:
	terraform destroy -var-file=${TFVARS} 

tf_start: tf_ws_create tf_init tf_plan

tf_cleanup:
	rm -Rf .terraform
	rm -Rf terraform.tfstate.d
	


tf_target_apply:
	terraform apply -target="${TARGET_APPLY}" -var-file=${TFVARS}
