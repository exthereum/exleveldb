defmodule Exleveldb.Mixfile do
  use Mix.Project

  def project do
    [app: :exleveldb,
     version: "0.8.0",
     elixir: "~> 1.3.0",
     name: "Exleveldb",
     source_url: "https://github.com/skovsgaard/exleveldb",
     homepage_url: "https://hex.pm/packages/exleveldb",
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:eleveldb]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:eleveldb, github: "basho/eleveldb", tag: "2.2.19"},
      {:cuttlefish, github: "skovsgaard/cuttlefish", branch: "develop", override: true},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:dialyxir, "~> 0.3.5", only: :dev}
    ]
  end

  defp description do
    """
    Exleveldb is a thin wrapper around Basho's eleveldb (github.com/basho/eleveldb).

    At the moment, Exleveldb exposes functions for the following features of LevelDB:

    - Opening a new datastore.

    - Closing an open datastore.

    - Getting values by key.

    - Storing individual key-value pairs.

    - Deleting stored key-value pairs.

    - Checking if a datastore is empty.

    - Folding over key-value pairs in the datastore.

    - Folding over keys in the datastore.

    - Batch writes to the datastore (put or delete).

    - Destroying a datastore.

    Additionally, the option of streaming key-value pairs or keys from the datastore has been added in v0.5.0.

    Note: Because eleveldb is not a hex package, you will need to include it as a separate dependency in your project (See `README.md`).
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE", "test"],
      authors: ["Jonas Skovsgaard Christensen", "Oscar Felipe Toro"],
      licenses: ["Apache v2.0"],
      links: %{"Github" => "https://github.com/skovsgaard/exleveldb.git"},
      maintainers: ["Jonas Skovsgaard Christensen"]
    ]
  end
end
