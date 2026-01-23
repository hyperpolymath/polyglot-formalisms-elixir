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
  | a     | b     | and(a, b) |
  |-------|-------|-----------|
  | true  | true  | true      |
  | true  | false | false     |
  | false | true  | false     |
  | false | false | false     |

  ## Mathematical Properties
  - Commutativity: and(a, b) == and(b, a)
  - Associativity: and(and(a, b), c) == and(a, and(b, c))
  - Identity element: and(a, true) == a
  - Annihilator: and(a, false) == false
  - Idempotence: and(a, a) == a
  - Distributivity: and(a, or(b, c)) == or(and(a, b), and(a, c))

  ## Examples

      iex> PolyglotFormalisms.Logical.and(true, true)
      true

      iex> PolyglotFormalisms.Logical.and(true, false)
      false

      iex> PolyglotFormalisms.Logical.and(false, true)
      false

      iex> PolyglotFormalisms.Logical.and(false, false)
      false
  """
  @spec and(boolean(), boolean()) :: boolean()
  def and(a, b), do: a and b

  @doc """
  Computes the logical disjunction (OR) of two boolean values.

  ## Behavioral Semantics
  - Parameters: a (first boolean), b (second boolean)
  - Returns: true if at least one of a or b is true, otherwise false

  ## Truth Table
  | a     | b     | or(a, b) |
  |-------|-------|----------|
  | true  | true  | true     |
  | true  | false | true     |
  | false | true  | true     |
  | false | false | false    |

  ## Mathematical Properties
  - Commutativity: or(a, b) == or(b, a)
  - Associativity: or(or(a, b), c) == or(a, or(b, c))
  - Identity element: or(a, false) == a
  - Annihilator: or(a, true) == true
  - Idempotence: or(a, a) == a
  - Distributivity: or(a, and(b, c)) == and(or(a, b), or(a, c))

  ## Examples

      iex> PolyglotFormalisms.Logical.or(true, true)
      true

      iex> PolyglotFormalisms.Logical.or(true, false)
      true

      iex> PolyglotFormalisms.Logical.or(false, true)
      true

      iex> PolyglotFormalisms.Logical.or(false, false)
      false
  """
  @spec or(boolean(), boolean()) :: boolean()
  def or(a, b), do: a or b

  @doc """
  Computes the logical negation (NOT) of a boolean value.

  ## Behavioral Semantics
  - Parameters: a (boolean value to negate)
  - Returns: true if a is false, false if a is true

  ## Truth Table
  | a     | not(a) |
  |-------|--------|
  | true  | false  |
  | false | true   |

  ## Mathematical Properties
  - Involution (double negation): not(not(a)) == a
  - Excluded middle: or(a, not(a)) == true
  - Non-contradiction: and(a, not(a)) == false
  - De Morgan's laws:
    - not(and(a, b)) == or(not(a), not(b))
    - not(or(a, b)) == and(not(a), not(b))

  ## Examples

      iex> PolyglotFormalisms.Logical.not(true)
      false

      iex> PolyglotFormalisms.Logical.not(false)
      true
  """
  @spec not(boolean()) :: boolean()
  def not(a), do: Kernel.not(a)
end
