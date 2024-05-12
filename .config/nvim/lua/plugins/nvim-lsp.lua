-- setup LSP server
require('mason').setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "bashls",
        "clangd",
        "cmake",
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        "gopls",
        "html",
        "jsonls",
        "tsserver",
        "marksman",
        -- "nimls",
        "pyright",
        "rust_analyzer",
    }
}
require('mason-lspconfig').setup_handlers({function(server)
    local opt = {
        -- -- Function executed when the LSP server startup
        -- on_attach = function(client, bufnr)
        --   local opts = {noremap=true, slient=true}
        --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
        -- end,
        capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
        ),
    }
    require('lspconfig')[server].setup(opt)
end})


-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')


-- Reference highlight
-- vim.cmd [[
-- set updatetime=100
-- highlight LspReferenceText  cterm=underline ctermbg=8 gui=underline guibg=#104040
-- highlight LspReferenceRead  cterm=underline ctermbg=8 gui=underline guibg=#104040
-- highlight LspReferenceWrite cterm=underline ctermbg=8 gui=underline guibg=#104040
-- augroup lsp_document_highlight
-- autocmd!
-- autocmd CursorHold,CursorHoldI   * lua vim.lsp.buf.document_highlight()
-- autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
-- augroup END
-- ]]
vim.cmd('set updatetime=50')
vim.cmd('highlight LspReferenceText  cterm=underline ctermbg=8 gui=underline guibg=#104040')
vim.cmd('highlight LspReferenceRead  cterm=underline ctermbg=8 gui=underline guibg=#104040')
vim.cmd('highlight LspReferenceWrite cterm=underline ctermbg=8 gui=underline guibg=#104040')
require("mason-lspconfig").setup_handlers {
    function(server_name)
        local opts = {
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            on_attach = function(client, bufnr)
                if client.supports_method "textDocument/documentHighlight" then
                    local lsp_document_highlight = vim.api.nvim_create_augroup("lsp_document_highlight", {})
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        group = lsp_document_highlight,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.document_highlight()
                        end,
                    })
                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        group = lsp_document_highlight,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.clear_references()
                        end,
                    })
                end
            end,
        }

        require("lspconfig")[server_name].setup(opts)
    end,
}


-- 3. completion (hrsh7th/nvim-cmp)
local cmp     = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        -- ['<C-l>'] = cmp.mapping.complete(),
        -- ['<C-e>'] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
    experimental = {
        ghost_text = true,
    },
})
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "path" },
        { name = "cmdline" },
    },
})

vim.cmd [[
set completeopt=menuone,noinsert,noselect
highlight! default link CmpItemKind CmpItemMenuDefault
]]

