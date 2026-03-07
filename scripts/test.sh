#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MAIN_OUT="$REPO_ROOT/out/main"
TEST_OUT="$REPO_ROOT/out/test"

"$REPO_ROOT/scripts/compile.sh"

rm -rf "$TEST_OUT"
mkdir -p "$TEST_OUT"

find "$REPO_ROOT/src/test/java" -name '*.java' -print0 \
  | xargs -0 javac -cp "$MAIN_OUT" -d "$TEST_OUT"

while IFS= read -r class_name; do
  echo "Running $class_name"
  java -cp "$MAIN_OUT:$TEST_OUT" "$class_name"
done < <(find "$TEST_OUT" -name '*Test.class' \
  | sed "s|$TEST_OUT/||" \
  | sed 's|/|.|g' \
  | sed 's|\.class$||' \
  | sort)

echo "All test classes completed successfully."
