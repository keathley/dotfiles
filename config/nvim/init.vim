set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Setup the builtin LS client.
" You can read more about it here: https://neovim.discourse.group/t/how-to-use-and-contribute-to-neovims-built-in-language-server-client-and-nvim-lspconfig/30

lua << EOL
local lspconfig = require("lspconfig")
local completion = require("completion")

-- You'll need to install the LS somewhere and you can set the path here.
-- I use the cache dir because the lspconfig plugin used to have auto installers
-- but they removed it because it was too much maintenance.
-- It should be as easy as cloning and running these instructions
-- https://github.com/elixir-lsp/elixir-ls#building-and-running
local path_to_elixirls = vim.fn.expand("~/.cache/nvim/lspconfig/elixirls/elixir-ls/release/language_server.sh")

lspconfig.elixirls.setup(
  {
    on_attach = function()
      completion.on_attach()
      -- format the file. If the LS doesn't do formatting its a noop
      vim.api.nvim_set_keymap("n", "df", "<cmd>lua vim.lsp.buf.formatting()<cr>", {noremap = true, silent = true})
      -- Show the current diagnostic in a floating window
      -- Helpful when the error is too long and falls off the edge of the buffer.
      vim.api.nvim_set_keymap(
        "n",
        "gd",
        "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>",
        {noremap = true, silent = true}
      )
      -- Go to definition.
      vim.api.nvim_set_keymap("n", "dt", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap = true, silent = true})
      -- Shows documentation for the given function or module. You should be able to scroll with the
      -- mouse if it doesn't fit in the floating window
      vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", {noremap = true, silent = true})
    end,
    settings = {
      elixirLS = {
        -- Turn off dialyzer. This disables some LS features, I think workspace symbols
        dialyzerEnabled = false,
        -- Turn off automatic dep fetching. Sometimes it get's stuck, easier to just run it myself. They might be making the default `false` soon.
        fetchDeps = false
      }
    },
    cmd = {path_to_elixirls}
  }
)
EOL
