defmodule EfoodApi.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table :products do
      add :name, :string
      add :thumbnail, :string
      add :price, :integer
      add :description, :string
      add :category_products_id, references(:category_products, type: :binary_id, on_delete: :delete_all)
      timestamps()
    end

    create unique_index(:products, [:name])
  end
end
