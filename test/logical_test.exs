# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.LogicalTest do
  use ExUnit.Case, async: true
  alias PolyglotFormalisms.Logical
  doctest PolyglotFormalisms.Logical

  describe "and/2" do
    test "returns true for true && true" do
      assert Logical.and(true, true)
    end

    test "returns false for true && false" do
      refute Logical.and(true, false)
    end

    test "returns false for false && true" do
      refute Logical.and(false, true)
    end

    test "returns false for false && false" do
      refute Logical.and(false, false)
    end

    test "commutativity: and(a, b) == and(b, a)" do
      assert Logical.and(true, false) == Logical.and(false, true)
    end

    test "associativity: and(and(a, b), c) == and(a, and(b, c))" do
      assert Logical.and(Logical.and(true, true), false) == Logical.and(true, Logical.and(true, false))
    end

    test "identity element: and(a, true) == a" do
      assert Logical.and(true, true) == true
      assert Logical.and(false, true) == false
    end

    test "annihilator: and(a, false) == false" do
      assert Logical.and(true, false) == false
      assert Logical.and(false, false) == false
    end

    test "idempotence: and(a, a) == a" do
      assert Logical.and(true, true) == true
      assert Logical.and(false, false) == false
    end
  end

  describe "or/2" do
    test "returns true for true || true" do
      assert Logical.or(true, true)
    end

    test "returns true for true || false" do
      assert Logical.or(true, false)
    end

    test "returns true for false || true" do
      assert Logical.or(false, true)
    end

    test "returns false for false || false" do
      refute Logical.or(false, false)
    end

    test "commutativity: or(a, b) == or(b, a)" do
      assert Logical.or(true, false) == Logical.or(false, true)
    end

    test "associativity: or(or(a, b), c) == or(a, or(b, c))" do
      assert Logical.or(Logical.or(false, false), true) == Logical.or(false, Logical.or(false, true))
    end

    test "identity element: or(a, false) == a" do
      assert Logical.or(true, false) == true
      assert Logical.or(false, false) == false
    end

    test "annihilator: or(a, true) == true" do
      assert Logical.or(true, true) == true
      assert Logical.or(false, true) == true
    end

    test "idempotence: or(a, a) == a" do
      assert Logical.or(true, true) == true
      assert Logical.or(false, false) == false
    end
  end

  describe "not/1" do
    test "returns false for !true" do
      refute Logical.not(true)
    end

    test "returns true for !false" do
      assert Logical.not(false)
    end

    test "involution: not(not(a)) == a" do
      assert Logical.not(Logical.not(true)) == true
      assert Logical.not(Logical.not(false)) == false
    end

    test "excluded middle: or(a, not(a)) == true" do
      assert Logical.or(true, Logical.not(true))
      assert Logical.or(false, Logical.not(false))
    end

    test "non-contradiction: and(a, not(a)) == false" do
      refute Logical.and(true, Logical.not(true))
      refute Logical.and(false, Logical.not(false))
    end

    test "De Morgan's law: not(and(a, b)) == or(not(a), not(b))" do
      a = true
      b = false
      assert Logical.not(Logical.and(a, b)) == Logical.or(Logical.not(a), Logical.not(b))
    end

    test "De Morgan's law: not(or(a, b)) == and(not(a), not(b))" do
      a = true
      b = false
      assert Logical.not(Logical.or(a, b)) == Logical.and(Logical.not(a), Logical.not(b))
    end
  end
end
