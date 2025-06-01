# Generador de reportes de entornos y sus servicios

locals {
    report_path = "${path.cwd}/generated_environment/reports"
}

resource "local_file" "resume" {
    filename = "${local.report_path}/resume.txt"
    content = join("\n", [for env, services in var.environments : "${env}: ${length(services)} "])
}

resource "null_resource" "report_by_environment" {
    for_each = var.environments

    provisioner "local-exec" {
        command = <<EOT
            mkdir -p "${local.report_path}"
            cd "${local.report_path}"
            echo "Environment: ${each.key}" > report_${each.key}.txt
            echo "services: ${join(", ", each.value)}" >> report_${each.key}.txt
        EOT
    }
}