local M = {}

function M.init()
  return { enabled = true }
end

function M.opts()
  return {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      hidden = true,
      ignored = true,
    },
  }
end

return M

