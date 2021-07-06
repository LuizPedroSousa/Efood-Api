defmodule EfoodApi.Repo.Migrations.CreateCategoryProducts do
  use Ecto.Migration

  def change do
    create table :category_products do
      add :name, :string
      add :type, :string
      timestamps()
    end
    create unique_index(:category_products, [:name])
  end
end
