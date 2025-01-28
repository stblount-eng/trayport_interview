variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
  default     = "eu-west-2"
}

variable "test_buckets" {
  type = map(object({
    versioning_enabled = bool
    object_lock = object({
      enabled = bool
      mode    = string
      days    = number
    })
    tags = object({
      cost_centre = string
      product     = string
    })
  }))
  description = "Configuration for test environment buckets"
}

variable "staging_buckets" {
  type = map(object({
    versioning_enabled = bool
    object_lock = object({
      enabled = bool
      mode    = string
      days    = number
    })
    tags = object({
      cost_centre = string
      product     = string
    })
  }))
  description = "Configuration for staging environment buckets"
}

variable "production_buckets" {
  type = map(object({
    versioning_enabled = bool
    object_lock = object({
      enabled = bool
      mode    = string
      days    = number
    })
    tags = object({
      cost_centre = string
      product     = string
    })
  }))
  description = "Configuration for production environment buckets"
}
