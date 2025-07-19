return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- загружается только при входе в insert mode
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- использовать treesitter для умного завершения
    })

    -- интеграция с nvim-cmp (если используешь cmp)
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if cmp_status_ok then
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}

