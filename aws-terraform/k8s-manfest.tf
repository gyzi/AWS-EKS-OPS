resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      name = "frontend"
    }
  }
  spec {
    replicas = 4
    selector {
      match_labels = {
        name = "webapp"
      }
    }
    template {
      metadata {
        labels = {
          name = "webapp"
        }
      }
      spec {
        container {
          name  = "simple-webapp"
          image = "kodekloud/webapp-color:v1"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "webapp-service" {
  metadata {
    name = "webapp-service"
  }
  spec {
    selector = {
      name = kubernetes_deployment.frontend.spec.0.template.0.metadata.0.labels.name
    }
    type = "NodePort"
    port {
      node_port   = 30080
      port        = 8080
      target_port = 8080
    }
  }
}