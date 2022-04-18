#!/usr/bin/env bash

source ./00-config.sh

function sync_cassandra () {
  oc project $NAMESPACE

  ### Note: This file is downloaded from https://github.com/IBM/cp4waiops-samples/blob/main/post-install/3.3/sync-cassandra.sh
  common/11-sync-cassandra.sh
}

sync_cassandra