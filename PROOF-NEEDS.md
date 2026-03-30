# PROOF-NEEDS.md — polyglot-formalisms-elixir

## Current State

- **src/abi/*.idr**: NO
- **Dangerous patterns**: 0
- **LOC**: ~1,900 (Elixir)
- **ABI layer**: Missing

## What Needs Proving

| Component | What | Why |
|-----------|------|-----|
| Arithmetic operations | Operations satisfy expected algebraic laws (commutativity, associativity, etc.) | Common library must be correct — downstream consumers depend on it |
| Comparison operations | Comparison is a total order (reflexive, antisymmetric, transitive) | Broken comparisons cause sorting bugs and data corruption |
| Logical operations | Boolean algebra laws hold | Incorrect logic propagates to all consumers |
| String operations | String functions preserve encoding and length invariants | Encoding bugs cause data corruption |

## Recommended Prover

**Idris2** — Create `src/abi/` with algebraic law proofs. These are textbook algebraic proofs well-suited to dependent types. Alternatively, Elixir property-based testing with StreamData as a lighter-weight approach.

## Priority

**LOW** — Small common library. The operations are straightforward, but as a shared library, correctness matters. Property-based testing would be a pragmatic first step before full formal proofs.
