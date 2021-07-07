defmodule EfoodApi.Users.Create do
  alias EfoodApi.{User, Repo, Users.Queries}
  alias Ecto.Multi

  def call(params) do
    Multi.new()
    |> Multi.insert(:create_user, User.changeset(params))
    |> Queries.preload_data(:create_user)
    |> run_transaction
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{preload_user_data: user}} -> {:ok, user}
    end
  end
end
