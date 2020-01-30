# namespace
aks_create_ns:
	kubectl create namespace $(NAMESPACE)

aks_delete_ns:
	kubectl delete namespace $(NAMESPACE)

# acr
aks_acr_secret:
	kubectl -n $(NAMESPACE) create secret docker-registry $(ACR_SECRET_NAME) --docker-server $(ACR_SERVER) --docker-username $(ACR_USER) --docker-password $(ACR_PWD)

# stack
aks_create_stack:
	kubectl apply -f ./k8s --record

aks_start: aks_create_ns aks_acr_secret

aks_stop: aks_delete_ns

# monitoring
aks_status:
	watch kubectl -n $(NAMESPACE) get deploy,service,ingress,secrets,configmap,pvc --show-labels

aks_events:
	kubectl -n $(NAMESPACE) get events

aks_decode:
	@echo "$(SECRET)" | base64 --decode

# Ingress Nginx Basic Authentication
## FROM https://kubernetes.github.io/ingress-nginx/examples/auth/basic/

define INSTRUCTIONS
	
	USAGE: add the following lines to the Ingress Kubernetes recipe + apply ingress + secret to Kubernetes cluster

	...
	kind: Ingress
	metadata:
	  annotations:
	    nginx.ingress.kubernetes.io/auth-type: basic
	    nginx.ingress.kubernetes.io/auth-secret: basic-auth
	    nginx.ingress.kubernetes.io/auth-realm: 'Authentication Required'
	...
endef
export INSTRUCTIONS

aks_ing_basic_auth:
	htpasswd -cb auth $(USR) $(PASSW)
	kubectl create secret generic basic-auth --from-file=auth
	kubectl get secret basic-auth -o yaml > basic-auth-secret.yaml
	rm -Rf auth
	kubectl delete secret basic-auth
	@echo "$$INSTRUCTIONS"
