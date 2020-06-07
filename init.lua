-- digicompute/init.lua
computercraft = {}

computercraft.VERSION = 0.5
computercraft.RELEASE_TYPE = "beta"

computercraft.path = minetest.get_worldpath().."/computercraft/"
computercraft.modpath = minetest.get_modpath("computercraft") -- modpath
local modpath = computercraft.modpath -- modpath pointer

-- Load builtin
dofile(modpath.."/builtin.lua")

-- Logger
function computercraft.log(content, log_type)
	assert(content, "digicompute.log content nil")
	if log_type == nil then log_type = "action" end
	minetest.log(log_type, "[digicompute] "..content)
end

-- Create mod directory inside world directory
computercraft.builtin.mkdir(computercraft.path)

-- Load environment utilities
dofile(modpath.."/env.lua")

-------------------
----- MODULES -----
-------------------

local loaded_modules = {}

local settings = Settings(modpath.."/modules.conf"):to_table()

-- [function] Get module path
function computercraft.get_module_path(name)
	local module_path = modpath.."/modules/"..name

	if computercraft.builtin.exists(module_path.."/init.lua") then
		return module_path
	end
end

-- [function] Load module (overrides modules.conf)
function computercraft.load_module(name)
	if loaded_modules[name] ~= false then
		local module_init = computercraft.get_module_path(name).."/init.lua"

		if module_init then
			dofile(module_init)
			loaded_modules[name] = true
			return true
		else
			computercraft.log("Invalid module \""..name.."\". The module either does not exist "..
				"or is missing an init.lua file.", "error")
		end
	else
		return true
	end
end

-- [function] Require module (does not override modules.conf)
function computercraft.require_module(name)
	if settings[name] and settings[name] ~= false then
		return computercraft.load_module(name)
	end
end

for name,enabled in pairs(settings) do
	if enabled ~= false then
		computercraft.load_module(name)
	end
end
