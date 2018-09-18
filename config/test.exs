use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :conduit, ConduitWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configs the EventStore DB for this ENV.
config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "conduit_eventstore_test",
  hostname: "localhost",
  pool_size: 1

# Configs the read store DB for this ENV.
config :conduit, Conduit.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "conduit_readstore_test",
  hostname: "localhost",
  pool_size: 1

# Configures the Commanded Ecto Projections lib
config :commanded_ecto_projections, repo: Conduit.Repo

# Configures Bcrypt to do limited rounds during test phase

config :comeonin, :bcrypt_log_rounds, 4
