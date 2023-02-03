defmodule DemoApp.Availability.Supervisor do
  use DynamicSupervisor

  alias DemoApp.Availability

  def start_link(_arg) do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def start_child(practitioner_id) do
    child_spec = {Availability, practitioner_id}

    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end

  @impl true
  def init(_arg) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end
