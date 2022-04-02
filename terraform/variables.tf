#######################################
#Variaveis de configuração
#######################################
variable "bucket_name" {
  type    = string
  default = "hackathon-grupo11"
}

variable "cloud_sql_instance_name" {
  type        = string
  description = "Nome da Instância do Cloud SQL"
  default     = "spotmusic-grupo11"
}

variable "project_id" {
  type        = string
  description = "Id do projeto do GCP"
  default     = "hackathon-6aso-grupo11"
}

variable "region" {
  type        = string
  description = "Região do GCP onde os modulos do projeto serão criados https://cloud.google.com/compute/docs/regions-zones?hl=pt-br default us-central1"
  default     = "us-central1"
}

variable "location" {
  type        = string
  description = "Localização do projeto GCP https://cloud.google.com/compute/docs/regions-zones?hl=pt-br default us"
  default     = "us"
}
