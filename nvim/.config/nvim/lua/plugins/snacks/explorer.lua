local M = {}

function M.explorer()
  return {
    replace_netrw = true,
  }
end

function M.picker()
  return {
    hidden = true,
    ignored = true,
  }
end

return M
