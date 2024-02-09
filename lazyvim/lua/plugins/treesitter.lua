return {
  "nvim-treesitter/nvim-treesitter",
  commit = "364b86ec8ea88e4a77ba676b93fb10829d6a9cb3",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
    end
  end,
}
