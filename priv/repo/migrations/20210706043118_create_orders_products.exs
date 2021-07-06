defmodule EfoodApi.Repo.Migrations.CreateOrdersProducts do
  use Ecto.Migration

  def change do
    create table :orders_products do
      add :quantity, :integer
      add :product_id, references(:products, type: :binary_id, on_delete: :delete_all)
      add :orders_id, references(:orders, type: :binary_id, on_delete: :delete_all)
      timestamps()
    end
  end
end
