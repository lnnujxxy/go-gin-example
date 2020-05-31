GOFILES ?= $(shell find . -type f -name '*.go' -not -path "./vendor/*")

.PHONY: build clean tool lint help

all: build

build:
	@go build -o cmd/go-gin-example -v .

tool:
	go vet ./...; true
	gofmt -w .
	# 需要安装goimports GO111MODULE=off go get -u golang.org/x/tools/cmd/goimports
	goimports -w $(GOFILES)
lint:
	golint ./...

clean:
	rm -rf cmd/*
	go clean -i .

help:
	@echo "make: compile packages and dependencies"
	@echo "make tool: run specified go tool"
	@echo "make lint: golint ./..."
	@echo "make clean: remove object files and cached files"
