# SPDX-License-Identifier: PMPL-1.0-or-later
# Benchee benchmarks for PolyglotFormalisms operations.
#
# Run with:   mix run bench/formalism_bench.exs
#
# Provides baseline throughput figures for all four formalism modules.
# Use to detect regressions and compare against sibling implementations
# (polyglot-formalisms-gleam, polyglot-formalisms-julia).

alias PolyglotFormalisms.Arithmetic
alias PolyglotFormalisms.Comparison
alias PolyglotFormalisms.Logical
alias PolyglotFormalisms.StringOps

# Pre-built values to avoid measuring setup in inner loops.
large_int    = 999_999_999
small_float  = 3.14159
long_string  = String.duplicate("hello world ", 100)
short_string = "hello"

Benchee.run(
  %{
    # --- Arithmetic benchmarks ---
    "Arithmetic.add (integers)" => fn ->
      Arithmetic.add(large_int, large_int)
    end,

    "Arithmetic.add (floats)" => fn ->
      Arithmetic.add(small_float, small_float)
    end,

    "Arithmetic.subtract (integers)" => fn ->
      Arithmetic.subtract(large_int, 1)
    end,

    "Arithmetic.multiply (integers)" => fn ->
      Arithmetic.multiply(large_int, 2)
    end,

    "Arithmetic.divide (integers)" => fn ->
      Arithmetic.divide(large_int, 7)
    end,

    "Arithmetic.modulo" => fn ->
      Arithmetic.modulo(large_int, 97)
    end,

    # --- Comparison benchmarks ---
    "Comparison.less_than (true)" => fn ->
      Comparison.less_than(1, large_int)
    end,

    "Comparison.less_than (false)" => fn ->
      Comparison.less_than(large_int, 1)
    end,

    "Comparison.equal (true)" => fn ->
      Comparison.equal(large_int, large_int)
    end,

    "Comparison.equal (false)" => fn ->
      Comparison.equal(large_int, large_int - 1)
    end,

    "Comparison.greater_equal" => fn ->
      Comparison.greater_equal(large_int, large_int)
    end,

    # --- Logical benchmarks ---
    "Logical.logical_and (true, true)" => fn ->
      Logical.logical_and(true, true)
    end,

    "Logical.logical_and (false, true)" => fn ->
      Logical.logical_and(false, true)
    end,

    "Logical.logical_or (false, false)" => fn ->
      Logical.logical_or(false, false)
    end,

    "Logical.logical_not" => fn ->
      Logical.logical_not(true)
    end,

    # --- StringOps benchmarks ---
    "StringOps.concat (short strings)" => fn ->
      StringOps.concat(short_string, short_string)
    end,

    "StringOps.concat (long strings, 1200 chars each)" => fn ->
      StringOps.concat(long_string, long_string)
    end,

    "StringOps.string_length (short)" => fn ->
      StringOps.string_length(short_string)
    end,

    "StringOps.string_length (long, 1200 chars)" => fn ->
      StringOps.string_length(long_string)
    end
  },
  time: 3,
  memory_time: 1,
  warmup: 1,
  print: [fast_warning: false],
  formatters: [
    Benchee.Formatters.Console
  ]
)
