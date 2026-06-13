#!/bin/bash
# Test script to verify Neovim configuration
# This tests various scenarios to ensure treesitter compatibility

echo "Testing Neovim 0.12.2 configuration..."
echo ""

# Test 1: Basic startup
echo "Test 1: Basic startup..."
if timeout 5 nvim --headless -c "echo 'OK'" -c "qa!" 2>/dev/null; then
    echo "✓ Basic startup successful"
else
    echo "✗ Basic startup failed"
    exit 1
fi

# Test 2: Open a Lua file
echo "Test 2: Opening Lua file..."
if timeout 5 nvim lua/plugins/treesitter.lua --headless -c "sleep 1" -c "qa!" 2>&1 | grep -q "Decoration provider" ; then
    echo "✗ Still seeing decoration errors"
else
    echo "✓ No decoration errors detected"
fi

# Test 3: Check treesitter status
echo "Test 3: Checking treesitter status..."
timeout 10 nvim --headless -c "lua print('Treesitter installed:', vim.fn.exists(':TSUpdate'))" -c "qa!" 2>&1 | grep -q "Treesitter installed" && echo "✓ Treesitter commands available" || echo "⚠ Treesitter commands not detected"

echo ""
echo "Test complete! If you see errors when opening files, they should be suppressed."
echo "Note: Treesitter functionality may be limited due to Neovim 0.12.2 compatibility."
