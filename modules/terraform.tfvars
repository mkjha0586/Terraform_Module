ril = {
  tecril = {
    rg_name  = "odsc"
    rg_location = "westus"
  }
}
manojvnet = {
  tecril = {
    vnet_name     = "ril-network"
    vnet_location = "westus"
    rg_name       = "odsc"
    address_space = ["10.0.0.0/16"]
    dns_servers   = ["10.0.0.4", "10.0.0.5"]
  }
}

manojsubnet = {
  rilsubnet = {
    subnet_name      = "ril-subnet"
    rg_name          = "odsc"
    vnet_name        = "ril-network"
    address_prefixes = ["10.0.1.0/24"]
  }
  rilsubnet1 = {
    subnet_name      = "AzureBastionSubnet"
    rg_name          = "odsc"
    vnet_name        = "ril-network"
    address_prefixes = ["10.0.2.0/24"]
  }
}

manojpip = {
  rilpip = {
    pip_name          = "rilpip"
    pip_location      = "westus"
    rg_name           = "odsc"
    allocation_method = "Static"
    sku               = "Standard"
  }
}

manojnic = {
  rilnic = {
    nic_name     = "rilnic"
    nic_location = "westus"
    subnet_name  = "ril-subnet"
    vnet_name    = "ril-network"
    rg_name      = "odsc"
  }
}

manojvm = {
  rilvm = {
    datanic        = "rilnic"
    vm_name        = "ril-machine"
    rg_name        = "odsc"
    vm_location    = "westus"
    vm_size        = "Standard_F2"
    admin_username = "adminuser"
    admin_password = "Manoj@123456"
  }
}
manojbastion = {
  rilbastions = {
    name     = "rilbastion"
    location = "West Europe"
    rg_name  = "odsc"
  }
}