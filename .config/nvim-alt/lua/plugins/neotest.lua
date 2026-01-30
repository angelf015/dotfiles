return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters for different languages
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-rust",
    "rouge8/neotest-rust",
  },
  config = function()
    local neotest = require("neotest")
    
    neotest.setup({
      -- General configuration
      adapters = {
        -- Python testing
        require("neotest-python")({
          -- Extra arguments for pytest
          -- For example: python_files = ["test_*.py", "*_test.py"]
          args = { "-v" },
          runner = "pytest",
        }),
        
        -- JavaScript/TypeScript testing with Jest
        require("neotest-jest")({
          -- Jest command to run
          jestCommand = "npm test --",
          -- Jest configuration file
          jestConfigFile = "jest.config.js",
          -- Environment variables
          env = { CI = true },
          -- Extra arguments for running tests
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
        
        -- Go testing
        require("neotest-go")({
          -- Extra arguments for go test
          extra_args = { "-v" },
        }),
        
        -- Rust testing
        require("neotest-rust")({
          -- Command to run rust tests
          command = "cargo test",
          -- Extra arguments
          args = { "--nocapture" },
        }),
      },
      
      -- Statusline configuration
      status = { virtual_text = true },
      
      -- Output configuration
      output = { open_on_run = true },
      
      -- Quickfix configuration
      quickfix = {
        open = function()
          vim.cmd("copen")
          vim.cmd("wincmd p")
        end,
      },
      
      -- Discovery configuration
      discovery = {
        enabled = true,
        concurrent = 8,
      },
      
      -- Running configuration
      running = {
        concurrent = true,
      },
      
      -- Diagnostic configuration
      diagnostic = {
        enabled = true,
      },
      
      -- Floating configuration
      floating = {
        border = "rounded",
        max_height = 0.8,
        max_width = 0.9,
        options = {},
      },
      
      -- Strategies configuration
      strategies = {
        integrated = {
          width = 120,
          height = 40,
        },
      },
      
      -- Icons configuration
      icons = {
        passed = "✅",
        failed = "❌",
        skipped = "⏭️",
        unknown = "❓",
        running = "🔄",
        running_animated = { "⏳", "⌛" },
        passed_animated = { "✅", "🎉" },
        failed_animated = { "❌", "💥" },
        skipped_animated = { "⏭️", "🔀" },
        unknown_animated = { "❓", "🤔" },
      },
      
      -- Summary configuration
      summary = {
        follow = true,
        open = "botright split | resize 20",
        mappings = {
          attach = "a",
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          output = "o",
          run = "r",
          short = "s",
          stop = "S",
          jumpto = "i",
        },
      },
    })
  end,
  keys = {
    -- Run tests
    { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File Tests" },
    { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Tests" },
    { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest Test" },
    { "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug Nearest Test" },
    { "<leader>tD", function() 
      require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})
    end, desc = "Debug File Tests" },
    
    -- Stop tests
    { "<leader>ts", function() require("neotest").run.stop() end, desc = "Stop Test" },
    { "<leader>tS", function() require("neotest").run.stop({ interactive = true }) end, desc = "Stop All Tests" },
    
    -- Test output
    { "<leader>to", function() require("neotest").output.open({ enter = true }) end, desc = "Show Test Output" },
    { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Test Output Panel" },
    
    -- Test summary
    { "<leader>tf", function() require("neotest").summary.toggle() end, desc = "Toggle Test Summary" },
    { "<leader>th", function() require("neotest").run.run({ suite = false }) end, desc = "Run Test Hover" },
    
    -- Jump to tests
    { "<leader>tj", function() require("neotest").jump.next({ status = "failed" }) end, desc = "Next Failed Test" },
    { "<leader>tk", function() require("neotest").jump.prev({ status = "failed" }) end, desc = "Previous Failed Test" },
    
    -- Watch mode
    { "<leader>tw", function() 
      require("neotest").watch.toggle(vim.fn.expand("%"))
    end, desc = "Toggle Watch Mode" },
  },
}