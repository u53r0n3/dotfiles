
-- ~/.config/nvim/lua/plugins/bufferline.lua

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        indicator = {
          style = 'icon',
          icon = '▎',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          }
        },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "slant",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'id',
      }
    })

    -- Keybindings
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

--    keymap("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", opts)
--    keymap("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", opts)
    keymap("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
    keymap("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Delete buffer" })
    keymap("n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
    keymap("n", "<leader>bl", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
    keymap("n", "<leader>bh", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
  end
}
