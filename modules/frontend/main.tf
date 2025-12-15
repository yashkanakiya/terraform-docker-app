
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_container" "frontend" {
  name  = "frontend_app"
  image = docker_image.nginx.image_id

  ports {
    internal = 80
    external = 8080
  }

  networks_advanced {
    name = var.network_name
  }

  upload {
    file    = "/usr/share/nginx/html/index.html"
    content = <<EOF
      <!DOCTYPE html>
      <html>
      <head>
        <title>Terraform Docker App</title>
      </head>
      <body>
        <h1>Frontend Working Frontend!</h1>
        <p>Backend URL: <a href="http://localhost:3000">Backend</a></p>
      </body>
      </html>
    EOF
  }
}
