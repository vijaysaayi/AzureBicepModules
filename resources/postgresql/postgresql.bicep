param resourceName string
param sqlDbName string = '${uniqueString(resourceName)}'
param sqlUser string = 'databaseadmin'
param sqlPassword string = '0D${uniqueString(sqlDbName)}#'

resource postgresqlserver 'Microsoft.DBforPostgreSQL/servers@2017-12-01' = {
  name: resourceName
  location: resourceGroup().location
  properties:{
    minimalTlsVersion : 'TLS1_2'
    createMode: 'Default'
    administratorLogin:sqlUser
    administratorLoginPassword:sqlPassword
  }
}

resource postgresqlDatabase 'Microsoft.DBforPostgreSQL/servers/databases@2017-12-01' = {
  name: '${resourceName}/${sqlDbName}'
  properties: {
    charset: 'utf8'
    collation: 'English_United States.1252'
  }  
  dependsOn:[
    postgresqlserver
  ]
}

output serverName string = resourceName
output databaseName string = sqlDbName
output userName string = sqlUser
output password string = sqlPassword
