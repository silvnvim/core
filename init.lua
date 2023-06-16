local options_core = require("core.options")
local load_opts = options_core.load_opts
local load_gs = options_core.load_gs


local config = require("config")
local modules = config.modules


function apply_config(config)
	if not (config.opts == nil) then
		load_opts(config.opts)
	end
	if not (config.gs == nil) then
		load_gs(config.gs)
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
