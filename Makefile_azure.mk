# Kubernetes (AKS) context
aks_context:
	az aks get-credentials --overwrite-existing --subscription $(AKS_SUBS) --resource-group $(AKS_RG) --name $(AKS_NAME)

# Create a container registry
acr_create:
	az acr create --name $(ACR_NAME)  --subscription $(AKS_SUBS) --resource-group $(AKS_RG) --sku Basic --location $(LOCATION) --admin-enabled=true --tags $(TAGS)

# upgrading aks
aks_upgrade_list:
	az aks get-upgrades --subscription $(AKS_SUBS) --resource-group $(AKS_RG) --name $(AKS_NAME) --output table

aks_upgrade_start:
	az aks upgrade --subscription $(AKS_SUBS) --resource-group $(AKS_RG) --name $(AKS_NAME) --kubernetes-version $(AKS_VERSION)

aks_upgrade_status:
	az aks show --subscription $(AKS_SUBS) --resource-group $(AKS_RG) --name $(AKS_NAME) --output table