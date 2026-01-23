# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.MixProject do
  use Mix.Project

  def project do
    [
      app: :polyglot_formalisms,
      version: "0.2.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/hyperpolymath/polyglot_formalisms_elixir",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Elixir implementation of the PolyglotFormalisms Common Library specification.
    Provides fundamental arithmetic, comparison, and logical operations with
    proven semantic equivalence across multiple programming languages.
    """
  end

  defp package do
    [
      licenses: ["PMPL-1.0-or-later"],
      links: %{
        "GitHub" => "https://github.com/hyperpolymath/polyglot_formalisms_elixir",
        "Specification" => "https://github.com/hyperpolymath/PolyglotFormalisms.jl"
      }
    ]
  end
end
