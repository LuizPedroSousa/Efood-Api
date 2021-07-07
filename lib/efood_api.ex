defmodule EfoodApi do
  # Users
  alias EfoodApi.Users.Create, as: UserCreate

  # Users
  defdelegate create_user(params), to: UserCreate, as: :call
end
