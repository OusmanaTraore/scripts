#!/bin/bash

echo "| Reset grafana passwd >> "
grafana-cli --homepath "/usr/share/grafana" admin reset-admin-password admin
