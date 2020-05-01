# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :image_slide_show, ImageSlideShowWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U/cQn5Y5yHrg3eQ5KnKyrhDAZCJhKLw23mDNIaByHXI1MLYJFu1nnDHkXNwPDwvy",
  render_errors: [view: ImageSlideShowWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ImageSlideShow.PubSub,
  live_view: [signing_salt: "xYENC+vkd0B9I2Mi5qiNMiFgYrELbVWh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
