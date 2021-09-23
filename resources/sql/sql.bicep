param resourceName string = 'hack-test-sql${uniqueString(resourceGroup().id)}'

targetScope = 'resourceGroup'
param sqlDbName string = '${uniqueString(resourceName)}'

param sqlUser string = 'databaseadmin'
param sqlPassword string = '0D${uniqueString(sqlDbName)}#'

resource sqlServer 'Microsoft.Sql/servers@2021-02-01-preview' = {
  name: resourceName
  location: resourceGroup().location
  properties: {
    administratorLogin:sqlUser
    administratorLoginPassword:sqlPassword
    minimalTlsVersion: '1.2'
  }  
}

resource sqlDatabase 'Microsoft.Sql/servers/databases@2021-02-01-preview' = { 
  name: '${resourceName}/${sqlDbName}'
  location: resourceGroup().location
  sku : {
    name : 'Basic'
    tier : 'Basic'
    capacity: 5
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648    
  }
  dependsOn: [
    sqlServer
  ]
}

output serverName string = resourceName
output databaseName string = sqlDbName
output userName string = sqlUser
output password string = sqlPassword
