defmodule Arkvatar.MixProject do
  use Mix.Project

  def project do
    [
      app: :arkvatar,
      version: "1.0.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Elixir Arkvatar Client",
      source_url: "https://github.com/thegoldenhorde/arkvatar-ex",
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
      {:tesla, "~> 1.2.1"},
      {:hackney, "~> 1.14.0"},
      {:jason, ">= 1.0.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "A simple Elixir API client for interacting with Arkvatar."
  end

  defp package() do
    [
      maintainers: ["Jolan Beer", "TheGoldenHorde"],
      files: ["config", "lib", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/thegoldenhorde/arkvatar-ex"}
    ]
  end
end
