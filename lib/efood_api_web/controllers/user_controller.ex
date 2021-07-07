defmodule EfoodApiWeb.UserController do
  use EfoodApiWeb, :controller
  alias EfoodApi.{User}

  action_fallback EfoodApiWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- EfoodApi.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create_user.json", user: user)
    end
  end
end
