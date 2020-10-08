IMAGE := base.json
VERSION := $(shell git rev-parse --short HEAD)
default: build

build:
	packer build -var='aws_access_key=$(aws_access_key)' -var='aws_secret_key=$(aws_secret_key)' -var='commit_hash=$(VERSION)' $(IMAGE)