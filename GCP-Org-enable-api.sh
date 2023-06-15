#!/bin/bash
# List all GCP projects
project_list=$(gcloud projects list --format="value(projectId)")

# Enable Compute Engine API and Cloud Storage service for each project
for project in $project_list; do
  echo $project
  #gcloud services enable compute.googleapis.com storage-component.googleapis.com --project=$project
  gcloud services enable compute.googleapis.com cloudresourcemanager.googleapis.com container.googleapis.com logging.googleapis.com dns.googleapis.com --project=$project
  gcloud services enable cloudkms.googleapis.com iam.googleapis.com appengine.googleapis.com bigquery.googleapis.com admin.googleapis.com file.googleapis.com apikeys.googleapis.com --project=$project
  gcloud services enable cloudfunctions.googleapis.com sqladmin.googleapis.com bigtableadmin.googleapis.com pubsub.googleapis.com redis.googleapis.com serviceusage.googleapis.com --project=$project
  gcloud services enable cloudasset.googleapis.com essentialcontacts.googleapis.com accessapproval.googleapis.com --project=$project
done
