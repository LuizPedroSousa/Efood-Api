defmodule EfoodApiWeb.Router do
  use EfoodApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EfoodApiWeb do
    pipe_through :api
  end

  # Users
  scope "/api/users", EfoodApiWeb do
    pipe_through :api
    post "/create", UserController, :create
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: EfoodApiWeb.Telemetry
    end
  end
end
