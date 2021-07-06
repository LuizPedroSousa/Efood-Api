defmodule EfoodApi.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset
  alias EfoodApi.{Order}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:name, :username, :nickname, :password]
  schema "users" do
    field :name, :string
    field :username, :string
    field :nickname, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_many :orders, Order
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:username])
    |> put_password_hash()
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset |> change(Pbkdf2.add_hash(password))
  end
end
