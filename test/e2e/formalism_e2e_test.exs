# SPDX-License-Identifier: PMPL-1.0-or-later
# End-to-end tests for PolyglotFormalisms — full cross-module computation pipelines.
#
# These tests exercise combined usage of Arithmetic, Comparison, Logical, and
# StringOps modules to verify that operations compose correctly and that the
# library behaves as a coherent whole, not just a collection of isolated functions.

defmodule PolyglotFormalisms.E2ETest do
  use ExUnit.Case, async: true

  alias PolyglotFormalisms.Arithmetic
  alias PolyglotFormalisms.Comparison
  alias PolyglotFormalisms.Logical
  alias PolyglotFormalisms.StringOps

  @moduletag :e2e

  # ---------------------------------------------------------------------------
  # Arithmetic + Comparison pipeline
  # ---------------------------------------------------------------------------

  describe "arithmetic result feeds comparison" do
    test "sum of two numbers is greater than either operand (positive inputs)" do
      a = 7
      b = 3
      sum = Arithmetic.add(a, b)

      assert Comparison.greater_than(sum, a)
      assert Comparison.greater_than(sum, b)
    end

    test "product of two positive numbers is greater than either factor (> 1)" do
      a = 4
      b = 5
      product = Arithmetic.multiply(a, b)

      assert Comparison.greater_than(product, a)
      assert Comparison.greater_than(product, b)
    end

    test "division result passes equality check when divisor is 1" do
      a = 42
      result = Arithmetic.divide(a, 1)

      # divide/2 returns a float
      assert Comparison.equal(result, 42.0)
    end

    test "chained arithmetic operations maintain expected ordering" do
      # (10 + 5) * 2 = 30 > 25
      step1 = Arithmetic.add(10, 5)
      step2 = Arithmetic.multiply(step1, 2)

      assert Comparison.greater_than(step2, 25)
      assert Comparison.less_than(25, step2)
    end
  end

  # ---------------------------------------------------------------------------
  # Comparison + Logical pipeline
  # ---------------------------------------------------------------------------

  describe "comparison predicates feed logical operations" do
    test "in-range check: a > min && a < max" do
      value = 50
      min_val = 10
      max_val = 100

      above_min = Comparison.greater_than(value, min_val)
      below_max = Comparison.less_than(value, max_val)

      assert Logical.logical_and(above_min, below_max)
    end

    test "out-of-range: below min OR above max" do
      value = 5
      min_val = 10
      max_val = 100

      below_min = Comparison.less_than(value, min_val)
      above_max = Comparison.greater_than(value, max_val)

      assert Logical.logical_or(below_min, above_max)
    end

    test "equality check combined with negation" do
      a = 42
      b = 42
      c = 43

      eq_ab = Comparison.equal(a, b)
      eq_ac = Comparison.equal(a, c)

      assert Logical.logical_and(eq_ab, Logical.logical_not(eq_ac))
    end
  end

  # ---------------------------------------------------------------------------
  # Arithmetic + StringOps pipeline
  # ---------------------------------------------------------------------------

  describe "arithmetic result used in string operations" do
    test "computed length matches expected string length" do
      parts = ["hello", " ", "world"]
      joined = Enum.reduce(parts, "", &StringOps.concat(&2, &1))

      expected_length =
        parts
        |> Enum.map(&StringOps.string_length/1)
        |> Enum.reduce(0, &Arithmetic.add(&2, &1))

      assert StringOps.string_length(joined) == expected_length
    end

    test "concatenation is associative (matches arithmetic associativity)" do
      a = "foo"
      b = "bar"
      c = "baz"

      left  = StringOps.concat(StringOps.concat(a, b), c)
      right = StringOps.concat(a, StringOps.concat(b, c))

      assert left == right
    end
  end

  # ---------------------------------------------------------------------------
  # Full four-module pipeline
  # ---------------------------------------------------------------------------

  describe "four-module end-to-end computation" do
    test "compute, compare, gate, and format result" do
      # Step 1: Arithmetic — compute a score
      base   = 10
      bonus  = 5
      score  = Arithmetic.multiply(Arithmetic.add(base, bonus), 2)  # 30

      # Step 2: Comparison — check threshold
      threshold = 25
      passes = Comparison.greater_equal(score, threshold)

      # Step 3: Logical — gate the result
      enabled = true
      should_display = Logical.logical_and(passes, enabled)

      # Step 4: StringOps — format output
      label   = "Score: "
      suffix  = if should_display, do: "PASS", else: "FAIL"
      message = StringOps.concat(label, suffix)

      assert should_display
      assert message == "Score: PASS"
    end

    test "zero score fails threshold gate" do
      score     = Arithmetic.multiply(0, 100)  # 0
      threshold = 1
      passes    = Comparison.greater_equal(score, threshold)

      refute passes

      label   = "Score: "
      suffix  = if passes, do: "PASS", else: "FAIL"
      message = StringOps.concat(label, suffix)

      assert message == "Score: FAIL"
    end
  end

  # ---------------------------------------------------------------------------
  # Edge-case coverage across modules
  # ---------------------------------------------------------------------------

  describe "cross-module edge cases" do
    test "modulo zero remainder feeds equal comparison" do
      remainder = Arithmetic.modulo(9, 3)
      assert Comparison.equal(remainder, 0)
    end

    test "negative arithmetic result compared correctly" do
      diff = Arithmetic.subtract(3, 10)   # -7
      assert Comparison.less_than(diff, 0)
      assert Comparison.less_equal(diff, -7)
    end

    test "string length of empty string equals arithmetic zero" do
      len = StringOps.string_length("")
      assert Comparison.equal(len, 0)
    end
  end
end
