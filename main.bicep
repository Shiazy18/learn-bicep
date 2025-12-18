targetScope = 'subscription'

param resource string
param resourceGroupName string = '${env}-${costCenter}-${resource}-rg'
param location string
param costCenter string
param env string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module webApp 'web app/web-app.bicep' = {
  scope: resourceGroup
  params: {
    location: location
    cost_centre: costCenter
    env: env
  }
}
