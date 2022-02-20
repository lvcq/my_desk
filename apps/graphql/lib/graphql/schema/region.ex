defmodule Graphql.Schema.Region do
  use Absinthe.Schema.Notation

  object :region do
    field(:city_id, :string)
    field(:cityen, :string)
    field(:cityzh, :string)
    field(:provinceen, :string)
    field(:provincezh, :string)
    field(:countryen, :string)
    field(:countryzh, :string)
    field(:leaderen, :string)
    field(:leaderzh, :string)
    field(:lat, :string)
    field(:lon, :string)
  end
end
