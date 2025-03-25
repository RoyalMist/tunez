defmodule Tunez.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Oban,
       AshOban.config(
         Application.fetch_env!(:tunez, :ash_domains),
         Application.fetch_env!(:tunez, Oban)
       )},
      TunezWeb.Telemetry,
      Tunez.Repo,
      {Ecto.Migrator, repos: Application.fetch_env!(:tunez, :ecto_repos)},
      {Litestream, litestream_config()},
      {DNSCluster, query: Application.get_env(:tunez, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Tunez.PubSub},
      {Finch, name: Tunez.Finch},
      TunezWeb.Endpoint,
      {AshAuthentication.Supervisor, [otp_app: :tunez]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Tunez.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TunezWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp litestream_config do
    Application.get_env(:tunez, Litestream)
  end
end
