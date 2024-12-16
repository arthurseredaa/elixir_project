defmodule ElixirProject do
  use Application

  @moduledoc """
    Module for studying
  """
  def start(_type, _args) do
    main()

    Supervisor.start_link([], strategy: :one_for_one)
  end

  def get_numbers_from_user do
    IO.puts("Write numbers separated by space.")
    input_data = IO.gets("") |> String.trim()
    String.split(input_data, " ") |> Enum.map(&String.to_integer/1)
  end

  def get_sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)

    { sum, average }
  end

  def main do
    numbers = get_numbers_from_user()
    {sum, average} = get_sum_and_average(numbers)

    IO.puts("Sum: #{sum}, average: #{average}")
    IO.inspect(numbers)
  end
end
