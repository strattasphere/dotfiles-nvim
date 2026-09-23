return {
  "snacks.nvim",
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    toggle = { map = LazyVim.safe_keymap_set },
    words = { enabled = true },
    picker = {
      hidden = true, -- Show hidden files (dotfiles) by default
      ignored = true, -- Show files ignored by .gitignore by default
      sources = {
        files = { hidden = true },
        grep = { hidden = true },
        explorer = { hidden = true },
      },
    },
    terminal = {
      -- Float by default by providing a cmd or configuring win style
      win = {
        style = "terminal",
        -- Floating window settings
        width = math.ceil(vim.o.columns * 0.8), -- 80% of screen width
        height = math.ceil(vim.o.lines * 0.7), -- 70% of screen height
        border = "rounded",
        title = "Terminal",
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>n", function()
      if Snacks.config.picker and Snacks.config.picker.enabled then
        Snacks.picker.notifications()
      else
        Snacks.notifier.show_history()
      end
    end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    -- Terminal keymaps
    { "<leader>ft", function() Snacks.terminal.open() end, desc = "Floating Terminal" },
    { "<C-t>", function() Snacks.terminal.toggle() end, desc = "Toggle Terminal", mode = { "n", "t" } },
  },
}
