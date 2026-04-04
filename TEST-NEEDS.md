# TEST-NEEDS.md — polyglot-formalisms-elixir

## CRG Grade: C — ACHIEVED 2026-04-04

> Generated 2026-03-29 by punishing audit.

## Current State

| Category     | Count | Notes |
|-------------|-------|-------|
| Unit tests   | 4     | arithmetic_test, comparison_test, logical_test, string_ops_test |
| Integration  | 0     | None |
| E2E          | 0     | None |
| Benchmarks   | 0     | None |

**Source modules:** 4 Elixir modules in lib/ (arithmetic, comparison, logical, string_ops).

## What's Missing

### P2P (Property-Based) Tests
- [ ] Arithmetic: property tests for commutativity, associativity, identity
- [ ] Comparison: property tests for transitivity, reflexivity, antisymmetry
- [ ] Logical: truth table exhaustive testing, De Morgan's laws
- [ ] String ops: arbitrary string input property tests

### E2E Tests
- [ ] Cross-module: combined arithmetic + comparison + logical expressions
- [ ] Equivalence: results match polyglot-formalisms-gleam for same inputs

### Aspect Tests
- **Security:** N/A (pure functions)
- **Performance:** No benchmarks for operation throughput
- **Concurrency:** N/A
- **Error handling:** No tests for overflow, division by zero, nil inputs, empty strings

### Build & Execution
- [ ] `mix test`

### Benchmarks Needed
- [ ] Operation throughput comparison (Elixir vs Gleam implementation)

### Self-Tests
- [ ] All formal properties verified

## Priority

**MEDIUM.** 4 modules with 4 test files = 100% file coverage, but test DEPTH matters. These are formalism implementations — they need property-based tests proving the mathematical properties they claim to implement. Error boundary testing is also absent.

## FAKE-FUZZ ALERT

- `tests/fuzz/placeholder.txt` is a scorecard placeholder inherited from rsr-template-repo — it does NOT provide real fuzz testing
- Replace with an actual fuzz harness (see rsr-template-repo/tests/fuzz/README.adoc) or remove the file
- Priority: P2 — creates false impression of fuzz coverage
