==============================================================================
Lean 4 Replication Guide for JET Supplement (Appendix B)
==============================================================================

This directory contains the replication package for the formal proofs and Lean
verification of the paper:
"Identifying Rational Types in Unknown Environments" (JET).

The folder structure is:
- Appendix_B_Proofs.tex : The LaTeX source file for the Appendix.
- replicate.sh          : Bash script to run the compilation of the Lean proofs.
- lean/                 : The Lean 4 project folder.
  - AppendixBProofs.lean: The main Lean proof file.
  - lakefile.lean       : Lake project configuration.
  - lean-toolchain      : Specifies the target Lean version.
  - lake-manifest.json  : Pinned package dependencies (including Mathlib).

------------------------------------------------------------------------------
Prerequisites
------------------------------------------------------------------------------

To run the verification, you need to have elan (the Lean version manager) and
Lean 4 installed.

1. Install elan:
   Follow the instructions at: https://github.com/leanprover/elan
   Usually, you can install it via:
   curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

2. Lean and Lake will be automatically fetched and configured based on the
   lean-toolchain file (v4.31.0-rc1) when running the build.

------------------------------------------------------------------------------
Running the Replication
------------------------------------------------------------------------------

Run the replication script from the root of this folder:

    ./replicate.sh

This script will:
- Change directory to `lean/`
- Download mathlib (on first run; network connection required)
- Build the Lean proof file: `AppendixBProofs.lean`
- Write the detailed compilation log to `lean/build.log`

The first build will fetch mathlib and may take 15-45 minutes. Subsequent builds
will be instantaneous.

------------------------------------------------------------------------------
Verification Status
------------------------------------------------------------------------------

The compilation log `lean/build.log` should end without errors, verifying that
all formal proofs in `AppendixBProofs.lean` have been successfully verified
by the Lean 4 compiler against Mathlib.
