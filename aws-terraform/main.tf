
resource "aws_ecr_repository" "node" {
  name                 = var.repo_name
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configration {
    scan_on_push = true
  }
}