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

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- EfoodApi.show_user(id) do
      conn
      |> put_status(:created)
      |> render("show_user.json", user: user)
    end
  end
end
