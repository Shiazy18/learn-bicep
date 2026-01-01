@allowed([
  'development'
  'qa'
  'uat'
  'preprod'
  'production'
])
param env string
param costCenter string


param location string =  resourceGroup().location
@description('purpose of web Storage account')
param purpose string

var tags = {
  cost_center: costCenter
  env: env
  purpose: purpose
}

var name string = '${env}${location}${costCenter}${purpose}sa'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  tags: tags
}
