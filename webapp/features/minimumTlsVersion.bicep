param resourceName string
param tlsVersion string

resource minimumTlsVersion 'Microsoft.Web/sites/config@2020-12-01' = {
  name: '${resourceName}/web'
  properties: {
    minTlsVersion: tlsVersion
    }
}
