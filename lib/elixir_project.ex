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
    user_guess = IO.gets("Guess the number between 0 and 10: ") |> String.trim() |> String.to_integer()

    if (user_guess == correct) do
      IO.puts("You got it!🎉")
    else
      IO.puts("Correct answer is #{correct}\nTry next time🫣")
    end
  end
end
