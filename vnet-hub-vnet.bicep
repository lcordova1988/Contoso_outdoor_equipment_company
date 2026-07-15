param virtualNetworks_vnet_hub_eastus_name string = 'vnet-hub-eastus'

resource virtualNetworks_vnet_hub_eastus_name_resource 'Microsoft.Network/virtualNetworks@2025-07-01' = {
  name: virtualNetworks_vnet_hub_eastus_name
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    summarizedGatewayPrefixes: {
      addressPrefixes: []
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'AzureFirewallSubnet'
        id: virtualNetworks_vnet_hub_eastus_name_AzureFirewallSubnet.id
        properties: {
          addressPrefix: '10.0.0.0/26'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'AzureBastionSubnet'
        id: virtualNetworks_vnet_hub_eastus_name_AzureBastionSubnet.id
        properties: {
          addressPrefix: '10.0.0.64/26'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
      {
        name: 'GatewaySubnet'
        id: virtualNetworks_vnet_hub_eastus_name_GatewaySubnet.id
        properties: {
          addressPrefix: '10.0.0.128/27'
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

resource virtualNetworks_vnet_hub_eastus_name_AzureBastionSubnet 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_hub_eastus_name}/AzureBastionSubnet'
  properties: {
    addressPrefix: '10.0.0.64/26'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_hub_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_hub_eastus_name_AzureFirewallSubnet 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_hub_eastus_name}/AzureFirewallSubnet'
  properties: {
    addressPrefix: '10.0.0.0/26'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_hub_eastus_name_resource
  ]
}

resource virtualNetworks_vnet_hub_eastus_name_GatewaySubnet 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name: '${virtualNetworks_vnet_hub_eastus_name}/GatewaySubnet'
  properties: {
    addressPrefix: '10.0.0.128/27'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vnet_hub_eastus_name_resource
  ]
}
