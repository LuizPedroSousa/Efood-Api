defmodule EfoodApi.DeliveryStatus do
  use Ecto.Schema
  import Ecto.Changeset
  alias EfoodApi.{Order}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [
    :is_taken,
    :is_prepared,
    :is_delivered,
    :is_received
  ]
  schema "delivery_status" do
    field :is_taken, :boolean, default: false
    field :is_prepared, :boolean, default: false
    field :is_delivered, :boolean, default: false
    field :is_received, :boolean, default: false
    belongs_to :order, Order
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
