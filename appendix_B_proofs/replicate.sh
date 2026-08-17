#!/bin/bash
# ==============================================================================
# Lean 4 Replication Script for JET Supplement (Appendix B)
# ==============================================================================
set -e

# Change directory to the lean project directory
LEAN_DIR="$(dirname "$0")/lean"
cd "$LEAN_DIR"

echo "======================================================================"
echo "Starting Lean 4 project build..."
echo "Toolchain: $(cat lean-toolchain)"
echo "Logging all outputs to: $LEAN_DIR/build.log"
echo "======================================================================"

# Run lake build and log both stdout and stderr
lake build > build.log 2>&1

echo "Build finished successfully."
echo "You can check the detailed log in lean/build.log"
echo "======================================================================"
