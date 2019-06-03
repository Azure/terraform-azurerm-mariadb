output "server_name" {
  value       = "${module.mariadb.server_name}"
}

output "administrator_login" {
  value = "${module.mariadb.administrator_login}"
}

output "administrator_password" {
  value     = "${module.mariadb.administrator_password}"
  sensitive = true
}