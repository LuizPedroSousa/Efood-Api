defmodule EfoodApi.Users.Queries do
  import Ecto.Query
  alias Ecto.Multi
  alias EfoodApi.{User}

  def get_with(query) do
    base_query()
    |> build_query(query)
  end

  defp base_query do
    from(u in User,
      order_by: [desc: u.inserted_at]
    )
  end

  defp build_query(query, criteria) do
    Enum.reduce(criteria, query, &compose_query/2)
  end

  defp compose_query({"id", id}, query) do
    where(query, [u], u.id == ^id)
  end

  # case not match with any compose_query return base_query
  defp compose_query(_unsupported_param, query) do
    query
  end

  def preload_data(multi, key) do
    multi
    |> Multi.run(:preload_user_data, fn repo, map ->
      {:ok,
       repo.preload(map[key], [
         :orders
       ])}
    end)
  end
end
