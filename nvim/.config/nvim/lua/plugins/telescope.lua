-- Extensable fuzzy finder over lists
--
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers

return {
  "nvim-telescope/telescope.nvim",

  event = "VimEnter",

  branch = "0.1.x",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").setup({})

    local builtin = require("telescope.builtin")

    ---
    ----- String Searching
    ---
    vim.keymap.set("n", "<leader>pws", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, { desc = "Telescope: Search [P]roject [w]ord [S]tring" })

    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "Telescope: Search [P]roject [W]ORD [S]tring" })

    vim.keymap.set("n", "<leader>bs", function()
      -- builtin.live_grep {
      builtin.current_buffer_fuzzy_find({
        previewer = false,
        prompt_title = "Grep String in File",
      })
    end, { desc = "Telescope: Search [B]uffer [S]trings" })

    vim.keymap.set("n", "<leader>ps", function()
      -- builtin.live_grep({
      --   grep_open_files = true,
      --   file_ignore_patterns = { "\\./" },
      --   prompt_title = "Grep String in Project",
      -- })
      builtin.live_grep({
        vim.keymap.set("n", "<leader>ps", function()
          builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end),
      })
    end, { desc = "Telescope: Search [P]roject [S]trings" })

    ---
    ----- File Searching
    ---
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope: Search [P]roject [F]iles" })
    vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Telescope: Search [G]it [F]iles" })
    vim.keymap.set("n", "<leader>sD", function()
      builtin.find_files({
        cwd = vim.fn.expand("$HOME/.dotfiles/"),
        hidden = true,
        file_ignore_patterns = { ".git/" },
      })
    end, { desc = "Telescope: [S]earch [D]otfiles" })

    ---
    ----- Reference Searching
    ---
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Telescope: [S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope: [S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Telescope: [S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "Telescope: [S]earch [M]an Pages" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Telescope: [S]earch [R]esume" })
  end,
}
