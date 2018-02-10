defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

    # No inheritance or class hierarchies
  # Alternatives:

  # 1. Import - take all functions out of this module
  #           and give them to another
  # 2. Alias - give me a shortcut to this other module
  # 2. Use - fancy setup between modules
  # https://elixir-lang.org/getting-started/alias-require-and-import.html

  def new(conn, _params) do
    # %Plug.Con = both request and response (Struct)
    changeset = Topic.changeset(%Topic{}, %{})

    # By default conn is passed to all views
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    # colors = %{ red: "green"} -> this is an atom
    # params = %{"topic" => "adsf" } -> string map (pattern match)
    # Pattern matching:
    # %{"topic" => string} = params

  end
end