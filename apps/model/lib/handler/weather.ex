defmodule Model.Handler.Weather do
  import Ecto.Query
  require Logger
  alias Model.Weather

  @doc """
  Query weather record by city id
  """
  @spec query_record_by_city_id(cityid: :string) :: nil
  def query_record_by_city_id(cityid) do
    try do
      from(record in Model.Weather, where: [cityid: ^cityid])
      |> Model.Repo.one()
    rescue
      err ->
        Logger.error(err)
        {:err, "query weather record error."}
    end
  end

  def save_weather_record(record) do
    cityid = Map.get(record,:cityid)
    Ecto.Multi.new()
    |> Ecto.Multi.run(:weather, fn repo, _changes ->
      {:ok, repo.get_by(Weather, [cityid: cityid]) || %Weather{}}
    end)
    |>Ecto.Multi.insert_or_update(:update,fn %{weather: current_weather}->
      IO.inspect(current_weather)
      Ecto.Changeset.change(current_weather,record)
    end)
    |>Model.Repo.transaction()
  end
end
