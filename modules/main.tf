terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

module "network" {
  source       = "./network"
  network_name = var.app_network
}

module "db" {
  source       = "./db"
  network_name = module.network.network_name
}

module "backend" {
  source       = "./backend"
  network_name = module.network.network_name
  depends_on   = [module.db]
}

module "frontend" {
  source       = "./frontend"
  network_name = module.network.network_name
}
