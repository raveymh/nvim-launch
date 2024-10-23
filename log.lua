return
{
  [1] = {
    ["opts"] = {
      ["position"] = center,
      ["hl"] = SpecialComment,
    },
    ["type"] = text,
    ["val"] = "Quick links",
  },
  [2] = {
    ["val"] = 1,
    ["type"] = padding,
  },
  [3] = {
    ["on_press"] = function: 0x02c6fc6e7478,
    ["type"] = button,
    ["val"] = "New file",
    ["opts"] = {
      ["shortcut"] = "e",
      ["hl_shortcut"] = Keyword,
      ["align_shortcut"] = right,
      ["position"] = center,
      ["keymap"] = {
        [1] = "n",
        [2] = "e",
        [3] = "<cmd>ene<CR>",
        [4] = {
          ["nowait"] = true,
          ["noremap"] = true,
          ["silent"] = true,
        },
      },
      ["width"] = 50,
      ["cursor"] = 3,
    },
  },
  [4] = {
    ["on_press"] = function: 0x02c6fc6e76e8,
    ["type"] = button,
    ["val"] = "Find file",
    ["opts"] = {
      ["shortcut"] = "SPC f f",
      ["hl_shortcut"] = Keyword,
      ["align_shortcut"] = right,
      ["position"] = center,
      ["width"] = 50,
      ["cursor"] = 3,
    },
  },
  [5] = {
    ["on_press"] = function: 0x02c6fc6e7958,
    ["type"] = button,
    ["val"] = "Live grep",
    ["opts"] = {
      ["shortcut"] = "SPC f g",
      ["hl_shortcut"] = Keyword,
      ["align_shortcut"] = right,
      ["position"] = center,
      ["width"] = 50,
      ["cursor"] = 3,
    },
  },
  [6] = {
    ["on_press"] = function: 0x02c6fc6e7d00,
    ["type"] = button,
    ["val"] = "Configuration",
    ["opts"] = {
      ["shortcut"] = "c",
      ["hl_shortcut"] = Keyword,
      ["align_shortcut"] = right,
      ["position"] = center,
      ["keymap"] = {
        [1] = "n",
        [2] = "c",
        [3] = "<cmd>cd stdpath('config')<CR>",
        [4] = {
          ["nowait"] = true,
          ["noremap"] = true,
          ["silent"] = true,
        },
      },
      ["width"] = 50,
      ["cursor"] = 3,
    },
  },
  [7] = {
    ["on_press"] = function: 0x02c6fc6e80a8,
    ["type"] = button,
    ["val"] = "Update plugins",
    ["opts"] = {
      ["shortcut"] = "u",
      ["hl_shortcut"] = Keyword,
      ["align_shortcut"] = right,
      ["position"] = center,
      ["keymap"] = {
        [1] = "n",
        [2] = "u",
        [3] = "<cmd>Lazy sync<CR>",
        [4] = {
          ["nowait"] = true,
          ["noremap"] = true,
          ["silent"] = true,
        },
      },
      ["width"] = 50,
      ["cursor"] = 3,
    },
  },
  [8] = {
    ["on_press"] = function: 0x02c6fc6e8450,
    ["type"] = button,
    ["val"] = "Quit",
    ["opts"] = {
      ["shortcut"] = "q",
      ["hl_shortcut"] = Keyword,
      ["align_shortcut"] = right,
      ["position"] = center,
      ["keymap"] = {
        [1] = "n",
        [2] = "q",
        [3] = "<cmd>qa<CR>",
        [4] = {
          ["nowait"] = true,
          ["noremap"] = true,
          ["silent"] = true,
        },
      },
      ["width"] = 50,
      ["cursor"] = 3,
    },
  },
}

