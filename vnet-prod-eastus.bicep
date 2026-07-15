param virtualNetworks_vnet_prod_eastus_name string = 'vnet-prod-eastus'

resource virtualNetworks_vnet_prod_eastus_name_resource 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: virtualNetworks_vnet_prod_eastus_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.3.0.0/16'
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'Web'
        id: virtualNetworks_vnet_prod_eastus_name_Web.id
        properties: {
          addressPrefix: '10.3.0.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'App'
        id: virtualNetworks_vnet_prod_eastus_name_App.id
        properties: {
          addressPrefix: '10.3.1.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'Data'
        id: virtualNetworks_vnet_prod_eastus_name_Data.id
        properties: {
          addressPrefix: '10.3.2.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'Management'
        id: virtualNetworks_vnet_prod_eastus_name_Management.id
        properties: {
          addressPrefix: '10.3.3.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource virtualNetworks_vnet_prod_eastus_name_App 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_prod_eastus_name}/App'
  properties: {
    addressPrefix: '10.3.1.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_prod_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_prod_eastus_name_Data 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_prod_eastus_name}/Data'
  properties: {
    addressPrefix: '10.3.2.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_prod_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_prod_eastus_name_Management 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_prod_eastus_name}/Management'
  properties: {
    addressPrefix: '10.3.3.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_prod_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_prod_eastus_name_Web 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_prod_eastus_name}/Web'
  properties: {
    addressPrefix: '10.3.0.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_prod_eastus_name_resource
  ]
}
