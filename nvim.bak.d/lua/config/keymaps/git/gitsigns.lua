local M = {}

function M.setup(buffer)
  local gs = require 'gitsigns'

  local function map(mode, l, r, desc)
    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
  end

  -- NEW MAPPINGS
  -- stylua: ignore start
  map("n", "]h", function()
    if vim.wo.diff then
      vim.cmd.normal({ "]c", bang = true })
    else
      gs.nav_hunk("next")
    end
  end, "Next Hunk")

  map("n", "[h", function()
    if vim.wo.diff then
      vim.cmd.normal({ "[c", bang = true })
    else
      gs.nav_hunk("prev")
    end
  end, "Prev Hunk")
  
  map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
  map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")

  map({ "n", "x" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
  map({ "n", "x" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
  map({ "n", "x" }, "<leader>ghu", ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk")

  map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
  map("n", "<leader>ghi", gs.preview_hunk_inline, "Preview Hunk Inline")

  -- BLAME
  map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")

  -- DIFFERENCE
  map("n", "<leader>ghd", gs.diffthis, "Diff This")
  map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
  
  -- TOGGLE
  map("n", "<leader>gtb", gs.toggle_current_line_blame, '[G]it [T]oggle show [b]lame line')
  map('n', '<leader>gtw', gs.toggle_word_diff, "[G]it [T]oggle word diff")
  -- map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })

  -- BUFFER STUFF
  -- map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
  -- map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
  -- map("n", "<leader>ghB", function() gs.blame() end, "Blame Buffer")
end

return M
