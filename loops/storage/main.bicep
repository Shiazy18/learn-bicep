targetScope = 'subscription'
param costCenter string
param env string
param rg_purpose string
param rg_location string



param storageConfig array




resource resourceGroup1 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${rg_purpose}-${costCenter}-${rg_location}-${env}-rg'
  location: rg_location
}


module storage '../storage.bicep' = [
  for (storage_configs, i) in storageConfig:  {
    name: 'storage${i}'
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

