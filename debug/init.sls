# State for a test and debug host. This should be a raspberry pi 3.
# A host bootstrapped with this role will be able to connect directly
# to a raspberry pi zero which has been correctly configured and
# interact with it as an ethernet device.

include:
  - services.rpz-hub
