defmodule EfoodApiWeb.UserView do
  use EfoodApiWeb, :view
  alias EfoodApi.{User}

  def render("create_user.json", %{user: user}) do
    %{
      ok: "User created with successfully",
      user: get_user(user)
    }
  end

  defp get_user(%User{
         id: id,
         name: name,
         nickname: nickname,
         username: username,
         inserted_at: inserted_at,
         updated_at: updated_at
       }) do
    %{
      id: id,
      name: name,
      nickname: nickname,
      username: username,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end
