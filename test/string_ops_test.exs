# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.StringOpsTest do
  use ExUnit.Case
  alias PolyglotFormalisms.StringOps
  doctest PolyglotFormalisms.StringOps

  describe "concat/2" do
    test "concatenates two strings" do
      assert StringOps.concat("Hello", " World") == "Hello World"
      assert StringOps.concat("", "test") == "test"
      assert StringOps.concat("test", "") == "test"
      assert StringOps.concat("a", "b") == "ab"
    end

    test "is associative" do
      assert StringOps.concat(StringOps.concat("a", "b"), "c") ==
               StringOps.concat("a", StringOps.concat("b", "c"))
    end

    test "has empty string as identity" do
      assert StringOps.concat("test", "") == "test"
      assert StringOps.concat("", "test") == "test"
    end
  end

  describe "string_length/1" do
    test "returns the length of a string" do
      assert StringOps.string_length("Hello") == 5
      assert StringOps.string_length("") == 0
      assert StringOps.string_length("🎉") == 1
      assert StringOps.string_length("Test 123") == 8
    end

    test "is non-negative" do
      assert StringOps.string_length("") >= 0
      assert StringOps.string_length("test") >= 0
    end

    test "satisfies concatenation property" do
      a = "Hello"
      b = " World"

      assert StringOps.string_length(StringOps.concat(a, b)) ==
               StringOps.string_length(a) + StringOps.string_length(b)
    end
  end

  describe "substring/3" do
    test "extracts substrings" do
      assert StringOps.substring("Hello World", 1, 5) == "Hello"
      assert StringOps.substring("Hello World", 7, 11) == "World"
      assert StringOps.substring("Test", 1, 1) == "T"
      assert StringOps.substring("Test", 3, 2) == ""
    end

    test "handles edge cases" do
      assert StringOps.substring("Test", 2, 3) == "es"
      assert StringOps.substring("Hello", 1, 5) == "Hello"
    end
  end

  describe "index_of/2" do
    test "finds substring position" do
      assert StringOps.index_of("Hello World", "World") == 7
      assert StringOps.index_of("Hello World", "o") == 5
      assert StringOps.index_of("Test", "xyz") == 0
      assert StringOps.index_of("Test", "") == 1
    end

    test "returns 0 when not found" do
      assert StringOps.index_of("Hello", "xyz") == 0
    end

    test "finds empty substring at start" do
      assert StringOps.index_of("Test", "") == 1
      assert StringOps.index_of("", "") == 1
    end
  end

  describe "string_contains/2" do
    test "checks if string contains substring" do
      assert StringOps.string_contains("Hello World", "World") == true
      assert StringOps.string_contains("Hello World", "xyz") == false
      assert StringOps.string_contains("Test", "") == true
      assert StringOps.string_contains("", "Test") == false
    end

    test "always contains empty string" do
      assert StringOps.string_contains("Test", "") == true
      assert StringOps.string_contains("", "") == true
    end

    test "is reflexive" do
      assert StringOps.string_contains("Hello", "Hello") == true
    end
  end

  describe "starts_with/2" do
    test "checks if string starts with prefix" do
      assert StringOps.starts_with("Hello World", "Hello") == true
      assert StringOps.starts_with("Hello World", "World") == false
      assert StringOps.starts_with("Test", "") == true
      assert StringOps.starts_with("", "Test") == false
    end

    test "always starts with empty prefix" do
      assert StringOps.starts_with("Test", "") == true
      assert StringOps.starts_with("", "") == true
    end

    test "is reflexive" do
      assert StringOps.starts_with("Hello", "Hello") == true
    end
  end

  describe "ends_with/2" do
    test "checks if string ends with suffix" do
      assert StringOps.ends_with("Hello World", "World") == true
      assert StringOps.ends_with("Hello World", "Hello") == false
      assert StringOps.ends_with("Test", "") == true
      assert StringOps.ends_with("", "Test") == false
    end

    test "always ends with empty suffix" do
      assert StringOps.ends_with("Test", "") == true
      assert StringOps.ends_with("", "") == true
    end

    test "is reflexive" do
      assert StringOps.ends_with("Hello", "Hello") == true
    end
  end

  describe "to_uppercase/1" do
    test "converts to uppercase" do
      assert StringOps.to_uppercase("Hello World") == "HELLO WORLD"
      assert StringOps.to_uppercase("test") == "TEST"
      assert StringOps.to_uppercase("TEST") == "TEST"
      assert StringOps.to_uppercase("café") == "CAFÉ"
    end

    test "is idempotent" do
      assert StringOps.to_uppercase(StringOps.to_uppercase("test")) ==
               StringOps.to_uppercase("test")
    end
  end

  describe "to_lowercase/1" do
    test "converts to lowercase" do
      assert StringOps.to_lowercase("Hello World") == "hello world"
      assert StringOps.to_lowercase("TEST") == "test"
      assert StringOps.to_lowercase("test") == "test"
      assert StringOps.to_lowercase("CAFÉ") == "café"
    end

    test "is idempotent" do
      assert StringOps.to_lowercase(StringOps.to_lowercase("TEST")) ==
               StringOps.to_lowercase("TEST")
    end
  end

  describe "string_trim/1" do
    test "removes leading and trailing whitespace" do
      assert StringOps.string_trim("  Hello World  ") == "Hello World"
      assert StringOps.string_trim("\n\tTest\n") == "Test"
      assert StringOps.string_trim("NoSpaces") == "NoSpaces"
      assert StringOps.string_trim("   ") == ""
    end

    test "is idempotent" do
      assert StringOps.string_trim(StringOps.string_trim("  test  ")) ==
               StringOps.string_trim("  test  ")
    end

    test "preserves internal whitespace" do
      assert StringOps.string_trim("  Hello World  ") == "Hello World"
    end
  end

  describe "string_split/2" do
    test "splits string by delimiter" do
      assert StringOps.string_split("a,b,c", ",") == ["a", "b", "c"]
      assert StringOps.string_split("Hello World", " ") == ["Hello", "World"]
      assert StringOps.string_split("test", ",") == ["test"]
      assert StringOps.string_split("a,,b", ",") == ["a", "", "b"]
    end

    test "splits by empty delimiter into graphemes" do
      assert StringOps.string_split("abc", "") == ["a", "b", "c"]
    end

    test "returns single element when not found" do
      assert StringOps.string_split("test", ",") == ["test"]
    end
  end

  describe "string_join/2" do
    test "joins list with separator" do
      assert StringOps.string_join(["a", "b", "c"], ",") == "a,b,c"
      assert StringOps.string_join(["Hello", "World"], " ") == "Hello World"
      assert StringOps.string_join(["test"], ",") == "test"
      assert StringOps.string_join([], ",") == ""
    end

    test "returns empty string for empty list" do
      assert StringOps.string_join([], ",") == ""
    end

    test "returns single element unchanged" do
      assert StringOps.string_join(["test"], ",") == "test"
    end

    test "is inverse of split" do
      original = "a,b,c"
      assert StringOps.string_join(StringOps.string_split(original, ","), ",") == original
    end
  end

  describe "string_replace/3" do
    test "replaces all occurrences" do
      assert StringOps.string_replace("Hello World", "World", "Universe") == "Hello Universe"
      assert StringOps.string_replace("test test", "test", "demo") == "demo demo"
      assert StringOps.string_replace("Hello", "xyz", "abc") == "Hello"
      assert StringOps.string_replace("Hello", "l", "") == "Heo"
    end

    test "returns unchanged when not found" do
      assert StringOps.string_replace("Hello", "xyz", "abc") == "Hello"
    end

    test "returns unchanged when old is empty" do
      assert StringOps.string_replace("Hello", "", "x") == "Hello"
    end

    test "replaces multiple occurrences" do
      assert StringOps.string_replace("test test test", "test", "demo") == "demo demo demo"
    end
  end

  describe "is_empty/1" do
    test "checks if string is empty" do
      assert StringOps.is_empty("") == true
      assert StringOps.is_empty("test") == false
      assert StringOps.is_empty(" ") == false
    end

    test "is equivalent to length check" do
      assert StringOps.is_empty("") == (StringOps.string_length("") == 0)
      assert StringOps.is_empty("test") == (StringOps.string_length("test") == 0)
    end
  end
end
