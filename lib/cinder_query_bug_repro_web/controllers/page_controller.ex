defmodule CinderQueryBugReproWeb.PageController do
  use CinderQueryBugReproWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
