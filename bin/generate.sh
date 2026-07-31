#!/usr/bin/env bash
#
# Generate Fluent Cart Pro stubs from the source directory.
#
# This script generates type declaration stubs for the Fluent Cart Pro plugin,
# creating two separate stub files:
# 1. A main stub file with functions, classes, interfaces, and traits
# 2. A constants stub file with only constants
#

# Exit immediately if a command exits with a non-zero status
set -e

# Error handling function
function error_exit {
    echo "ERROR: $1" >&2
    exit 1
}

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
HEADER=$'/**\n * Generated stub declarations for Fluent Cart Pro.\n * @see https://fluentcart.com/pricing/\n * @see https://github.com/mralaminahamed/phpstan-fluent-cart-pro-stubs\n */'
FILE="$ROOT_DIR/fluent-cart-pro-stubs.stub"
FILE_CONSTANTS="$ROOT_DIR/fluent-cart-pro-constants-stubs.stub"
GENERATOR_BIN="$ROOT_DIR/vendor/bin/generate-stubs"
FINDER_FILE="$ROOT_DIR/configs/finder.php"

# Validate requirements
echo "Validating requirements..."
[[ -x "$GENERATOR_BIN" ]] || error_exit "Stub generator not found or not executable at $GENERATOR_BIN"
[[ -f "$FINDER_FILE" ]] || error_exit "Finder configuration not found at $FINDER_FILE"
# Pro is a paid plugin: there is no WordPress.org endpoint to download it from, so the
# source has to be supplied by someone with a licence. Unpack it at source/fluent-cart-pro.
[[ -d "$ROOT_DIR/source/fluent-cart-pro" ]] || error_exit "Fluent Cart Pro source not found. Unpack a licensed copy at $ROOT_DIR/source/fluent-cart-pro (see README)."

# Ensure stub files exist
touch "$FILE" 2>/dev/null || error_exit "Cannot create main stub file at $FILE"
touch "$FILE_CONSTANTS" 2>/dev/null || error_exit "Cannot create constants stub file at $FILE_CONSTANTS"

echo "Generating main stubs file..."
# Generate main stubs (excluding constants)
"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$FINDER_FILE" \
    --header="$HEADER" \
    --functions \
    --classes \
    --interfaces \
    --traits \
    --out="$FILE" || error_exit "Failed to generate main stubs"

echo "Generating constants stubs file..."
# Generate constants stubs (excluding functions, classes, interfaces, traits, and globals)
"$GENERATOR_BIN" \
    --include-inaccessible-class-nodes \
    --force \
    --finder="$FINDER_FILE" \
    --header="$HEADER" \
    --constants \
    --out="$FILE_CONSTANTS" || error_exit "Failed to generate constants stubs"

echo "Stub generation completed successfully."
echo "Main stubs file: $FILE"
echo "Constants stubs file: $FILE_CONSTANTS"
