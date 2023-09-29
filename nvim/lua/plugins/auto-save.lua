return {
  {
    "pocco81/auto-save.nvim",
    config = function()
      require('auto-save').setup({
        execution_message = {
          message = function() -- message no message on auto save
            return ("")
          end,
        },
      })
    end
  }
}
