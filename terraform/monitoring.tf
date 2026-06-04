resource "aws_cloudwatch_dashboard" "cloudforge" {
  dashboard_name = "CloudForge-Dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          title = "EC2 CPU Utilization"

          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "InstanceId",
              aws_instance.web.id
            ]
          ]

          period = 300
          stat   = "Average"
          region = var.aws_region
        }
      },

      {
        type   = "metric"
        x      = 12
        y      = 0
        width  = 12
        height = 6

        properties = {
          title = "Memory Usage"

          metrics = [
            [
              "CloudForge",
              "mem_used_percent",
              "InstanceId",
              aws_instance.web.id
            ]
          ]

          period = 300
          stat   = "Average"
          region = var.aws_region
        }
      },

      {
        type   = "metric"
        x      = 0
        y      = 6
        width  = 12
        height = 6

        properties = {
          title = "Disk Usage"

          metrics = [
            [
              "CloudForge",
              "disk_used_percent",
              "InstanceId",
              aws_instance.web.id,
              "path",
              "/",
              "device",
              "nvme0n1p1",
              "fstype",
              "xfs"
            ]
          ]

          period = 300
          stat   = "Average"
          region = var.aws_region
        }
      }
    ]
  })
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name          = "cloudforge-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2

  metric_name = "CPUUtilization"
  namespace   = "AWS/EC2"

  period    = 300
  statistic = "Average"

  threshold = 80

  dimensions = {
    InstanceId = aws_instance.web.id
  }

  alarm_description = "CPU utilization above 80%"
}

resource "aws_cloudwatch_metric_alarm" "high_memory" {

  alarm_name          = "cloudforge-high-memory"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2

  metric_name = "mem_used_percent"
  namespace   = "CloudForge"

  period    = 300
  statistic = "Average"

  threshold = 80

  dimensions = {
    InstanceId = aws_instance.web.id
  }

  alarm_description = "Memory utilization above 80%"
}