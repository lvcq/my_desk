defmodule Weather.WorkerTest do
  use ExUnit.Case

  setup context do
    _ = start_supervised!({Weather.Worker, name: context.test})
    %{worker: context.test}
  end

  test "first work", %{worker: worker} do
    Weather.Worker.fetch_current_weather(worker, '100011')
  end
end
