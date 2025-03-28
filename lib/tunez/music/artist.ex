defmodule Tunez.Music.Artist do
  use Ash.Resource, otp_app: :tunez, domain: Tunez.Music, data_layer: AshSqlite.DataLayer

  sqlite do
    table "artists"
    repo Tunez.Repo
  end

  actions do
    defaults [:read, :destroy, :create, :update]
    default_accept [:name, :bio]
  end

  attributes do
    uuid_v7_primary_key :id

    attribute :name, :string do
      allow_nil? false
    end

    attribute :bio, :string
    create_timestamp :inserted_at
    update_timestamp :updated_at
  end
end
