defmodule Graphql.Resolvers.Weather do
  def current_weather(_parent, %{city_id: city_id}, _resolution) do
    task =
      Task.async(fn ->
        Weather.Worker.fetch_current_weather(self(), city_id)

        receive do
          {:ok, value} ->
            {:ok, key_map(value)}

          _ ->
            {:error, "fetch current weather fail"}
            # code
        end
      end)

    Task.await(task)
  end

  # Mapping weather map's key to atom
  # cityid	String	城市ID
  # date	String	当前日期
  # week	String	当前星期
  # update_time	String	气象台更新时间
  # city	String	城市名称
  # cityEn	String	城市英文名称
  # country	String	国家名称
  # countryEn	String	国家英文名称
  # wea	String	天气情况
  # wea_img	String	天气对应图标	固定9种类型(您也可以根据wea字段自己处理): xue、lei、shachen、wu、bingbao、yun、yu、yin、qing
  # tem	String	实时温度
  # tem1	String	高温
  # tem2	String	低温
  # win	String	风向
  # win_speed	String	风力等级
  # win_meter	String	风速
  # humidity	String	湿度
  # visibility	String	能见度
  # pressure	String	气压hPa
  # air	String	空气质量
  # air_level	String	空气质量等级
  # air_tips	String	空气质量描述
  defp key_map(value) do
    %{
      :cityid => Map.get(value, "cityid"),
      :date => Map.get(value, "date"),
      :week => Map.get(value, "week"),
      :observatory_update_time => Map.get(value, "update_time"),
      :city => Map.get(value, "city"),
      :cityEn => Map.get(value, "cityEn"),
      :country => Map.get(value, "country"),
      :countryEn => Map.get(value, "countryEn"),
      :wea => Map.get(value, "wea"),
      :wea_img => Map.get(value, "wea_img"),
      :tem => Map.get(value, "tem"),
      :tem1 => Map.get(value, "tem1"),
      :tem2 => Map.get(value, "tem2"),
      :win => Map.get(value, "win"),
      :win_speed => Map.get(value, "win_speed"),
      :win_meter => Map.get(value, "win_meter"),
      :humidity => Map.get(value, "humidity"),
      :visibility => Map.get(value, "visibility"),
      :pressure => Map.get(value, "pressure"),
      :air => Map.get(value, "air"),
      :air_level => Map.get(value, "air_level"),
      :air_tips => Map.get(value, "air_tips"),
      :update_time => DateTime.utc_now() |> DateTime.to_unix(:millisecond)
    }
  end
end
