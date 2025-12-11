#! /usr/bin/env bash
# This script sets up environment variables for Terraform operations.

aws secretsmanager get-secret-value --secret-id healthespresso/terraform --query SecretString --output text | jq -r 'to_entries|map("export " + .key + "=" + (.value|@sh))|.[]'
