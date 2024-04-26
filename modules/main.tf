module "rg" {
  source = "../RG"
  ril    = var.ril

}

module "vnet" {
  source     = "../vnet"
  ril        = var.manojvnet
  depends_on = [module.rg]
}

module "subnet" {
  source     = "../Subnet"
  ril        = var.manojsubnet
  depends_on = [module.vnet]

}

module "pip" {
  source     = "../PIP"
  ril        = var.manojpip
  depends_on = [module.rg]
}

module "nsg" {
  source     = "../NSG"
  name       = var.manojnsg
  depends_on = [module.rg, module.vnet]
}

module "nic" {
  source     = "../NIC"
  ril        = var.manojnic
  depends_on = [module.pip]

}

module "vm" {
  ril        = var.manojvm
  source     = "../VM"
  depends_on = [module.nic]

}

module "bastion" {
  source     = "../Bastion"
  ril        = var.manojbastion
  depends_on = [module.subnet, module.pip]

}

  