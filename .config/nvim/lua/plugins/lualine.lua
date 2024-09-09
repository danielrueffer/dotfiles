return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local mode = {
			"mode",
			fmt = function(str)
				-- return " " .. str:sub(1, 1) -- displays only the first character of the mode
				return " " .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				-- Some useful glyphs:
				-- https://www.nerdfonts.com/cheat-sheet
				--        
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "nvim-tree" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch", diff },
				lualine_c = { filename },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
		})
	end,
}
