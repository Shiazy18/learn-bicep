param location string

resource webapp 'Microsoft.Web/sites@2024-11-01' = {
  name: 'test-webapp'
  location: location
  properties: {
    serverFarmId: 'webServer.id'
  }
}
