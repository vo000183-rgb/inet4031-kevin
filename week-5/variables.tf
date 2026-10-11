variable "postgres_user" {
  description = "PostgreSQL username"
  type        = string

  validation {
    condition     = var.postgres_user != "replace-me"
    error_message = "Set a real PostgreSQL username in terraform.tfvars."
  }
}

variable "postgres_password" {
  description = "PostgreSQL password"
  type        = string
  sensitive   = true

  validation {
    condition     = var.postgres_password != "replace-me" && length(var.postgres_password) >= 16
    error_message = "PostgreSQL password must be set and at least 16 characters long."
  }
}

variable "postgres_db" {
  description = "PostgreSQL database name"
  type        = string

  validation {
    condition     = var.postgres_db != "replace-me"
    error_message = "Set a real PostgreSQL database name in terraform.tfvars."
  }
}

variable "flask_secret_key" {
  description = "Flask application secret key"
  type        = string
  sensitive   = true

  validation {
    condition     = var.flask_secret_key != "replace-me" && length(var.flask_secret_key) >= 16
    error_message = "Flask secret key must be set and at least 16 characters long."
  }
}
