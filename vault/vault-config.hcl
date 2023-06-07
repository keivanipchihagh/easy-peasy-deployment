storage "file" {
    path = "/vault/file"
}

listener "tcp" {
    address       = "0.0.0.0:8200"
    tls_disable   = "true"
    tls_cert_file = "/certs/fullchain.pem"
    tls_key_file  = "/certs/privkey.pem"
}

ui                = true
api_addr          = "http://0.0.0.0:8200"
default_lease_ttl = "48h"
max_lease_ttl     = "168h"
cluster_name      = "Primary"