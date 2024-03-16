while read line; do
	$line
done < ../export.sh

cat > canary.yaml<<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-canary
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
        track: canary
        Version: "1.24"
    spec:
      containers:
      - name: nginx
        image: moonjukhim/nginx:1.24
        ports:
        - containerPort: 80
EOF

kubectl apply -f canary.yaml

echo "wait for configuration"
for i in {1..10}
do
	echo $i
	kubectl get deployments
	sleep 1
done


kubectl scale --replicas=0 deployment nginx-deployment
kubectl get deployments

