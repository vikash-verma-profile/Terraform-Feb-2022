#time resource
resource "time_sleep" "wait_90_seconds" {
  depends_on = [
    azurerm_linux_virtual_machine.mylinuxvm
  ]
  create_duration = "90s"
}

#terraform Null resource
resource "null_resource" "app_sync" {
  depends_on = [time_sleep.wait_90_seconds]
  triggers = {
    always-update = timestamp()
  }

  connection {
    type     = "ssh"
    host     = azurerm_linux_virtual_machine.mylinuxvm.public_ip_address
    user     = azurerm_linux_virtual_machine.mylinuxvm.admin_username
    password = azurerm_linux_virtual_machine.mylinuxvm.admin_password
  }
  #copis the file

  provisioner "file" {
    source      = "apps" #local path on your system from where you are running terraform
    destination = "/tmp" #remote path where our infrastructure will be created
  }
}
