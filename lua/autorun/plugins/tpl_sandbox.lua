----------------------------------------
-- GMTrak Sandbox Plugin              --
-- Developed by digital               --
----------------------------------------
-- Tracks player data within a server --
-- running the default sandbox        --
-- gamemode.                          --
----------------------------------------

include("autorun/server/sv_functions.lua")
-- Include the functions file, needed to
-- actually allow this file to work.

hook.Add("PlayerAuthed", "GMTrak_SandboxPlugin_ConnectHook", function(ply, steamid, uniqueid)
  print("[GMTrack-Sandbox] " .. ply:Nick() .. " connected!")
  PostWebData(steamid, "PlayerAuthed")
end)

hook.Add("PlayerSpawn", "GMTrak_SandboxPlugin_PlayerSpawnHook", function(ply)
  PostWebData(ply:SteamID(), "PlayerSpawn")
end)