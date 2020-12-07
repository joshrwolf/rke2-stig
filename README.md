# rke2-image-builder

__WARNING__: This repository serves as an __example__ for how to create an rke2 ami with packer using RHEL8 stig playbook located [here](https://github.com/RedHatGov/rhel8-stig-latest).  It is __not__ official by any means.

```
sudo oscap xccdf eval --fetch-remote-resources --profile xccdf_org.ssgproject.content_profile_ospp --results-arf /tmp/arf.xml --report report.html /usr/share/xml/scap/ssg/content/ssg-rhel8-ds.xml
```
