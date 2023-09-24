resource "google_cloud_run_v2_service" "astracloud" {
  provider = google-beta
  name     = var.project_id
  location = "europe-west12"
  project = var.project_id

  template {
    scaling {
      max_instance_count = 5
      min_instance_count = 1
    }
    containers {
      image = "gcr.io/${var.project_id}/astraimage:latest"
      env {
        name  = "DB_NAME"
        value = var.db_name
      }
      env {
        name  = "DB_SERVICE_USER"
        value = var.db_service_user
      }
      env {
        name  = "DB_SERVICE_USER_PASSWORD"
        value = var.password_service_user
      }
      env {
        name  = "DB_HOSTNAME"
        value = google_sql_database_instance.astra_dbinstance.public_ip_address
      }
      
      resources {
        startup_cpu_boost = true
        cpu_idle          = true
        limits = {
          cpu    = "2"
          memory = "2Gi"
        }
      }
      ports {
        container_port = 8080
      }
      liveness_probe {
        http_get {
          path = "/"
        }
        initial_delay_seconds = 150
        failure_threshold = 5
        timeout_seconds = 60
        period_seconds = 60
      }
    }
  }

  traffic {
    type    = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
    percent = 100
  }


  depends_on = [
    google_sql_database_instance.astra_dbinstance
  ]
}

#rende il db accessibile al pubblico
resource "google_cloud_run_service_iam_member" "public" {
  service  = google_cloud_run_v2_service.astracloud.name
  location = google_cloud_run_v2_service.astracloud.location
  role     = "roles/run.invoker"
  member   = "allUsers"
  project = var.project_id
}