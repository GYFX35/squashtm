job "sexual-health-platform" {
    datacenters = ["${datacenter}"]
    type = "service"

    group "web-server" {
        count = 1

        network {
            port "http" { to = 80 }
        }

        task "nginx" {
            driver = "docker"

            config {
                image = "${image}:${tag}"
                ports = ["http"]
            }

            resources {
                cpu    = 100
                memory = 128
            }

            service {
                name = "sexual-health-platform"
                tags = ["urlprefix-${servername}/"]
                port = "http"
                check {
                    name     = "alive"
                    type     = "http"
                    path     = "/"
                    interval = "30s"
                    timeout  = "5s"
                }
            }
        }
    }
}
