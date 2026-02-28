project = "forge/sexual-health-platform"

labels = { "domaine" = "forge" }

runner {
    enabled = true
    data_source "git" {
        url  = "https://github.com/ansforge/sexual-health-platform.git"
        ref  = "main"
        path = "sexual-health-platform"
        ignore_changes_outside_path = true
    }
}

app "forge/sexual-health-platform" {

    build {
        use "docker" {}
    }

    deploy{
        use "nomad-jobspec" {
            jobspec = templatefile("${path.app}/sexual-health.nomad.tpl", {
                image   = var.image
                tag     = var.tag
                datacenter = var.datacenter
                servername = var.servername
                })
        }
    }
}

variable "servername" {
     type    = string
     default = "sexual-health.asipsante.fr"
}

variable "datacenter" {
    type    = string
    default = "test"
}

variable "image" {
    type    = string
    default = "sexual-health-platform"
}

variable "tag" {
    type    = string
    default = "latest"
}
