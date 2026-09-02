return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { flavour = "mocha" },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      image = {
        enabled = true,
        doc = {
          enabled = true,
          inline = true,
          float = true,

          max_width = 999,
          max_height = 999,
        },
      },
      notifier = { enabled = true },
      indent = { enabled = true },
      quickfile = { enabled = true },
      words = { enabled = true },
      scroll = { enabled = true },
      picker = {
        win = {
          input = {
            keys = {
              ["jk"] = { "close", mode = { "i", "n" } },
            },
          },
        },
      },

      explorer = { enabled = false },
      terminal = { enabled = false },
    },
    keys = {
      -- notifier module
      {
        "<leader>n",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification History",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
      {
        "<leader>ir",
        function()
          Snacks.image.image.clear()
          vim.cmd("edit!")
        end,
        desc = "Reload image",
      },
    },
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      local oil = require("oil")
      oil.setup({
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
        },
        float = {
          border = "rounded",
        },
      })
      vim.keymap.set("n", "<leader>0", require("oil").toggle_float)
    end,
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = { visible = true },
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "disabled",
        },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal<CR>", { silent = true })
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      auto_save = true,
      auto_restore = true,
      auto_create = true,
    },
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup({
        mappings = { i = { j = { k = "<esc>" } }, t = { j = { k = "<c-\\><c-n>" } }, v = { j = { k = "k<esc>" } } },
        timeout = 200,
      })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = { size = 20, direction = "horizontal" },
    config = function()
      require("toggleterm").setup({
        size = 20,
        hide_numbers = true,
        direction = "horizontal",
        start_in_insert = true,
        persist_mode = false,
      })
      local map = vim.keymap.set
      for i = 1, 4 do
        map(
          "n",
          "<leader>" .. i,
          "<Cmd>" .. i .. "ToggleTerm direction=horizontal<CR>",
          { silent = true, desc = "Terminal " .. i }
        )
      end
      map(
        { "n", "i", "t" },
        "<C-\\>",
        "<Cmd>5ToggleTerm direction=float<CR>",
        { silent = true, desc = "Floating Terminal" }
      )
    end,
  },
  { "sphamba/smear-cursor.nvim", opts = {} },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "python",
          "lua",
          "javascript",
          "cpp",
          "vim",
          "vimdoc",
          "yaml",
          "markdown",
          "markdown_inline",
        },
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
