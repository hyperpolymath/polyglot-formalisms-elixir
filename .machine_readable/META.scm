;; SPDX-License-Identifier: PMPL-1.0-or-later
;; META.scm - Architectural decisions and meta-information for polyglot-formalisms-elixir
;; Media-Type: application/meta+scheme

(define-meta polyglot-formalisms-elixir
  (version "1.0.0")

  (architecture-decisions
    ((adr-001 accepted "2026-01-23"
      "Need Elixir implementation of PolyglotFormalisms specification"
      "Implement using standard Elixir/BEAM idioms with explicit type specs"
      "Enables cross-language verification with Julia, ReScript, and Gleam implementations")
    (adr-002 accepted "2026-01-23"
      "Function naming conflicts with Elixir Kernel reserved words"
      "Use logical_ prefix for boolean operations (logical_and, logical_or, logical_not)"
      "Avoids shadowing Kernel.and/2, Kernel.or/2, Kernel.not/1")
    (adr-003 accepted "2026-01-23"
      "String indexing convention"
      "Use 1-based indexing to match Julia and Idris formalisms"
      "Consistent cross-language behavior despite Elixir's 0-based String.slice")))

  (development-practices
    (code-style
      "Standard Elixir conventions with @moduledoc and @doc annotations. "
      "Explicit @spec type signatures on all public functions.")
    (security
      "Hypatia neurosymbolic scanning enabled. "
      "OpenSSF Scorecard tracking.")
    (testing
      "ExUnit test suite with property verification. "
      "Doctests for inline examples.")
    (versioning
      "Semantic versioning (semver).")
    (documentation
      "README.md for overview. "
      "STATE.scm for current state. "
      "ECOSYSTEM.scm for relationships.")
    (branching
      "Main branch protected. "
      "Feature branches for new work."))

  (design-rationale
    (why-elixir
      "BEAM runtime provides excellent concurrency and fault tolerance. "
      "Pattern matching and guard clauses enable clean implementation of formal operations.")
    (why-cross-language
      "Semantic equivalence across languages proves correctness "
      "and enables polyglot codebases to share verified behavior.")))
