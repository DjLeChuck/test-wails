.DEFAULT_GOAL := help
.PHONY:help fmt vet tidy test build-linux build-darwin

## help: print this help message
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## fmt: format code
fmt:
	go fmt ./...

## vet: format code and execute got vet
vet: fmt
	go vet ./...

## tidy: format code and tidy modfile
tidy:
	go fmt ./...
	go mod tidy -v

## test: run all tests
test:
	go test -v -race ./...

## build: build the application
build:
	GOARCH=amd64 GOOS=darwin wails build -o dist/wail-test-${VERSION}-darwin
	GOARCH=amd64 GOOS=linux wails build -o dist/wail-test-${VERSION}-linux
