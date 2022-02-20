defmodule Graphql.Resolvers.Region do
  @type region_arg :: %{parent_id: :string}

  @doc """
  Query sub regions by id,
  if parent_id is nil, return all province

  """
  def query_regions(_parent, %{name: name}, _resolution) do
    task =
      Task.async(fn ->
        Model.Handler.City.query_city_by_name(name)
      end)

    Task.await(task)
  end
end
