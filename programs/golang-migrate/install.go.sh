#!/bin/bash

go get -u -d github.com/golang-migrate/migrate/cmd/migrate
cd $GOPATH/src/github.com/golang-migrate/migrate/cmd/migrate
git checkout $TAG # e.g. v4.1.0
go build -tags 'postgres' -ldflags="-X main.Version=$(git describe --tags)" -o $GOPATH/bin/migrate $GOPATH/src/github.com/golang-migrate/migrate/cmd/migrate
# Go 1.16+
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@$TAG

# Go 1.15 and below
go get -tags 'postgres' -u github.com/golang-migrate/migrate/cmd/migrate
$ # Go 1.16+
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
