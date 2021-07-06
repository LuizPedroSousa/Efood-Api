defmodule EfoodApi.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table :orders do
      add :payment_method, :integer
      add :telephone, :string
      add :status, :integer
      add :track_address, :string
      add :user_id, references(:users, type: :binary_id, on_delete: :delete_all)
    end
  end
end
