defmodule ElixirProject do
  use Application

  @moduledoc """
    Module for studying
  """
  def start(_type, _args) do
    main()

    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    correct = Enum.random(0..10)
    user_guess = IO.gets("Guess the number between 0 and 10: ") |> String.trim() |> Integer.parse()

    case user_guess do
      {result, _} ->
        if result === correct do
          IO.puts("You win!")
        else
          IO.puts("You lose! Guessed number is: #{correct}")
        end

      :error -> IO.puts("Incorrect answer format. Please, use only numbers")
    end
  end
end
