param resourceName string
param connectionStringCollection object

resource appSettings 'Microsoft.Web/sites/config@2020-12-01' = {
  name : '${resourceName}/connectionstrings'
  properties : connectionStringCollection
}
