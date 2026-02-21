# SPDX-License-Identifier: PMPL-1.0-or-later

defmodule PolyglotFormalisms.Comparison do
  @moduledoc """
  Comparison Kernel — PolyglotFormalisms Common Library (Elixir).

  This module implements the formal comparison operations specified in the 
  common library. It ensures that ordering and equality predicates 
  behave identically across all ecosystem languages.

  DESIGN MANDATE:
  - Adherence to formal mathematical properties (Transitivity, Antisymmetry).
  - Explicit documentation of relation definitions (e.g. `<=`).
  """

  @doc """
  LESS THAN: Returns true iff `a` is strictly less than `b`.

  ## Properties:
  - Irreflexive: less_than(a, a) == false
  - Transitive: less_than(a, b) && less_than(b, c) => less_than(a, c)
  """
  @spec less_than(number(), number()) :: boolean()
  def less_than(a, b), do: a < b

  @doc """
  EQUALITY: Returns true iff `a` and `b` are identical.

  ## Properties:
  - Reflexive: equal(a, a) == true
  - Symmetric: equal(a, b) == equal(b, a)
  """
  @spec equal(number(), number()) :: boolean()
  def equal(a, b), do: a == b

  @doc """
  LESS THAN OR EQUAL: Returns true iff `a < b` or `a == b`.

  ## Properties:
  - Antisymmetric: less_equal(a, b) && less_equal(b, a) => equal(a, b)
  """
  @spec less_equal(number(), number()) :: boolean()
  def less_equal(a, b), do: a <= b
end
