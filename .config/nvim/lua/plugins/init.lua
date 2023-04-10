vim.cmd [[packadd packer.nvim]]

require("packer").startup(function()
	-- packer.nvim
	use "wbthomason/packer.nvim"

	-- vim-airline
	use "vim-airline/vim-airline"
	use "vim-airline/vim-airline-themes"
	use "ryanoasis/vim-devicons"

	-- nvim-lsp
	use "neovim/nvim-lspconfig"
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/vim-vsnip"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-cmdline"

	-- invader-vim
	use "mattn/invader-vim"
end)

-- Plugin Settings
require("plugins/vim-airline")
require("plugins/nvim-lsp")

