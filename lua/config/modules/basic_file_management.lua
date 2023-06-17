local utils = require("utils")


return {
    mappings = {
        n = {
            ["<leader>n"] = utils.wrap_func("new_file"),
        },
    },
    funcs = {
        new_file = {
            func = function()
                vim.cmd("enew")
            end,
            desc = "New file",
        },
    },
}
