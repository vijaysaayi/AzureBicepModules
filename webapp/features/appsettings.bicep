param resourceName string
param appsettingsCollection object

resource appSettings 'Microsoft.Web/sites/config@2020-12-01' = {
  name : '${resourceName}/appsettings'
  properties : appsettingsCollection
}
