import Config

config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

config :elixir_ms, timezone: "America/Bogota"

config :elixir_ms,
  http_port: 8081,
  enable_server: true,
  secret_name: "fua-dev-secret-CNX",
  region: "us-east-1",
  token_exp: 600,
  cache_expiration: 86400,
  rsa_private_key: "",
  kms_rsa_key_id: "",
  version: "1.2.3"

config :logger,
  level: :error

config :elixir_ms,
  redis_host_credentials: "localhost",
  redis_port_credentials: "6379"

config :elixir_ms,
  hello_repository: ElixirMs.Adapters.Hello
