export CLUSTER_NAME=kataclstr
export LOCATION=australiaeast
export RESOURCE_GROUP=katarg
export KUBERNETES_VERSION=1.27.3
export VMSIZE=Standard_B2s
export NODECOUNT=1

az login


az group create --location ${LOCATION} --name ${RESOURCE_GROUP}


az aks get-versions --location ${LOCATION} --output table


az aks create --name ${CLUSTER_NAME} \
            --resource-group ${RESOURCE_GROUP} \
            --location ${LOCATION} \
            --kubernetes-version ${KUBERNETES_VERSION} \
            --node-count ${NODECOUNT} \
            --node-vm-size ${VMSIZE} 

az aks get-credentials --resource-group ${RESOURCE_GROUP} --name ${CLUSTER_NAME}

POWERSTATE=$(az aks show \
	--resource-group "$RESOURCE_GROUP" \
	--name "$CLUSTER_NAME" \
	--query "powerState.code" -o tsv)
    
az aks stop \
		--resource-group ${RESOURCE_GROUP} \
		--name ${CLUSTER_NAME} \
		--no-wait

az aks start \
		--resource-group ${RESOURCE_GROUP} \
		--name ${CLUSTER_NAME}
		