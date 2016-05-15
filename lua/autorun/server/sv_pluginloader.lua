-------------------------------------------
-- GMTrak Plugin Loader                  --
-- Based off of DarkRP's Lua file loader --
-------------------------------------------

local fol = "autorun/plugins/"
local files, folders = file.Find(fol .. "*", "LUA")

for k, v in pairs(files) do
    if string.GetExtensionFromFilename(v) ~= "lua" then continue end
    include(fol .. v)
end

for _, folder in SortedPairs(folders, true) do
    if folder == "." or folder == ".." then continue end

    for _, File in SortedPairs(file.Find(fol .. folder .. "/tpl_*.lua", "LUA"), true) do
        include(fol .. folder .. "/" .. File)
        print("[GMTrak] Loaded " .. File .. "!")
    end
end