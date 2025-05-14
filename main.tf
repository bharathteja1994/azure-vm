resource "random_password" "password" {
  length           = var.length
  keepers          = var.keepers
  lower            = var.lower
  min_lower        = var.min_lower
  min_numeric      = var.min_numeric
  min_special      = var.min_special
  min_upper        = var.min_upper
  numeric          = var.numeric
  override_special = var.override_special
  special          = var.special
  upper            = var.upper
}

resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  admin_username                = "adminuser"
  admin_password                = resource.random_password.password.result
  allow_extension_operations    = var.allow_extension_operations
  availability_set_id           = var.availability_set_id
  capacity_reservation_group_id = var.capacity_reservation_group_id
  computer_name                 = var.computer_name
  custom_data                   = var.custom_data
  dedicated_host_id             = var.dedicated_host_id
  dedicated_host_group_id       = var.dedicated_host_group_id
  edge_zone                     = var.edge_zone
  enable_automatic_updates      = var.enable_automatic_updates
  encryption_at_host_enabled    = var.encryption_at_host_enabled
  eviction_policy               = var.eviction_policy
  extensions_time_budget        = var.extensions_time_budget
  hotpatching_enabled           = var.hotpatching_enabled
  license_type                  = var.license_type
  max_bid_price                 = var.max_bid_price
  network_interface_ids         = var.network_interface_ids
  patch_assessment_mode         = var.patch_assessment_mode
  platform_fault_domain         = var.platform_fault_domain
  priority                      = var.priority
  provision_vm_agent            = var.provision_vm_agent
  proximity_placement_group_id  = var.proximity_placement_group_id
  secure_boot_enabled           = var.secure_boot_enabled
  size                          = var.size
  source_image_id               = var.source_image_id
  tags                          = var.tags
  timezone                      = var.timezone
  user_data                     = var.user_data
  virtual_machine_scale_set_id  = var.virtual_machine_scale_set_id
  vtpm_enabled                  = var.vtpm_enabled
  zone                          = var.zone

  dynamic "os_disk" {
    for_each = var.os_disk
    content {
      caching              = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type

      dynamic "diff_disk_settings" {
        for_each = try(os_disk.value.diff_disk_settings, null) != null ? [os_disk.value.diff_disk_settings] : []
        content {
          option    = try(diff_disk_settings.value.option, null)
          placement = try(diff_disk_settings.value.placement, null)
        }
      }
      disk_encryption_set_id           = try(os_disk.value.disk_encryption_set_id, null)
      disk_size_gb                     = try(os_disk.value.disk_size_gb, null)
      name                             = try(os_disk.value.name, null)
      secure_vm_disk_encryption_set_id = try(os_disk.value.secure_vm_disk_encryption_set_id, null)
      security_encryption_type         = try(os_disk.value.security_encryption_type, null)
      write_accelerator_enabled        = try(os_disk.value.write_accelerator_enabled, null)
    }
  }

  dynamic "additional_capabilities" {
    for_each = try(var.additional_capabilities, null) != null ? [var.additional_capabilities] : []
    content {
      ultra_ssd_enabled = try(additional_capabilities.value.ultra_ssd_enabled, null)
    }
  }

  dynamic "additional_unattend_content" {
    for_each = try(var.additional_unattend_content, null) != null ? [var.additional_unattend_content] : []
    content {
      content = try(additional_unattend_content.value.content, null)
      setting = try(additional_unattend_content.value.setting, null)
    }
  }

  dynamic "boot_diagnostics" {
    for_each = try(var.boot_diagnostics, null) != null ? [var.boot_diagnostics] : []
    content {
      storage_account_uri = try(boot_diagnostics.value.storage_account_uri, null)
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = var.identity_ids
  }

  dynamic "termination_notification" {
    for_each = try(var.termination_notification, null) != null ? [var.termination_notification] : []
    content {
      enabled = try(termination_notification.value.enabled, null)
      timeout = try(termination_notification.value.timeout, null)
    }
  }

  dynamic "winrm_listener" {
    for_each = try(var.winrm_listener, null) != null ? [var.winrm_listener] : []
    content {
      protocol        = "https"
      certificate_url = try(winrm_listener.value.certificate_url, null)
    }
  }

  dynamic "timeouts" {
    for_each = var.timeouts != [] ? var.timeouts : []
    content {
      create = lookup(timeouts.value, "create", "45m")
      update = lookup(timeouts.value, "update", "45m")
      delete = lookup(timeouts.value, "delete", "45m")
      read   = lookup(timeouts.value, "read", "5m")
    }
  }

  bypass_platform_safety_checks_on_user_schedule_enabled = true
  patch_mode                                             = "AutomaticByPlatform"
}
