local harpoon = require("harpoon")
harpoon:setup()

local bind = vim.keymap.set
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

bind("n", "<leader>a", function() harpoon:list():add() end)
bind("n", "<A-S-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)


bind("n", "<A-1>", function() harpoon:list():select(1) end)
bind("n", "<A-2>", function() harpoon:list():select(2) end)
bind("n", "<A-3>", function() harpoon:list():select(3) end)
bind("n", "<A-4>", function() harpoon:list():select(4) end)
bind("n", "<A-5>", function() harpoon:list():select(5) end)
bind("n", "<A-6>", function() harpoon:list():select(6) end)
bind("n", "<A-7>", function() harpoon:list():select(7) end)
bind("n", "<A-8>", function() harpoon:list():select(8) end)
bind("n", "<A-9>", function() harpoon:list():select(9) end)


bind("n", "<A-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })
