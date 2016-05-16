-------------------------------------------
-- GMTrak Plugin Loader                  --
-- Based off of DarkRP's Lua file loader --
-------------------------------------------

local fol = "autorun/plugins/"
local files, folders = file.Find(fol .. "*", "LUA")

for k, v in pairs(files) do
    if string.GetExtensionFromFilename(v) ~= "lua" then continue end
    include(fol .. v)
    print("[GMTrak] Loaded " .. v .. "!")
end