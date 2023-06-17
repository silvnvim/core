local core = require("core")

local has_config, config = pcall(require("config"))
if not has_config then
	return
end
local modules = config.modules


local funcs = {}
local plugins = nil


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

    if not (config.plugins == nil) then
        if plugins == nil then
            plugins = config.plugins
        else
            for _, plugin in ipairs(config.plugins) do
                table.insert(plugins, plugin)
            end
        end
    end
end


function load_module(module_name)
	local module_config = require("config.modules." .. module_name)
    
	apply_config(module_config)

	if not (module_config.deps == nil) then
		for _, dependency_name in ipairs(module_config.deps) do
			load_module(dependency_name)
		end
	end
end

if not (modules == nil) then
	for _, module_name in ipairs(modules) do
		load_module(module_name)
	end
end

if not (plugins == nil) then
    core.plugins.load_plugins(plugins)
end
core.funcs.create_user_command(funcs)
