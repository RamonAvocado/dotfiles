function get_random_image(route)
  local files = {}
  local process = io.popen('ls "' .. route .. '"')

  if process == nil then
    return
  end

  for file in process:lines() do
    table.insert(files, file)
  end

  math.randomseed(os.time())
  local index = math.random(1, #files)
  return files[index]
end
local M = {}

function M.init()
  return { enabled = true }
end

function M.opts()
  local route = '$HOME/.config/wallpapers/nvim/'
  local terminal_image = get_random_image(route)
  return {
    sections = {
      {
        section = 'terminal',
        cmd = 'chafa ' .. route .. terminal_image .. ' --format symbols --symbols vhalf --stretch; sleep .1',
        height = 17,
        padding = 1,
      },
      {
        pane = 2,
        { section = 'keys', gap = 1, padding = 1 },
        { section = 'startup' },
      },
    },
  }
end

return M
-- return
-- {
-- 	"snacks.nvim",
-- 	opts = {
-- 		dashboard = {
-- 			sections = {
-- 				{
-- 					section = "terminal",
-- 					cmd =
-- 					"chafa ~/Downloads/download1.jpeg --format symbols --symbols vhalf --stretch; sleep .1",
-- 					height = 17,
-- 					padding = 1,
-- 				},
-- 				{
-- 					pane = 2,
-- 					{ section = "keys",   gap = 1, padding = 1 },
-- 					{ section = "startup" },
-- 				},
-- 			},
--
-- 			-- stylua: ignore
-- 			---@type snacks.dashboard.Item[]
-- 			keys = {
-- 				{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
-- 				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
-- 				{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
-- 				{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
-- 				{ icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
-- 				{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
-- 				{ icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
-- 				{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
-- 				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
-- 			},
-- 		},
-- 	},
-- }

-- {
--   sections = {
--     { section = "header" },
--     {
--       pane = 2,
--       section = "terminal",
--       cmd = "colorscript -e square",
--       height = 5,
--       padding = 1,
--     },
--     { section = "keys", gap = 1, padding = 1 },
--     {
--       pane = 2,
--       icon = " ",
--       desc = "Browse Repo",
--       padding = 1,
--       key = "b",
--       action = function()
--         Snacks.gitbrowse()
--       end,
--     },
--     function()
--       local in_git = Snacks.git.get_root() ~= nil
--       local cmds = {
--         {
--           title = "Notifications",
--           cmd = "gh notify -s -a -n5",
--           action = function()
--             vim.ui.open("https://github.com/notifications")
--           end,
--           key = "n",
--           icon = " ",
--           height = 5,
--           enabled = true,
--         },
--         {
--           title = "Open Issues",
--           cmd = "gh issue list -L 3",
--           key = "i",
--           action = function()
--             vim.fn.jobstart("gh issue list --web", { detach = true })
--           end,
--           icon = " ",
--           height = 7,
--         },
--         {
--           icon = " ",
--           title = "Open PRs",
--           cmd = "gh pr list -L 3",
--           key = "P",
--           action = function()
--             vim.fn.jobstart("gh pr list --web", { detach = true })
--           end,
--           height = 7,
--         },
--         {
--           icon = " ",
--           title = "Git Status",
--           cmd = "git --no-pager diff --stat -B -M -C",
--           height = 10,
--         },
--       }
--       return vim.tbl_map(function(cmd)
--         return vim.tbl_extend("force", {
--           pane = 2,
--           section = "terminal",
--           enabled = in_git,
--           padding = 1,
--           ttl = 5 * 60,
--           indent = 3,
--         }, cmd)
--       end, cmds)
--     end,
--     { section = "startup" },
--   },
-- }
