param costCenter string
param env string
param purpose string
param location string



targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${purpose}-${costCenter}-${location}-${env}-rg'
  location: location
}


module storage 'storage.bicep' = {
  scope: resourceGroup
  params: {
    costCenter: costCenter
    env: env
    purpose: purpose
  }
}
