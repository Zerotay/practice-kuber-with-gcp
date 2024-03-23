cat > service.yaml<<EOF
apiVersion: v1
kind: Service
metadata:
  name: nginx
spec:
  type: LoadBalancer
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 60000
      targetPort: 80
EOF


kubectl apply -f service.yaml
kubectl get service 
