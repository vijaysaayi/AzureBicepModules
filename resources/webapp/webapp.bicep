param location string = 'westus2'
param rsg string = 'hack-rsg-${uniqueString(location)}'
param resourceName string = 'hack-${uniqueString(rsg)}'

param isLinux bool = true
param sku string = 'F1'

targetScope = 'resourceGroup'

var skuName = '${resourceName}-asp'

resource serverfarm 'Microsoft.Web/serverFarms@2020-06-01' = {
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
    serverFarmId: serverfarm.id
    httpsOnly: true
  }
} 
