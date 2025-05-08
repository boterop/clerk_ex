defmodule Clerk.MixProject do
  use Mix.Project

  @version "0.1.0"
  @name "Clerk Ex"
  @github "https://github.com/boterop/clerk_ex"

  def project do
    [
      app: :clerk_ex,
      name: @name,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: @github,
      docs: docs(),
      dialyzer: [
        plt_add_apps: [:clerk_ex, :ex_unit, :jason],
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.14"},
      {:jason, "~> 1.4"},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.18.5", only: :test},
      {:ex_doc, "~> 0.37.3", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "CHANGELOG.md"]
    ]
  end

  defp description do
    """
        An Elixir library for interacting with the Clerk API
    """
  end

  defp package do
    [
      description: description(),
      files: ["lib", "mix.exs", "README*", "LICENSE"],
      licenses: ["MIT"],
      links: %{"GitHub" => @github, "Changelog" => "#{@github}/blob/main/CHANGELOG.md"}
    ]
  end
end
