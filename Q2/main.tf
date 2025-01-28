resource "aws_s3_bucket" "test_buckets" {
  for_each = var.test_buckets

  bucket              = each.key
  object_lock_enabled = each.value.object_lock.enabled

  tags = each.value.tags
}

# Test
resource "aws_s3_bucket_versioning" "test_versioning" {
  for_each = {
    for k, v in var.test_buckets : k => v
    if v.versioning_enabled
  }

  bucket = aws_s3_bucket.test_buckets[each.key].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "test_object_lock" {
  for_each = {
    for k, v in var.test_buckets : k => v
    if v.object_lock.enabled
  }

  bucket = aws_s3_bucket.test_buckets[each.key].id

  rule {
    default_retention {
      mode = each.value.object_lock.mode
      days = each.value.object_lock.days
    }
  }
}

# Staging
resource "aws_s3_bucket" "staging_buckets" {
  for_each = var.staging_buckets

  bucket              = each.key
  object_lock_enabled = each.value.object_lock.enabled

  tags = each.value.tags
}

resource "aws_s3_bucket_versioning" "staging_versioning" {
  for_each = {
    for k, v in var.staging_buckets : k => v
    if v.versioning_enabled
  }

  bucket = aws_s3_bucket.staging_buckets[each.key].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "staging_object_lock" {
  for_each = {
    for k, v in var.staging_buckets : k => v
    if v.object_lock.enabled
  }

  bucket = aws_s3_bucket.staging_buckets[each.key].id

  rule {
    default_retention {
      mode = each.value.object_lock.mode
      days = each.value.object_lock.days
    }
  }
}

# Production
resource "aws_s3_bucket" "production_buckets" {
  for_each = var.production_buckets

  bucket              = each.key
  object_lock_enabled = each.value.object_lock.enabled

  tags = each.value.tags
}

resource "aws_s3_bucket_versioning" "production_versioning" {
  for_each = {
    for k, v in var.production_buckets : k => v
    if v.versioning_enabled
  }

  bucket = aws_s3_bucket.production_buckets[each.key].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "production_object_lock" {
  for_each = {
    for k, v in var.production_buckets : k => v
    if v.object_lock.enabled
  }

  bucket = aws_s3_bucket.production_buckets[each.key].id

  rule {
    default_retention {
      mode = each.value.object_lock.mode
      days = each.value.object_lock.days
    }
  }
}
