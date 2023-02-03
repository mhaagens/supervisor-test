defmodule DemoApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @registry :availability_registry

  @impl true
  def start(_type, _args) do
    children = [
      DemoApp.Repo,
      {DemoApp.Availability.Supervisor, []},
      {Registry, [keys: :unique, name: @registry]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: __MODULE__]
    Supervisor.start_link(children, opts)
  end
end
