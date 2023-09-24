#DB Instance creation
resource "google_sql_database_instance" "astra_dbinstance" {
  name = "astra-dbinstance"
  database_version = "MYSQL_8_0"    #ultima versione
  region = "europe-west12"
  deletion_protection = false

    settings {
    tier = "db-f1-micro"

    ip_configuration {
      require_ssl     = false
      ipv4_enabled    = true
      authorized_networks {
        value           = "0.0.0.0/0"
        name            = "all"
        expiration_time = null
      }
    }

    database_flags {
      name  = "wait_timeout"
      value = "300"
    }

    database_flags {
      name  = "max_connections"
      value = "1000"
    }
  }
}

#DB Authentication management: service db user
resource "google_sql_user" "service_db_user" {
  instance = google_sql_database_instance.astra_dbinstance.name
  name = var.db_service_user
  project = var.project_id
  password = var.password_service_user
  host = "%"

  depends_on = [
    google_sql_database_instance.astra_dbinstance
  ]
}

