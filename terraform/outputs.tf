output "manifest_path" {
  description = "Path of the generated deployment manifest"
  value       = local_file.deployment_manifest.filename
}

output "application_endpoint" {
  description = "Local application URL"
  value       = "http://localhost:${var.application_port}"
}

output "project_name" {
  description = "Hospital management project name"
  value       = var.project_name
}
