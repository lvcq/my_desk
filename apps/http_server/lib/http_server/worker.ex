defmodule HttpServer.Worker do
  def start_link(_opts) do
    Plug.Cowboy.http(HttpServer.Router, [], port: 4040)
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end
end
