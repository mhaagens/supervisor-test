defmodule DemoApp.Practitioner do
  use Ecto.Schema

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "practitioners" do
    field :name, :string
    timestamps()
  end
end
