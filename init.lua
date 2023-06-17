local core = require("core")

local config = require("config")
local modules = config.modules


local funcs = {}


function apply_config(config)
	if not (config.opts == nil) then
		core.options.load_opts(config.opts)
	end
	if not (config.gs == nil) then
		core.options.load_gs(config.gs)
	end

	if not (config.mappings == nil) then
		core.mappings.load_mappings(config.mappings)
	end

    if not (config.funcs == nil) then
        for name, func in pairs(config.funcs) do
            funcs[name] = func
        end
    end
end


function load_module(module_name)
	local module_config = require("config.modules." .. module_name)
    
	apply_config(module_config)

	if not (module_config.dependencies == nil) then
		for _, dependency_name in ipairs(module_config.dependencies) do
			load_module(dependency_name)
		end
	end
end

for _, module_name in ipairs(modules) do
	load_module(module_name)
end

core.funcs.create_user_command(funcs)
