#!/bin/bash
systemctl start mariadb.service
systemctl start rabbitmq-server.service
systemctl start memcached.service
systemctl start httpd.service
systemctl start openstack-glance-api.service \
  openstack-glance-registry.service
systemctl start openstack-nova-api.service \
  openstack-nova-consoleauth.service openstack-nova-scheduler.service \
  openstack-nova-conductor.service openstack-nova-novncproxy.service
systemctl start neutron-server.service \
  neutron-linuxbridge-agent.service neutron-dhcp-agent.service \
  neutron-metadata-agent.service
systemctl start neutron-l3-agent.service
systemctl restart httpd.service memcached.service
