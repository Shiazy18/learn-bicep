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

param storageConfig array

var short_location = short_location_map[location]

targetScope = 'subscription'

resource resourceGroup1 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${purpose}-${costCenter}-${short_location}-${env}-rg'
  location: location
}


module storage '../storage.bicep' = [
  for storage_configs in storageConfig:  {
    scope: resourceGroup1
    params: {
      costCenter: storage_configs.costCenter
      env: env
      purpose: storage_configs.purpose
    }
  }
]

// var storageConfigs = [
//   {
//     purpose: 'demo'
//     costCenter: costCenter
//   }
// ]

// module storage '../storage.bicep' = [
//   for storage in storageConfigs: {
//     scope: resourceGroup1
//     params: {
//       costCenter: storage.costCenter
//       env: env
//       purpose: storage.purpose
//       location: location
//     }
//   }
// ]

