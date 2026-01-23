# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.LogicalTest do
  use ExUnit.Case, async: true
  alias PolyglotFormalisms.Logical
  doctest PolyglotFormalisms.Logical

  describe "logical_and/2" do
    test "returns true for true && true" do
      assert Logical.logical_and(true, true)
    end

    test "returns false for true && false" do
      refute Logical.logical_and(true, false)
    end

    test "returns false for false && true" do
      refute Logical.logical_and(false, true)
    end

    test "returns false for false && false" do
      refute Logical.logical_and(false, false)
    end

    test "commutativity: and(a, b) == and(b, a)" do
      assert Logical.logical_and(true, false) == Logical.logical_and(false, true)
    end

    test "associativity: and(and(a, b), c) == and(a, and(b, c))" do
      assert Logical.logical_and(Logical.logical_and(true, true), false) == Logical.logical_and(true, Logical.logical_and(true, false))
    end

    test "identity element: and(a, true) == a" do
      assert Logical.logical_and(true, true) == true
      assert Logical.logical_and(false, true) == false
    end

    test "annihilator: and(a, false) == false" do
      assert Logical.logical_and(true, false) == false
      assert Logical.logical_and(false, false) == false
    end

    test "idempotence: and(a, a) == a" do
      assert Logical.logical_and(true, true) == true
      assert Logical.logical_and(false, false) == false
    end
  end

  describe "logical_or/2" do
    test "returns true for true || true" do
      assert Logical.logical_or(true, true)
    end

    test "returns true for true || false" do
      assert Logical.logical_or(true, false)
    end

    test "returns true for false || true" do
      assert Logical.logical_or(false, true)
    end

    test "returns false for false || false" do
      refute Logical.logical_or(false, false)
    end

    test "commutativity: or(a, b) == or(b, a)" do
      assert Logical.logical_or(true, false) == Logical.logical_or(false, true)
    end

    test "associativity: or(or(a, b), c) == or(a, or(b, c))" do
      assert Logical.logical_or(Logical.logical_or(false, false), true) == Logical.logical_or(false, Logical.logical_or(false, true))
    end

    test "identity element: or(a, false) == a" do
      assert Logical.logical_or(true, false) == true
      assert Logical.logical_or(false, false) == false
    end

    test "annihilator: or(a, true) == true" do
      assert Logical.logical_or(true, true) == true
      assert Logical.logical_or(false, true) == true
    end

    test "idempotence: or(a, a) == a" do
      assert Logical.logical_or(true, true) == true
      assert Logical.logical_or(false, false) == false
    end
  end

  describe "logical_not/1" do
    test "returns false for !true" do
      refute Logical.logical_not(true)
    end

    test "returns true for !false" do
      assert Logical.logical_not(false)
    end

    test "involution: not(not(a)) == a" do
      assert Logical.logical_not(Logical.logical_not(true)) == true
      assert Logical.logical_not(Logical.logical_not(false)) == false
    end

    test "excluded middle: or(a, not(a)) == true" do
      assert Logical.logical_or(true, Logical.logical_not(true))
      assert Logical.logical_or(false, Logical.logical_not(false))
    end

    test "non-contradiction: and(a, not(a)) == false" do
      refute Logical.logical_and(true, Logical.logical_not(true))
      refute Logical.logical_and(false, Logical.logical_not(false))
    end

    test "De Morgan's law: not(and(a, b)) == or(not(a), not(b))" do
      a = true
      b = false
      assert Logical.logical_not(Logical.logical_and(a, b)) == Logical.logical_or(Logical.logical_not(a), Logical.logical_not(b))
    end

    test "De Morgan's law: not(or(a, b)) == and(not(a), not(b))" do
      a = true
      b = false
      assert Logical.logical_not(Logical.logical_or(a, b)) == Logical.logical_and(Logical.logical_not(a), Logical.logical_not(b))
    end
  end
end
