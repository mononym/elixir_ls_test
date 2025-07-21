defmodule ElixirLsTest.Repo do
  use Ecto.Repo,
    otp_app: :elixir_ls_test,
    adapter: Ecto.Adapters.Postgres
end
