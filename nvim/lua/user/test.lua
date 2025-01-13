require("neotest").setup({
	adapters = {
		require("neotest-dotnet")({
			discovery_root = "project",
			dotnet_additional_args = {
				'--environment DiffEngine_ToolOrder="Neovim,Rider,Vim,VisualStudioCode"',
			},
		}),
		require("neotest-python"),
		require("neotest-jest"),
	},
	icons = {
		expanded = "",
		child_prefix = "",
		child_indent = "",
		final_child_prefix = "",
		non_collapsible = "",
		collapsed = "",

		passed = "",
		running = "",
		failed = "",
		unknown = "",
	},
})
