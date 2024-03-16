while read line; do
	$line
done < ../export.sh


cat > deployment.yaml<< EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: moonjukhim/nginx:1.7.8
          ports:
            - containerPort: 80
EOF

kubectl apply -f deployment.yaml


