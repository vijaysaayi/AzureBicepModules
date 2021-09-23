param resourceName string
param repositoryUrl string = 'https://github.com/Azure-Samples/python-docs-hello-django'
param branch string = 'main'
param isManualIntergration bool = true

resource djangoApp 'Microsoft.Web/sites/sourcecontrols@2018-02-01' = {
  name: '${resourceName}/web'
  properties: {
    repoUrl: repositoryUrl
    branch: branch  
    isManualIntegration: isManualIntergration  
  }
}
