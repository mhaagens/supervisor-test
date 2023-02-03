defmodule DemoApp do
  alias DemoApp.Repo
  alias DemoApp.Practitioner
  alias DemoApp.Availability
  alias DemoApp.Availability.Supervisor

  @registry :availability_registry

  def start_availability() do
    for practitioner <- Repo.all(Practitioner) do
      Supervisor.start_child(practitioner.id)
    end
  end

  def list_availabilities() do
    Registry.select(@registry, [{{:"$1", :_, :_}, [], [:"$1"]}])
  end

  def get_availability(practitioner_id) do
    Availability.get_availability(practitioner_id)
  end

  def update_availability(practitioner_id) do
    Availability.update_availability(practitioner_id)
  end
end
