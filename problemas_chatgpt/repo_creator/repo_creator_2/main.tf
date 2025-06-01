locals {
    repo_path = "${path.cwd}/generated_environment/${var.repository.name}"
}

data "template_file" "init" {
    template = file("${path.cwd}/templates/create_repo.sh.tpl")
    vars = {
        repo_path = local.repo_path
        repo_name = var.repository.name
        repo_author = var.repository.author
        repo_email = var.repository.email
        repo_directories = join(",", var.repository.directories)
    }
}

resource "null_resource" "create_repo" {
    provisioner "local-exec" {
        command = data.template_file.init.rendered
    }
}