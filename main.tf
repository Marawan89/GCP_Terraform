#creazione dell'istanza del db
resource "google_sql_database_instance" "astra_dbinstance" {
  name = "astra-dbinstance"
  database_version = "MYSQL_8_0"    #ultima versione
  region = "europe-west12"
  deletion_protection = false

    settings {
    tier = "db-f1-micro"

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

#Gestione autenticazione utente cliente
resource "google_sql_user" "client_user" {
  instance = google_sql_database_instance.astra_dbinstance.name
  name = "client-user"
  project = var.project_id
#   password = 
}

