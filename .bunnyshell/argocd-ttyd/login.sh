#! /usr/bin/env bash

serverAddr=${ARGOCD_SERVER}
newPass=${ARGOCD_PASS}
initialPass=${ARGOCD_INITIAL_PASS}

if [[ ! -z "$initialPass" ]]; then
  echo "loging with initial pass..."
  argocd login --username admin --password $initialPass --insecure $serverAddr
  if [ $? -eq 0 ]; then
     echo "setting new pass..."
     argocd account update-password --current-password $initialPass --new-password $newPass
  else
     echo "loging with new pass..."
     argocd login --username admin --password $newPass --insecure $serverAddr
  fi
else
  echo "loging with new pass..."
  argocd login --username admin --password $newPass --insecure $serverAddr
fi

echo $?
