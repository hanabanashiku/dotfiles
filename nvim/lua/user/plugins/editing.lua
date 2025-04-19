return {
	{
		"numToStr/Comment.nvim",
		opts = {
			mappings = {
				basic = false,
				extra = false,
			},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"monaqa/dial.nvim",
		config = function()
			local dial = require("dial.map")
			vim.keymap.set("n", "<C-a>", function()
				dial.manipulate("increment", "normal")
			end)
			vim.keymap.set("n", "<C-x>", function()
				dial.manipulate("decrement", "normal")
			end)
			vim.keymap.set("n", "g<C-a>", function()
				dial.manipulate("increment", "gnormal")
			end)
			vim.keymap.set("n", "g<C-x>", function()
				dial.manipulate("decrement", "gnormal")
			end)
			vim.keymap.set("v", "<C-a>", function()
				dial.manipulate("increment", "visual")
			end)
			vim.keymap.set("v", "<C-x>", function()
				dial.manipulate("decrement", "visual")
			end)
			vim.keymap.set("v", "g<C-a>", function()
				dial.manipulate("increment", "gvisual")
			end)
			vim.keymap.set("v", "g<C-x>", function()
				dial.manipulate("decrement", "gvisual")
			end)

			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%m/%d/%Y"],
					augend.constant.alias.bool,
					augend.constant.alias.alpha,
				},
				csharp = {
					augend.constant.new({ elements = { "public", "protected", "private" }, cyclic = true, word = true }),
					augend.constant.new({ elements = { "virtual", "abstract" }, cyclic = true, word = true }),
				},
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local filetype = vim.bo.filetype
					if filetype == "cs" then
						vim.api.nvim_buf_set_keymap(
							0,
							"n",
							"<C-a>",
							require("dial.map").inc_normal("csharp"),
							{ noremap = true }
						)
						vim.api.nvim_buf_set_keymap(
							0,
							"n",
							"<C-a>",
							require("dial.map").inc_normal("csharp"),
							{ noremap = true }
						)
					end
				end,
				pattern = "*",
				desc = "Register C# augends",
			})
		end,
	},
}
