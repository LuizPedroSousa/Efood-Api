defmodule EfoodApi.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table :users do
      add :name, :string
      add :username, :string
      add :nickname, :string
      add :password_hash, :string
      add :isAdmin, :boolean, default: false
      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
