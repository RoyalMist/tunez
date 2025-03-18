import Config

config :tunez, TunezWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: Tunez.Finch
config :swoosh, local: false
config :logger, level: :info
