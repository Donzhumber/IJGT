import Lake
open Lake DSL

package «AppendixBProofs» where
  leanOptions := #[⟨`pp.unicode.fun, true⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "master"

@[default_target]
lean_lib «AppendixBProofs» where
  roots := #[`AppendixBProofs]
