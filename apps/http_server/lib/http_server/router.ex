defmodule HttpServer.Router do
  use Plug.Router

  if Mix.env() == :dev do
    use Plug.Debugger
    plug(Plug.Logger)
  end

  use Plug.ErrorHandler

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["application/json"],
    json_decoder: Jason
  )

  plug(:match)
  plug(:dispatch)

  options "/api" do
    send_resp(conn,200,"cors")
  end

  get "/hello" do
    send_resp(conn, 200, "world")
  end

  forward("/api",
    to: Absinthe.Plug,
    init_opts: [schema: Graphql.Schema]
  )

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [schema: Graphql.Schema]
  )

  match _ do
    send_resp(conn, 404, "oops")
  end

  defp handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    send_resp(conn, conn.status, "Something went wrong")
  end
end
