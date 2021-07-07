defmodule EfoodApi.Users.Queries do
  alias Ecto.Multi
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
