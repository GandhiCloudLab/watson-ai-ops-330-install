#!/usr/bin/env bash

function subscribe_operator() {

### Install  Infra Automation operator (Subscription)
echo "-----------------------------------"
echo "2. Install  Infra Automation operator (Subscription)"
echo "-----------------------------------"
cat << EOF | oc apply -f -
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  name: ibm-infrastructure-automation-operator
  namespace: $NAMESPACE
spec:
  channel: $SUBSCRIPTION_CHANNEL
  installPlanApproval: Automatic
  name: ibm-infrastructure-automation-operator
  source: ibm-operator-catalog
  sourceNamespace: openshift-marketplace
  startingCSV: $SUBSCRIPTION_STARTINGCSV
EOF

sleep 5

echo "Process completed .... "

}


