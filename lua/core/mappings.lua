return {
    load_mappings = function(mappings)
        for mode, mappings in pairs(mappings) do
            for lhs, rhs in pairs(mappings) do
                vim.api.nvim_set_keymap(mode, lhs, rhs, {})
            end
        end
    end,
}
