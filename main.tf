# Create S3 bucket
resource "aws_s3_bucket" "newbucket" {
  bucket = var.bucketname
}

# Set Ownership controls
resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.newbucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Block Public Access settings
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.newbucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Set the Bucket ACL for public-read
resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.newbucket.id
  acl    = "public-read"
}

# Upload the index.html file
resource "aws_s3_object" "index" {
  bucket        = aws_s3_bucket.newbucket.id
  key           = "index.html"
  source        = "index.html" 
  acl           = "public-read"
  content_type  = "text/html"
}

# Upload the error.html file
resource "aws_s3_object" "error" {
  bucket        = aws_s3_bucket.newbucket.id
  key           = "error.html"
  source        = "error.html"  
  content_type  = "text/html"
}

# Upload the profile.png file
resource "aws_s3_object" "photo" {
  bucket        = aws_s3_bucket.newbucket.id
  key           = "photo.png"
  source        = "photo.png"  
  content_type  = "image/png"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.newbucket.id
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  depends_on = [ aws_s3_bucket_acl.example ]
}
