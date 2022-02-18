defmodule Weather.Worker do
  alias Weather.HttpRequest
  use GenServer

  def start_link(opts) do
    server = Keyword.fetch!(opts, :name)
    GenServer.start_link(__MODULE__, server, opts)
  end

  ### client api

  def fetch_current_weather(rec, city_id) do
    GenServer.call(Weather.Worker, {:fetch, {city_id, rec}})
  end

  ### server side
  @impl true
  def init(_opts) do
    {:ok, %{tasks: %{}}}
  end

  # We invoke a task from the GenServer to fetch weather
  @impl true
  def handle_call({:fetch, {city_id, rec}}, _from, state) do
    task =
      Task.Supervisor.async_nolink(Weather.TaskSupervisor, fn ->
        HttpRequest.get_current_weather(city_id)
      end)

    state = put_in(state.tasks[task.ref], {city_id, rec})
    {:reply, :ok, state}
  end

  # If fetch info success
  @impl true
  def handle_info({ref, result}, state) do
    # The task succeed, we cancel the monitoring and discard the DOWN message
    Process.demonitor(ref, [:flush])
    {{city_id, rec}, state} = pop_in(state.tasks[ref])
    IO.puts("Get #{inspect(result)} for city #{inspect(city_id)}, #{inspect(rec)}")
    send(rec, result)
    {:noreply, state}
  end

  # If fetch fails
  @impl true
  def handle_info({:DOWN, ref, _, _, reason}, state) do
    {{city_id, rec}, state} = pop_in(state.tasks[ref])
    IO.puts("URL #{inspect(city_id)} failed with reason #{inspect(reason)},#{inspect(rec)}")
    send(ref, {:error, "fail"})
    {:noreply, state}
  end
end
