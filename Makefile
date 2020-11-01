AWS_VPC_ID := none
AWS_SUBNET_ID := none
AWS_REGION := us-east-2
RKE2_VERSION := v1.18.10+rke2r1
RKE2_BUILD_DATE := 2020-10-31
HTTP_PROXY := ""
HTTPS_PROXY := "" 
NO_PROXY := ""
HARDENING := stig
KMS_KEY_ID := ""

define packer_build
	@echo "Starting Packer Build"
	@echo "VPC ID: $(AWS_VPC_ID)"
	@echo "SUBNET ID: $(AWS_SUBNET_ID)"
	@echo "REGION: $(AWS_REGION)"
	@echo "CONFIG: $1"
	@echo "HTTP Proxy: $(HTTP_PROXY)"
	@echo "HTTPS Proxy: $(HTTPS_PROXY)"
	@echo "No Proxy: $(NO_PROXY)"
	@echo "Hardening: $(HARDENING)"
	@echo "KMS Key Id: $(KMS_KEY_ID)"

	cd ./packer; \
	packer build \
		-var "vpc_id=$(AWS_VPC_ID)" \
		-var "subnet_id=$(AWS_SUBNET_ID)" \
		-var "aws_region=$(AWS_REGION)" \
		-var "rke2_version=$(RKE2_VERSION)" \
		-var "rke2_build_date=$(RKE2_BUILD_DATE)" \
		-var "http_proxy=$(HTTP_PROXY)" \
		-var "https_proxy=$(HTTPS_PROXY)" \
		-var "no_proxy=$(NO_PROXY)" \
		-var "hardening=$(HARDENING)" \
		-var "kms_key_id=$(KMS_KEY_ID)" \
		$1
endef

install:
	brew install ansible packer
	cd ./ansible; ansible-galaxy install RedHatOfficial.rhel7_stig

build-ubuntu-1604:
	$(call packer_build,"ubuntu-1604.json")

build-ubuntu-1804:
	$(call packer_build,"ubuntu-1804.json")

build-debian-stretch:
	$(call packer_build,"debian-stretch.json")

build-centos-7:
	$(call packer_build,"centos-7.json")

build-rhel-8:
	$(call packer_build,"rhel-8.json")
