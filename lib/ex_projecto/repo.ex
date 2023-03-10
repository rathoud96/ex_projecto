defmodule ExProjecto.Repo do
  use Ecto.Repo,
    otp_app: :ex_projecto,
    adapter: Ecto.Adapters.Postgres
end
