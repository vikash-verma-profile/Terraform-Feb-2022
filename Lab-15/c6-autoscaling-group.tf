#autoscaling group

resource "aws_autoscaling_group" "autoscalinggroup"{
    name = "autoscaling-group"
    vpc_zone_identifier = [aws_subnet.vpc-dev-public-subnet-1.id]
    launch_configuration = aws_launch_configuration.autoscaling_launch_configuration.name
    health_check_type = "EC2"
    min_size = 1
    max_size = 2
    health_check_grace_period = 300
    force_delete = true
}

#launch Configuration
resource "aws_launch_configuration" "autoscaling_launch_configuration" {
  name_prefix = "autoscaling_launch_configuration"
  image_id = "ami-0c19f80dba70861db"
  instance_type = var.instance_type
  security_groups = [aws_security_group.dev-vpc-sg.id]
}

#policy for autoscaling scaleout or scaleUp
resource "aws_autoscaling_policy" "scaleup-aws-autoscaling-policy" {
  name ="scaleup-aws-autoscaling-policy"
  autoscaling_group_name = aws_autoscaling_group.autoscalinggroup.name
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = "-1"
  cooldown = "300"
  policy_type = "SimpleScaling"
}


#policy for autoscaling scalein or scaledown
resource "aws_autoscaling_policy" "scaledown-aws-autoscaling-policy" {
  name ="scaledown-aws-autoscaling-policy"
  autoscaling_group_name = aws_autoscaling_group.autoscalinggroup.name
  adjustment_type = "ChangeInCapacity"
  scaling_adjustment = "-1"
  cooldown = "300"
  policy_type = "SimpleScaling"
}

#alarm for scale up

resource "aws_cloudwatch_metric_alarm" "autoscaling-alarm-scaleup" {
    alarm_name = "autoscaling-alarm-scaleup"
    evaluation_periods = 1
    alarm_description = "autoscaling alarm for scaleup"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"  #seconds
    threshold = "30"
    statistic = "Average" # minimum ,maximum
    dimensions = {
      "AutoScalingGroupName" = aws_autoscaling_group.autoscalinggroup.name
    }
    actions_enabled = true
    alarm_actions = [ aws_autoscaling_policy.scaleup-aws-autoscaling-policy.arn ]
}
#alarm for scale down

resource "aws_cloudwatch_metric_alarm" "autoscaling-alarm-scaledown" {
    alarm_name = "autoscaling-alarm-scaledown"
    evaluation_periods = 1
    alarm_description = "autoscaling alarm for scaledown"
    comparison_operator = "LessThanOrEqualToThreshold"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "120"  #seconds
    threshold = "5"
    statistic = "Average" # minimum ,maximum
    dimensions = {
      "AutoScalingGroupName" = aws_autoscaling_group.autoscalinggroup.name
    }
     actions_enabled = true
    alarm_actions = [ aws_autoscaling_policy.scaledown-aws-autoscaling-policy.arn ]
}

