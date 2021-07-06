defmodule EfoodApi.Repo.Migrations.AlterOrders do
  use Ecto.Migration

  def change do
    alter table :orders do
      add :delivery_status_id, references(:delivery_status, type: :binary_id, on_delete: :delete_all)
    end
  end
end
