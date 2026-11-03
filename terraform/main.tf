resource "local_file" "deployment_manifest" {
  filename = "${path.module}/deployment-manifest.txt"

  content = <<-EOT
    Project: ${var.project_name}
    Environment: ${var.environment}
    Application: Spring Boot Hospital Management
    Application Port: ${var.application_port}
    CI/CD: Jenkins
    Database: PostgreSQL
    Infrastructure Management: Terraform
    Provisioning: Local provider demonstration
  EOT
}
