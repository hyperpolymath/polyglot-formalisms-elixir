# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.Logical do
  @moduledoc """
  Logical operations from the PolyglotFormalisms Common Library specification.

  Elixir implementation matching aggregate-library behavioral semantics.
  """

  @doc """
  Computes the logical conjunction (AND) of two boolean values.

  ## Behavioral Semantics
  - Parameters: a (first boolean), b (second boolean)
  - Returns: true if both a and b are true, otherwise false

  ## Truth Table
  | a     | b     | logical_and(a, b) |
  |-------|-------|-------------------|
  | true  | true  | true              |
  | true  | false | false             |
  | false | true  | false             |
  | false | false | false             |

  ## Mathematical Properties
  - Commutativity: logical_and(a, b) == logical_and(b, a)
  - Associativity: logical_and(logical_and(a, b), c) == logical_and(a, logical_and(b, c))
  - Identity element: logical_and(a, true) == a
  - Annihilator: logical_and(a, false) == false
  - Idempotence: logical_and(a, a) == a
  - Distributivity: logical_and(a, logical_or(b, c)) == logical_or(logical_and(a, b), logical_and(a, c))

  ## Examples

      iex> PolyglotFormalisms.Logical.logical_and(true, true)
      true

      iex> PolyglotFormalisms.Logical.logical_and(true, false)
      false

      iex> PolyglotFormalisms.Logical.logical_and(false, true)
      false

      iex> PolyglotFormalisms.Logical.logical_and(false, false)
      false
  """
  @spec logical_and(boolean(), boolean()) :: boolean()
  def logical_and(a, b), do: a and b

  @doc """
  Computes the logical disjunction (OR) of two boolean values.

  ## Behavioral Semantics
  - Parameters: a (first boolean), b (second boolean)
  - Returns: true if at least one of a or b is true, otherwise false

  ## Truth Table
  | a     | b     | logical_or(a, b) |
  |-------|-------|------------------|
  | true  | true  | true             |
  | true  | false | true             |
  | false | true  | true             |
  | false | false | false            |

  ## Mathematical Properties
  - Commutativity: logical_or(a, b) == logical_or(b, a)
  - Associativity: logical_or(logical_or(a, b), c) == logical_or(a, logical_or(b, c))
  - Identity element: logical_or(a, false) == a
  - Annihilator: logical_or(a, true) == true
  - Idempotence: logical_or(a, a) == a
  - Distributivity: logical_or(a, logical_and(b, c)) == logical_and(logical_or(a, b), logical_or(a, c))

  ## Examples

      iex> PolyglotFormalisms.Logical.logical_or(true, true)
      true

      iex> PolyglotFormalisms.Logical.logical_or(true, false)
      true

      iex> PolyglotFormalisms.Logical.logical_or(false, true)
      true

      iex> PolyglotFormalisms.Logical.logical_or(false, false)
      false
  """
  @spec logical_or(boolean(), boolean()) :: boolean()
  def logical_or(a, b), do: a or b

  @doc """
  Computes the logical negation (NOT) of a boolean value.

  ## Behavioral Semantics
  - Parameters: a (boolean value to negate)
  - Returns: true if a is false, false if a is true

  ## Truth Table
  | a     | logical_not(a) |
  |-------|----------------|
  | true  | false          |
  | false | true           |

  ## Mathematical Properties
  - Involution (double negation): logical_not(logical_not(a)) == a
  - Excluded middle: logical_or(a, logical_not(a)) == true
  - Non-contradiction: logical_and(a, logical_not(a)) == false
  - De Morgan's laws:
    - logical_not(logical_and(a, b)) == logical_or(logical_not(a), logical_not(b))
    - logical_not(logical_or(a, b)) == logical_and(logical_not(a), logical_not(b))

  ## Examples

      iex> PolyglotFormalisms.Logical.logical_not(true)
      false

      iex> PolyglotFormalisms.Logical.logical_not(false)
      true
  """
  @spec logical_not(boolean()) :: boolean()
  def logical_not(a), do: Kernel.not(a)
end
