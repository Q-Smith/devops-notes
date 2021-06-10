
# Configuration

```bash
ls -al ~/.config/gcloud
export GCP_PROJECT_ID="<name/id>"
```

# Bastion Hosts (with IAP)

```bash
gcloud compute ssh --tunnel-through-iap vm-bastion-001 --project="$GCP_PROJECT_ID" --zone="us-east1-b"
```

# Cloud Shell

```bash
gcloud config get-value project
gcloud projects list --filter="$GCP_PROJECT_ID"

gcloud iam roles describe roles/viewer
gcloud iam roles describe --project="$GCP_PROJECT_ID" <role>

gcloud cloud-shell ssh --authorize-session --project=prj-gousenaib-inf-res01 --command=ls "dir"

gcloud projects get-iam-policy pid-gousenaid-eaei-astro-01  \
--flatten="bindings[].members" \
--format='table(bindings.role)' \
--filter="bindings.members:service-PROJECT-NUMBER@containerregistry.iam.gserviceaccount.com"
```

# Pub / Sub

```bash
gcloud components install pubsub-emulator
gcloud beta emulators pubsub start --host-port=0.0.0.0:8086 --project="$GCP_PROJECT_ID"

export PUBSUB_EMULATOR_HOST=localhost:8086
export PUBSUB_PROJECT_ID="$GCP_PROJECT_ID"
```

# Cloud SQL

```bash
gcloud auth login
curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
chmod +x cloud_sql_proxy

./bin/cloud_sql_proxy -instances=$GCP_PROJECT_ID:us-east1:astro-demo=tcp:3306

./bin/mysqlsh -u root -p --host 127.0.0.1 --port 3306
use astro;
sql show databases;
sql show full tables;
sql show fields from TABLE / describe TABLE;
```

# Google Kubernetes Engine (GKE)

Workload Identity installs ip-masq-agent if the cluster is created without the --disable-default-snat flag.

```bash
# Ensure that Workload Identity is enabled
gcloud container clusters describe gke-cluster-primary \
  --project="$GCP_PROJECT_ID" \
  --region="us-east4" \
  --format="value(workloadIdentityConfig.workloadPool)"

# Ensure that GKE metadata server (GKE_METADATA) is configured on the node pool
gcloud container node-pools describe jenkins-default-pool \
  --project="$GCP_PROJECT_ID" \
  --region="us-east4" \
  --cluster="gke-cluster-primary" \
  --format="value(config.workloadMetadataConfig.mode)"

# Ensure that the Kubernetes service account is annotated correctly
kubectl describe serviceaccount \
  --project="$GCP_PROJECT_ID" \
  --region="us-east4" \
  --namespace ops \
  KSA_NAME
```

# Service Accounts

```bash
gcloud iam service-accounts create sa-demo --display-name="Demo SA" --project="$GCP_PROJECT_ID"
gcloud iam service-accounts get-iam-policy sa-demo@$GCP_PROJECT_ID.iam.gserviceaccount.com

gcloud projects add-iam-policy-binding $GCP_PROJECT_ID --role="roles/secretmanager.secretAccessor" --member="serviceAccount:sa-demo@$GCP_PROJECT_ID.iam.gserviceaccount.com"
```

project = $GCP_PROJECT_ID
sa = act-jenk@$GCP_PROJECT_ID.iam.gserviceaccount.com
3c1c8270d4f6a63f4b6bc47c89c3ecccee4359c8
/Users/quinnsmith/_Projects/GPN/astro-infra/$GCP_PROJECT_ID-3c1c8270d4f6.json

brew install oauth2l
oauth2l fetch --type oauth --scope cloud-platform --credentials /Users/quinnsmith/_Projects/GPN/astro-infra/$GCP_PROJECT_ID-3c1c8270d4f6.json

jwt encode --alg RS256 --iss "act-jenk@$GCP_PROJECT_ID.iam.gserviceaccount.com" --aud "https://oauth2.googleapis.com/token" --exp "+30 min" --payload "scope=https://www.googleapis.com/auth/compute.readonly" -S @//Users/quinnsmith/_Projects/GPN/astro-infra/$GCP_PROJECT_ID-3c1c8270d4f6.pem

## Impersonation

```bash
gcloud auth list
gcloud projects list
gsutil ls -p "$GCP_PROJECT_ID"

gcloud --impersonate-service-account=sa-vm-gke-nodes@$GCP_PROJECT_ID.iam.gserviceaccount.com container clusters get-credentials astro-gke-primary
```

# OAuth2

__Client Credentials Flow__

```bash
export CREDENTIALS=$(echo -n '<client_id>:<client_secret>' | base64)

curl -H "Content-Type: application/x-www-form-urlencoded" \
  -H "Authorization: Basic $CREDENTIALS" \
  -X POST "https://oauth2.googleapis.com/token" \
  -d "grant_type=client_credentials"
```

# References

https://cloud.google.com/sdk/docs/cheatsheet
https://gkesecurity.guide/cluster_configuration/
https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity
https://www.gcpweekly.com/gcp-resources/tag/terraform/
https://cloud.google.com/istio/docs/istio-on-gke/installing
https://github.com/GoogleCloudPlatform/kubernetes-engine-samples
https://stackoverflow.com/questions/65109947/access-secret-manager-of-multiple-google-cloud-projects-using-google-cloud-secre
https://quachtd.com/google-adc/
https://jryancanty.medium.com/stop-downloading-google-cloud-service-account-keys-1811d44a97d9 (awesome!!!)
https://www.netskope.com/blog/gcp-oauth-token-hijacking-in-google-cloud-part-1
https://github.com/palimarium/istio-vault-ca

https://github.com/palimarium/multicluster-istio-smh-private-gke
https://cloud.google.com/kubernetes-engine/docs/best-practices/enterprise-multitenancy