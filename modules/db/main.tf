terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

resource "docker_image" "mongo" {
  name = "mongo:6"
}

resource "docker_container" "mongo" {
  name  = "mongo_db"
  image = docker_image.mongo.image_id

  networks_advanced {
    name = var.network_name
  }

  ports {
    internal = 27017
    external = 27017
  }
}

