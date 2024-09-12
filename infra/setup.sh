# get sub ID
az account show --query id -o tsv

# az CLI
# Variables
RESOURCE_GROUP="rg-auea-dev-gh-ws"
LOCATION="eastus"
STORAGE_ACCOUNT_NAME="stgaueadevghws"

# Create a resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create a storage account
az storage account create --name $STORAGE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP --location $LOCATION --sku Standard_LRS


# Bicep
az deployment group create --resource-group rg-auea-dev-gh-ws --template-file main.bicep

# Terraform
terraform init
terraform apply