vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	-- packer.nvim
	use "wbthomason/packer.nvim"

	-- vim-airline
	use "vim-airline/vim-airline"
	use "vim-airline/vim-airline-themes"

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

end)
