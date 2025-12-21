


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

var short_env_map = {
  development : 'dev'
  qa : 'qa'
  uat : 'uat'
  preprod : 'ppe'
  production : 'prod'

}

var short_location_map ={
centralus : 'cus'
eastus : 'eus'
westus : 'wus'
eastus2 : 'eus2'
}

var short_location = short_location_map[location]

var short_env = short_env_map[env]

var name string = '${short_env}${short_location}{costCenter}${purpose}sa'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: name
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  tags: tags
}
