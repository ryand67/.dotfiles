-- Native LSP Setup
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, buffer)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
		vim.keymap.set("n", "<leader>dr", vim.diagnostic.goto_next, { buffer = 0 })
		vim.keymap.set("n", "<leader>pr", vim.diagnostic.goto_prev, { buffer = 0 })
		vim.keymap.set("n", "<leader>tr","<cmd>Telescope diagnostics<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>fr","<cmd>Telescope lsp_references<cr>", { buffer = 0 })
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
end

-- snippets
require("luasnip.loaders.from_snipmate").load({ path = { "../snippets" } })

-- golang
require'lspconfig'.gopls.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- ts/s/t/jsx
require'lspconfig'.tsserver.setup{
	capabilities = capabilities,
	on_attach = on_attach
}

-- rust
require'lspconfig'.rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = on_attach
})

-- lua
require'lspconfig'.sumneko_lua.setup{
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			},
			diagnostics = {
				globals = { 'vim' }
			},
			telemetry = {
				enable = false
			}
		}
	}
}

-- sql
require'lspconfig'.sqlls.setup{
	on_attach = on_attach,
	capabilities = capabilities	
}

--settings
vim.opt.completeopt={"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})
