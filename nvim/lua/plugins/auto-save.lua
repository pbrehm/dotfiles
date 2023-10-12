return {
  {
    -- originally used pocco81/auto-save.nvim
    -- now I use this fork. I like that it does a defer_save (save after deboune on insertLeave)
    -- this is useful when adding a comment and leaving a space at the end with the intent to paste something after the space
    -- without the defer_save, as soon as you exist insert mode, the space is wiped out
    -- also more actively developed
    "okuuva/auto-save.nvim",
    opts = {
      execution_message = {
        message = function()   -- message no message on auto save
          return ("")
        end,
      },
      -- this way if we do a refactor changes in other buffers will get auto saved
      write_all_buffers = true
    }
  }
}
