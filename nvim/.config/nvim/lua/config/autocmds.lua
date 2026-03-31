-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.scss", "*.sass" },
  group = vim.api.nvim_create_augroup("AutoCompileSass", { clear = true }),
  callback = function()
    local current_file = vim.fn.expand("%:p")
    local output_file = vim.fn.expand("%:p:r") .. ".css"
    local cmd = string.format("sass %s %s", vim.fn.shellescape(current_file), vim.fn.shellescape(output_file))

    vim.fn.system(cmd)

    if vim.v.shell_error == 0 then
      vim.notify(
        "Compiled to " .. vim.fn.fnamemodify(output_file, ":t"),
        vim.log.levels.INFO,
        { title = "Sass Compiler" }
      )
    else
      vim.notify("Failed to compile Sass/SCSS", vim.log.levels.ERROR, { title = "Sass Compiler" })
    end
  end,
})
