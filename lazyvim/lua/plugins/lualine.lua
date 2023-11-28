-- local function session_name()
--   return require("possession.session").session_name or ""
-- end

return {
  {
    "nvim-lualine/lualine.nvim",
    -- disable clock since tmux has it
    opts = {
      options = {
        -- section_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        component_separators = "|",
      },-- █
      sections = {
        -- lualine_a = {session_name},
        -- lualine_z = { session_name },
        lualine_z = { "" },
      },
    },
  },
}
