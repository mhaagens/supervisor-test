import Config

config :demo_app, DemoApp.Repo,
  database: "postgres",
  username: "postgres",
  password: "example",
  hostname: "localhost"

config :demo_app,
  ecto_repos: [DemoApp.Repo]
