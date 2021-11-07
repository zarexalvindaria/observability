# backend-tracing
 docker build -t backend-tracing .
 docker tag backend-tracing zarexalvindaria/backend-tracing:latest
 docker push zarexalvindaria/backend-tracing:latest

### PORT FORWARD SERVICES
# Getting grafana pod name: prometheus-grafana-588475b7c6-b6m4p
kubectl get pod -n monitoring | grep grafana
kubectl port-forward -n monitoring prometheus-grafana-588475b7c6-b6m4p 3000
kubectl port-forward svc/frontend-service 8080:8080
kubectl port-forward svc/backend-service 80:80

# Apply modified version of backend services
kubectl apply -f https://raw.githubusercontent.com/zarexalvindaria/observability/main/manifests/app/backend_tracing.yaml

# port forward jaeger
kubectl port-forward -n observability $(kubectl get pods -n observability -l=app="jaeger" -o name) --address 0.0.0.0 16686:16686


gcloud compute  ssh --ssh-flag="-L 3000:localhost:3000"  --zone "asia-east1-b" "instance-1"
gcloud compute  ssh --ssh-flag="-L 8080:localhost:8080"  --zone "asia-east1-b" "instance-1"
gcloud compute  ssh --ssh-flag="-L 16686:localhost:16686"  --zone "asia-east1-b" "instance-1"
gcloud compute  ssh --ssh-flag="-L 80:localhost:80"  --zone "asia-east1-b" "instance-1"



