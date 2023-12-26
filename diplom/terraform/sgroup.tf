
resource "yandex_vpc_security_group" "bastion-sg" {
  name        = "bastion security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.diplom-net.id

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
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
 }

 resource "yandex_vpc_security_group" "zabbix-sg" {
  name        = "zabbix security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.diplom-net.id

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["192.168.20.0/24"]
    port           = 22
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["192.168.10.0/24", "192.168.30.0/24"]
    port           = 10050
  }

  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
 }

resource "yandex_vpc_security_group" "kibana-sg" {
  name        = "kibana security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.diplom-net.id

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["192.168.20.0/24"]
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
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
 }
 
 resource "yandex_vpc_security_group" "elastic-sg" {
  name        = "elastic security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.diplom-net.id

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["192.168.20.0/24"]
    port           = 22
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["192.168.20.0/24"]
    port           = 9200
  }

  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
 }

 resource "yandex_vpc_security_group" "web-sg" {
  name        = "web security group"
  description = "Description for security group"
  network_id  = yandex_vpc_network.diplom-net.id

  ingress {
    protocol       = "ANY"
    description    = "Rule description 1"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["192.168.20.0/24"]
    port           = 22
  }

 ingress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["192.168.20.0/24"]
    port           = 10050
  }
 
  egress {
    protocol       = "ANY"
    description    = "Rule description 2"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
 }