-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Colorscheme
lvim.colorscheme = "dracula"

-- Options
vim.opt.relativenumber = true
vim.opt.autowrite = true

-- Install plugins
lvim.plugins = {
  -- Copilot
  "github/copilot.vim",

  -- Colorschemes
  "lunarvim/colorschemes",
  "Mofiqul/dracula.nvim",

  -- Python
  "AckslD/swenv.nvim",
  "stevearc/dressing.nvim",

  -- Laravel
  "EmranMR/tree-sitter-blade",

  -- Others
  "tpope/vim-sleuth",
  "tpope/vim-commentary",
}

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "all"

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "pint",
    configuration = {
      rootPatterns = { "pint.json" },
    },
  },
  {
    name = "black"
  }
}
lvim.format_on_save.enabled = true

-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "flake8",
    args = { "--ignore=E203" },
    filetypes = { "python" },
  },
  {
    command = "phpstan",
    filetypes = { "php" },
    configuration = {
      rootPatterns = { "phpstan.neon" },
    },
  }
}

-- Gitsigns
lvim.keys.normal_mode["<leader>g"] = {
  name = "+Git",
  s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
  u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
  r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
  p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
  b = { "<cmd>Gitsigns blame_line<CR>", "Blame Line" },
  n = { "<cmd>Gitsigns next_hunk<CR>", "Next Hunk" },
}

-- [Python] --------------------------------------------------------------------------------------

require("swenv").setup({
  post_set_env = function()
    vim.cmd("LspRestart")
  end,
})

lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}
--------------------------------------------------------------------------------------------------
