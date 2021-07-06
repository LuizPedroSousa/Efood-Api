defmodule EfoodApi.Repo.Migrations.CreateDeliveryStatus do
  use Ecto.Migration

  def change do
    create table :delivery_status do
      add :is_taken, :boolean, default: false
      add :is_prepared, :boolean, default: false
      add :is_received, :boolean, default: false
      add :is_delivered, :boolean, default: false
      timestamps()
    end
  end
end
