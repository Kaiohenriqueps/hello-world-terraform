variable gcp_global {
    type = object({project_name = string})
    default = {
        project_name = "festive-magpie-279021"
    }
}

variable storage_infos {
    type = object({bucket_name = string, location = string})
    default = {
        bucket_name = "hello-world-terraform-storage"
        location = "us-east1"
    }
}