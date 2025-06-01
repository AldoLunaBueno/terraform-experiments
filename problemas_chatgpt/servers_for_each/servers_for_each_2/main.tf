variable "servers" {
    type = map(string)
    default = {
        server1 = "web"
        server2 = "db"
        server3 = "cache"
    }
}

resource "null_resource" "local_servers" {
    for_each = var.servers

    provisioner "local-exec" {
        command = <<EOT
            echo "servidor ${each.key}: propósito ${each.value}" > server_${each.key}.txt
        EOT
    }
}