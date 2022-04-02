#############################
#Configuração do Cloud SQL
#############################

resource "google_sql_database_instance" "master" {
  name             = var.cloud_sql_instance_name
  database_version = "MYSQL_5_7"
  region           = var.region
  settings {
    tier = "db-n1-standard-2"
  }
}
resource "google_sql_database" "database" {
  name      = "playlists"
  instance  = google_sql_database_instance.master.name
  charset   = "utf8"
  collation = "utf8_general_ci"
  depends_on = [
    google_sql_database_instance.master
  ]
}
resource "google_sql_user" "users" {
  name     = "root"
  instance = google_sql_database_instance.master.name
  host     = "%"
  password = "XXXXXXXXX"
  depends_on = [
    google_sql_database_instance.master
  ]
}

##################################
#Configuração do Artifact Registry
##################################
resource "google_artifact_registry_repository" "spotmusic-frontend" {
  project  = var.project_id
  provider = google-beta

  location      = "us-central1"
  repository_id = "spotmusic-frontend_test_terraform"
  description   = "Repositório Front-End - SpotMusic - Grupo 11"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "spotmusic-backend" {
  project  = var.project_id
  provider = google-beta

  location      = "us-central1"
  repository_id = "spotmusic-backend_test_terraform"
  description   = "Repositório Front-End - SpotMusic - Grupo 11"
  format        = "DOCKER"
}
