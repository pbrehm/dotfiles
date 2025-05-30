---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
  local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
  config = vim.deepcopy(config)
  ---@cast args string[]
  config.args = function()
    local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
    return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
  end
  return config
end

local M = {
  "mfussenegger/nvim-dap",
}

M.keys = {
  {
    "<leader>dB",
    function()
      require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
    end,
    desc = "Breakpoint Condition",
  },
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
  },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
  },
  {
    "<leader>da",
    function()
      require("dap").continue { before = get_args }
    end,
    desc = "Run with Args",
  },
  {
    "<leader>dC",
    function()
      require("dap").run_to_cursor()
    end,
    desc = "Run to Cursor",
  },
  {
    "<leader>dg",
    function()
      require("dap").goto_()
    end,
    desc = "Go to line (no execute)",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
  },
  {
    "<M-i>",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
  },
  {
    "<leader>dj",
    function()
      require("dap").down()
    end,
    desc = "Down",
  },
  {
    "<leader>dk",
    function()
      require("dap").up()
    end,
    desc = "Up",
  },
  {
    "<leader>dl",
    function()
      require("dap").run_last()
    end,
    desc = "Run Last",
  },
  {
    "<leader>dO",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
  },
  {
    "<M-O>",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
  },
  {
    "<M-o>",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
  },
  {
    "<leader>dp",
    function()
      require("dap").pause()
    end,
    desc = "Pause",
  },
  -- {
  --   "<leader>dr",
  --   function()
  --     require("dap").repl.toggle()
  --   end,
  --   desc = "Toggle REPL",
  -- },
  {
    "<leader>ds",
    function()
      require("dap").session()
    end,
    desc = "Session",
  },
  {
    "<leader>dt",
    function()
      require("dap").terminate()
    end,
    desc = "Terminate",
  },
  {
    "<leader>dw",
    function()
      require("dap.ui.widgets").hover()
    end,
    desc = "Widgets",
  },
  {
    "<leader>td",
    function()
      require("neotest").run.run { strategy = "dap" }
    end,
    desc = "Debug Nearest",
  },
  {
    "<leader>tD",
    function()
      require("neotest").run.run{ suite = true, strategy = "dap" }
    end,
    desc = "Debug All Test files",
  },
}

M.dependencies = {
  -- fancy UI for the debugger
  {
    "rcarriga/nvim-dap-ui",
      -- stylua: ignore
      keys = {
        { "<leader>dr",
        function() require("dapui").open({ reset = true })
          local toggle = require "user.util.toggle"
          toggle.dap_set_state(true);
          end,
        desc = "Dap UI Reset" },

        { "<leader>du", function() require("dapui").toggle({ })
          local toggle = require "user.util.toggle"
          toggle.dap_toggle_state();
          end, desc = "Dap UI" },

            { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
          },
    -- opts = {
    --   adapters = {},
    -- },
    config = function(_, opts)
      -- setup dap config by VsCode launch.json file
      -- require("dap.ext.vscode").load_launchjs()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open {}
        local toggle = require "user.util.toggle"
        toggle.dap_set_state(true);

      end
      -- only automate the openeing of the debug adapter since the termination event is triggered many times cuasing flashing
      -- dap.listeners.before.event_terminated["dapui_config"] = function(a) -- this one gets triggered a bunch
        -- vim.notify(vim.inspect(a)) -- debugging purposes
        -- dapui.close {}
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close {}
      -- end
    end,
  },

  -- virtual text for the debugger
  {
    "theHamsta/nvim-dap-virtual-text",
    -- opts = {},
  },

  -- which key integration
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>d"] = { name = "+debug" },
      },
    },
  },

  -- mason.nvim integration
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
      },
    },
  },
}


--- Gets a path to a package in the Mason registry.
--- Prefer this to `get_package`, since the package might not always be
--- available yet and trigger errors.
---@param pkg string
---@param path? string
---@param opts? { warn?: boolean }
function M.get_pkg_path(pkg, path, opts)
  pcall(require, "mason") -- make sure Mason is loaded. Will fail when generating docs
  local root = vim.env.MASON or (vim.fn.stdpath("data") .. "/mason")
  opts = opts or {}
  opts.warn = opts.warn == nil and true or opts.warn
  path = path or ""
  local ret = root .. "/packages/" .. pkg .. "/" .. path
  if opts.warn and not vim.loop.fs_stat(ret) and not require("lazy.core.config").headless() then
    M.warn(
      ("Mason package path not found for **%s**:\n- `%s`\nYou may need to force update the package."):format(pkg, path)
    )
  end
  return ret
end

function M.config()
  local icons = require "user.resources.icons"
  vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

  for name, sign in pairs(icons.dap) do
    sign = type(sign) == "table" and sign or { sign }
    vim.fn.sign_define(
      "Dap" .. name,
      { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
    )
  end

  local dap = require "dap"
  if not dap.adapters["pwa-node"] then
    require("dap").adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = {
          M.get_pkg_path("js-debug-adapter", "/js-debug/src/dapDebugServer.js"),
          "${port}",
        },
      },
    }
  end
  for _, language in ipairs { "typescript", "javascript", "typescriptreact", "javascriptreact" } do
    if not dap.configurations[language] then
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        -- { // attach to hard coded port
        --   type = "pwa-node",
        --   request = "attach",
        --   name = "Attach to port 5858",
        --   cwd = "${workspaceFolder}",
        --   port = "5858"
        -- },
      }
    end
  end
end

return M
