import Config

config :tunez, Tunez.Repo,
  database: Path.expand("../tunez_dev.db", __DIR__),
  pool_size: 5,
  stacktrace: true,
  show_sensitive_data_on_connection_error: true

config :tunez, TunezWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "GXVM8PFahJvb2cUV43F8OPmF0cYcQJpmLpBYb4jmL2xzYqtgjfn33U5DY6qLZ2Fu",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:tunez, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:tunez, ~w(--watch)]}
  ]

config :tunez, TunezWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/tunez_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

config :tunez, dev_routes: true, token_signing_secret: "Lrx2VCb9vbYFsBcJ3zmK+vv8zZQcBkBj"
config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20
config :phoenix, :plug_init_mode, :runtime
config :swoosh, :api_client, false

config :phoenix_live_view,
  enable_expensive_runtime_checks: true
