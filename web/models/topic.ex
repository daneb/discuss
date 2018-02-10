defmodule Discuss.Topic do
  use Discuss.Web, :model

  # Model Schema (how it relates to our db)
  # Changeset (aid with validation)
  # We need to tell Phoenix whats inside PostGres

  schema "topics" do
    field :title, :string
  end

  # One of the most confusing parts
  # Struct - our record in our DB
  # Params - what we want to update the record with

  # Cast produces a changeset
  # '\\' - defaults to an empty map
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end

end