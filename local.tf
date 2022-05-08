locals {
    owners=var.Busniness_division
    environment=var.environment
    resource_name_prefix="${var.Busniness_division}-${var.environment}"

    common_tags={
        owners=local.owners
        environment= local.environment
    }


}

