local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "haydenmeade/neotest-jest",
  },
  keys = {
    {
      "<leader>tt",
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      desc = "Run File",
    },
    {
      "<leader>tT",
      function()
        require("neotest").run.run(vim.loop.cwd())
      end,
      desc = "Run All Test Files",
    },
    {
      "<leader>tr",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Nearest",
    },
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last",
    },
    {
      "<leader>ts",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Toggle Summary",
    },
    {
      "<leader>to",
      function()
        require("neotest").output.open { enter = true, auto_close = true }
      end,
      desc = "Show Output",
    },
    {
      "<leader>tO",
      function()
        require("neotest").output_panel.toggle()
      end,
      desc = "Toggle Output Panel",
    },
    {
      "<leader>tS",
      function()
        require("neotest").run.stop()
      end,
      desc = "Stop",
    },
  },
}

function M.config()
  local neotest_ns = vim.api.nvim_create_namespace "neotest"
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        -- Replace newline and tab characters with space for more compact diagnostics
        local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        return message
      end,
    },
  }, neotest_ns)

  local opts = {
    summary = {
      -- animated = true,
      -- enabled = true,
      -- expand_errors = true,
      -- follow = true,
      mappings = {
        -- attach = "a",
        -- clear_marked = "M",
        -- clear_target = "T",
        -- debug = "d",
        -- debug_marked = "D",
        expand = "e",
        expand_all = "E",
        jumpto = { "<CR>", "<2-LeftMouse>" },
        -- mark = "m",
        -- next_failed = "J",
        -- output = "o",
        -- prev_failed = "K",
        -- run = "r",
        -- run_marked = "R",
        -- short = "O",
        -- stop = "u",
        -- target = "t",
        -- watch = "w"
      },
      -- open = "botright vsplit | vertical resize 50"
    },
    -- Can be a list of adapters like what neotest expects,
    -- or a list of adapter names,
    -- or a table of adapter names, mapped to adapter configs.
    -- The adapter will then be automatically loaded with the config.
    adapters = {
      require "neotest-jest" {
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
          local file = vim.fn.expand "%:p"

          -- Check if the file path contains "/app/"
          if string.find(file, "/app/") then
            -- If the file path contains "/app/", return "/app/" as the working directory
            return string.match(file, "(.*/app/)")
          end

          -- If the file path doesn't contain "/app/", return the current working directory in Vim
          return vim.fn.getcwd()
        end,
      },
    },
    -- Example for loading neotest-go with a custom config
    -- adapters = {
    --   ["neotest-go"] = {
    --     args = { "-tags=integration" },
    --   },
    -- },
    status = { virtual_text = true },
    output = { open_on_run = true },
    quickfix = {
      open = function()
        require("trouble").open { mode = "quickfix", focus = false }
      end,
    },
    consumers = {
      trouble = function(client)
        client.listeners.results = function(adapter_id, results, partial)
          if partial then
            return
          end
          local tree = assert(client:get_position(nil, { adapter = adapter_id }))

          local failed = 0
          for pos_id, result in pairs(results) do
            if result.status == "failed" and tree:get_key(pos_id) then
              failed = failed + 1
            end
          end
          vim.schedule(function()
            local trouble = require "trouble"
            if trouble.is_open() then
              trouble.refresh()
              if failed == 0 then
                trouble.close()
              end
            end
          end)
          return {}
        end
      end,
    },
  }
  require("neotest").setup(opts)
end

return M
