return {
  "chipsenkbeil/org-roam.nvim",
  tag = "0.1.1",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
      tag = "0.3.7",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/workspace/org",
      -- optional
      -- org_files = {
      --   "~/another_org_dir",
      --   "~/some/folder/*.org",
      --   "~/a/single/org_file.org",
      -- }
    })
  end,
}
-- return {
--   "nvim-orgmode/orgmode",
--   event = "VeryLazy",
--   ft = { "org" },
--   config = function()
--     -- Setup orgmode
--     require("orgmode").setup({
--       org_agenda_files = "~/workspace/org/**/*",
--       org_default_notes_file = "~/workspace/org/notes.org",
--     })
--
--     -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
--     -- add ~org~ to ignore_install
--     -- require('nvim-treesitter.configs').setup({
--     --   ensure_installed = 'all',
--     --   ignore_install = { 'org' },
--     -- })
--   end,
-- }
