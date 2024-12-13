defmodule ElixirProject do
  use Application

  def start(_type, _args) do
    main()

    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = "Caleb"
    status = Enum.random([:gold, :silver, :bronse])

    if status === :gold do
      IO.puts("Welcome to the fancy lounge, #{name}")
    else
      IO.puts("Get lost, #{name}")
    end
  end
end
