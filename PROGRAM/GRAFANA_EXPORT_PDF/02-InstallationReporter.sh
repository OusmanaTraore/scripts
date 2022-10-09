#!/bin/bash

echo "Téléchargement de Reporter depuis le repos GIT"
echo " |==>"
go get github.com/IzakMarais/reporter/...
go install -v github.com/IzakMarais/reporter/cmd/grafana-reporter
