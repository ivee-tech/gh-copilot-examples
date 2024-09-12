targetScope = 'resourceGroup'
// Variables
param storageAccountName string = 'stgaueadevghws'
param location string = 'eastus'
// param resourceGroupName string = 'myResourceGroup'

// // Resource Group
// resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
//   name: resourceGroupName
//   location: location
// }

// Storage Account
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
