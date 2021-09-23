param resourceName string
param isEnabled bool

resource alwaysOn 'Microsoft.Web/sites/config@2020-12-01' = {
  name: '${resourceName}/web'
  properties: {
    alwaysOn: isEnabled
    }
}
