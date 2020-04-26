defmodule ImageSlideShowWeb.PageController do
  use ImageSlideShowWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
