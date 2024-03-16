while read line; do
	$line
done < ../export.sh
kubectl create deployment --image nginx nginx-1
kubectl get pods
export my_nginx_pod=$( kubectl get pods | grep nginx | awk '{ print $1 }' -)
echo $my_nginx_pod
kubectl describe pod $my_nginx_pod
