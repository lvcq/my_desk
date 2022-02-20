defmodule Graphql.Schema do
  use Absinthe.Schema
  import_types(Graphql.Schema.Weather)
  import_types(Graphql.Schema.Region)

  alias Graphql.Resolvers

  query do
    @desc "get current weather"
    field :current_weather, :weather do
      arg(:city_id, non_null(:string))
      resolve(&Resolvers.Weather.current_weather/3)
    end

    field :regions, list_of(:region) do
      arg(:name, :string, default_value: "", description: "city name")
      resolve(&Resolvers.Region.query_regions/3)
    end
  end
end
