defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

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
    gold_membership = %Membership{
      type: :gold,
      price: 50,
    }
    silver_membership = %Membership{
      type: :silver,
      price: 25,
    }
    bronze_membership = %Membership{
      type: :bronze,
      price: 10,
    }
    no_membership = %Membership{
      type: :none,
      price: 0,
    }

    users = [
      %User{name: "Caleb", membership: gold_membership},
      %User{name: "Jacob", membership: silver_membership},
      %User{name: "Alice", membership: bronze_membership},
      %User{name: "Arthur", membership: no_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} has a #{membership.type} membership, that cost #{membership.price}")
    end)
  end
end
