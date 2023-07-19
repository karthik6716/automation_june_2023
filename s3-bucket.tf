# resource "aws_s3_bucket" "this" {
#   bucket = var.aws_s3_bucket_name
#   #    bucket = aws_s3_bucket.this.id 
#   #   versioning {
#   #     enabled = true
#   #   }

#   tags = {
#     Name = var.aws_s3_bucket_name
#   }
# }

# resource "aws_s3_bucket_ownership_controls" "this" {
#   bucket = aws_s3_bucket.this.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_acl" "this" {
#   depends_on = [aws_s3_bucket_ownership_controls.this]
#   bucket     = aws_s3_bucket.this.id
#   acl        = "private"
# }

# resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
#   bucket = aws_s3_bucket.this.id

#   rule {
#     id = "transfer-to-glacier"

#     expiration {
#       days = 90
#     }

#     filter {}

#     status = "Enabled"

#     transition {
#       days          = 30
#       storage_class = "STANDARD_IA"
#     }

#     transition {
#       days          = 60
#       storage_class = "GLACIER"
#     }
#   }

#   rule {
#     id = "tmp"

#     filter {
#       prefix = "tmp/"
#     }

#     expiration {
#       days = "15"
#     }

#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket" "versioning_bucket" {
#   bucket = var.aws_s3_bucket_name
# }

# resource "aws_s3_bucket_acl" "versioning_bucket_acl" {
#   bucket = aws_s3_bucket.versioning_bucket.id
#   acl    = "private"
# }

# resource "aws_s3_bucket_versioning" "versioning" {
#   bucket = aws_s3_bucket.versioning_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

