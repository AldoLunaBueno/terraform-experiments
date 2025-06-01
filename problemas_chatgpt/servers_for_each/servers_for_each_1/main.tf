locals {
    servers = {
        alpha = {
            purpose = "web"
        }
        beta = {
            purpose = "db"
        }
        gamma = {
            purpose = "cache"
        }
    }
}

resource "null_resource" "local_servers" {
    for_each = local.servers
    
    triggers = {
        name = each.key
        purpose = each.value.purpose
    }

    provisioner "local-exec" {
        command = "echo 'servidor ${each.key}: ${each.value.purpose}' > 'servidor_${each.key}.txt'"
    }
}