defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def index(conn, _params) do
    # Discuss.Top
    topics = Repo.all(Topic)
    # Make topics available in the view
    render conn, "index.html", topics: topics
  end

    # No inheritance or class hierarchies
  # Alternatives:

  # 1. Import - take all functions out of this module
  #           and give them to another
  # 2. Alias - give me a shortcut to this other module
  # 2. Use - fancy setup between modules
  # https://elixir-lang.org/getting-started/alias-require-and-import.html

  # Underscore pre-pended to variable name means ignore it.

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
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => topic_id }) do
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)

    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn, %{ "id" => topic_id, "topic" => topic }) do
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)

    changeset = Repo.get(Topic, topic_id) |> Topic.changeset(topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic Updated")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "edit.html", changeset: changeset, topic: old_topic
    end

    render conn, "update.html", changeset: changeset, topic: topic
  end
end