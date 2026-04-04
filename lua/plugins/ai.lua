local keymap = vim.keymap.set

local s = {
	copilot = {
		enabled = true,
		auto_trigger = true,
	},
	chat_ui = {
		tool = "claudecode",
	},
}

-- Copilot (ghost text only, no panel, no cmp source)

if s.copilot.enabled then
	vim.pack.add({ { src = "https://github.com/zbirenbaum/copilot.lua" } })
	require("copilot").setup({
		suggestion = {
			enabled = s.copilot.enabled,
			auto_trigger = s.copilot.auto_trigger,
			keymap = { accept = false, next = false, prev = false, dismiss = false },
		},
		panel = { enabled = false },
		filetypes = { markdown = true, help = true },
	})

	keymap("i", "<M-a>", function()
		require("copilot.suggestion").accept()
	end, { desc = "Copilot accept" })
	keymap("i", "<M-]>", function()
		require("copilot.suggestion").next()
	end, { desc = "Copilot next" })
	keymap("i", "<M-[>", function()
		require("copilot.suggestion").prev()
	end, { desc = "Copilot prev" })
	keymap("i", "<M-e>", function()
		require("copilot.suggestion").dismiss()
	end, { desc = "Copilot dismiss" })
end

-- Opencode

if s.chat_ui.tool == "opencode" then
	vim.pack.add({ { src = "https://github.com/sudo-tee/opencode.nvim" } })
	require("opencode").setup()

	local api = function()
		return require("opencode.api")
	end
	keymap({ "n", "x" }, "<leader>aa", function()
		api().toggle()
	end, { desc = "Toggle opencode" })
	keymap({ "n", "x" }, "<leader>ai", function()
		api().open_input()
	end, { desc = "Opencode open input" })
	keymap({ "n", "x" }, "<leader>aq", function()
		api().quick_chat()
	end, { desc = "Opencode quick chat" })
	keymap({ "n", "x" }, "<leader>am", function()
		api().mention_file()
	end, { desc = "Opencode mention file" })
	keymap({ "n", "x" }, "<leader>as", function()
		api().select_agent()
	end, { desc = "Opencode select agent" })
	keymap({ "n", "t" }, "<C-.>", function()
		api().toggle_focus()
	end, { desc = "Toggle opencode focus" })
end

-- Claude Code
if s.chat_ui.tool == "claudecode" then
	vim.pack.add({ { src = "https://github.com/coder/claudecode.nvim" } })
	require("claudecode").setup()

	keymap({ "n", "t" }, "<C-.>", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude Code" })
	keymap({ "n", "x" }, "<leader>aa", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Code" })
	keymap({ "n", "x" }, "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude Code" })
	keymap("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add buffer to Claude Code" })
	keymap("n", "<leader>ai", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
	keymap("n", "<leader>ax", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
end
