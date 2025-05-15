variable "create_domain_join" {
  description = "Whether Windows Virtual machine should be join to Domain or not. Defaults to false (as per ). Deprecation Waring: Will be removed in future."
  type        = bool
  default     = false
}

variable "location" {
  description = "(Required) The Azure location where the Windows Virtual Machine should exist. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "(Required) The name of the Windows Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "network_interface_ids" {
  description = "(Required) A list of Network Interface IDs which should be attached to this Virtual Machine. The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine."
  type        = list(string)
}

variable "os_disk" {
  type        = list(any)
  description = <<EOT
"(Required) A os_disk block as defined in module.tf." 
caching - (Required) The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite.
storage_account_type - (Required) The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created.
diff_disk_settings - (Optional) A diff_disk_settings block as defined above. Changing this forces a new resource to be created.
disk_encryption_set_id - (Optional) The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk. Conflicts with secure_vm_disk_encryption_set_id.
disk_size_gb - (Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from.
name - (Optional) The name which should be used for the Internal OS Disk. Changing this forces a new resource to be created.
secure_vm_disk_encryption_set_id - (Optional) The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk when the Virtual Machine is a Confidential VM. Conflicts with disk_encryption_set_id. Changing this forces a new resource to be created.
security_encryption_type - (Optional) Encryption Type when the Virtual Machine is a Confidential VM. Possible values are VMGuestStateOnly and DiskWithVMGuestState. Changing this forces a new resource to be created.
write_accelerator_enabled - (Optional) Should Write Accelerator be Enabled for this OS Disk? Defaults to false.
EOT
}

variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in which the Windows Virtual Machine should be exist."
  type        = string
}

variable "size" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
}

variable "additional_capabilities" {
  description = <<EOT
"A additional_capabilities block as defined"
ultra_ssd_enabled - (Optional) Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine? Defaults to false.
EOT
  type        = map(any)
  default     = null
}

variable "additional_unattend_content" {
  description = <<EOT
"A additional_unattend_content block as defined in module.tf."
content - (Required) The XML formatted content that is added to the unattend.xml file for the specified path and component. Changing this forces a new resource to be created.
setting - (Required) The name of the setting to which the content applies. Possible values are AutoLogon and FirstLogonCommands. Changing this forces a new resource to be created.
EOT
  type        = map(any)
  default     = null
}

variable "allow_extension_operations" {
  description = "(Optional) Should Extension Operations be allowed on this Virtual Machine? Defaults to true."
  type        = bool
  default     = true
}

variable "availability_set_id" {
  description = "(Optional) Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "boot_diagnostics" {
  description = <<EOT
A boot_diagnostics block as defined below.
storage_account_uri - (Optional) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor.
EOT
  type        = map(any)
  default     = null
}

variable "capacity_reservation_group_id" {
  description = "(Optional) Specifies the ID of the Capacity Reservation Group which the Virtual Machine should be allocated to."
  type        = string
  default     = null
}

variable "computer_name" {
  description = "(Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "custom_data" {
  description = "(Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "dedicated_host_id" {
  description = "(Optional) The ID of a Dedicated Host where this machine should be run on. Conflicts with dedicated_host_group_id."
  type        = string
  default     = null
}

variable "dedicated_host_group_id" {
  description = "(Optional) The ID of a Dedicated Host Group that this Windows Virtual Machine should be run within. Conflicts with dedicated_host_id."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Windows Virtual Machine should exist. Changing this forces a new Windows Virtual Machine to be created."
  type        = string
  default     = null
}

variable "enable_automatic_updates" {
  description = "(Optional) Specifies if Automatic Updates are Enabled for the Windows Virtual Machine. Changing this forces a new resource to be created. Defaults to true."
  type        = bool
  default     = true
}

variable "encryption_at_host_enabled" {
  description = "(Optional) Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  type        = bool
  default     = null
}

variable "eviction_policy" {
  description = "(Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. Possible values are Deallocate and Delete. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "patch_assessment_mode" {
  description = "(Optional) Specifies the mode of VM Guest Patching for the Virtual Machine. Possible values are AutomaticByPlatform or ImageDefault. Defaults to ImageDefault."
  type        = string
  default     = "AutomaticByPlatform"
}

variable "extensions_time_budget" {
  description = "(Optional) Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M)."
  type        = string
  default     = "PT1H30M"
}

variable "hotpatching_enabled" {
  description = "(Optional) Should the VM be patched without requiring a reboot? Possible values are true or false. Defaults to false. For more information about hot patching please see the product documentation."
  type        = bool
  default     = null
}

variable "identity_ids" {
  description = "(Required) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Windows Virtual Machine."
  type        = list(string)
}

variable "license_type" {
  description = "(Optional) Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) which should be used for this Virtual Machine. Possible values are None, Windows_Client and Windows_Server"
  type        = string
  default     = null
}

variable "max_bid_price" {
  description = "(Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons."
  type        = number
  default     = "-1"
}

variable "priority" {
  description = "(Optional) Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
  type        = string
  default     = "Regular"
}

variable "provision_vm_agent" {
  description = "(Optional) Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to."
  type        = string
  default     = null
}

variable "secure_boot_enabled" {
  description = "(Optional) Specifies if Secure Boot and Trusted Launch is enabled for the Virtual Machine. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "source_image_id" {
  description = "(Required) The ID of the Image which this Virtual Machine should be created from. Changing this forces a new resource to be created.
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "(Required) Map of tags assigned to the resource, including those inherited from the provider default_tags"
}

