defmodule EfoodApi.Users.Show do
  alias Ecto.Multi
  alias EfoodApi.{Repo, User, Users.Queries, Utils.UUID}

  def call(id) do
    case UUID.validate_id(id) do
      :ok ->
        Multi.new()
        |> Multi.run(:get_user, fn repo, _ ->
          get_user(repo, id)
          |> handle_user()
        end)
        |> Queries.preload_data(:get_user)
        |> run_transaction

      error ->
        error
    end
  end

  defp get_user(repo, id) do
    Queries.get_with(%{"id" => id})
    |> repo.one()
  end

  defp handle_user(user) do
    case user do
      nil -> {:error, "User not found"}
      %User{} = user -> {:ok, user}
    end
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{preload_user_data: user}} -> {:ok, user}
    end
  end
end
