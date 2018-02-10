defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    # Create a new table called topics
    create table(:topics) do
      add :title, :string
    end
  end
end
