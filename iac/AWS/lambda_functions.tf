resource "aws_lambda_function" "hospital_task" {
  function_name = "func-${local.resource_prefix}"
  role          = aws_iam_role.lambda_exec_role.arn
  handler       = "index.handler"
  runtime       = "python3.9"
  filename      = "function_payload.zip" # Ye file iac folder mein honi chahiye

  tags = local.common_tags
}

# Lambda ke liye IAM Role zaroori hai
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-role-${local.resource_prefix}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}