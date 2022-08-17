/* 
resource "docker_image" "php-httpd-image" {
    name = "php-httpd:challenge"
    build {
        path = "./lamp_stack/php_httpd"
        label = {
            challenge: "second"
        }
    }   
}

resource "docker_image" "mariadb-image" {
    name = "mariadb:challenge"
    build {
        path = "./lamp_stack/custom_db"
        label = {
            challenge: "second"
        }
    }   
}

resource "docker_volume" "mariadb_volume" {
    name = "mariadb-volume"
    labels {
        label = "challenge"
        value = "second"
    }
}

resource "docker_container" "mariadb" {
    name = "db"
    hostname = "db"
    image = docker_image.mariadb-image.name   
    networks = [docker_network.private_network.name]
    volumes {
        volume_name = docker_volume.mariadb_volume.name
        container_path = "/var/lib/mysql"
    }
    ports {
        internal = 3306
        ip = "0.0.0.0"
        protocol = "tcp"
        external = 3306
    }
    env = ["MYSQL_ROOT_PASSWORD=1234","MYSQL_DATABASE=simple-website"]
    labels {
        label = "challenge"
        value = "second"
    }
}

resource "docker_container" "php-httpd" {
    name = "webserver"
    hostname = "php-httpd"
    image = docker_image.php-httpd-image.name   
    networks = [docker_network.private_network.name]
    ports {
        internal = 80
        ip = "0.0.0.0"
        protocol = "tcp"
        external = 80
    }
    mounts {
        target = "/var/www/html"
        type = "bind"
        source = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    }
    labels {
        label = "challenge"
        value = "second"
    }
}

resource "docker_network" "private_network" {
    name = "my_network"
    attachable = true
    labels {
        label = "challenge"
        value = "second"
    }
}

resource "docker_container" "phpmyadmin" {
    name = "db_dashboard"
    image = "phpmyadmin/phpmyadmin"
    hostname = "phpmyadmin"
    networks = [docker_network.private_network.name]
    links = [db]
    ports {
        internal = 80
        ip = "0.0.0.0"
        protocol = "tcp"
        external = 8081
    }
    labels {
        label = "challenge"
        value = "second"
    }
} */