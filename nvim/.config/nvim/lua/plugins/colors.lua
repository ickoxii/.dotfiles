--  Color Scheme Manager
--  Helps manage different color schemes.
--
--  A `PencilCase` stores key value pairs of color schemes, mapping a
--  color scheme name to its related configuration options.
--    ```
--    PencilCase = {
--      ['colorscheme_0'] = pencil_0,
--      ['colorscheme_1'] = pencil_1,
--    }
--    ```
--
--  A `pencil` contains multiple attributes:
--    ```
--    pencil {
--      scheme,
--      tones,
--      rating,
--    }
--    ```
--
--  The `scheme` field is the same structure as a normal plugin registered
--  for the lazy plugin manager. You can often find this field by looking
--  at a colorschemes github page.
--
--  Sometimes a color scheme doesn't support transparent backgrounds
--  out of the box. Thats where the `tones` field comes in. The function
--  that handles color schemes sets the background of every ui component
--  to transparent if a `tones` field is supplied. But we usually don't
--  want EVERYTHING transparent (i.e. color bar, cursor) so the `tones`
--  field allows you to supply a color code for those fields.

-- default color scheme
local favorite = "rose-pine"

-- color scheme swapping
vim.keymap.set("n", "<leader>cs", "<cmd>lua SwitchMyPencils()<cr>", { desc = "List available [C]olor [S]chemes" })

-- applies a background
function ColorMyPencils(color)
  color = color or favorite
  local pencil = PencilCase.pencils[color]

  vim.cmd.colorscheme(color)
  if pencil.tones then
    SetAllTransparent(pencil.tones)
  end

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- background, normal window
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- background, floating window
end

-- switches color themes using a telescope window
function SwitchMyPencils()
  local color_names = {}
  for name, _ in pairs(PencilCase.pencils) do
    table.insert(color_names, name)
  end

  -- print menu
  -- local telescope = require('telescope.builtin')
  require("telescope.pickers")
    .new({}, {
      prompt_title = "Select a Color Scheme",
      finder = require("telescope.finders").new_table({
        results = color_names,
      }),
      sorter = require("telescope.sorters").fuzzy_with_index_bias(),
      attach_mappings = function(_, map)
        map("i", "<CR>", function(prompt_bufnr)
          local selection = require("telescope.actions.state").get_selected_entry()
          if selection then
            ColorMyPencils(selection[1])
            -- close picker after selection
            require("telescope.actions").close(prompt_bufnr)
          end
        end)
        return true
      end,
    })
    :find()
end

-- Set all* ui components to transparent
function SetAllTransparent(tones)
  local highlights = {
    "NormalNC",
    "LineNr",
    "SignColumn",
    "StatusLine",
    "StatusLineNC",
    "WinSeparator",
    "VertSplit",
    "TabLine",
    "TabLineFill",
    "TabLineSel",
    "Pmenu",
    "PmenuSel",
  }

  for _, group in ipairs(highlights) do
    vim.api.nvim_set_hl(0, group, { bg = "none" })
  end

  -- If tones were provided, use them for cursor highlights
  vim.api.nvim_set_hl(0, "Cursor", {
    fg = tones.cursor_fg,
    bg = tones.cursor_bg,
  })
  vim.api.nvim_set_hl(0, "CursorLineNr", {
    fg = tones.cursor_line_nr_fg,
    bg = tones.cursor_line_nr_bg,
  })
end

