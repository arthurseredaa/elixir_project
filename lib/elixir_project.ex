defmodule ElixirProject do
  use Application

  def start(_type, _args) do
    main()

    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = "Caleb"
    status = Enum.random([:gold, :silver, :bronse])

    case status do
      :gold -> IO.puts("Welcome to the fancy lounge, #{name}")
      _ -> IO.puts("Get out bruh")
    end
  end
end
