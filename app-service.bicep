param location string = resourceGroup().location

//windows system
resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'azbicep-dev-eus-asp1'
  location: location
  sku: {
    name: 'S1' //Pricing tier
    capacity: 1 //Number of instance,
  }
}

resource appService 'Microsoft.Web/sites@2021-03-01' = {
  name: 'azbicep-dev-eus-web-app1'
  location: location
  properties:{
    //Important we should give your app service plan name
    serverFarmId: resourceId('Microsoft.Web/serverfarms', 'azbicep-dev-eus-asp1')
  }
  dependsOn:[
    //if your creating your app service plan with this file 
    //then you have to mention your app service plan name
    appServicePlan
  ]
}
