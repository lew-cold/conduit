defmodule Conduit.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the Ecto repository
      supervisor(Conduit.Repo, []),
      # Start the endpoint when the application starts
      supervisor(ConduitWeb.Endpoint, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Conduit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ConduitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
