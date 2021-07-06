defmodule EfoodApi.OrderProduct do
  use Ecto.Schema
  import Ecto.Changeset
  alias EfoodApi.{Order, Product}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [
    :quantity,
    :product_id,
    :orders_id
  ]
  schema "orders_products" do
    field :quantity, :integer
    belongs_to :product, Product
    belongs_to :order, Order
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
