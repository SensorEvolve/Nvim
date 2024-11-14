return {
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      -- Basic setup with default mappings
      require("leap").create_default_mappings()

      -- Customize highlighting
      -- Backdrop highlighting (greying out the search area)
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })

      -- Match highlighting (Lightspeed-style)
      vim.api.nvim_set_hl(0, "LeapMatch", {
        fg = "white",
        bold = true,
        nocombine = true,
      })

      -- Optional configurations
      require("leap").opts = {
        -- Disable auto-jumping to the first match
        -- safe_labels = {},

        -- Case sensitivity
        case_sensitive = false,

        -- Equivalence classes configuration (for non-English text)
        -- Example: Group similar characters for easier targeting
        equivalence_classes = {
          " \t\r\n", -- Consider all whitespace equivalent
          "aäàáâãā",
          "eëéèêē",
          "iïīíìîı",
          "oöōóòô",
          "uüūúùû",
        },

        -- Labels that will be used for targets
        labels = "sfnjklhodweimbuyvrgtaqpcxz",

        -- Set to empty table to disable label preview
        -- preview_filter = function() return false end,
      }

      -- Optional: set up better window navigation
      vim.keymap.set("n", "<C-f>", function()
        require("leap").leap({ target_windows = { vim.fn.win_getid(vim.fn.winnr("h")) } })
      end, { desc = "Leap to left window" })

      vim.keymap.set("n", "<S-f>", function()
        require("leap").leap({ target_windows = { vim.fn.win_getid(vim.fn.winnr("l")) } })
      end, { desc = "Leap to right window" })

      -- You can also add custom autocommands for more control
      vim.api.nvim_create_autocmd("User", {
        pattern = "LeapEnter",
        callback = function()
          -- Actions to perform when leap starts
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "LeapLeave",
        callback = function()
          -- Actions to perform when leap ends
        end,
      })
    end,
  },
}