variable "termination_notification" {
  description = <<EOT
"(Optional) A termination_notification block as defined below."
enabled - (Required) Should the termination notification be enabled on this Virtual Machine?
timeout - (Optional) Length of time (in minutes, between 5 and 15) a notification to be sent to the VM on the instance metadata server till the VM gets deleted. The time duration should be specified in ISO 8601 format. Defaults to PT5M.
EOT
  type        = map(any)
  default     = null
}

variable "timezone" {
  description = "(Optional) Specifies the Time Zone which should be used by the Virtual Machine, the possible values are defined here. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "user_data" {
  description = "(Optional) The Base64-Encoded User Data which should be used for this Virtual Machine."
  type        = string
  default     = null
}

variable "platform_fault_domain" {
  description = "(Optional) Specifies the Platform Fault Domain in which this Windows Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Windows Virtual Machine to be created."
  type        = string
  default     = null
}

variable "virtual_machine_scale_set_id" {
  description = "(Optional) Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "vtpm_enabled" {
  description = "(Optional) Specifies if vTPM (virtual Trusted Platform Module) and Trusted Launch is enabled for the Virtual Machine. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "winrm_listener" {
  description = "(Optional) One or more winrm_listener blocks as defined below. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "zone" {
  description = "(Optional) Specifies the Availability Zone in which this Windows Virtual Machine should be located. Changing this forces a new Windows Virtual Machine to be created."
  type        = string
  default     = null
}

variable "timeouts" {
  type        = any
  default     = []
  description = "(Optional) Timeouts specified for certain terraform actions. Defaults: Create: 45minutes, Update: 45 minutes, Read: 5 minutes, Delete: 45 minutes"
}

/***********Random*************/

variable "length" {
  type        = number
  description = "(Number) The length of the string desired."
  default     = 16

  validation {
    condition     = var.length > 8
    error_message = "The length must be greater than 8 according to GRC KB0071392 - PR1.1 - 1:require a minimum of 8 characters"
  }
}

variable "keepers" {
  type        = map(string)
  description = "(Map of String) Arbitrary map of values that, when changed, will trigger recreation of resource. See the main provider documentation for more information"
  default     = null
}

variable "lower" {
  type        = bool
  description = "(Boolean) Include lowercase alphabet characters in the result. Default value is true."
  default     = true
}

variable "min_lower" {
  type        = number
  description = "(Number) Minimum number of lowercase alphabet characters in the result. Default value is 0."
  default     = 3
}

variable "min_numeric" {
  type        = number
  description = "(Number) Minimum number of numeric characters in the result. Default value is 0."
  default     = 3
}

variable "min_special" {
  type        = number
  description = "(Number) Minimum number of special characters in the result. Default value is 0."
  default     = 3
}

variable "min_upper" {
  type        = number
  description = "(Number) Minimum number of uppercase alphabet characters in the result. Default value is 0."
  default     = 3
}

variable "numeric" {
  type        = bool
  description = "(Boolean) Include numeric characters in the result. Default value is true."
  default     = true
}

variable "override_special" {
  type        = string
  description = "(String) Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument. The special argument must still be set to true for any overwritten characters to be used in generation."
  default     = "!#$%^_"
}

variable "special" {
  type        = bool
  description = "(Boolean) Include special characters in the result. These are !@#$%&*()-_=+[]{}<>:?. Default value is true."
  default     = true
}

variable "upper" {
  type        = bool
  description = "(Boolean) Include uppercase alphabet characters in the result. Default value is true."
  default     = true
}

NIC##############

variable "ip_configuration" {
  description = <<EOT
(Required) One or more block(s) as defined in the module.tf
name - (Required) A name used for this IP Configuration.
gateway_load_balancer_frontend_ip_configuration_id - (Optional) The Frontend IP Configuration ID of a Gateway SKU Load Balancer.
subnet_id - (Optional) The ID of the Subnet where this Network Interface should be located in.
private_ip_address_allocation - (Required) The allocation method used for the Private IP Address. Possible values are Dynamic and Static.
Note: Dynamic means "An IP is automatically assigned during creation of this Network Interface"; Static means "User supplied IP address will be used"
primary - (Optional) Is this the Primary IP Configuration? Must be true for the first ip_configuration when multiple are specified. Defaults to false.
When private_ip_address_allocation is set to Static the private_ip_address field can be configured:
private_ip_address - (Optional) The Static IP Address which should be used.
EOT
  type        = list(any)
}
variable "location" {
  description = "(Required) The location where the Network Interface should exist."
  type        = string
}
variable "name" {
  description = "(Required) The name of the Network Interface."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the Resource Group in which to create the Network Interface."
  type        = string
}
variable "dns_servers" {
  description = "(Optional) A list of IP Addresses defining the DNS Servers which should be used for this Network Interface."
  type        = list(string)
  default     = null
}
variable "edge_zone" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Network Interface should exist."
  type        = string
  default     = null
}
variable "ip_forwarding_enabled" {
  description = "(Optional) Should IP Forwarding be enabled? Defaults to false."
  type        = bool
  default     = false
}
variable "accelerated_networking_enabled" {
  description = "(Optional) Should Accelerated Networking be enabled? Defaults to false."
  type        = bool
  default     = false
}
variable "internal_dns_name_label" {
  description = "(Optional) The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  type        = string
  default     = null
}

variable "timeouts" {
  type        = any
  default     = []
  description = "(Optional) Default value to create: 30 minutes, update:30 minutes, read: 5 mins, delete:30 minutes for the NetApp Volume."
}
