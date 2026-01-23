# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.ComparisonTest do
  use ExUnit.Case, async: true
  alias PolyglotFormalisms.Comparison
  doctest PolyglotFormalisms.Comparison

  describe "less_than/2" do
    test "returns true for 2 < 3" do
      assert Comparison.less_than(2, 3)
    end

    test "returns false for 5 < 5" do
      refute Comparison.less_than(5, 5)
    end

    test "returns false for 10 < 3" do
      refute Comparison.less_than(10, 3)
    end

    test "returns true for -5 < 0" do
      assert Comparison.less_than(-5, 0)
    end

    test "transitivity: less_than(a, b) && less_than(b, c) => less_than(a, c)" do
      a = 1
      b = 2
      c = 3
      assert Comparison.less_than(a, b) and Comparison.less_than(b, c)
      assert Comparison.less_than(a, c)
    end

    test "irreflexivity: !less_than(a, a)" do
      refute Comparison.less_than(5, 5)
    end

    test "asymmetry: less_than(a, b) => !less_than(b, a)" do
      a = 2
      b = 3
      assert Comparison.less_than(a, b)
      refute Comparison.less_than(b, a)
    end
  end

  describe "greater_than/2" do
    test "returns true for 5 > 3" do
      assert Comparison.greater_than(5, 3)
    end

    test "returns false for 2 > 2" do
      refute Comparison.greater_than(2, 2)
    end

    test "returns false for 1 > 10" do
      refute Comparison.greater_than(1, 10)
    end

    test "transitivity: greater_than(a, b) && greater_than(b, c) => greater_than(a, c)" do
      a = 3
      b = 2
      c = 1
      assert Comparison.greater_than(a, b) and Comparison.greater_than(b, c)
      assert Comparison.greater_than(a, c)
    end

    test "irreflexivity: !greater_than(a, a)" do
      refute Comparison.greater_than(5, 5)
    end

    test "relation to less_than: greater_than(a, b) == less_than(b, a)" do
      a = 5
      b = 3
      assert Comparison.greater_than(a, b) == Comparison.less_than(b, a)
    end
  end

  describe "equal/2" do
    test "returns true for 5 == 5" do
      assert Comparison.equal(5, 5)
    end

    test "returns false for 3 == 7" do
      refute Comparison.equal(3, 7)
    end

    test "reflexivity: equal(a, a)" do
      assert Comparison.equal(5, 5)
    end

    test "symmetry: equal(a, b) => equal(b, a)" do
      a = 5
      b = 5
      assert Comparison.equal(a, b) == Comparison.equal(b, a)
    end

    test "transitivity: equal(a, b) && equal(b, c) => equal(a, c)" do
      a = 5
      b = 5
      c = 5
      assert Comparison.equal(a, b) and Comparison.equal(b, c)
      assert Comparison.equal(a, c)
    end
  end

  describe "not_equal/2" do
    test "returns true for 5 != 3" do
      assert Comparison.not_equal(5, 3)
    end

    test "returns false for 7 != 7" do
      refute Comparison.not_equal(7, 7)
    end

    test "negation of equal: not_equal(a, b) == !equal(a, b)" do
      a = 5
      b = 3
      assert Comparison.not_equal(a, b) == not Comparison.equal(a, b)
    end

    test "symmetry: not_equal(a, b) => not_equal(b, a)" do
      a = 5
      b = 3
      assert Comparison.not_equal(a, b) == Comparison.not_equal(b, a)
    end
  end

  describe "less_equal/2" do
    test "returns true for 2 <= 3" do
      assert Comparison.less_equal(2, 3)
    end

    test "returns true for 5 <= 5" do
      assert Comparison.less_equal(5, 5)
    end

    test "returns false for 10 <= 3" do
      refute Comparison.less_equal(10, 3)
    end

    test "reflexivity: less_equal(a, a)" do
      assert Comparison.less_equal(5, 5)
    end

    test "transitivity: less_equal(a, b) && less_equal(b, c) => less_equal(a, c)" do
      a = 1
      b = 2
      c = 3
      assert Comparison.less_equal(a, b) and Comparison.less_equal(b, c)
      assert Comparison.less_equal(a, c)
    end

    test "relation to less_than: less_equal(a, b) == (less_than(a, b) || equal(a, b))" do
      a = 2
      b = 3
      assert Comparison.less_equal(a, b) == (Comparison.less_than(a, b) or Comparison.equal(a, b))
    end
  end

  describe "greater_equal/2" do
    test "returns true for 5 >= 3" do
      assert Comparison.greater_equal(5, 3)
    end

    test "returns true for 7 >= 7" do
      assert Comparison.greater_equal(7, 7)
    end

    test "returns false for 2 >= 10" do
      refute Comparison.greater_equal(2, 10)
    end

    test "reflexivity: greater_equal(a, a)" do
      assert Comparison.greater_equal(5, 5)
    end

    test "transitivity: greater_equal(a, b) && greater_equal(b, c) => greater_equal(a, c)" do
      a = 3
      b = 2
      c = 1
      assert Comparison.greater_equal(a, b) and Comparison.greater_equal(b, c)
      assert Comparison.greater_equal(a, c)
    end

    test "relation to less_equal: greater_equal(a, b) == less_equal(b, a)" do
      a = 5
      b = 3
      assert Comparison.greater_equal(a, b) == Comparison.less_equal(b, a)
    end
  end
end
