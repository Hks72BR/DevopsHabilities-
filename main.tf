provider "aws" {
  access_key = "var.access_key" #AKIAYEKP5MF34TLP8DUG Example
  secret_key = "var.secret_key" ##afwS2XkJ//agqKskpFTCeEzXWhLy+DsZ5DVGzkdF Example
  region     = "us-west-2"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "example-vpc"
  }
}

resource "aws_subnet" "example_a" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.example.id
  availability_zone = "us-west-2a"

  tags = {
    Name = "example-subnet-a"
  }
}

resource "aws_subnet" "example_b" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.example.id
  availability_zone = "us-west-2b"

  tags = {
    Name = "example-subnet-b"
  }
}

resource "aws_iam_role" "example" {
  name        = "example-cluster-role"
  description = "EKS cluster role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect = "Allow"
      }
    ]
  })

  tags = {
    Name = "example-iam-role"
  }
}

resource "aws_iam_policy" "example" {
  name        = "example-cluster-policy"
  description = "EKS cluster policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
          "elasticloadbalancing:*",
          "cloudwatch:*",
          "iam:PassRole",
          "eks:*"
        ]
        Resource = "*"
        Effect = "Allow"
      }
    ]
  })

  tags = {
    Name = "example-iam-policy"
  }
}

resource "aws_iam_role_policy_attachment" "example" {
  role       = aws_iam_role.example.name
  policy_arn = aws_iam_policy.example.arn
}

resource "aws_eks_cluster" "example" {
  name     = "example-cluster"
  role_arn = aws_iam_role.example.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.example_a.id,
      aws_subnet.example_b.id
    ]
  }

  tags = {
    Name = "example-eks-cluster"
  }
}
