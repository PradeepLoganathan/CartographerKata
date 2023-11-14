CERT_MANAGER_VERSION=1.5.3

kapp deploy --yes -a cert-manager \
	-f https://github.com/jetstack/cert-manager/releases/download/v$CERT_MANAGER_VERSION/cert-manager.yaml

k get ns

k get pods -n cert-manager

kubectl create namespace cartographer-system

kubectl apply -f https://github.com/vmware-tanzu/cartographer/releases/download/v0.0.7/cartographer.yaml
kubectl apply -f https://github.com/vmware-tanzu/cartographer/releases/v0.0.7/download/cartographer.yaml


kubectl get pods -n cartographer-system



