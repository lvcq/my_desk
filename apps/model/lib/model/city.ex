defmodule Model.City do
  use Ecto.Schema

  @primary_key {:id, :string, []}

  schema "city" do
    field(:cityid, :string, source: :id)
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
