use Mix.Config

# Configure your database
config :a_demo, ADemo.Repo,
  username: "22pegQ4gKo",
  password: "pCxaP8RiQ0",
  database: "22pegQ4gKo",
  hostname: "remotemysql.com",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :a_demo_web, ADemoWeb.Endpoint,
  http: [port: 3306],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
