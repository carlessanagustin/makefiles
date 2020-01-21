# Kubernetes (AKS) context
aks_context:
	az aks get-credentials --overwrite-existing --subscription $(AKS_SUBS) --resource-group $(AKS_RG) --name $(AKS_NAME)

# Create a container registry
acr_create:
	az acr create --name $(ACR_NAME)  --subscription $(AKS_SUBS) --resource-group $(AKS_RG) --sku Basic --location $(LOCATION)
