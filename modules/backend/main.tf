terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.6.2"
    }
  }
}

resource "docker_image" "backend" {
  name = "node:18-alpine"
}

resource "docker_container" "backend" {
  name  = "backend_api"
  image = docker_image.backend.image_id

  command = [
    "sh",
    "-c",
    <<EOF
    npm install express mongodb &&
    node -e "
      const express = require('express');
      const { MongoClient } = require('mongodb');

      const app = express();
      const url = 'mongodb://mongo_db:27017';
      const client = new MongoClient(url);

      app.get('/', async (req, res) => {
        try {
          await client.connect();
          const db = client.db('testdb');
          const col = db.collection('visits');
          await col.insertOne({ time: new Date() });
          const count = await col.countDocuments();
          res.send('Mongo Connected Visits: ' + count);
        } catch (err) {
          res.status(500).send('Mongo Error ' + err.message);
        }
      });

      app.listen(3000, ()=>console.log('Backend with Mongo running'));
    "
    EOF
  ]

  ports {
    internal = 3000
    external = 3000
  }

  networks_advanced {
    name = var.network_name
  }
}
