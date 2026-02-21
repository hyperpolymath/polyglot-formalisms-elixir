# SPDX-License-Identifier: PMPL-1.0-or-later

defmodule PolyglotFormalisms.Logical do
  @moduledoc """
  Logical Kernel — PolyglotFormalisms Common Library (Elixir).

  This module implements boolean algebra operations matching the 
  PolyglotFormalisms specification. It ensures that logical predicates 
  behave consistently across Elixir and Idris environments.

  DESIGN MANDATE:
  - Strict adherence to aggregate-library truth tables.
  - Verification of algebraic properties (Annihilators, Idempotence).
  - Explicit documentation of De Morgan's Law compliance.
  """

  @doc """
  CONJUNCTION: Returns true iff both `a` and `b` are true.

  ## Properties:
  - Identity: logical_and(a, true) == a
  - Annihilator: logical_and(a, false) == false
  - Commutative: logical_and(a, b) == logical_and(b, a)
  """
  @spec logical_and(boolean(), boolean()) :: boolean()
  def logical_and(a, b), do: a and b

  @doc """
  DISJUNCTION: Returns true if at least one of `a` or `b` is true.

  ## Properties:
  - Identity: logical_or(a, false) == a
  - Annihilator: logical_or(a, true) == true
  """
  @spec logical_or(boolean(), boolean()) :: boolean()
  def logical_or(a, b), do: a or b

  @doc """
  NEGATION: Inverts the boolean value of `a`.

  ## Properties:
  - Involution: logical_not(logical_not(a)) == a
  - Excluded Middle: logical_or(a, logical_not(a)) == true
  """
  @spec logical_not(boolean()) :: boolean()
  def logical_not(a), do: Kernel.not(a)
end