PencilCase = {
  pencils = {
    --[[
    --
    -- colorname
    --
    ['colorname'] = {
      -- usually found in installation at the gh repo
      scheme = {
        'github-owner/github-repo',
        lazy = true,
        config = function()
          -- config stuff here

          ColorMyPencils('colorname')
        end,
      },
      -- [optional] if there are still any annoying parts still not transparent
      tones = {
        cursor_fg = 'none',
        cursor_bg = 'none',
        cursorline_nr_fg = 'none',
        cursorline_nr_bg = 'none',
      },
      rating = '',
    },
    ]]
    --

    --
    -- Base2Tone Motel Dark
    --
    ["base2tone_motel_dark"] = {
      scheme = {
        "atelierbram/Base2Tone-nvim",
        lazy = true,
        config = function()
          require("base2tone_motel_dark").setup()
          ColorMyPencils("base2tone_motel_dark")
        end,
      },
      tones = {
        cursor_fg = "#dca3a3",
        cursor_bg = "#282c34",
        cursor_line_nr_fg = "#dca3a3",
        cursor_line_nr_bg = "NONE",
      },
      rating = "7/10 - nice duotone theme",
    },

    --
    -- Catppuccin
    --
    ["catppuccin"] = {
      scheme = {
        "catppuccin/nvim",
        lazy = true,
        config = function()
          require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            no_italic = true,
            no_bold = true,
            no_underline = true,
          })
          ColorMyPencils("catppuccin")
        end,
      },
      rating = "5/10 - overhyped",
    },

    --
    -- Everforest
    --
    ["everforest"] = {
      scheme = {
        "neanias/everforest-nvim",
        version = false,
        lazy = true,
        -- priority = 1000,
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("everforest").setup({
            transparent_background_level = 2,
            italics = false,
            disable_italics_comments = true,
            background = "soft",
          })
          ColorMyPencils("everforest")
        end,
      },
      rating = "9/10 - very nice colors, not overdone, green theme",
    },

    --
    --
    --
    ["gruvbox"] = {
      scheme = {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        -- priority = 1000,
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("gruvbox").setup({
            undercurl = false,
            underline = false,
            bold = false,
            italic = {
              strings = false,
              emphasis = false,
              comments = false,
              operators = false,
              folds = false,
            },
            strikethrough = false,
            transparent_mode = true,
          })
          ColorMyPencils("gruvbox")
        end,
      },
      rating = "5/10 - too much going on",
    },

    --
    -- Kanagawa Dragon
    --
    ["kanagawa"] = {
      scheme = {
        "rebelot/kanagawa.nvim",
        lazy = true,
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("kanagawa").setup({
            undercurls = false,
            commentStyle = { italic = false },
            keywordStyle = { italic = false },
            statementStyle = { bold = false },
            transparent = true,
            terminalColors = true,
            theme = "dragon", -- [dragon|lotus|wave] (vim.o.background = "")
            background = {
              dark = "dragon", -- [dragon|lotus|wave] (vim.o.background = "dark")
              light = "dragon", -- [dragon|lotus|wave] (vim.o.background = "light")
            },
            colors = {
              theme = {
                all = {
                  ui = {
                    bg = "none",
                    bg_gutter = "none",
                    bg_border = "none",
                  },
                },
              },
            },
          })
          ColorMyPencils("kanagawa")
        end,
      },
      rating = "10/10 - good colors, muted, greenish tones",
    },

    --
    -- Rose Pine <3
    --
    ["rose-pine"] = {
      scheme = {
        "rose-pine/neovim",
        lazy = true,
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("rose-pine").setup({
            variant = "moon", -- [auto|main|moon|dawn]
            dark_variant = "moon", -- [main|moon|dawn]
            disable_background = true,
            styles = {
              bold = false,
              italic = false,
              transparency = true,
            },
          })
          ColorMyPencils("rose-pine")
        end,
      },
      rating = "9/10",
    },

    --
    -- Tokyo Night
    --
    ["tokyonight"] = {
      scheme = {
        "folke/tokyonight.nvim",
        lazy = true,
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("tokyonight").setup({
            style = "storm", -- [storm|moon|night]
            transparent = true,
            terminal_colors = true, -- when using :terminal
            styles = {
              -- Style to be applied to different syntax groups
              -- Value is any valid attr-list value for `:help nvim_set_hl`
              comments = { italic = false },
              keywords = { italic = false },
              sidebars = "transparent", -- [dark|transparent|normal]
              floats = "transparent", -- [dark|transparent|normal]
            },
          })
          ColorMyPencils("tokyonight")
        end,
      },
      rating = "5/10 overhyped",
    },
  },
}

-- idk why i have this tbh honest
function PencilCase.get_pencil_names()
  local pencils = {}
  for name, _ in pairs(PencilCase.pencils) do
    table.insert(pencils, name)
  end
  return pencils
end

local schemes = {}

-- grab all pencils and return them
for name, pencil in pairs(PencilCase.pencils) do
  if name == favorite and pencil.scheme then
    pencil.scheme.lazy = false
  end
  table.insert(schemes, pencil.scheme)
end

return {
  schemes,
}
