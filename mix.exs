defmodule Moxtest.MixProject do
  use Mix.Project

  def project do
    [
      app: :moxtest,
      version: "0.1.0",
      elixir: "~> 1.6-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Moxtest.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 1.1.2"},
      {:plug, "~> 1.4"},
      #and an HTTP library as well.
      {:httpoison, "~> 0.13"},
      #mocking library
      {:mox, "~> 0.3", only: :test}
    ]
  end
end
