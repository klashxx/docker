#!/bin/bash

readonly SW_IMG="fedora/ora12c_sw"
readonly DB_IMG="fedora/ora12c_db"
readonly DB_DIR="database"

[[ ! -d $DB_DIR ]] && echo "Database software required! " && exit 5

docker build --tag=$SW_IMG -f Dockerfile.1 .

docker run --privileged=true \
           -it --cidfile="cidfile.$$" \
           $SW_IMG  \
           /bin/bash -c  "/tmp/privileged_actions.sh"

docker commit $(cat cidfile.$$) $SW_IMG

rm cidfile.$$

[[ -d $DB_DIR ]] && mv $DB_DIR ${DB_DIR}_bk

docker build --tag=$DB_IMG -f Dockerfile.2 .

[[ -d ${DB_DIR}_bk ]] && mv ${DB_DIR}_bk $DB_DIR
