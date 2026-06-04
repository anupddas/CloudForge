resource "aws_ebs_snapshot" "web_backup" {

  volume_id = "vol-01ba3983837c9ce45"

  tags = {
    Name = "cloudforge-web-backup"
  }
}