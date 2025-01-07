return {
  -- Catppuccin theme setup
  {
    "folke/tokyonight.nvim",
    lazy = false,
    name = "tokyonight",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end,
  },
  -- Lualine status bar
  {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight', -- Set the lualine theme to catppuccin
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          icons_enabled = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        }
      }
    end
  }
}


