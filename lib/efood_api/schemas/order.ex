defmodule EfoodApi.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias EfoodApi.{User, DeliveryStatus, OrderProduct}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [
    :payment_method,
    :track_address,
    :telephone,
    :status,
    :delivery_status_id,
    :user_id
  ]
  schema "orders" do
    field :payment_method, :integer
    field :track_address, :string
    field :telephone, :string
    field :status, :integer
    belongs_to :user, User

    has_many :order_products, OrderProduct
    has_one :delivery_status, DeliveryStatus
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
