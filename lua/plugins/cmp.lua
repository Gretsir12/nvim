return {
  {
    "hrsh7th/nvim-cmp", -- основной автодополнитель
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",    -- LSP source
      "hrsh7th/cmp-buffer",      -- из буфера
      "hrsh7th/cmp-path",        -- пути
      "hrsh7th/cmp-cmdline",     -- автодополнение в командной строке
      "L3MON4D3/LuaSnip",        -- движок сниппетов
      "saadparwaiz1/cmp_luasnip" -- сниппеты в cmp
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
