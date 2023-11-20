return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          -- default just use cwd
          -- cwd = function()
          --   return vim.fn.getcwd()
          -- end,

          -- nested repo setup
          cwd = function()
            -- Retrieve the full path of the current file being edited in Vim
            local file = vim.fn.expand("%:p")

            -- Check if the file path contains "/app/"
            if string.find(file, "/app/") then
              -- If the file path contains "/app/", return "/app/" as the working directory
              return string.match(file, "(.*/app/)")
            end

            -- If the file path doesn't contain "/app/", return the current working directory in Vim
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
    end,
  },
}
