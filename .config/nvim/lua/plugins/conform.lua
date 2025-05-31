
vim.g.autoformat_enabled = false

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>l",
      function()
--        require("conform").format({ async = false, quiet = true })
-- vim.defer_fn(function()
--        vim.cmd("edit!")
--      end, 1000)
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,

      mode = "n",
      desc = "[F]ormat buffer",
    },
    {
      "<leader>tf",
      function()
        vim.g.autoformat_enabled = not vim.g.autoformat_enabled
        vim.notify("Format on save: " .. (vim.g.autoformat_enabled and "Enabled" or "Disabled"))
      end,
      desc = "[T]oggle auto[F]ormat on save",
    },
  },
  opts = function()
    vim.g.autoformat_enabled = true
    return {
      notify_on_error = true,
      format_on_save = function(bufnr)
        if not vim.g.autoformat_enabled or not vim.b[bufnr].autoformat_enabled then
          return nil
        end
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end
      end,
      formatters_by_ft = {
        bash = { "shfmt" },
        blade = { "blade-formatter" },
        css = { "prettier", "prettier", stop_after_firstd = true },
        graphql = { "prettier", "prettier", stop_after_firstd = true },
        html = { "prettier", "prettier", stop_after_firstd = true },
        json = { "prettier", "prettierd", stop_after_first = true },
        jsonc = { "prettier", "prettierd", stop_after_first = true },
        lua = { "stylua" },
        markdown = { "prettier", "prettierd", stop_after_first = true },
        php = { "php" }, -- or ""prettier"" ord "php-cs-fixer"
        ruby = { "rubocop" },
        rust = { "rustfmt", lsp_format = "fallback" },
        scss = { "prettier", "prettierd", stop_after_first = true },
        sh = { "shfmt" },
        sql = { "sqlformat" }, -- from sqlparse
        svelte = { "prettier", "prettierd", stop_after_first = true },
        toml = { "taplo" }, -- fast TOML formatter
        javascript = { "eslint_d", "prettier", "prettierd" },
        javascriptreact = { "eslint_d", "prettier", "prettierd" },
        typescript = { "eslint_d", "prettier", "prettierd" },
        typescriptreact = { "eslint_d", "prettier", "prettierd" },
        vue = { "eslint_d", "prettier", "prettierd" },
        xml = { "prettier", "prettierd", stop_after_first = true },
        yaml = { "prettier", "prettierd", stop_after_first = true },
      },
    formatters = {
        prettier_php = {
        command = "./format-php.sh",
        
     --   command = "npx",
        args = {          
       --       "--no-install",
         --    "prettier",
           --             "--write",
          --   "--stdin-filepath",
             "$FILENAME",
          --   "--plugin",
          --   "./node_modules/@prettier/plugin-php",
                    },
        stdin = true,
        timeout = 10000,
        },
         php = { 
                    command = "php-cs-fixer", 
                    args = { 
                        "fix", "--rules=@PSR12",
                        "$FILENAME",
                       -- "--config=/your/path/to/config/file/[filename].php",
                        "--allow-risky=yes", -- if you have risky stuff in config, if not you dont need it.
                    }, 
                    stdin = false,
                },
cwd = function()
  return vim.fn.getcwd()
end,
    },
    }
  end,
}
