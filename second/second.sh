
while read line; do
	$line
done < ../export.sh

gcloud builds submit --tag gcr.io/${GOOGLE_CLOUD_PROJECT}/test-image .
# gcloud builds submit --config cloudbuild.yaml .
kubectl create deployment --image gcr.io/$PROJECT_ID/test-image test-image
