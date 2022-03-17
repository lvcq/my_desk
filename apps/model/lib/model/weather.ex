defmodule Model.Weather do
  use Ecto.Schema

  schema "weather" do
    field(:cityid, :string)
    field(:date, :string)
    field(:week, :string)
    field(:observatory_update_time, :string)
    field(:city, :string)
    field(:cityEn, :string)
    field(:country, :string)
    field(:countryEn, :string)
    field(:wea, :string)
    field(:wea_img, :string)
    field(:tem, :string)
    field(:tem1, :string)
    field(:tem2, :string)
    field(:win, :string)
    field(:win_speed, :string)
    field(:win_meter, :string)
    field(:humidity, :string)
    field(:visibility, :string)
    field(:pressure, :string)
    field(:air, :string)
    field(:air_level, :string)
    field(:air_tips, :string)
    timestamps([:autogenerate])
  end
end
