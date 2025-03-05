test_buckets = {
  "stb-trayport-test-bucket-1" = {
    versioning_enabled = true
    object_lock = {
      enabled = true
      mode    = "GOVERNANCE"
      days    = 30
    }
    tags = {
      cost_centre = "test-cc-001"
      product     = "example-product-1"
    }
  }
  "stb-trayport-test-bucket-2" = {
    versioning_enabled = false
    object_lock = {
      enabled = false
      mode    = ""
      days    = 0
    }
    tags = {
      cost_centre = "test-cc-002"
      product     = "example-product-2"
    }
  }
}

staging_buckets = {
  "stb-trayport-staging-bucket-1" = {
    versioning_enabled = true
    object_lock = {
      enabled = true
      mode    = "COMPLIANCE"
      days    = 60
    }
    tags = {
      cost_centre = "staging-cc-001"
      product     = "example-product-1"
    }
  }
  "stb-trayport-staging-bucket-2" = {
    versioning_enabled = false
    object_lock = {
      enabled = false
      mode    = ""
      days    = 0
    }
    tags = {
      cost_centre = "staging-cc-002"
      product     = "analytics"
      product     = "logging"
      product     = "example-product-2"
    }
  }
}

production_buckets = {
  "stb-trayport-prod-bucket-1" = {
    versioning_enabled = true
    object_lock = {
      enabled = true
      mode    = "COMPLIANCE"
      days    = 90
    }
    tags = {
      cost_centre = "prod-cc-001"
      product     = "analytics"
      product     = "example-product-1"
    }
  }
  "stb-trayport-prod-bucket-2" = {
    versioning_enabled = true
    object_lock = {
      enabled = true
      mode    = "GOVERNANCE"
      days    = 45
    }
    tags = {
      cost_centre = "prod-cc-002"
      product     = "example-product-2"
    }
  }
}
