# Apply env variables and secrets
kubectl apply -f aws-secret.yaml
kubectl apply -f env-secret.yaml
kubectl apply -f env-configmap.yaml
kubectl apply -f backend-feed-deployment.yaml
kubectl apply -f backend-feed-service.yaml
kubectl apply -f backend-user-deployment.yaml
kubectl apply -f backend-user-service.yaml

kubectl apply -f reverseproxy-deployment.yaml
kubectl apply -f reverseproxy-service.yaml

kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy  
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
# Nếu update cluster
# aws eks --region us-east-1 update-kubeconfig --name clusterProject3
#kubectl autoscale deployment backend-feed --cpu-percent=70 --min=3 --max=5
# kubectl get ConfigMap/env-config -oyaml
kubectl edit hpa   kubectl delete hpa backend-user  kubectl delete hpa backend-feed kubectl autoscale deployment backend-feed --cpu-percent=70 --min=3 --max=5

docker run --rm --publish 8080:8080 -v $HOME/.aws:/Users/phuochuynh2482/.aws --env POSTGRESS_HOST=$POSTGRESS_HOST --env POSTGRESS_USERNAME=$POSTGRESS_USERNAME --env POSTGRESS_PASSWORD=$POSTGRESS_PASSWORD --env POSTGRESS_DATABASE=$POSTGRESS_DATABASE --env AWS_REGION=$AWS_REGION --env AWS_PROFILE=$AWS_PROFILE --env AWS_BUCKET=$AWS_BUCKET --env JWT_SECRET=$JWT_SECRET --name cd0354-monolith-to-microservices-project_backend-feed_1
