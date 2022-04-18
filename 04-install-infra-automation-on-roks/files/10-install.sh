#!/usr/bin/env bash

source ./00-config.sh

source ./common/01-create-namespace-secret-catalog-source.sh
source ./common/02-subscribe-infra-automation-operator.sh
source ./common/03-verify-ai-manager-operator.sh
source ./common/04-create-crd-ia-config.sh
source ./common/05-verify-ai-manager-pods.sh
source ./common/06-configure-signed-certifications-for-nginx.sh
source ./common/07-verify-crd-ia-config.sh
source ./common/08-create-crd-im-install.sh
source ./common/21-print-aiops-console-url-pwd.sh

function sync_cassandra () {
  oc project $NAMESPACE

  ### Note: This file is downloaded from https://github.com/IBM/cp4waiops-samples/blob/main/post-install/3.3/sync-cassandra.sh
  common/11-sync-cassandra.sh
}

install_main() {

  date1=$(date '+%Y-%m-%d %H:%M:%S')
  echo "******************************************************************************************"
  echo " IBM Cloud Pak for Watson AIOps Infra-Automation started ....$date1"
  echo "******************************************************************************************"
  
  create_namespace_secret_catalog_source
  subscribe_operator
  verify_ai_manager_operator
  if [[ $GLOBAL_POD_VERIFY_STATUS == "true" ]]; then 
    
    create_crd_ia_config
    verify_ai_manager_pods
    if [[ $GLOBAL_POD_VERIFY_STATUS == "true" ]]; then 
      configure_signed_certificates_for_NGINX
    fi  

    verify_ia_config
    if [[ $GLOBAL_VERIFY_STATUS == "true" ]]; then 
      create_crd_im_install
      print_aiops_console_url_pwd
      sync_cassandra
    fi
  fi

  date1=$(date '+%Y-%m-%d %H:%M:%S')
  echo "******************************************************************************************"
  echo " IBM Cloud Pak for Watson AIOps Infra-Automation completed ....$date1"
  echo "******************************************************************************************"
}

install_main