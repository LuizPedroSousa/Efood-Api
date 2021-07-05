defmodule EfoodApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      EfoodApi.Repo,
      # Start the Telemetry supervisor
      EfoodApiWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: EfoodApi.PubSub},
      # Start the Endpoint (http/https)
      EfoodApiWeb.Endpoint
      # Start a worker by calling: EfoodApi.Worker.start_link(arg)
      # {EfoodApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EfoodApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EfoodApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
