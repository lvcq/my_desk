defmodule Model.Repo do
  use Ecto.Repo,
    opt_app: :model,
    adapter: Ecto.Adapters.Postgres

end
