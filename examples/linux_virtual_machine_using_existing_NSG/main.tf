# Azurerm provider configuration
provider "azurerm" {
  features {}
}

data "azurerm_network_security_group" "example" {
  name                = "nsg_mgnt_subnet_in"
  resource_group_name = "rg-shared-westeurope-01"
}

data "azurerm_log_analytics_workspace" "example" {
  name                = "loganalytics-we-sharedtest2"
  resource_group_name = "rg-shared-westeurope-01"
}

module "virtual-machine" {
  source  = "../.."
  version = "2.3.0"

  # Resource Group, location, VNet and Subnet details
  resource_group_name  = "rg-shared-westeurope-01"
  location             = "westeurope"
  virtual_network_name = "vnet-shared-hub-westeurope-001"
  subnet_name          = "snet-management"
  virtual_machine_name = "vm-linux" 
  os_flavor               = "linux"
  linux_distribution_name = "ubuntu2004"
  virtual_machine_size    = "Standard_B2s"
  disable_password_authentication = false
  instances_count         = 2
  enable_proximity_placement_group = true
  enable_vm_availability_set       = true
  existing_network_security_group_id = data.azurerm_network_security_group.example.id
  enable_boot_diagnostics = true
  data_disks = [
    {
      name                 = "disk1"
      disk_size_gb         = 100
      storage_account_type = "StandardSSD_LRS"
    },
    {
      name                 = "disk2"
      disk_size_gb         = 200
      storage_account_type = "Standard_LRS"
    }
  ]
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.example.id
  deploy_log_analytics_agent                 = true
  log_analytics_customer_id                  = data.azurerm_log_analytics_workspace.example.workspace_id
  log_analytics_workspace_primary_shared_key = data.azurerm_log_analytics_workspace.example.primary_shared_key

  tags = {}
}
