#!/bin/bash

VMHome=$(pwd)

az login --service-principal -u #{CLIENT_ID}# -p #{CLIENT_SECRET}# --tenant #{TENANT_ID}#

stg_account_check=$(az storage account check-name -n #{STORAGE_ACCOUNT}# -o json | jq -r '.nameAvailable')

if [ $stg_account_check == false ]; then
	echo "El storage account #{STORAGE_ACCOUNT}# ya existe"

	stg_container_check=$(az storage container exists --account-name #{STORAGE_ACCOUNT}# --name #{STORAGE_CONTAINER}# --connection-string $stg_account_connection| jq -r '.exists')
	if [ $stg_container_check == false ]; then
		echo "El storage container #{STORAGE_CONTAINER}# no existe"
		az storage container create -n #{STORAGE_CONTAINER}# --account-name #{STORAGE_ACCOUNT}#
	else
		echo "El storage container #{STORAGE_CONTAINER}# ya existe"
	fi
else
	echo "El storage account #{STORAGE_ACCOUNT}# no existe"
	az storage account create -n #{STORAGE_ACCOUNT}# -g #{RESOURCE_GROUP}# -l westus --sku Standard_LRS
	az storage container create -n #{STORAGE_CONTAINER}# --account-name #{STORAGE_ACCOUNT}#
fi

stg_account_key=$(az storage account keys list -g #{RESOURCE_GROUP}# -n #{STORAGE_ACCOUNT}# -o json | jq -r '.[0].value')

echo "##vso[task.setvariable variable=ACCESS_KEY;issecret=true]$stg_account_key"

exit


