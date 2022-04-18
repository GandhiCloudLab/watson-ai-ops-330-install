#!/usr/bin/env bash

source ./00-config.sh

source ./common/01-create-namespace-secret-catalog-source.sh
source ./common/02-subscribe-infra-automation-operator.sh
source ./common/03-verify-infra-automation-operator.sh
source ./common/04-create-crd-installation.sh
source ./common/05-verify-infra-automation-pods.sh
source ./common/06-configure-signed-certifications-for-nginx.sh
source ./common/07-print-aiops-console-url-pwd.sh

install_main() {

  date1=$(date '+%Y-%m-%d %H:%M:%S')
  echo "******************************************************************************************"
  echo " IBM Cloud Pak for Watson AIOps Infra-Automation started ....$date1"
  echo "******************************************************************************************"
  
  create_namespace_secret_catalog_source
  subscribe_operator
  verify_ai_manager_operator
  if [[ $GLOBAL_POD_VERIFY_STATUS == "true" ]]; then 
    create_crd_installation
    verify_ai_manager_pods
    if [[ $GLOBAL_POD_VERIFY_STATUS == "true" ]]; then 
      configure_signed_certificates_for_NGINX
    fi
    print_aiops_console_url_pwd
  fi

  date1=$(date '+%Y-%m-%d %H:%M:%S')
  echo "******************************************************************************************"
  echo " IBM Cloud Pak for Watson AIOps Infra-Automation completed ....$date1"
  echo "******************************************************************************************"

}

install_main