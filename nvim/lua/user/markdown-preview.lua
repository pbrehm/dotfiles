local M = {
  {
    {
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      -- build = "cd app && yarn install",
      build = ":call mkdp#util#install()",
    },
  },
}
-- https://github.com/iamcco/markdown-preview.nvim/issues/199#issuecomment-699482637
-- install wsl-open
-- 'sudo npm install -g wsl-open'
-- 'sudo rm $(which xdg-open)'
-- must have appendWindowsPath = true in /etc/wsl.conf

return M
