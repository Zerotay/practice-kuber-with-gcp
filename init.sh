export my_zone=us-central1-a
export my_cluster=cluster-1
export PROJECT_ID=$(gcloud config get-value project)
export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value project)


source <(kubectl completion bash)

gcloud container clusters create $my_cluster --num-nodes 3 --zone $my_zone --enable-ip-alias
gcloud container clusters get-credentials $my_cluster --zone $my_zone
# gcloud container clusters get-credentials $my_cluster --zone=$my_zone
