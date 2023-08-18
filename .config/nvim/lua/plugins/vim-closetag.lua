return {
  "alvan/vim-closetag",
  config = function()
    -- autoclose tag
    -- enable plugin for file extensions
    vim.g["closetag_filenames"] = "*.html,*.erb"
  end,
}
