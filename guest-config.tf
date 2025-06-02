resource "azurerm_virtual_machine_extension" "win_vm" {
  name                       = "AzurePolicyforWindows"
  virtual_machine_id         = azurerm_windows_virtual_machine.win_wm[0].id
  publisher                  = "Microsoft.GuestConfiguration"
  type                       = "ConfigurationforWindows"
  type_handler_version       = "1.29"
  auto_upgrade_minor_version = "true"
}

# Assign guest configuration for comprehensive security policies
resource "azurerm_policy_virtual_machine_configuration_assignment" "win_vm" {
  name               = "AzureWindowsSecurityBaseline"
  location           = azurerm_windows_virtual_machine.win_wm[0].location
  virtual_machine_id = azurerm_windows_virtual_machine.win_wm[0].id

  configuration {
    assignment_type = "ApplyAndEnforce"
    version         = "1.*"

    # Password policy parameters
    parameter {
      name  = "Minimum Password Length;ExpectedValue"
      value = "16"
    }
    parameter {
      name  = "Minimum Password Age;ExpectedValue"
      value = "1"
    }
    parameter {
      name  = "Maximum Password Age;ExpectedValue"
      value = "30"
    }
    parameter {
      name  = "Enforce Password History;ExpectedValue"
      value = "24"
    }
    parameter {
      name  = "Password Must Meet Complexity Requirements;ExpectedValue"
      value = "1"
    }

    # Define other security policies
    # Antivirus configuration
    parameter {
      name  = "Antivirus Enabled;ExpectedValue"
      value = "1"
    }

    # Windows Firewall configuration
    parameter {
      name  = "Firewall Enabled;ExpectedValue"
      value = "1"
    }

    # Windows Updates configuration
    parameter {
      name  = "Auto Update;ExpectedValue"
      value = "1"
    }

    # Example of another security policy - auditing
    parameter {
      name  = "Ensure Log Audit;ExpectedValue"
      value = "1"
    }
  }
}
