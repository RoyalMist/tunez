import Config
config :tunez, Oban, testing: :manual
config :tunez, token_signing_secret: "Lxtzvlw+Wtt4ko8i+4h8uleaCnigDDyL"
config :ash, disable_async?: true

config :tunez, Tunez.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "tunez_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

config :tunez, TunezWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "m2C9Jx0qejwGCnhNWTlPA9IY3bg3CoFbhq9PXJoYWwt2LaBXI7+9tnG74dGlPKu5",
  server: false

config :tunez, Tunez.Mailer, adapter: Swoosh.Adapters.Test
config :swoosh, :api_client, false
config :logger, level: :warning
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  enable_expensive_runtime_checks: true
