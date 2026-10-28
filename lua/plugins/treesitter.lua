return {
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.templ",
        callback = function(args)
          vim.system({ "templ", "generate", args.file }, { text = true }, function(res)
            if res.code ~= 0 then
              vim.notify("templ generate failed: " .. (res.stderr or "?"), vim.log.levels.ERROR)
            end
          end)
        end,
      })
    end,
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "css",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "typescript",
        "vim",
        "yaml",
        "terraform",
        "hcl",
        "cpp",
        "c_sharp",
        "templ",
      })
    end,
  },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod", "templ" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
