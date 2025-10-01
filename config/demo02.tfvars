subscription_name     = "sub-demo-02"
management_group_name = "demo-corp"
location              = "uksouth"
resource_groups = {
  rg_demo_01 = {
    name     = "rg-demo-01"
    location = "uksouth"
    tags = {
      environment = "demo02"
      owner       = "team-a"
    }
  }
  rg_demo_02 = {
    name     = "rg-demo-02"
    location = "uksouth"
    tags = {
      environment = "demo02"
      owner       = "team-a"
    }
  }
}
subscription_tags = {
  environment = "demo02"
  owner       = "team-a"
}
virtual_networks = {
  vnet_01 = {
    name          = "vnet-spoke-demo-01"
    address_space = ["10.101.0.0/24"]
  }
}
