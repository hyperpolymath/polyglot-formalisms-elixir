; SPDX-License-Identifier: PMPL-1.0-or-later
;; guix.scm — GNU Guix package definition for polyglot-formalisms-elixir
;; Usage: guix shell -f guix.scm

(use-modules (guix packages)
             (guix build-system gnu)
             (guix licenses))

(package
  (name "polyglot-formalisms-elixir")
  (version "0.1.0")
  (source #f)
  (build-system gnu-build-system)
  (synopsis "polyglot-formalisms-elixir")
  (description "polyglot-formalisms-elixir — part of the hyperpolymath ecosystem.")
  (home-page "https://github.com/hyperpolymath/polyglot-formalisms-elixir")
  (license ((@@ (guix licenses) license) "PMPL-1.0-or-later"
             "https://github.com/hyperpolymath/palimpsest-license")))
