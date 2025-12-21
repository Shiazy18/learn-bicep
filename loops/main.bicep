param costCenter string
param env string
param purpose string
param location string

var short_location_map ={
centralus : 'cus'
eastus : 'eus'
westus : 'wus'
eastus2 : 'eus2'
}

var short_location = short_location_map[location]

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${purpose}-${costCenter}-${short_location}-${env}-rg'
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
