;; SPDX-License-Identifier: PMPL-1.0-or-later
;; ECOSYSTEM.scm - Ecosystem relationships for polyglot-formalisms-elixir
;; Media-Type: application/vnd.ecosystem+scm

(ecosystem
  (version "1.0.0")
  (name "polyglot-formalisms-elixir")
  (type "library")
  (purpose "Elixir implementation of the PolyglotFormalisms Common Library specification, providing fundamental arithmetic, comparison, logical, and string operations with proven semantic equivalence across multiple programming languages.")

  (position-in-ecosystem
    "Elixir component of the cross-language PolyglotFormalisms specification. "
    "Part of the hyperpolymath ecosystem of 500+ repositories "
    "following Rhodium Standard Repository (RSR) conventions.")

  (related-projects
    (specification "PolyglotFormalisms.jl" "Julia reference implementation and specification")
    (sibling "alib-for-rescript" "ReScript implementation")
    (sibling "polyglot_formalisms_gleam" "Gleam implementation")
    (dependency "hypatia" "Security scanning")
    (consumer "gitbot-fleet" "Quality enforcement"))

  (what-this-is
    "The Elixir implementation of the PolyglotFormalisms Common Library. "
    "Provides arithmetic, comparison, logical, and string operations "
    "that are semantically equivalent across Julia, ReScript, Gleam, and Elixir.")

  (what-this-is-not
    "This is not a standalone library — it is part of a cross-language "
    "specification ensuring behavioral equivalence across ecosystems."))
