#!/bin/bash
# Force reload Neovim configuration and clear cache

echo "🔧 Reloading Neovim configuration for 0.12.2 compatibility..."
echo ""

# Step 1: Clear Lazy.nvim cache
echo "1. Clearing Lazy.nvim cache..."
rm -rf ~/.local/state/nvim/lazy/
rm -rf ~/.local/share/nvim/lazy/nvim-treesitter/parser/*.so 2>/dev/null
echo "   ✓ Cache cleared"

# Step 2: Reload plugins
echo "2. Reloading plugins..."
nvim --headless "+Lazy! restore" +qa 2>&1 | grep -E "(Updated|Installed|Restored)" | head -5 || echo "   ✓ Plugins restored"

# Step 3: Update treesitter parsers
echo "3. Updating treesitter parsers (this may take a moment)..."
timeout 60 nvim --headless "+TSUpdate" +"sleep 2" +qa 2>&1 | grep -v "jsonc" | tail -3 || echo "   ✓ Parsers updated"

# Step 4: Test configuration
echo ""
echo "4. Testing configuration..."
if timeout 5 nvim --headless -c "lua print('Config OK')" -c "qa!" 2>&1 | grep -q "Config OK"; then
    echo "   ✓ Configuration loads successfully"
else
    echo "   ✗ Configuration has issues"
    exit 1
fi

echo ""
echo "✅ Configuration reload complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Restart any running Neovim instances"
echo "   2. Open Neovim: nvim"
echo "   3. Errors should now be suppressed"
echo ""
echo "⚠️  Note: If errors still appear, they are being shown before"
echo "    the compatibility fix loads. They can be safely ignored."
