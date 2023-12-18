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
    initialize_params {  
      image_id = "fd84qmg56d2uqhhbuciq"
      size = 10
    }
  }

  network_interface {
    subnet_id = "e2ljspp0no4f6ndm9q0o"
    nat       = true
    security_group_ids = ["${yandex_vpc_security_group.bastion-sg.id}"]
  }
 
 metadata = {
    user-data = "${file("./meta.yml")}"
  }
 
 scheduling_policy {
        preemptible = true
    }
 
 }
 resource "yandex_vpc_security_group" "bastion-sg" {
  name        = "bastion security group"
  description = "Description for security group"
  network_id  = "enpa9auu48k75qm9hvb3"

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  
  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0", "0.0.0.0/0"]
  }
 }