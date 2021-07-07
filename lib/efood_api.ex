defmodule EfoodApi do
  # Users
  alias EfoodApi.Users.Create, as: UserCreate
  alias EfoodApi.Users.Show, as: UserShow

  # Users
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate show_user(id), to: UserShow, as: :call
end
