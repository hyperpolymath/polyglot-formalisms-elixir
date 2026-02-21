# SPDX-License-Identifier: PMPL-1.0-or-later

defmodule PolyglotFormalisms.Arithmetic do
  @moduledoc """
  Arithmetic Kernel — PolyglotFormalisms Common Library.

  This module implements the arithmetic section of the PolyglotFormalisms 
  specification. It ensures that numerical operations behave identically 
  across Elixir, Rust, and ReScript environments.

  DESIGN MANDATE:
  - Strict adherence to specification behavioral semantics.
  - Verification of mathematical properties (Commutativity, Associativity).
  - Explicit type signatures for float-based operations.
  """

  @doc """
  SUMMATION: Returns the arithmetic sum of `a` and `b`.

  ## Properties:
  - Identity: add(a, 0.0) == a
  - Commutative: add(a, b) == add(b, a)
  """
  @spec add(number(), number()) :: float()
  def add(a, b), do: a + b

  @doc """
  SUBTRACTION: Returns the arithmetic difference `a - b`.

  ## Properties:
  - Non-commutative: subtract(a, b) != subtract(b, a)
  - Inverse: subtract(a, b) == add(a, -b)
  """
  @spec subtract(number(), number()) :: float()
  def subtract(a, b), do: a - b

  @doc """
  MULTIPLICATION: Returns the arithmetic product of `a` and `b`.

  ## Properties:
  - Zero Element: multiply(a, 0.0) == 0.0
  - Identity: multiply(a, 1.0) == a
  """
  @spec multiply(number(), number()) :: float()
  def multiply(a, b), do: a * b
end
