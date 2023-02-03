defmodule DemoApp.Availability do
  use GenServer
  require Logger

  @registry :availability_registry
  @initial_state []

  def start_link(practitioner_id) do
    GenServer.start_link(__MODULE__, practitioner_id, name: via(practitioner_id))
  end

  def log_state(practitioner_id) do
    practitioner_id |> via() |> GenServer.call(:log_state)
  end

  def get_availability(practitioner_id) do
    practitioner_id |> via() |> GenServer.call(:get_availability)
  end

  def update_availability(practitioner_id) do
    practitioner_id |> via() |> GenServer.call(:update_availability)
  end

  def child_spec(practitioner_id) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [practitioner_id]},
      restart: :transient
    }
  end

  def stop(practitioner_id, stop_reason) do
    practitioner_id |> via() |> GenServer.stop(stop_reason)
  end

  @impl true
  def init(practitioner_id) do
    Logger.info("Starting availability for #{practitioner_id}")
    {:ok, @initial_state}
  end

  @impl true
  def handle_call(:log_state, _from, state) do
    {:reply, "State: #{inspect(state)}", state}
  end

  @impl true
  def handle_call(:get_availability, _from, state) do
    IO.inspect(state)
    {:reply, :get_availability, state}
  end

  @impl true
  def handle_call(:update_availability, _from, state) do
    new_state = state ++ [%{date: DateTime.utc_now(), is_available: Enum.random([true, false]) }]
    {:reply, :updated_availability, new_state}
  end

  defp via(practitioner_id), do: {:via, Registry, {@registry, practitioner_id}}
end
