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
 resource "yandex_compute_instance" "vm1" {
  name = "bastion"
  hostname = "bastion"
  platform_id = "standard-v2"
  zone        = "ru-central1-b"
 
 resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    device_name = "disk1"
    initialize_params {  
      image_id = "fd84qmg56d2uqhhbuciq"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-b.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.bastion-sg.id] 
  }
 
 metadata = {
    user-data = "${file("./meta.yml")}"
  }
 
 scheduling_policy {
        preemptible = true
    }
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
    subnet_id = yandex_vpc_subnet.subnet-c.id
    nat       = false
    security_group_ids = [yandex_vpc_security_group.web-sg.id]
  }
 
 metadata = {
    user-data = "${file("./meta.yml")}"
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
    subnet_id = yandex_vpc_subnet.subnet-a.id
    nat       = false
    security_group_ids = [yandex_vpc_security_group.web-sg.id]
  }
 
 metadata = {
    user-data = "${file("./meta.yml")}"
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
    subnet_id = yandex_vpc_subnet.subnet-a.id
    nat       = false
    security_group_ids = [yandex_vpc_security_group.elastic-sg.id]
  }
 
 metadata = {
    user-data = "${file("./meta.yml")}"
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
    subnet_id = yandex_vpc_subnet.subnet-b.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.kibana-sg.id]
  }
 
 metadata = {
    user-data = "${file("./meta.yml")}"
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
    subnet_id = yandex_vpc_subnet.subnet-b.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.zabbix-sg.id]
  }
 
 metadata = {
    user-data = "${file("./meta.yml")}"
  }
 
 scheduling_policy {
        preemptible = true
    }
 
 }

