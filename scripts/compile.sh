#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MAIN_OUT="$REPO_ROOT/out/main"

rm -rf "$MAIN_OUT"
mkdir -p "$MAIN_OUT"

find "$REPO_ROOT/src/main/java" -name '*.java' -print0 \
  | xargs -0 javac -d "$MAIN_OUT"

echo "Compilation succeeded. Classes written to $MAIN_OUT"
