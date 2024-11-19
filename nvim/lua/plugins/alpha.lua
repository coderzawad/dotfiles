return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

 config = function ()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
[[  ███████████ █████   █████  ███                  ]],
[[ ░█░░░░░░███ ░░███   ░░███  ░░░                   ]],
[[ ░     ███░   ░███    ░███  ████  █████████████   ]],
[[      ███     ░███    ░███ ░░███ ░░███░░███░░███  ]],
[[     ███      ░░███   ███   ░███  ░███ ░███ ░███  ]],
[[   ████     █  ░░░█████░    ░███  ░███ ░███ ░███  ]],
[[  ███████████    ░░███      █████ █████░███ █████ ]],
[[ ░░░░░░░░░░░      ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],

    }

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":pwd | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
}

-- Set footer
        local function footer()
      local quotes = {
        "Coding is like humor. If you have to explain it, it’s bad.",
        "Code is like poetry – it’s useless unless it can be read.",
        "First, solve the problem. Then, write the code.",
        "It’s not a bug. It’s an undocumented feature!",
        "Hack the code, not the soul.",
        "Every line of code is a leap of faith.",
        "Where logic fails, creativity prevails.",
        "Dream in code, live in execution.",
        "Through lines of code, we find clarity.",
        "Leave no bug behind.",
        "Precision in code is peace in life.",
        "Keep calm and hack on.",
        "Evolve, or remain obsolete.",
        "Code hard, commit harder.",
        "Lines that matter, logic that resonates.",
        "An ocean of bytes, a drop of wisdom.",
        "Debugging is the art of patience, perfected.",
        "A glitch only brings you closer to mastery.",
        "Unleash the kernel within.",
        "Shift, refactor, repeat: the coder's way."

      }
      return quotes[math.random(#quotes)]
    end

    dashboard.section.footer.val = footer()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]]) 
 end,
}
