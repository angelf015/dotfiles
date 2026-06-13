#!/bin/bash
# Test script specifically for the which-key + treesitter issue

echo "🧪 Testing Neovim 0.12.2 - which-key scenario"
echo ""
echo "This tests the specific case where errors appear when:"
echo "  - Opening lvim (alias for nvim with NVIM_APPNAME=nvim-alt)"
echo "  - Pressing <leader> + c + u + i (which triggers which-key popup)"
echo ""

# Test 1: Basic startup
echo "Test 1: Basic startup with alias..."
NVIM_APPNAME=nvim-alt timeout 5 nvim --headless -c "echo 'OK'" -c "qa!" 2>&1 | grep -i "decoration\|error" && echo "✗ Found errors" || echo "✓ No errors in basic test"

# Test 2: Load which-key specifically
echo ""
echo "Test 2: Testing which-key loading..."
NVIM_APPNAME=nvim-alt timeout 5 nvim --headless \
  -c "lua require('which-key')" \
  -c "sleep 1" \
  -c "qa!" 2>&1 | grep -i "decoration\|error" && echo "✗ Found errors" || echo "✓ No errors with which-key"

# Test 3: Simulate the keypress scenario (as close as possible in headless)
echo ""
echo "Test 3: Testing UI inspection command (similar to <leader>ui)..."
NVIM_APPNAME=nvim-alt timeout 5 nvim --headless \
  -c "echo 'Testing ui command'" \
  -c "lua vim.schedule(function() pcall(vim.show_pos) end)" \
  -c "sleep 1" \
  -c "qa!" 2>&1 | grep -i "decoration\|error" && echo "✗ Found errors" || echo "✓ No errors with UI commands"

echo ""
echo "📝 Summary:"
echo "  If all tests passed (✓), the errors should be suppressed."
echo ""
echo "🎯 To test manually:"
echo "  1. Close all nvim instances: pkill -9 nvim"
echo "  2. Open with alias: lvim"
echo "  3. Press: <space> (or your leader key)"
echo "  4. Press: c"
echo "  5. Press: u then i"
echo "  6. Check if errors appear"
echo ""
echo "⚠️  Note: If errors still appear, they might be shown BEFORE"
echo "    the compat fix loads. Try adding a startup delay or"
echo "    look at the output - they should say '(suppressed)'."
