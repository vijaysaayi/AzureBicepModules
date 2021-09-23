param resourceName string = 'hack-test-storage${uniqueString(resourceGroup().id)}'

targetScope = 'resourceGroup'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name : resourceName
  location:resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'BlobStorage'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    minimumTlsVersion: 'TLS1_2'
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
    }
  }
}

var blobStorageConnectionString  = 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${listKeys(storageAccount.id, storageAccount.apiVersion).keys[0].value}'
output blobStorageConnectionString string = blobStorageConnectionString
