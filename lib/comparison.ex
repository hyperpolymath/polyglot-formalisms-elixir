# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.Comparison do
  @moduledoc """
  Comparison operations from the PolyglotFormalisms Common Library specification.

  Elixir implementation matching aggregate-library behavioral semantics.
  """

  @doc """
  Checks if the first value is strictly less than the second value.

  ## Behavioral Semantics
  - Parameters: a (first value), b (second value)
  - Returns: true if a < b, otherwise false

  ## Mathematical Properties
  - Transitivity: less_than(a, b) && less_than(b, c) => less_than(a, c)
  - Irreflexivity: !less_than(a, a)
  - Asymmetry: less_than(a, b) => !less_than(b, a)

  ## Examples

      iex> PolyglotFormalisms.Comparison.less_than(2.0, 3.0)
      true

      iex> PolyglotFormalisms.Comparison.less_than(5.0, 5.0)
      false

      iex> PolyglotFormalisms.Comparison.less_than(10.0, 3.0)
      false

      iex> PolyglotFormalisms.Comparison.less_than(-5.0, 0.0)
      true

      iex> PolyglotFormalisms.Comparison.less_than(1.5, 2.5)
      true
  """
  @spec less_than(number(), number()) :: boolean()
  def less_than(a, b), do: a < b

  @doc """
  Checks if the first value is strictly greater than the second value.

  ## Behavioral Semantics
  - Parameters: a (first value), b (second value)
  - Returns: true if a > b, otherwise false

  ## Mathematical Properties
  - Transitivity: greater_than(a, b) && greater_than(b, c) => greater_than(a, c)
  - Irreflexivity: !greater_than(a, a)
  - Relation to less_than: greater_than(a, b) == less_than(b, a)

  ## Examples

      iex> PolyglotFormalisms.Comparison.greater_than(5.0, 3.0)
      true

      iex> PolyglotFormalisms.Comparison.greater_than(2.0, 2.0)
      false

      iex> PolyglotFormalisms.Comparison.greater_than(1.0, 10.0)
      false

      iex> PolyglotFormalisms.Comparison.greater_than(0.0, -5.0)
      true

      iex> PolyglotFormalisms.Comparison.greater_than(3.5, 1.2)
      true
  """
  @spec greater_than(number(), number()) :: boolean()
  def greater_than(a, b), do: a > b

  @doc """
  Checks if two values are equal.

  ## Behavioral Semantics
  - Parameters: a (first value), b (second value)
  - Returns: true if a == b, otherwise false

  ## Mathematical Properties
  - Reflexivity: equal(a, a)
  - Symmetry: equal(a, b) => equal(b, a)
  - Transitivity: equal(a, b) && equal(b, c) => equal(a, c)

  ## Examples

      iex> PolyglotFormalisms.Comparison.equal(5.0, 5.0)
      true

      iex> PolyglotFormalisms.Comparison.equal(3.0, 7.0)
      false

      iex> PolyglotFormalisms.Comparison.equal(0.0, 0.0)
      true

      iex> PolyglotFormalisms.Comparison.equal(2.5, 2.5)
      true
  """
  @spec equal(number(), number()) :: boolean()
  def equal(a, b), do: a == b

  @doc """
  Checks if two values are not equal.

  ## Behavioral Semantics
  - Parameters: a (first value), b (second value)
  - Returns: true if a != b, otherwise false

  ## Mathematical Properties
  - Negation of equal: not_equal(a, b) == !equal(a, b)
  - Symmetry: not_equal(a, b) => not_equal(b, a)

  ## Examples

      iex> PolyglotFormalisms.Comparison.not_equal(5.0, 3.0)
      true

      iex> PolyglotFormalisms.Comparison.not_equal(7.0, 7.0)
      false

      iex> PolyglotFormalisms.Comparison.not_equal(0.0, 1.0)
      true

      iex> PolyglotFormalisms.Comparison.not_equal(-5.0, -5.0)
      false

      iex> PolyglotFormalisms.Comparison.not_equal(2.5, 2.6)
      true
  """
  @spec not_equal(number(), number()) :: boolean()
  def not_equal(a, b), do: a != b

  @doc """
  Checks if the first value is less than or equal to the second value.

  ## Behavioral Semantics
  - Parameters: a (first value), b (second value)
  - Returns: true if a <= b, otherwise false

  ## Mathematical Properties
  - Reflexivity: less_equal(a, a)
  - Transitivity: less_equal(a, b) && less_equal(b, c) => less_equal(a, c)
  - Antisymmetry: less_equal(a, b) && less_equal(b, a) => equal(a, b)
  - Relation to less_than: less_equal(a, b) == (less_than(a, b) || equal(a, b))

  ## Examples

      iex> PolyglotFormalisms.Comparison.less_equal(2.0, 3.0)
      true

      iex> PolyglotFormalisms.Comparison.less_equal(5.0, 5.0)
      true

      iex> PolyglotFormalisms.Comparison.less_equal(10.0, 3.0)
      false

      iex> PolyglotFormalisms.Comparison.less_equal(-5.0, 0.0)
      true

      iex> PolyglotFormalisms.Comparison.less_equal(1.5, 1.5)
      true
  """
  @spec less_equal(number(), number()) :: boolean()
  def less_equal(a, b), do: a <= b

  @doc """
  Checks if the first value is greater than or equal to the second value.

  ## Behavioral Semantics
  - Parameters: a (first value), b (second value)
  - Returns: true if a >= b, otherwise false

  ## Mathematical Properties
  - Reflexivity: greater_equal(a, a)
  - Transitivity: greater_equal(a, b) && greater_equal(b, c) => greater_equal(a, c)
  - Antisymmetry: greater_equal(a, b) && greater_equal(b, a) => equal(a, b)
  - Relation to less_equal: greater_equal(a, b) == less_equal(b, a)

  ## Examples

      iex> PolyglotFormalisms.Comparison.greater_equal(5.0, 3.0)
      true

      iex> PolyglotFormalisms.Comparison.greater_equal(7.0, 7.0)
      true

      iex> PolyglotFormalisms.Comparison.greater_equal(2.0, 10.0)
      false

      iex> PolyglotFormalisms.Comparison.greater_equal(0.0, -5.0)
      true

      iex> PolyglotFormalisms.Comparison.greater_equal(3.5, 3.5)
      true
  """
  @spec greater_equal(number(), number()) :: boolean()
  def greater_equal(a, b), do: a >= b
end
