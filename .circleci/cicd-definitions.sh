#!/bin/bash

# Gcloud project id
export GCLOUD_PROJECT_ID="construtora-2020"

# GCLOUD service account credentials path
export GCLOUD_JSON_KEY_PATH="${CIRCLE_WORKING_DIRECTORY}/credentials/credential.json"
export GOOGLE_APPLICATION_CREDENTIALS=${GCLOUD_JSON_KEY_PATH}
export GCLOUD_PROJECT_BUCKET_NAME="www.construtoracarvalhopereira.com.br"
export GCLOUD_PROJECT_REGION="southamerica-east1"
