targetScope = 'subscription 1'

param location string = 'eastus2'

var resourceGroups = [
  'rg-network'
  'rg-security'
  'rg-monitoring'
  'rg-shared-services'
  'rg-dev'
  'rg-dev'
  'rg-test'
  'rg-prod'
]

resource rg 'Microsoft.Resources/resourceGroups@2025-04-01' = [for name in resourceGroups: {
  name: name
  location: location

  tags: {
    Department: 'IT'
    Project: 'Enterprise Azure Infrastructure'
    Owner: 'Cloud team'

  }
}]
