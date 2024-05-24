output "container_id" {
  description = "ID of the Container"
  value       = docker_container.nginx.id
}

output "container_image" {
  description = "id of the Container image"
  value       = docker_image.nginx.id
}