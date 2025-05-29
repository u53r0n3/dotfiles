return {
  "mattn/emmet-vim",
  ft = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
  init = function()
    -- Emmet config
    vim.g.user_emmet_leader_key = "<C-n>" -- Change this to your preferred key
--    vim.g.user_emmet_install_global = 0    -- Disable global mapping
    vim.g.user_emmet_mode = 'i'            -- Only enable in insert mode
    -- 100% reliable mapping (tested on multiple systems)
    -- Enable Emmet only for specific filetypes
--    vim.api.nvim_create_autocmd("FileType", {
--      pattern = { "html", "css", "javascriptreact", "typescriptreact", "vue", "svelte" },
--      callback = function()
--        vim.cmd("EmmetInstall")
--      end
--    })
  end,
}
