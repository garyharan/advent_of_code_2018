defmodule Day14.MixProject do
  use Mix.Project

  def project do
    [
      app: :day14,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
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
      {:eflame, "~> 1.0"},
      {:binary, "~> 0.0.5"}
    ]
  end
end
