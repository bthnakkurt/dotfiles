---@diagnostic disable: undefined-global
return{

{
   'nvim-treesitter/nvim-treesitter'
},

{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
},

{

   'mong8se/actually.nvim',
   dependencies = 'stevearc/dressing.nvim',
},

{
  'folke/which-key.nvim',
  event = "VeryLazy",
  opts = {
  },
},

{
   'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = true,
      insert_at_start = false,
    },
  },

{
     "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
       window = {
      width = 20,
      auto_expand_width=true,}
    })

  end,
  }


}
