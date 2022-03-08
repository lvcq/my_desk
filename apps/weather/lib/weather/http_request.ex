defmodule Weather.HttpRequest do
  require Logger
  use Tesla

  plug(Tesla.Middleware.JSON)

  def get_current_weather(city_id) do
    {url, appid, appsecret} = get_env_config()
    request_path = "#{url}?appid=#{appid}&appsecret=#{appsecret}&cityid=#{city_id}&version=v6"
    Logger.info("request weather info: #{request_path}")

    case get(request_path) do
      {:ok, response} -> {:ok, response.body}
      _ -> {:error}
    end
  end

  defp get_env_config() do
    url = Application.fetch_env!(:weather, :url)
    appid = Application.fetch_env!(:weather, :appid)
    appsecret = Application.fetch_env!(:weather, :appsecret)
    {url, appid, appsecret}
  end
end
