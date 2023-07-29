//go:build tools
// +build tools

// To install the following tools at the version used by this repo run:
// $ make tools
// or
// $ go generate -tags tools tools/tools.go

package tools

//go:generate go install github.com/golangci/golangci-lint/cmd/golangci-lint
//go:generate go install github.com/kyleconroy/sqlc/cmd/sqlc@latest


import (
	_ "github.com/golangci/golangci-lint/cmd/golangci-lint"
	_ "github.com/kyleconroy/sqlc/cmd/sqlc"
)
