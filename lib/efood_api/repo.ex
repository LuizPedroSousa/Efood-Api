defmodule EfoodApi.Repo do
  use Ecto.Repo,
    otp_app: :efood_api,
    adapter: Ecto.Adapters.Postgres
end
