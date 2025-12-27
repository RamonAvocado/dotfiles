-- TODO: IN THEORY EVERYTHING WORKS, NOT TESTED ENOUGH SURROUND
-- TODO: INVESTIGATE CONFIG YOU CAN PUT
-- WARN: IN MINI THERE IS MINI.TABLINE, SIMILAR TO BUFFERLINE THAT I USE
-- WARN: IN MINI THERE IS MINI.INDENTSCOPE I THINK SIMILAR TO GUESTINDENT THAT I USE
return {
	require 'plugins.mini.ai',
	require 'plugins.mini.pairs',
	require 'plugins.mini.surround',
	require "plugins.mini.status-line",
}
