#!/usr/bin/bash

function unpacking {
  cd /tmp/orainstall
  unzip linuxamd64_12102_database_1of2.zip
  unzip linuxamd64_12102_database_2of2.zip
  rm linuxamd64_12102_database_1of2.zip
  rm linuxamd64_12102_database_2of2.zip

}

eval $*
