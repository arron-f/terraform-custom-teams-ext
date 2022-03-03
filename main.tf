terraform {
  # This module is now only being tested with Terraform 0.13.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 0.13.x code.
  required_version = ">= 0.12.26"
}

data "external" "teams" {
    #program = ["${path.module}/test.sh"]
    program = ["python3", "${path.module}/page_me.py"]

    query = { 
      msg = "${var.message}"
      title = "${var.title}"
      url = "${var.teamsurl}"
    }
}
