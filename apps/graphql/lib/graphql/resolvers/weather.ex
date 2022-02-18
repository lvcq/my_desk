defmodule Graphql.Resolvers.Weather do
  def current_weather(_parent, %{city_id: city_id}, _resolution) do
    task = Task.async(fn ->
      Weather.Worker.fetch_current_weather(self(),city_id)
      receive do
        {:ok, value} -> {:ok, key_map(value)}
        _ -> {:error,"fetch current weather fail"}
          # code
      end
    end)
    Task.await(task)
  end

 # Mapping weather map's key to atom
  defp key_map(value)do
    %{
      :cityid => Map.get(value,"cityid"),
      :city => Map.get(value,"city"),
      :wea => Map.get(value,"wea"),
      :wea_img => Map.get(value,"wea_img"),
      :tem => Map.get(value,"tem"),
      :tem_day => Map.get(value,"tem_day"),
      :tem_night => Map.get(value,"tem_night"),
      :win => Map.get(value, "win"),
      :win_speed => Map.get(value,"win_speed"),
      :win_meter => Map.get(value,"win_meter"),
      :air => Map.get(value,"air"),
      :update_time => DateTime.utc_now() |> DateTime.to_unix(:millisecond)
    }
  end
end
