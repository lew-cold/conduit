defmodule Conduit.Mixfile do
  use Mix.Project

  def project do
    [
      app: :conduit,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      aliases: aliases(),
      deps: deps(),
    ]
  end

  def application do
    [
      mod: {Conduit.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :eventstore,
      ],
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.4"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:commanded, "~> 0.15"},
      {:commanded_eventstore_adapter, "~> 0.3"},
      {:ex_machina, "~> 2.0", only: :test},
      {:uuid, "~> 1.1"},
      {:exconstructor, "~> 1.1"},
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false},
      {:commanded_ecto_projections, "~> 0.6"},
      {:vex, "~> 0.6"},
      {:bcrypt_elixir, "~> 1.0"},
      {:comeonin, "~> 4.0"},
    ]
  end

  defp aliases do
    [
      "event_store_reset": ["event_store.drop", "event_store.create", "event_store.init"],
      "ecto.setup": ["ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.create", "ecto.setup"],
      "test": ["ecto.reset", "test"],
    ]
  end
end
