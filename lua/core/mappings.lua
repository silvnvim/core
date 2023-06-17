local M = {}


function M.load_mappings(mappings)
    for mode, mappings in pairs(mappings) do
        for lhs, rhs in pairs(mappings) do
            vim.keymap.set(mode, lhs, rhs, { desc = "Test" })
        end
    end
end


return M
