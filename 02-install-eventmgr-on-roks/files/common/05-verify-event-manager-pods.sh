#!/usr/bin/env bash

function verify_event_manager_pods () {

echo "-----------------------------------"
echo "5. Verify Pods Count in Event Manager Namespace ($EVENT_MANAGER_NAMESPACE)"
echo "-----------------------------------"

GLOBAL_POD_VERIFY_STATUS=false

POD_COUNT=0
MIN_POD_COUNT=85
MAX_WAIT_MINUTES=120
LOOP_COUNT=0

while [[ $POD_COUNT -lt $MIN_POD_COUNT ]] && [[ $LOOP_COUNT -lt $MAX_WAIT_MINUTES ]]; do
  POD_COUNT=$(oc get pods -n $EVENT_MANAGER_NAMESPACE | wc -l ) 
  echo "Event Manager Pod Count in $LOOP_COUNT minutes : $POD_COUNT"
  LOOP_COUNT=$((LOOP_COUNT + 1))
  sleep 60
done

if [[ $POD_COUNT -gt $MIN_POD_COUNT ]]; then
  echo "Event Manager Namespace Pods counts are OK and it is more than $MIN_POD_COUNT"; 
  GLOBAL_POD_VERIFY_STATUS=true
else
  echo "Timed out waiting for PODs in ${EVENT_MANAGER_NAMESPACE}"
  echo "Only $POD_COUNT pods are created in Event Manager namespace. It should be more than  $MIN_POD_COUNT"; 
  GLOBAL_POD_VERIFY_STATUS=false
fi

}