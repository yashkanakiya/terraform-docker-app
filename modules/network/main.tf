terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

resource "docker_network" "app_net" {
  name = var.network_name
}
