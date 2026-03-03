#!/bin/bash

# ─────────────────────────────────────────────────────────────
# Workflow Automation Setup
# Installs skills → Claude Code globally
# Installs rules  → Cursor globally
# ─────────────────────────────────────────────────────────────

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Workflow Automation Installer"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ─────────────────────────────────────────────────────────────
# 1. Claude Code — global skills
# ─────────────────────────────────────────────────────────────

echo "▸ Installing Claude Code skills → ~/.claude/commands/"
echo ""

CLAUDE_DIR="$HOME/.claude/commands"
mkdir -p "$CLAUDE_DIR"

SKILLS=(
  "design-thinking.md"
  "plan.md"
  "new-project.md"
  "test-debug.md"
)

for skill in "${SKILLS[@]}"; do
  src="$SCRIPT_DIR/.claude/commands/$skill"
  if [ -f "$src" ]; then
    cp "$src" "$CLAUDE_DIR/$skill"
    echo "  ✓ $skill"
  else
    echo "  ✗ $skill not found — skipping"
  fi
done

echo ""
echo "  Claude Code skills installed."
echo "  Available in any project: /design-thinking, /plan, /new-project, /test-debug"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ─────────────────────────────────────────────────────────────
# 2. Cursor — global rules
# ─────────────────────────────────────────────────────────────

echo "▸ Installing Cursor rules → ~/.cursor/rules/"
echo ""

CURSOR_DIR="$HOME/.cursor/rules"
mkdir -p "$CURSOR_DIR"

RULES=(
  "ui-design.mdc"
  "ux-design.mdc"
  "motion-design.mdc"
  "stack.mdc"
  "git.mdc"
)

for rule in "${RULES[@]}"; do
  src="$SCRIPT_DIR/.cursor/rules/$rule"
  if [ -f "$src" ]; then
    cp "$src" "$CURSOR_DIR/$rule"
    echo "  ✓ $rule"
  else
    echo "  ✗ $rule not found — skipping"
  fi
done

echo ""
echo "  Cursor rules installed."
echo "  Active globally across all projects."

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ─────────────────────────────────────────────────────────────
# 3. Verify
# ─────────────────────────────────────────────────────────────

echo "▸ Verifying installation"
echo ""

echo "  Claude Code skills (~/.claude/commands/):"
for skill in "${SKILLS[@]}"; do
  if [ -f "$CLAUDE_DIR/$skill" ]; then
    echo "    ✓ $skill"
  else
    echo "    ✗ $skill MISSING"
  fi
done

echo ""
echo "  Cursor rules (~/.cursor/rules/):"
for rule in "${RULES[@]}"; do
  if [ -f "$CURSOR_DIR/$rule" ]; then
    echo "    ✓ $rule"
  else
    echo "    ✗ $rule MISSING"
  fi
done

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Done. Restart Cursor to pick up the new rules."
echo ""
echo "  To start a new project:"
echo "    1. Open Ghostty in your projects folder"
echo "    2. Run: claude"
echo "    3. Type: /new-project"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
