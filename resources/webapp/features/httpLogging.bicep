param resourceName string
param isEnabled bool

resource httpLogging 'Microsoft.Web/sites/config@2020-12-01' = {
  name: '${resourceName}/web'
  properties: {
    httpLoggingEnabled: isEnabled
  }
}
