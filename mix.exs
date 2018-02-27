defmodule QuantumDemo.MixProject do
  use Mix.Project

  def project do
    [
      app: :quantum_demo,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {QuantumDemo.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:distillery, "~> 1.5", runtime: false},
      {:libcluster, "~> 2.3"},
      {:swarm, "~> 3.3.0"},
      {:gen_stage, "~> 0.13.1"},
      {:quantum, "~> 2.2"},
      {:logger_file_backend, github: "onkel-dirtus/logger_file_backend"},
    ]
  end
end
