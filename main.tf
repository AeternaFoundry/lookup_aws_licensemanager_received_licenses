data "aws_licensemanager_received_licenses" "licensemanager_received_licenses_lookup" {
  for_each = var.licensemanager_received_licenses_lookup

  region = each.value.region

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

