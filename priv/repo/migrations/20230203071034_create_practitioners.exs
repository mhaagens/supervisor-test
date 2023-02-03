defmodule DemoApp.Repo.Migrations.CreatePractitioners do
  use Ecto.Migration

  def change do
    create table(:practitioners, primary_key: false) do
      add(:id, :uuid, primary_key: true, null: false)
      add(:name, :string)
      timestamps()
    end
  end
end
