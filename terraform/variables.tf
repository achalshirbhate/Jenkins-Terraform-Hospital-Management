variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "hospital-management"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

variable "application_port" {
  description = "Spring Boot application port"
  type        = number
  default     = 8080
}
