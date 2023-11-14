kubectl create namespace app-ns


#create supply chain components
kubectl apply -f source-retrieval-template.yaml
kubectl apply -f build-template.yaml
kubectl apply -f test-template.yaml
kubectl apply -f deployment-template.yaml

#create supply chain
kubectl apply -f supply-chain.yaml

# create workload
kubectl apply -f workload.yaml


kubectl delete -f source-retrieval-template.yaml
kubectl delete  -f build-template.yaml
kubectl delete -f test-template.yaml
kubectl delete -f deployment-template.yaml