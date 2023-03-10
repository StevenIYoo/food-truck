defmodule FoodTruck.MixProject do
  use Mix.Project

  def project do
    [
      app: :food_truck,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      docs: docs()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {FoodTruck.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies doc generation.
  defp docs do
    [
      main: "readme",
      source_url: "https://github.com/StevenIYoo/food-truck",
      homepage_url: "https://food-truck.gigalixirapp.com/api/food-trucks/random",
      assets: "documentation",
      extras: [
        "README.md",
        "documentation/architecture.md"
      ],
      groups_for_functions: [
        Guards: &(&1[:guard] === true)
      ],
      formatters: ["html"]
    ]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6.15"},
      {:phoenix_live_dashboard, "~> 0.6"},
      {:esbuild, "~> 0.4", runtime: Mix.env() == :dev},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:nimble_csv, "~> 1.2.0"},
      {:ex_doc, "~> 0.28", runtime: false},
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get"],
      "assets.deploy": ["esbuild default --minify", "phx.digest"]
    ]
  end
end
