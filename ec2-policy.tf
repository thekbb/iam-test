data "aws_iam_policy_document" "ec2_readonly" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:Describe*",
      "ec2:Get*",
      "ec2:List*,
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "elasticloadbalancing:Describe*",
      "autoscaling:Describe*",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2_readonly" {
  name        = "ec2-readonly-policy"
  description = "Read-only access to EC2 resources"
  policy      = data.aws_iam_policy_document.ec2_readonly.json
}

