locals {
    repo_path = "${path.cwd}/generated_environment/${var.repository.name}"
}

resource "null_resource" "create_repo" {
    provisioner "local-exec" {
        command = <<-EOF
            mkdir -p "${local.repo_path}"
            cd "${local.repo_path}"
            git init
            git config user.name "${var.repository.author}"
            git config user.email "${var.repository.email}"
            echo "Author: ${var.repository.author}" > README.md
            git add .
            git commit -m "First Commit"
            git log
            %{ for directory in var.repository.directories }
            mkdir -p "${directory}"
            %{ endfor }
        EOF
    }
}

output "repo_path" {
    value = local.repo_path
}