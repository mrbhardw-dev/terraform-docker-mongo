module "label" {
  source  = "aws-ia/label/aws"
  version = "0.0.5"


  # name      = var.name
  namespace = var.aws_region
  env       = var.project
  # account   = var.account
  id_order = ["env","namespace", "account",  "name"]
  tags = {
    "Created by" = "terraform"
    "Project"    = var.project
    "Owner"      = "IaC"

  }
}
