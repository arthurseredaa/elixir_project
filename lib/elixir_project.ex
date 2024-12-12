defmodule ElixirProject do
  use Application

  def start(_type, _args) do
    IO.puts(ElixirProject.hello_world());

    Supervisor.start_link([], strategy: :one_for_one)
  end

  def hello_world do
    "Hello, world!"
  end
end
