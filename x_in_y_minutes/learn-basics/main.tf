variable "ready_to_learn" {
  type = bool
}

# Un recurso ficticio, simulado con null_resource
resource "null_resource" "beginner" {
  count = var.ready_to_learn ? 1 : 0

  provisioner "local-exec" {
    command = "echo Empezando el camino de Terraform 🚀"
  }
}

output "knowledge" {
  value = var.ready_to_learn ? "Has aprendido los fundamentos 🎉" : "Aún no estás listo..."
}
