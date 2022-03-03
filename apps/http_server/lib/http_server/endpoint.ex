defmodule HttpServer.Endpoint do
  use Plug.Builder

  plug Plug.Head
  plug HttpServer.CORS
  plug HttpServer.Router
end
