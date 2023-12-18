terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
token = var.tocken
cloud_id = "b1g5o782lnoiooh0i32j"
folder_id = "b1gimokv8g2uegfmqvo7"  

zone = "ru-central1-a"

}
 
 
 resource "yandex_compute_instance" "vm2" {
  name = "web1"
  hostname = "web1"
  platform_id = "standard-v2"
  zone        = "ru-central1-c"
 
 resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {  
      image_id = "fd84qmg56d2uqhhbuciq"
      size = 10
    }
  }

  network_interface {
    subnet_id = "b0cmkodd2r7j5b1t1dlo"
    nat       = true
    security_group_ids = ["${yandex_vpc_security_group.web-sg.id}"]
  }
 
 metadata = {
    user-data = "${file("./meta2.yml")}"
  }
 
 scheduling_policy {
        preemptible = true
    }
 
 }

 resource "yandex_compute_instance" "vm3" {
  name = "web2"
  hostname = "web2"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"
 
 resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {  
      image_id = "fd84qmg56d2uqhhbuciq"
      size = 10
    }
  }

  network_interface {
    subnet_id = "e9b8h8fgntov76s0m5qh"
    nat       = true
    security_group_ids = ["${yandex_vpc_security_group.web-sg.id}"]
  }
 
 metadata = {
    user-data = "${file("./meta2.yml")}"
  }
 
 scheduling_policy {
        preemptible = true
    }
 
 }

resource "yandex_compute_instance" "vm4" {
  name = "elastic"
  hostname = "elastic"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"
 
 resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {  
      image_id = "fd84qmg56d2uqhhbuciq"
      size = 10
    }
  }

  network_interface {
    subnet_id = "e9b8h8fgntov76s0m5qh"
    nat       = true
    security_group_ids = ["${yandex_vpc_security_group.elastic-sg.id}"]
  }
 
 metadata = {
    user-data = "${file("./meta2.yml")}"
  }
 
 scheduling_policy {
        preemptible = true
    }
 
 }

resource "yandex_compute_instance" "vm5" {
  name = "kibana"
  hostname = "kibana"
  platform_id = "standard-v2"
  zone        = "ru-central1-b"
 
 resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {  
      image_id = "fd84qmg56d2uqhhbuciq"
      size = 10
    }
  }

  network_interface {
    subnet_id = "e2ljspp0no4f6ndm9q0o"
    nat       = true
    security_group_ids = ["${yandex_vpc_security_group.kibana-sg.id}"]
  }
 
 metadata = {
    user-data = "${file("./meta2.yml")}"
  }
 
 scheduling_policy {
        preemptible = true
    }
 
 }
resource "yandex_compute_instance" "vm6" {
  name = "zabbix"
  hostname = "zabbix"
  platform_id = "standard-v2"
  zone        = "ru-central1-b"
 
 resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {  
      image_id = "fd84qmg56d2uqhhbuciq"
      size = 10
    }
  }

  network_interface {
    subnet_id = "e2ljspp0no4f6ndm9q0o"
    nat       = true
    security_group_ids = ["${yandex_vpc_security_group.zabbix-sg.id}"]
  }
 
 metadata = {
    user-data = "${file("./meta2.yml")}"
  }
 
 scheduling_policy {
        preemptible = true
    }
 
 }

resource "yandex_vpc_security_group" "zabbix-sg" {
  name        = "zabbix security group"
  description = "Description for security group"
  network_id  = "enpa9auu48k75qm9hvb3"

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 10050
  }

  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0", "0.0.0.0/0"]
  }
 }

resource "yandex_vpc_security_group" "kibana-sg" {
  name        = "kibana security group"
  description = "Description for security group"
  network_id  = "enpa9auu48k75qm9hvb3"

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 5601
  }

  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0", "0.0.0.0/0"]
  }
 }
 
 resource "yandex_vpc_security_group" "elastic-sg" {
  name        = "elastic security group"
  description = "Description for security group"
  network_id  = "enpa9auu48k75qm9hvb3"

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 9200
  }

  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0", "0.0.0.0/0"]
  }
 }

 resource "yandex_vpc_security_group" "web-sg" {
  name        = "web security group"
  description = "Description for security group"
  network_id  = "enpa9auu48k75qm9hvb3"

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 5044
  }
 ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 10050
  }
 
  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0", "0.0.0.0/0"]
  }
 }
 
 resource "yandex_alb_target_group" "foo" {
  name           = "webgr"

  target {
    subnet_id    = "b0cmkodd2r7j5b1t1dlo"
    ip_address   = "${yandex_compute_instance.vm2.network_interface.0.ip_address}"
  }

  target {
    subnet_id    = "e9b8h8fgntov76s0m5qh"
    ip_address   = "${yandex_compute_instance.vm3.network_interface.0.ip_address}"
  }
 }

 resource "yandex_alb_backend_group" "test-backend-group" {
  name                     = "webback"
  
  http_backend {
    name                   = "backend1"
    weight                 = 1
    port                   = 80
    target_group_ids       = ["${yandex_alb_target_group.foo.id}"]
    load_balancing_config {
      panic_threshold      = 90
    }    
    healthcheck {
      timeout              = "10s"
      interval             = "2s"
      healthy_threshold    = 10
      unhealthy_threshold  = 15 
      http_healthcheck {
        path               = "/"
      }
    }
  }
  http_backend {
    name                   = "backend2"
    weight                 = 1
    port                   = 80
    target_group_ids       = ["${yandex_alb_target_group.foo.id}"]
    load_balancing_config {
      panic_threshold      = 90
    }    
    healthcheck {
      timeout              = "10s"
      interval             = "2s"
      healthy_threshold    = 10
      unhealthy_threshold  = 15 
      http_healthcheck {
        path               = "/"
      }
    }
  }

}

resource "yandex_alb_http_router" "tfrouter" {
  name          = "httproute"
  labels        = {
    tf-label    = "tf-label-value"
    empty-label = ""
  }
}

resource "yandex_alb_virtual_host" "my-virtual-host" {
  name                    = "virthost"
  http_router_id          = yandex_alb_http_router.tfrouter.id
  route {
    name                  = "route1"
    http_route {
      http_route_action {
        backend_group_id  = "${yandex_alb_backend_group.test-backend-group.id}"
        timeout           = "60s"
      }
    }
  }
}    

 resource "yandex_alb_load_balancer" "balancer" {
  name        = "webbalanser"
  network_id  = "enpa9auu48k75qm9hvb3"
  security_group_ids = []

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = "e9b8h8fgntov76s0m5qh" 
    }
    location {
      zone_id   = "ru-central1-b"
      subnet_id = "e2ljspp0no4f6ndm9q0o" 
    }
    location {
      zone_id   = "ru-central1-c"
      subnet_id = "b0cmkodd2r7j5b1t1dlo" 
    }
  }




  listener {
    name = "listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [ 80 ]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.tfrouter.id
      }
    }
  }
}


