defmodule Graphql.Schema.Weather do
  use Absinthe.Schema.Notation

  object :weather do
    field(:update_time, :integer)
    field(:cityid, :string)
    field(:city, :string)
    field(:wea, :string)
    field(:wea_img, :string)
    field(:tem, :string)
    field(:tem_day, :string)
    field(:tem_night, :string)
    field(:win, :string)
    field(:win_speed, :string)
    field(:win_meter, :string)
    field(:air, :string)
  end
end
