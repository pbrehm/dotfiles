local M = {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    -- vim.cmd "highlight DashboardHeader guifg=#FF9E3B"
    vim.cmd "highlight DashboardHeader guifg=#dcd7ba"
    -- vim.cmd "highlight DashboardHeader guifg=#7fb4ca"

    -- vim.cmd "highlight DashboardHeader guifg=#C0A36E"

    -- vim.cmd "highlight DashboardHeader guifg=#e6c384"
    -- vim.cmd "highlight DashboardHeader guifg=#7e9cd8"
    local logo = string.rep("\n", 8) .. require("user.resources.dashboard-logos").logoGhost .. "\n\n"

    local lazygit = 'lua require("user.util.lazyterm.terminal").open({ "lazygit" })'
    local viewConfig = [[require("telescope.builtin")["find_files"]({ cwd = vim.fn.stdpath("config") })]]
    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            { action = "ene | startinsert",                 desc = " New file",        icon = " ", key = "n" },
            { action = "Grapple toggle_tags",               desc = " Marked files",    icon = "󱡅 ", key = "m" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = lazygit,                             desc = " Lazy Git",        icon = " ", key = "g" },
            { action = "Lazy",                              desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = viewConfig,                          desc = " Config",          icon = " ", key = "c" },
            { action = "qa",                                desc = " Quit",            icon = " ", key = "q" },
          },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}

return M
