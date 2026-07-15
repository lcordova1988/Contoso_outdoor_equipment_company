param virtualNetworks_vnet_dev_eastus_name string = 'vnet-dev-eastus'
param networkSecurityGroups_nsg_web_externalid string = '/subscriptions/9b4195ca-fcac-4da6-94c7-1ac87d9a5198/resourceGroups/rg-network-prod-eastus/providers/Microsoft.Network/networkSecurityGroups/nsg-web'
param networkSecurityGroups_nsg_app_externalid string = '/subscriptions/9b4195ca-fcac-4da6-94c7-1ac87d9a5198/resourceGroups/rg-network-prod-eastus/providers/Microsoft.Network/networkSecurityGroups/nsg-app'
param networkSecurityGroups_nsg_data_externalid string = '/subscriptions/9b4195ca-fcac-4da6-94c7-1ac87d9a5198/resourceGroups/rg-network-prod-eastus/providers/Microsoft.Network/networkSecurityGroups/nsg-data'
param networkSecurityGroups_nsg_management_externalid string = '/subscriptions/9b4195ca-fcac-4da6-94c7-1ac87d9a5198/resourceGroups/rg-network-prod-eastus/providers/Microsoft.Network/networkSecurityGroups/nsg-management'

resource virtualNetworks_vnet_dev_eastus_name_resource 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: virtualNetworks_vnet_dev_eastus_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'web'
        id: virtualNetworks_vnet_dev_eastus_name_web.id
        properties: {
          addressPrefix: '10.1.0.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_web_externalid
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'app'
        id: virtualNetworks_vnet_dev_eastus_name_app.id
        properties: {
          addressPrefix: '10.1.1.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_app_externalid
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'data'
        id: virtualNetworks_vnet_dev_eastus_name_data.id
        properties: {
          addressPrefix: '10.1.2.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_data_externalid
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'management'
        id: virtualNetworks_vnet_dev_eastus_name_management.id
        properties: {
          addressPrefix: '10.1.3.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_nsg_management_externalid
          }
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

resource virtualNetworks_vnet_dev_eastus_name_app 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_dev_eastus_name}/app'
  properties: {
    addressPrefix: '10.1.1.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_app_externalid
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_dev_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_dev_eastus_name_data 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_dev_eastus_name}/data'
  properties: {
    addressPrefix: '10.1.2.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_data_externalid
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_dev_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_dev_eastus_name_management 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_dev_eastus_name}/management'
  properties: {
    addressPrefix: '10.1.3.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_management_externalid
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_dev_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_dev_eastus_name_web 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_dev_eastus_name}/web'
  properties: {
    addressPrefix: '10.1.0.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_nsg_web_externalid
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_dev_eastus_name_resource
  ]
}
