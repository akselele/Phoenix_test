# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :a_demo,
  ecto_repos: [ADemo.Repo]

config :a_demo_web,
  ecto_repos: [ADemo.Repo],
  generators: [context_app: :a_demo]

# Configures the endpoint
config :a_demo_web, ADemoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jKf8u4JyMfyYKASIcCjNHGlk3TpGRSTU7d9LTBSocjKdn7IsD4e3Egfgxs9fjBxi",
  render_errors: [view: ADemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ADemoWeb.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "K+Cx+zKO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
