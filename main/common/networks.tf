module "main-vpc" {
  source = "../../modules/vpc"
}

module "subnet" {
  source = "../../modules/subnet"

  available_zones      = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
  private_subnet_cidrs = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  public_subnet_cidrs  = ["10.0.128.0/24", "10.0.129.0/24", "10.0.130.0/24"]
  vpc_id               = module.main-vpc.common_vpc_id
}