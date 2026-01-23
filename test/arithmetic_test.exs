# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.ArithmeticTest do
  use ExUnit.Case, async: true
  alias PolyglotFormalisms.Arithmetic
  doctest PolyglotFormalisms.Arithmetic

  describe "add/2" do
    test "adds positive integers" do
      assert Arithmetic.add(2, 3) == 5
    end

    test "adds negative integers" do
      assert Arithmetic.add(-5, 3) == -2
    end

    test "adds zero" do
      assert Arithmetic.add(0, 0) == 0
    end

    test "adds floats" do
      assert Arithmetic.add(1.5, 2.5) == 4.0
    end

    test "adds negative floats" do
      assert Arithmetic.add(-10.0, -20.0) == -30.0
    end

    test "commutativity: add(a, b) == add(b, a)" do
      assert Arithmetic.add(5, 3) == Arithmetic.add(3, 5)
    end

    test "associativity: add(add(a, b), c) == add(a, add(b, c))" do
      assert Arithmetic.add(Arithmetic.add(1, 2), 3) == Arithmetic.add(1, Arithmetic.add(2, 3))
    end

    test "identity element: add(a, 0) == a" do
      assert Arithmetic.add(42, 0) == 42
    end
  end

  describe "subtract/2" do
    test "subtracts positive integers" do
      assert Arithmetic.subtract(10, 3) == 7
    end

    test "subtracts to negative result" do
      assert Arithmetic.subtract(5, 8) == -3
    end

    test "subtracts zero" do
      assert Arithmetic.subtract(0, 0) == 0
    end

    test "subtracts floats" do
      assert_in_delta Arithmetic.subtract(10.5, 3.2), 7.3, 0.0001
    end

    test "subtracts negative floats" do
      assert Arithmetic.subtract(-5.0, -3.0) == -2.0
    end

    test "non-commutative: subtract(a, b) != subtract(b, a)" do
      assert Arithmetic.subtract(10, 3) != Arithmetic.subtract(3, 10)
    end

    test "identity element: subtract(a, 0) == a" do
      assert Arithmetic.subtract(42, 0) == 42
    end
  end

  describe "multiply/2" do
    test "multiplies positive integers" do
      assert Arithmetic.multiply(4, 5) == 20
    end

    test "multiplies negative and positive" do
      assert Arithmetic.multiply(-3, 7) == -21
    end

    test "multiplies by zero" do
      assert Arithmetic.multiply(0, 100) == 0
    end

    test "multiplies floats" do
      assert Arithmetic.multiply(2.5, 4.0) == 10.0
    end

    test "multiplies negative numbers" do
      assert Arithmetic.multiply(-2, -3) == 6
    end

    test "commutativity: multiply(a, b) == multiply(b, a)" do
      assert Arithmetic.multiply(5, 3) == Arithmetic.multiply(3, 5)
    end

    test "associativity: multiply(multiply(a, b), c) == multiply(a, multiply(b, c))" do
      assert Arithmetic.multiply(Arithmetic.multiply(2, 3), 4) == Arithmetic.multiply(2, Arithmetic.multiply(3, 4))
    end

    test "identity element: multiply(a, 1) == a" do
      assert Arithmetic.multiply(42, 1) == 42
    end

    test "zero element: multiply(a, 0) == 0" do
      assert Arithmetic.multiply(42, 0) == 0
    end
  end

  describe "divide/2" do
    test "divides evenly" do
      assert Arithmetic.divide(10, 2) == 5.0
    end

    test "divides with remainder" do
      assert Arithmetic.divide(7, 2) == 3.5
    end

    test "divides floats" do
      assert Arithmetic.divide(10.5, 2) == 5.25
    end

    test "divides negative dividend" do
      assert Arithmetic.divide(-10, 2) == -5.0
    end

    test "divides by negative divisor" do
      assert Arithmetic.divide(5, -2) == -2.5
    end

    test "identity element: divide(a, 1) == a" do
      assert Arithmetic.divide(42, 1) == 42.0
    end
  end

  describe "modulo/2" do
    test "modulo with remainder" do
      assert Arithmetic.modulo(10, 3) == 1
    end

    test "modulo evenly divisible" do
      assert Arithmetic.modulo(15, 4) == 3
    end

    test "modulo exact division" do
      assert Arithmetic.modulo(7, 7) == 0
    end

    test "modulo with negative dividend (Erlang rem semantics)" do
      assert Arithmetic.modulo(-10, 3) == -1
    end
  end
end
