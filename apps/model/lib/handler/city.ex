defmodule Model.Handler.City do
  import Ecto.Query
  require Logger

  @doc """
  Filter all province records,

  """
  def query_city_by_name(name \\ "", limit_count \\ 10) do
    try do
      filter = "%#{name}%"
      trans = fn val -> {:ok, val} end

      from(city in Model.City)
      |> where([city], like(field(city, :cityzh), ^filter))
      |> limit([city], ^limit_count)
      |> Model.Repo.all()
      |> Enum.map(&trans_city_model_to_map/1)
      |> trans.()
    rescue
      err ->
        Logger.error(err)
        {:error, "query city error."}
    end
  end

  defp trans_city_model_to_map(city) do
    %{
      :city_id => Map.get(city, :cityid, ""),
      :cityen => Map.get(city, :cityen, ""),
      :cityzh => Map.get(city, :cityzh, ""),
      :provinceen => Map.get(city, :provinceen, ""),
      :provincezh => Map.get(city, :provincezh, ""),
      :countryen => Map.get(city, :countryen, ""),
      :countryzh => Map.get(city, :countryzh, ""),
      :leaderen => Map.get(city, :leaderen, ""),
      :leaderzh => Map.get(city, :leaderzh, ""),
      :lat => Map.get(city, :lat, ""),
      :lon => Map.get(city, :lon, "")
    }
  end
end
