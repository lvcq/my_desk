defmodule HttpServer.CORS do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    origin = get_req_header(conn, "origin")
    conn
    |> put_resp_header("access-control-allow-origin", Enum.join(origin, ", "))
    |> put_resp_header("Access-Control-Allow-Methods", "GET, POST, DELETE, HEAD, OPTIONS")
    |> put_resp_header("Access-Control-Max-Age", "86400")
    |> put_resp_header("Access-Control-Allow-Headers", "X-PINGOTHER, Content-Type")
  end
end
