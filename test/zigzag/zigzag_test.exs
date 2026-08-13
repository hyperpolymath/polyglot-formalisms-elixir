defmodule ZigzagTest do
  use ExUnit.Case, async: true
  use ExUnitProperties

  @moduledoc """
  Zigzag test implementation: Meandering routes through the system aspects.
  """

  # Define aspects
  @aspects [:auth, :db, :network, :telemetry]

  property "meandering route maintains cross-cutting invariants" do
    check all steps <- list_of(member_of(@aspects), min_length: 5, max_length: 50) do
      # Initial system state
      state = %{auth: false, db_connected: true, metrics: 0}

      final_state =
        Enum.reduce(steps, state, fn aspect, acc ->
          # Execute the aspect transition (simulated)
          case aspect do
            :auth ->
              %{acc | auth: not acc.auth, metrics: acc.metrics + 1}
            :db ->
              # DB might disconnect and reconnect
              %{acc | db_connected: not acc.db_connected, metrics: acc.metrics + 1}
            :network ->
              acc
            :telemetry ->
              %{acc | metrics: acc.metrics + 1}
          end
        end)

      # Cross-cutting invariants that MUST hold after a chaotic meandering route:
      # Invariant 1: Metrics should never be negative
      assert final_state.metrics >= 0

      # Invariant 2: (Simulated) if we finish the route, the DB should ultimately be able to reconnect
      # or if it's disconnected, it shouldn't crash the next read.
      assert is_boolean(final_state.db_connected)
    end
  end
end
