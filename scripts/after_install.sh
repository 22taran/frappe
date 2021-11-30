#!/bin/bash

cd /home/erpuser/frappe-bench/apps/
mv tag-frappe/* ./frappe/
mv tag-frappe/.* ./frappe/
rmdir tag-frappe
cd /home/erpuser/frappe-bench/apps/frappe/
/usr/local/bin/virtualenv --quiet env -p python3
./env/bin/python -m pip install --quiet --upgrade pip
./env/bin/python -m pip install --quiet --upgrade .
npm i frappe-node
yarn install
bench build
sudo supervisorctl restart all

