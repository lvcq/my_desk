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
    query = from(record in Model.Weather, where: [cityid: ^cityid])

    Ecto.Multi.new()
    |> Ecto.Multi.run(:current_weather, fn repo, _changes ->
      {:ok, repo.get(query, 1) || %Weather{}}
    end)
    |>Ecto.Multi.insert_or_update(:current_weather,fn %{current_weather: current_weather}->
      Ecto.Changeset.change(current_weather,record)
    end)
    |>Model.Repo.transaction()
  end
end
