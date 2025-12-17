metadata descrption = 'This is used to create a web app in a resource group'
param location string = resourceGroup().location

@description('This is to define the web app name')
@minLength(5)
param name string = '${env}-${cost_centre}-bicep-webapp'

@description('environment')
@allowed([
  'dev'
  'qa'
  'uat'
  'ppe'
  'prod'
])
param env string = 'dev'

@description('cost center')
@minLength(00000)
@maxLength(99999)
param cost_centre string = '09876'

var tags = {
  cost_centre: cost_centre
  environment: env
}


// param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
    name: '${name}-plan'
    location: location
    sku: {
      name: 'F1'
      capacity: 5
    }
    tags: tags
  }


resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: name
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
  tags: tags
}

output webAppUrl string = webApplication.properties.defaultHostName


