resource "yandex_alb_target_group" "foo" {
  name           = "webgr"

  target {
    subnet_id    = yandex_vpc_subnet.subnet-a.id
    ip_address   = yandex_compute_instance.vm2.network_interface.0.ip_address
  }

  target {
    subnet_id    = yandex_vpc_subnet.subnet-c.id
    ip_address   = yandex_compute_instance.vm3.network_interface.0.ip_address
  }
 }

 resource "yandex_alb_backend_group" "test-backend-group" {
  name                     = "webback"
  
  http_backend {
    name                   = "backend1"
    weight                 = 1
    port                   = 80
    target_group_ids       = [yandex_alb_target_group.foo.id]
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
        backend_group_id  = yandex_alb_backend_group.test-backend-group.id
        timeout           = "60s"
      }
    }
  }
}    

 resource "yandex_alb_load_balancer" "balancer" {
  name        = "webbalanser"
  network_id  = yandex_vpc_network.diplom-net.id
  security_group_ids = []

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.subnet-a.id
    }
    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.subnet-b.id 
    }
    location {
      zone_id   = "ru-central1-c"
      subnet_id = yandex_vpc_subnet.subnet-c.id
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