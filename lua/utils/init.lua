local M = {}


function M.wrap_func(func_name)
    return function()
        vim.cmd("Funcs " .. func_name)
    end
end


return M
