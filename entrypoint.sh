#!/usr/bin/env bash

export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID:?You must provide AWS credentials}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY:?You must provide AWS credentials}
export AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION:-eu-west-1}

set -euo pipefail

tfswitch -b ${TERRAFORM_HOME}/terraform
make -f /Makefile
