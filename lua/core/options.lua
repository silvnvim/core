local M = {}


function M.load_opts(opts)
    for name, value in pairs(opts) do
        vim.opt[name] = value
    end
end

function M.load_gs(gs)
    for name, value in pairs(gs) do
        vim.g[name] = value
    end
end


return M
