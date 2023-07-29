# Loomi-Go: A Go Implementation of Loomio

Port of the Rails App [Loomio](https://github.com/loomio/loomio).

## Possible Tools & Libraries

- [connect-go](https://connect.build/docs/go/getting-started) for gRPC.
- [gotestfmt](https://github.com/GoTestTools/gotestfmt) for parsing test outputs.
- [chi](https://github.com/go-chi/chi) for routing.
- [cobra](https://github.com/spf13/cobra) for command parsing.
- [viper](https://github.com/spf13/viper) for config mgmt.
- [tern](https://github.com/jackc/tern) or [goose](https://github.com/pressly/goose) for migrations.
- [gomock](https://github.com/golang/mock) for mock generation.
- [sqlc](https://github.com/kyleconroy/sqlc) for code-gen from sql.
- [pgx](https://github.com/jackc/pgx) for driving postgresql.
- [rueidis](https://github.com/redis/rueidis) as a redis client.
- [zerolog](https://github.com/rs/zerolog) or [zap](https://github.com/uber-go/zap) for logging.
- [otel](https://pkg.go.dev/go.opentelemetry.io/otel) sdk for tracing and o11y
- [oapi-codegen](https://github.com/deepmap/oapi-codegen) for OpenAPI generation from spec.
- [htmx](https://htmx.org/) for front end.
- [redocly-cli](https://github.com/Redocly/redocly-cli) for managing openAPI spec.
- [validator](https://github.com/go-playground/validator) for struct & field validation.
- database testing via [pgunit](https://github.com/adrianandrei-ca/pgunit) and [pgtap](https://github.com/theory/pgtap/).
- file and directory linting via [ls-lint](https://ls-lint.org/)

## Long Term Goals

- Support [TUF](https://github.com/theupdateframework/go-tuf).
- Generate gRPC gateway via [gnostic](https://github.com/google/gnostic-grpc/tree/main/examples/end-to-end-grpc-gateway) to use protobufs internally.
- BDD with [godog](https://github.com/cucumber/godog)
- CRDT editing for Discussions (maybe with [hocuspocus](https://tiptap.dev/hocuspocus/introduction)).
