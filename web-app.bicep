metadata descrption = 'This is used to create a web app in a resource group'
param location string = resourceGroup().location

@description('This is to define the web app name')
@minLength(5)
param name string = 'bicep-test-web-app'

// param location string = resourceGroup().location

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
    name: 'bicep-test-web-app-plan'
    location: location
    sku: {
      name: 'F1'
      capacity: 1
    }
  }


resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: name
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output webAppUrl string = webApplication.properties.defaultHostName
