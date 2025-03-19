[
  import_deps: [
    :oban,
    :ash_oban,
    :ash_admin,
    :ash_authentication_phoenix,
    :ash_authentication,
    :ash_sqlite,
    :ash_json_api,
    :ash,
    :ecto,
    :ecto_sql,
    :phoenix
  ],
  subdirectories: ["priv/*/migrations"],
  plugins: [TailwindFormatter, Spark.Formatter, Phoenix.LiveView.HTMLFormatter],
  inputs: ["*.{heex,ex,exs}", "{config,lib,test}/**/*.{heex,ex,exs}", "priv/*/seeds.exs"]
]
