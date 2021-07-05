# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :efood_api,
  ecto_repos: [EfoodApi.Repo]

# Configures the endpoint
config :efood_api, EfoodApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WiNZI5Pdt2ukMO2owOd2vnn8x1hxALI+J/SutchlvIGQRPyGwA+/VwF/VVvJxjZb",
  render_errors: [view: EfoodApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: EfoodApi.PubSub,
  live_view: [signing_salt: "a2AnpUJP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
