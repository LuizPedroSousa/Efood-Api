defmodule EfoodApi.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias EfoodApi.{OrderProduct, CategoryProduct}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [
    :name,
    :thumbnail,
    :price,
    :description,
    :category_products_id
  ]
  schema "products" do
    field :name, :string
    field :thumbnail, :string
    field :price, :string
    field :description, :string
    field :category_products_id, :string

    belongs_to :category_product, CategoryProduct
    has_many :order_product, OrderProduct
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:name])
  end
end
