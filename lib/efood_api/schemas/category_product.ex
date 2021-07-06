defmodule EfoodApi.CategoryProduct do
  use Ecto.Schema
  import Ecto.Changeset
  alias EfoodApi.{Product}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [
    :name,
    :type
  ]
  schema "category_products" do
    field :name, :string
    field :type, :string

    has_many :product, Product
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end
end
