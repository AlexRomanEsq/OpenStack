#!/usr/bin/python

import MySQLdb

# Open database connection
db = MySQLdb.connect("localhost","root","openstack")

# prepare a cursor object using cursor() method
cursor = db.cursor()

#Crete Keystone
cursor.execute("CREATE DATABASE keystone;")
cursor.execute("GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'localhost' \
  IDENTIFIED BY 'openstack';")
cursor.execute("GRANT ALL PRIVILEGES ON keystone.* TO 'keystone'@'%' \
  IDENTIFIED BY 'openstack';")
#Crete glance
cursor.execute("CREATE DATABASE glance;")
cursor.execute("GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'localhost' \
  IDENTIFIED BY 'openstack';")
cursor.execute("GRANT ALL PRIVILEGES ON glance.* TO 'glance'@'%' \
  IDENTIFIED BY 'openstack';")
#Crete Nova
cursor.execute("CREATE DATABASE nova;")
cursor.execute("GRANT ALL PRIVILEGES ON glance.* TO 'nova'@'localhost' \
  IDENTIFIED BY 'openstack';")
cursor.execute("GRANT ALL PRIVILEGES ON glance.* TO 'nova'@'%' \
  IDENTIFIED BY 'openstack';")
#Create neutron
cursor.execute("CREATE DATABASE neutron;")
cursor.execute("GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' \
  IDENTIFIED BY 'openstack';")
cursor.execute("GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' \
  IDENTIFIED BY 'openstack';")

# disconnect from server
db.close()
