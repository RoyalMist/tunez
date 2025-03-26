import Config

if System.get_env("PHX_SERVER") do
  config :tunez, TunezWeb.Endpoint, server: true
end

if config_env() == :prod do
  database_path =
    System.get_env("DATABASE_PATH") ||
      raise """
      environment variable DATABASE_PATH is missing.
      For example: /etc/lite/lite.db
      """

  config :tunez, Tunez.Repo,
    database: database_path,
    pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  host = System.get_env("PHX_HOST") || "example.com"
  port = String.to_integer(System.get_env("PORT") || "4000")

  config :tunez, :dns_cluster_query, System.get_env("DNS_CLUSTER_QUERY")

  config :tunez, TunezWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ],
    secret_key_base: secret_key_base

  config :tunez,
    token_signing_secret:
      System.get_env("TOKEN_SIGNING_SECRET") ||
        raise("Missing environment variable `TOKEN_SIGNING_SECRET`!")

  config :tunez, Litestream,
    replica_url: System.fetch_env!("LITESTREAM_REPLICA_URL"),
    access_key_id: System.fetch_env!("LITESTREAM_ACCESS_KEY"),
    secret_access_key: System.fetch_env!("LITESTREAM_SECRET_KEY")
end
