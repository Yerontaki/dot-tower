return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "whoissethdaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason.setup()

      mason_tool_installer.setup({
        ensure_installed = {
          "prettier",
          "goimports",
          "gofumpt",
          "stylua",
        },
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "gopls",
          "html",
          "cssls",
          "ts_ls",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["gopls"] = function()
            require("lspconfig").gopls.setup({
              capabilities = capabilities,
              settings = {
                gopls = {
                  analyze = { unusedparams = true },
                  staticcheck = true,
                  gofumpt = true,
                },
              },
            })
          end,
        },
      })

      local cmp = require("cmp")
      vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#89b4fa" })
      vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "NONE" })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }),
      })
    end,
  },
}
