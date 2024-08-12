return {
	"jackMort/ChatGPT.nvim",
	event = "VimEnter",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		-- Function to execute the shell command and capture its output
		local function get_api_key()
			local handle = io.popen("pass show api/tokens/openai-nvim | head -n 1 | tr -d '\n'")
			local api_key = handle:read("*a")
			handle:close()
			return api_key:gsub("%s+", "") -- trim any extra whitespace
		end

		-- Get the API key
		local api_key = get_api_key()

		-- Setup ChatGPT with the API key and default options
		require("chatgpt").setup({
			api_key_cmd = "echo " .. api_key,

			openai_params = {
				model = "gpt-4o",
				temperature = 0,
				top_p = 1,
				n = 1,
			},

			openai_edit_params = {
				model = "gpt-4o",
				temperature = 0,
				top_p = 1,
				n = 1,
			},
		})
	end,
}
