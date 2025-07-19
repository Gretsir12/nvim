return {
  -- LSPConfig
  {
    "neovim/nvim-lspconfig",
  },

  -- Mason: менеджер LSP серверов
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-LSPConfig: мост между mason и lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = { "clangd", "lua_ls", "pyright" },
      })

      local lspconfig = require("lspconfig")

	  local servers = { "clangd", "lua_ls", "pyright" }
		for _, server in ipairs(servers) do
			lspconfig[server].setup({})
		end
	  end,
  },
}

