#!/usr/bin/env bash

source ./00-config.sh

source ./common/01-create-namespace-secret-catalog-source.sh
source ./common/02-subscribe-ai-manager-operator.sh
source ./common/03-verify-ai-manager-operator.sh
source ./common/04-create-crd-installation.sh
source ./common/05-verify-ai-manager-pods.sh
source ./common/06-configure-signed-certifications-for-nginx.sh
source ./common/07-print-aiops-console-url-pwd.sh

function sync_cassandra () {
  oc project $NAMESPACE

  ### Note: This file is downloaded from https://github.com/IBM/cp4waiops-samples/blob/main/post-install/3.3/sync-cassandra.sh
  common/11-sync-cassandra.sh
}

install_main() {

  date1=$(date '+%Y-%m-%d %H:%M:%S')
  echo "******************************************************************************************"
  echo " IBM Cloud Pak for Watson AIOps AI-Manager started ....$date1"
  echo "******************************************************************************************"
  
  create_namespace_secret_catalog_source
  subscribe_ai_manager_operator
  verify_ai_manager_operator
  if [[ $GLOBAL_POD_VERIFY_STATUS == "true" ]]; then 
    create_crd_installation
    verify_ai_manager_pods
    if [[ $GLOBAL_POD_VERIFY_STATUS == "true" ]]; then 
      configure_signed_certificates_for_NGINX
    fi
    print_aiops_console_url_pwd
    sync_cassandra
  fi

  date1=$(date '+%Y-%m-%d %H:%M:%S')
  echo "******************************************************************************************"
  echo " IBM Cloud Pak for Watson AIOps AI-Manager completed ....$date1"
  echo "******************************************************************************************"

}

install_main