param resourceName string
param location string
param isLinux bool
param sku string

targetScope = 'resourceGroup'

var skuName = '${resourceName}-asp'

resource serverFarm 'Microsoft.Web/serverFarms@2020-06-01' = {
  name: skuName
  location: location
  properties: {
    reserved: isLinux
  }
  sku: {
    name: sku    
  }  
}

resource webapp 'Microsoft.Web/sites@2020-06-01' = {
  name: resourceName
  location: location
  properties: {
    serverFarmId: serverFarm.id
    httpsOnly: true
  }
}
