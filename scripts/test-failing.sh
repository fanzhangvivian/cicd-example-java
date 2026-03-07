#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MAIN_OUT="$REPO_ROOT/out/main"
FAIL_OUT="$REPO_ROOT/out/test-failure"

"$REPO_ROOT/scripts/compile.sh"

rm -rf "$FAIL_OUT"
mkdir -p "$FAIL_OUT"

find "$REPO_ROOT/src/test-failure/java" -name '*.java' -print0 \
  | xargs -0 javac -cp "$MAIN_OUT" -d "$FAIL_OUT"

echo "Running com.example.CalculatorFailingTest"
java -cp "$MAIN_OUT:$FAIL_OUT" com.example.CalculatorFailingTest
