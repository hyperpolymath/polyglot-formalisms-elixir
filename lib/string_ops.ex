# SPDX-License-Identifier: PMPL-1.0-or-later
defmodule PolyglotFormalisms.StringOps do
  @moduledoc """
  String operations from the PolyglotFormalisms Common Library specification.

  Elixir implementation matching aggregate-library behavioral semantics.

  Each operation includes:
  - Implementation following PolyglotFormalisms specification
  - Type signatures using @spec
  - Documentation with behavioral semantics
  - Examples using doctests
  """

  @doc """
  Concatenates two strings.

  ## Behavioral Semantics
  - Parameters: a (first string), b (second string)
  - Returns: The concatenation of a and b

  ## Mathematical Properties
  - Associativity: concat(concat(a, b), c) == concat(a, concat(b, c))
  - Identity element: concat(a, "") == concat("", a) == a
  - Non-commutativity: concat(a, b) != concat(b, a) (in general)

  ## Examples

      iex> PolyglotFormalisms.StringOps.concat("Hello", " World")
      "Hello World"

      iex> PolyglotFormalisms.StringOps.concat("", "test")
      "test"

      iex> PolyglotFormalisms.StringOps.concat("test", "")
      "test"

      iex> PolyglotFormalisms.StringOps.concat("a", "b")
      "ab"
  """
  @spec concat(String.t(), String.t()) :: String.t()
  def concat(a, b), do: a <> b

  @doc """
  Returns the length of a string (number of graphemes).

  ## Behavioral Semantics
  - Parameters: s (string to measure)
  - Returns: Number of graphemes in the string

  ## Mathematical Properties
  - Non-negativity: length(s) >= 0
  - Empty string: length("") == 0
  - Concatenation: length(concat(a, b)) == length(a) + length(b)

  ## Examples

      iex> PolyglotFormalisms.StringOps.string_length("Hello")
      5

      iex> PolyglotFormalisms.StringOps.string_length("")
      0

      iex> PolyglotFormalisms.StringOps.string_length("🎉")
      1

      iex> PolyglotFormalisms.StringOps.string_length("Test 123")
      8
  """
  @spec string_length(String.t()) :: non_neg_integer()
  def string_length(s), do: String.length(s)

  @doc """
  Extracts a substring using 1-based indexing (to match Julia spec).

  ## Behavioral Semantics
  - Parameters: s (source string), start (start index), end_pos (end index)
  - Returns: Substring from start to end_pos (inclusive)
  - Indexing: 1-based (matching Julia convention for cross-language consistency)

  ## Edge Cases
  - If start > end_pos: returns empty string
  - If indices out of bounds: returns truncated result

  ## Examples

      iex> PolyglotFormalisms.StringOps.substring("Hello World", 1, 5)
      "Hello"

      iex> PolyglotFormalisms.StringOps.substring("Hello World", 7, 11)
      "World"

      iex> PolyglotFormalisms.StringOps.substring("Test", 1, 1)
      "T"

      iex> PolyglotFormalisms.StringOps.substring("Test", 3, 2)
      ""
  """
  @spec substring(String.t(), pos_integer(), pos_integer()) :: String.t()
  def substring(_s, start, end_pos) when start > end_pos, do: ""

  def substring(s, start, end_pos) do
    # Convert 1-based to 0-based for Elixir
    zero_start = start - 1
    length = end_pos - start + 1
    String.slice(s, zero_start, length)
  end

  @doc """
  Finds the first occurrence of a substring.

  ## Behavioral Semantics
  - Parameters: s (string to search), substr (substring to find)
  - Returns: 1-based index of first occurrence, or 0 if not found

  ## Mathematical Properties
  - Not found convention: returns 0 (matching Julia convention)
  - Empty substring: index_of(s, "") == 1 (found at start)

  ## Examples

      iex> PolyglotFormalisms.StringOps.index_of("Hello World", "World")
      7

      iex> PolyglotFormalisms.StringOps.index_of("Hello World", "o")
      5

      iex> PolyglotFormalisms.StringOps.index_of("Test", "xyz")
      0

      iex> PolyglotFormalisms.StringOps.index_of("Test", "")
      1
  """
  @spec index_of(String.t(), String.t()) :: non_neg_integer()
  def index_of(_s, ""), do: 1

  def index_of(s, substr) do
    case :binary.match(s, substr) do
      {pos, _len} -> pos + 1  # Convert 0-based to 1-based
      :nomatch -> 0
    end
  end

  @doc """
  Checks if a string contains a substring.

  ## Behavioral Semantics
  - Parameters: s (string to search), substr (substring to find)
  - Returns: true if substr is found in s, false otherwise

  ## Mathematical Properties
  - Empty substring: contains(s, "") == true (always)
  - Reflexivity: contains(s, s) == true

  ## Examples

      iex> PolyglotFormalisms.StringOps.string_contains("Hello World", "World")
      true

      iex> PolyglotFormalisms.StringOps.string_contains("Hello World", "xyz")
      false

      iex> PolyglotFormalisms.StringOps.string_contains("Test", "")
      true

      iex> PolyglotFormalisms.StringOps.string_contains("", "Test")
      false
  """
  @spec string_contains(String.t(), String.t()) :: boolean()
  def string_contains(s, substr), do: String.contains?(s, substr)

  @doc """
  Checks if a string starts with a given prefix.

  ## Behavioral Semantics
  - Parameters: s (string to check), prefix (prefix to match)
  - Returns: true if s starts with prefix, false otherwise

  ## Mathematical Properties
  - Empty prefix: starts_with(s, "") == true (always)
  - Reflexivity: starts_with(s, s) == true

  ## Examples

      iex> PolyglotFormalisms.StringOps.starts_with("Hello World", "Hello")
      true

      iex> PolyglotFormalisms.StringOps.starts_with("Hello World", "World")
      false

      iex> PolyglotFormalisms.StringOps.starts_with("Test", "")
      true

      iex> PolyglotFormalisms.StringOps.starts_with("", "Test")
      false
  """
  @spec starts_with(String.t(), String.t()) :: boolean()
  def starts_with(s, prefix), do: String.starts_with?(s, prefix)

  @doc """
  Checks if a string ends with a given suffix.

  ## Behavioral Semantics
  - Parameters: s (string to check), suffix (suffix to match)
  - Returns: true if s ends with suffix, false otherwise

  ## Mathematical Properties
  - Empty suffix: ends_with(s, "") == true (always)
  - Reflexivity: ends_with(s, s) == true

  ## Examples

      iex> PolyglotFormalisms.StringOps.ends_with("Hello World", "World")
      true

      iex> PolyglotFormalisms.StringOps.ends_with("Hello World", "Hello")
      false

      iex> PolyglotFormalisms.StringOps.ends_with("Test", "")
      true

      iex> PolyglotFormalisms.StringOps.ends_with("", "Test")
      false
  """
  @spec ends_with(String.t(), String.t()) :: boolean()
  def ends_with(s, suffix), do: String.ends_with?(s, suffix)

  @doc """
  Converts all characters in a string to uppercase.

  ## Behavioral Semantics
  - Parameters: s (string to convert)
  - Returns: New string with all characters in uppercase

  ## Mathematical Properties
  - Idempotence: to_uppercase(to_uppercase(s)) == to_uppercase(s)

  ## Examples

      iex> PolyglotFormalisms.StringOps.to_uppercase("Hello World")
      "HELLO WORLD"

      iex> PolyglotFormalisms.StringOps.to_uppercase("test")
      "TEST"

      iex> PolyglotFormalisms.StringOps.to_uppercase("TEST")
      "TEST"

      iex> PolyglotFormalisms.StringOps.to_uppercase("café")
      "CAFÉ"
  """
  @spec to_uppercase(String.t()) :: String.t()
  def to_uppercase(s), do: String.upcase(s)

  @doc """
  Converts all characters in a string to lowercase.

  ## Behavioral Semantics
  - Parameters: s (string to convert)
  - Returns: New string with all characters in lowercase

  ## Mathematical Properties
  - Idempotence: to_lowercase(to_lowercase(s)) == to_lowercase(s)

  ## Examples

      iex> PolyglotFormalisms.StringOps.to_lowercase("Hello World")
      "hello world"

      iex> PolyglotFormalisms.StringOps.to_lowercase("TEST")
      "test"

      iex> PolyglotFormalisms.StringOps.to_lowercase("test")
      "test"

      iex> PolyglotFormalisms.StringOps.to_lowercase("CAFÉ")
      "café"
  """
  @spec to_lowercase(String.t()) :: String.t()
  def to_lowercase(s), do: String.downcase(s)

  @doc """
  Removes leading and trailing whitespace from a string.

  ## Behavioral Semantics
  - Parameters: s (string to trim)
  - Returns: New string with whitespace removed from both ends

  ## Mathematical Properties
  - Idempotence: trim(trim(s)) == trim(s)

  ## Examples

      iex> PolyglotFormalisms.StringOps.string_trim("  Hello World  ")
      "Hello World"

      iex> PolyglotFormalisms.StringOps.string_trim("\\n\\tTest\\n")
      "Test"

      iex> PolyglotFormalisms.StringOps.string_trim("NoSpaces")
      "NoSpaces"

      iex> PolyglotFormalisms.StringOps.string_trim("   ")
      ""
  """
  @spec string_trim(String.t()) :: String.t()
  def string_trim(s), do: String.trim(s)

  @doc """
  Splits a string into parts using a delimiter.

  ## Behavioral Semantics
  - Parameters: s (string to split), delimiter (separator)
  - Returns: List of substrings
  - Empty delimiter: returns list of individual graphemes

  ## Examples

      iex> PolyglotFormalisms.StringOps.string_split("a,b,c", ",")
      ["a", "b", "c"]

      iex> PolyglotFormalisms.StringOps.string_split("Hello World", " ")
      ["Hello", "World"]

      iex> PolyglotFormalisms.StringOps.string_split("test", ",")
      ["test"]

      iex> PolyglotFormalisms.StringOps.string_split("a,,b", ",")
      ["a", "", "b"]

      iex> PolyglotFormalisms.StringOps.string_split("abc", "")
      ["a", "b", "c"]
  """
  @spec string_split(String.t(), String.t()) :: [String.t()]
  def string_split(s, ""), do: String.graphemes(s)
  def string_split(s, delimiter), do: String.split(s, delimiter)

  @doc """
  Joins a list of strings with a separator.

  ## Behavioral Semantics
  - Parameters: parts (list of strings), separator (string to insert between parts)
  - Returns: Single string with parts joined by separator

  ## Mathematical Properties
  - Empty list: join([], sep) == ""
  - Single element: join([s], sep) == s

  ## Examples

      iex> PolyglotFormalisms.StringOps.string_join(["a", "b", "c"], ",")
      "a,b,c"

      iex> PolyglotFormalisms.StringOps.string_join(["Hello", "World"], " ")
      "Hello World"

      iex> PolyglotFormalisms.StringOps.string_join(["test"], ",")
      "test"

      iex> PolyglotFormalisms.StringOps.string_join([], ",")
      ""
  """
  @spec string_join([String.t()], String.t()) :: String.t()
  def string_join(parts, separator), do: Enum.join(parts, separator)

  @doc """
  Replaces all occurrences of a substring with another string.

  ## Behavioral Semantics
  - Parameters: s (source string), old (substring to replace), new (replacement)
  - Returns: New string with all occurrences replaced

  ## Edge Cases
  - old not found: returns original string unchanged
  - Empty old: returns original string unchanged

  ## Examples

      iex> PolyglotFormalisms.StringOps.string_replace("Hello World", "World", "Universe")
      "Hello Universe"

      iex> PolyglotFormalisms.StringOps.string_replace("test test", "test", "demo")
      "demo demo"

      iex> PolyglotFormalisms.StringOps.string_replace("Hello", "xyz", "abc")
      "Hello"

      iex> PolyglotFormalisms.StringOps.string_replace("Hello", "l", "")
      "Heo"

      iex> PolyglotFormalisms.StringOps.string_replace("Hello", "", "x")
      "Hello"
  """
  @spec string_replace(String.t(), String.t(), String.t()) :: String.t()
  def string_replace(s, "", _new), do: s
  def string_replace(s, old, new), do: String.replace(s, old, new)

  @doc """
  Checks if a string is empty.

  ## Behavioral Semantics
  - Parameters: s (string to check)
  - Returns: true if string has zero length, false otherwise

  ## Mathematical Properties
  - Equivalent to: length(s) == 0

  ## Examples

      iex> PolyglotFormalisms.StringOps.is_empty("")
      true

      iex> PolyglotFormalisms.StringOps.is_empty("test")
      false

      iex> PolyglotFormalisms.StringOps.is_empty(" ")
      false
  """
  @spec is_empty(String.t()) :: boolean()
  def is_empty(s), do: s == ""
end
