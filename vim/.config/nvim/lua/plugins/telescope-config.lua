require("telescope").setup(
  {
    pickers = {
      find_files = {
        disable_devicons = false,
	hidden = true
      },
      git_files = {
        disable_devicons = false,
	hidden = true
      },
      file_browser = {
        disable_devicons = false,
        hidden = false
      }
    }
  }
)

require("telescope").load_extension("fzf")

-- UNCOMMENT FOR DEBUG MESSAGES
-- print('- plugins/telescope-config.lua...OK!')

-- picker configurations for use with binds
local picker_configs = {}

-- live_grep with tweaked layout
picker_configs.live_grep = function()
  local opts = {
    sorting_strategy = "ascending",
    only_sort_text = false,
    layout_config = {
      prompt_position = "top"
    }
  }

  require("telescope.builtin").live_grep(opts)
end

-- current_buffer_fuzzy_find with tweaked layout
picker_configs.current_buffer_fuzzy_find = function()
  local opts = {
    only_sort_text = false,
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top"
    }
  }

  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

return picker_configs
