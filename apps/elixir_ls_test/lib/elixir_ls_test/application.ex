defmodule ElixirLsTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixirLsTest.Repo,
      {DNSCluster, query: Application.get_env(:elixir_ls_test, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixirLsTest.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ElixirLsTest.Finch}
      # Start a worker by calling: ElixirLsTest.Worker.start_link(arg)
      # {ElixirLsTest.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: ElixirLsTest.Supervisor)
  end
end
