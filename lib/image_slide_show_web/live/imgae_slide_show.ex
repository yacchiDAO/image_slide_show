defmodule ImageSlideShowWeb.ImageSlideShow do
  use Phoenix.LiveView

  def render(assigns), do: ImageSlideShowWeb.LiveView.render("submit.html", assigns)

  def mount( _params, _session, socket ) do
      { :ok, assign( socket, query: "", message: "[Init]", loading: false, results: [] ) }
  end

  def handle_event( "change", %{ "query" => query }, socket ) do
      send( self(), { :submit, query } )
      { :noreply, assign( socket, message: "") }
  end

  def handle_event( "submit", %{ "query" => query }, socket ) do
      send( self(), { :submit, query } )
      { :noreply, assign( socket, message: "[Searching...]", loading: true) }
  end

  def handle_info( { :submit, query }, socket ) do
    results = Json.get( "https://qiita.com", "/api/v2/items?query=#{ query }" )
    { :noreply, assign( socket, message: "[Complete!!]", results: results ) }
  end
end
