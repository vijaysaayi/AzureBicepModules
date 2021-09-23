param resourceName string
param pythonVersion string

var linuxFxVersion = 'PYTHON|${pythonVersion}'

resource python 'Microsoft.Web/sites/config@2020-12-01' = {
  name: '${resourceName}/web'
  properties: {
    linuxFxVersion: linuxFxVersion
    }
}
