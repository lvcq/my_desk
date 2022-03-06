# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :model, Model.Repo,
  database: "my_desk",
  username: "zly",
  password: "980108",
  hostname: "101.35.238.22"

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

config :tesla, adapter: Tesla.Adapter.Hackney

config :model,
  ecto_repos: [Model.Repo]

import_config "#{config_env()}.exs"
