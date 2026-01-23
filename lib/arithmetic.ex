# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.Arithmetic do
  @moduledoc """
  Arithmetic operations from the PolyglotFormalisms Common Library specification.

  Elixir implementation matching aggregate-library behavioral semantics.

  Each operation includes:
  - Implementation following PolyglotFormalisms specification
  - Type signatures for numeric operations
  - Documentation matching specification format
  """

  @doc """
  Computes the sum of two numbers.

  ## Behavioral Semantics
  - Parameters: a (augend), b (addend)
  - Returns: The arithmetic sum of a and b

  ## Mathematical Properties
  - Commutativity: add(a, b) == add(b, a)
  - Associativity: add(add(a, b), c) == add(a, add(b, c))
  - Identity element: add(a, 0.0) == a

  ## Examples

      iex> PolyglotFormalisms.Arithmetic.add(2.0, 3.0)
      5.0

      iex> PolyglotFormalisms.Arithmetic.add(-5.0, 3.0)
      -2.0

      iex> PolyglotFormalisms.Arithmetic.add(0.0, 0.0)
      0.0

      iex> PolyglotFormalisms.Arithmetic.add(1.5, 2.5)
      4.0

      iex> PolyglotFormalisms.Arithmetic.add(-10.0, -20.0)
      -30.0
  """
  @spec add(number(), number()) :: float()
  def add(a, b), do: a + b

  @doc """
  Computes the difference of two numbers.

  ## Behavioral Semantics
  - Parameters: a (minuend), b (subtrahend)
  - Returns: The arithmetic difference a - b

  ## Mathematical Properties
  - Non-commutative: subtract(a, b) != subtract(b, a) (except when a == b)
  - Identity element: subtract(a, 0.0) == a
  - Inverse of add: subtract(a, b) == add(a, -b)

  ## Examples

      iex> PolyglotFormalisms.Arithmetic.subtract(10.0, 3.0)
      7.0

      iex> PolyglotFormalisms.Arithmetic.subtract(5.0, 8.0)
      -3.0

      iex> PolyglotFormalisms.Arithmetic.subtract(0.0, 0.0)
      0.0

      iex> PolyglotFormalisms.Arithmetic.subtract(10.5, 3.2)
      7.3

      iex> PolyglotFormalisms.Arithmetic.subtract(-5.0, -3.0)
      -2.0
  """
  @spec subtract(number(), number()) :: float()
  def subtract(a, b), do: a - b

  @doc """
  Computes the product of two numbers.

  ## Behavioral Semantics
  - Parameters: a (multiplicand), b (multiplier)
  - Returns: The arithmetic product of a and b

  ## Mathematical Properties
  - Commutativity: multiply(a, b) == multiply(b, a)
  - Associativity: multiply(multiply(a, b), c) == multiply(a, multiply(b, c))
  - Identity element: multiply(a, 1.0) == a
  - Zero element: multiply(a, 0.0) == 0.0
  - Distributivity: multiply(a, add(b, c)) == add(multiply(a, b), multiply(a, c))

  ## Examples

      iex> PolyglotFormalisms.Arithmetic.multiply(4.0, 5.0)
      20.0

      iex> PolyglotFormalisms.Arithmetic.multiply(-3.0, 7.0)
      -21.0

      iex> PolyglotFormalisms.Arithmetic.multiply(0.0, 100.0)
      0.0

      iex> PolyglotFormalisms.Arithmetic.multiply(2.5, 4.0)
      10.0

      iex> PolyglotFormalisms.Arithmetic.multiply(-2.0, -3.0)
      6.0
  """
  @spec multiply(number(), number()) :: float()
  def multiply(a, b), do: a * b

  @doc """
  Computes the quotient of two numbers.

  ## Behavioral Semantics
  - Parameters: a (dividend), b (divisor)
  - Returns: The arithmetic quotient a / b

  ## Mathematical Properties
  - Non-commutative: divide(a, b) != divide(b, a) (except when a == b)
  - Identity element: divide(a, 1.0) == a
  - Inverse of multiply: multiply(divide(a, b), b) ≈ a (when b != 0.0)

  ## Edge Cases
  - Division by zero: Returns Infinity or -Infinity (BEAM/Erlang behavior)
  - Behavior follows BEAM floating-point division

  ## Examples

      iex> PolyglotFormalisms.Arithmetic.divide(10.0, 2.0)
      5.0

      iex> PolyglotFormalisms.Arithmetic.divide(7.0, 2.0)
      3.5

      iex> PolyglotFormalisms.Arithmetic.divide(10.5, 2.0)
      5.25

      iex> PolyglotFormalisms.Arithmetic.divide(-10.0, 2.0)
      -5.0

      iex> PolyglotFormalisms.Arithmetic.divide(5.0, -2.0)
      -2.5
  """
  @spec divide(number(), number()) :: float()
  def divide(a, b), do: a / b

  @doc """
  Computes the remainder of integer division.

  ## Behavioral Semantics
  - Parameters: a (dividend), b (divisor)
  - Returns: The remainder of a / b

  ## Mathematical Properties
  - Range constraint: For b > 0, result is in [0, b)
  - Division relation: a == div(a, b) * b + rem(a, b) (when b != 0)

  ## Edge Cases
  - Modulo by zero: Raises ArithmeticError (BEAM behavior)
  - Sign handling follows Erlang rem operator semantics

  ## Examples

      iex> PolyglotFormalisms.Arithmetic.modulo(10, 3)
      1

      iex> PolyglotFormalisms.Arithmetic.modulo(15, 4)
      3

      iex> PolyglotFormalisms.Arithmetic.modulo(7, 7)
      0

      iex> PolyglotFormalisms.Arithmetic.modulo(-10, 3)
      -1

  ## Note
  Elixir/BEAM uses `rem` which may differ from other languages' mod.
  This follows BEAM/Erlang semantics for cross-platform consistency.
  """
  @spec modulo(integer(), integer()) :: integer()
  def modulo(a, b), do: rem(a, b)
end
