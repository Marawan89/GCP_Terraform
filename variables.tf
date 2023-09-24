variable "project_id"{
    type = string
    description = "the project id"
}

variable "password_service_user" {
    type = string
    description = "password of the sql service user"
}

variable "db_service_user" {
    type = string
    description = "password of the sql ser user"
}

variable "db_name" {
    type = string
    description = "password of the sql ser user"
}

variable "user_github" {
  type = string
  description = "github owner"
}

variable "repository_name" {
  type = string
  description = "the name of the repository"
}

variable "repository_branch" {
    type = string
    description = "the name of the branch in the repository"
}