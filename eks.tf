resource "aws_iam_role" "eks-iam-role" {
  name = "devopsthehardway-eks-iam-role"

  path = "/"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
  {
   "Effect": "Allow",
   "Principal": {
    "Service": "eks.amazonaws.com"
   },
   "Action": "sts:AssumeRole"
  }
 ]
}
EOF

}

resource "aws_eks_cluster" "devopsthehardway-eks" {
  name     = "EKS-cluster"
  role_arn = aws_iam_role.eks-iam-role.arn
  version  = "1.20"
  vpc_config {
    subnet_ids         = module.vpc.public_subnets
    security_group_ids = [ module.security-group-Bastion.this_security_group_id ]
  }

  depends_on = [
    aws_iam_role.eks-iam-role,
  ]
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-iam-role.name
}
resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-iam-role.name
}


output "endpoint" {
  value = aws_eks_cluster.devopsthehardway-eks.endpoint
}

