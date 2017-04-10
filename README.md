# rpi-saltstack
Saltstack states and templates for a raspberry pi infrastructure

The actual top.sls is in brnsampson/rpi-saltstack-base so that there are not 4 different versions of top.sls being merged
when states are run.

Right now there is only a hub role which is a raspberry pi 3 which connects to a number of raspberry pi zeros through usb ethernet
and will route traffic from them to the outside network (WIP).
