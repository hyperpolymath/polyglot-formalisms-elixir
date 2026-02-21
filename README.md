# PolyglotFormalisms.Elixir

Elixir implementation of the PolyglotFormalisms Common Library specification.

## Overview

This package provides Elixir implementations of fundamental operations defined in the PolyglotFormalisms specification, enabling semantic equivalence verification across multiple programming languages.

## Modules

### Arithmetic
- `add(a, b)` - Addition
- `subtract(a, b)` - Subtraction
- `multiply(a, b)` - Multiplication
- `divide(a, b)` - Division
- `modulo(a, b)` - Modulo (integer operation)

### Comparison
- `less_than(a, b)` - Strict less than
- `greater_than(a, b)` - Strict greater than
- `equal(a, b)` - Equality
- `not_equal(a, b)` - Inequality
- `less_equal(a, b)` - Less than or equal
- `greater_equal(a, b)` - Greater than or equal

### Logical
- `logical_and(a, b)` - Logical conjunction
- `logical_or(a, b)` - Logical disjunction
- `logical_not(a)` - Logical negation

**Note:** Function names include `logical_` prefix to avoid conflicts with Elixir's Kernel reserved keywords.

## Installation

Add this package to your `mix.exs` dependencies:

```elixir
def deps do
  [
    {:polyglot_formalisms, "~> 0.2.0"}
  ]
end
```

## Usage

```elixir
alias PolyglotFormalisms.{Arithmetic, Comparison, Logical}

# Arithmetic
sum = Arithmetic.add(2.0, 3.0)
product = Arithmetic.multiply(4.0, 5.0)

# Comparison
is_less = Comparison.less_than(2.0, 3.0)
is_equal = Comparison.equal(5.0, 5.0)

# Logical
both_true = Logical.logical_and(true, true)
either_true = Logical.logical_or(false, true)
negated = Logical.logical_not(false)
```

## Mathematical Properties

All implementations preserve the mathematical properties defined in the PolyglotFormalisms specification:

### Arithmetic Properties
- Commutativity (for add, multiply)
- Associativity (for add, multiply)
- Identity elements
- Distributivity

### Comparison Properties
- Transitivity
- Reflexivity
- Symmetry
- Asymmetry

### Logical Properties
- Commutativity
- Associativity
- Distributivity
- De Morgan's laws
- Excluded middle
- Non-contradiction

## Behavioral Semantics

This implementation follows BEAM/Erlang semantics:

### Float Operations
- Division by zero returns `Infinity` or `-Infinity`
- NaN propagation follows IEEE 754
- Comparison with NaN returns `false`

### Integer Operations
- Modulo uses Erlang `rem` operator semantics
- Modulo by zero raises `ArithmeticError` (BEAM behavior)

### Boolean Operations
- Short-circuit evaluation for `and` and `or`
- Eager evaluation for wrapper functions

## Testing

Run the test suite:

```bash
mix test
```

Run tests with documentation tests:

```bash
mix test --include doctest
```

## Cross-Language Verification

This Elixir implementation is semantically equivalent to:
- Julia implementation (PolyglotFormalisms.jl)
- ReScript implementation (alib-for-rescript)
- Gleam implementation (polyglot_formalisms_gleam)

Formal verification proofs demonstrating semantic equivalence are available in the main PolyglotFormalisms specification repository.

## Documentation

Generate documentation:

```bash
mix docs
```

## License

PMPL-1.0-or-later (Palimpsest Meta-Public License)

## Related Projects

- [PolyglotFormalisms.jl](https://github.com/hyperpolymath/PolyglotFormalisms.jl) - Julia reference implementation
- [alib-for-rescript](https://github.com/hyperpolymath/alib-for-rescript) - ReScript implementation
- [polyglot_formalisms_gleam](https://github.com/hyperpolymath/polyglot_formalisms_gleam) - Gleam implementation


## Architecture

See [TOPOLOGY.md](TOPOLOGY.md) for a visual architecture map and completion dashboard.
