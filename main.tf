#DB Instance creation
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

#DB Authentication management: service db user
resource "google_sql_user" "service_db_user" {
  instance = google_sql_database_instance.astra_dbinstance.name
  name = "astra_service_user"
  project = var.project_id
  password = var.password_service_user
  host = "%"

  depends_on = [
    google_sql_database_instance.astra_dbinstance
  ]
}


#DB Authentication management: admin db user 
resource "google_sql_user" "admin_db_user" {
  instance = google_sql_database_instance.astra_dbinstance.name
  name = "astra_admin_user"
  project = var.project_id
  password = var.password_admin_user
  host = "%"

  depends_on = [
    google_sql_database_instance.astra_dbinstance
  ]
}


#DB initialization and popolation 
resource "null_resource" "db_population" {
    depends_on = [
      google_sql_user.admin_db_user
    ]

    provisioner "local-exec" {
      command = "mysql --host=${google_sql_database_instance.astra_dbinstance.public_ip_address}  --user=${google_sql_user.admin_db_user.name} --password=${google_sql_user.admin_db_user.password} < sqlCreation.sql"
    }
}