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

hook.Add("EntityTakeDamage", "GMTrak_sandbox_EntityTakeDamage", function(ent, inflictor, attacker, amount, dmginfo)
  if ent:IsPlayer() then
    PostWebData(ent:SteamID64(), "EntityTakeDamage", tonumber(amount))
  end
end)


hook.Add("PlayerAuthed", "GMTrak_sandbox_PlayerAuthed", function(ply, steamid, uniqueid)
  PostWebData(ply:SteamID64(), "PlayerAuthed", 1)
end)

hook.Add("PlayerSpawn", "GMTrak_sandbox_PlayerSpawn", function(ply)
  PostWebData(ply:SteamID64(), "PlayerSpawn", 1)
end)

hook.Add("PlayerSpray", "GMTrak_sandbox_PlayerSpray", function(ply)
  PostWebData(ply:SteamID64(), "PlayerSpray", 1)
end)

hook.Add("OnNPCKilled", "GMTrak_sandbox_OnNPCKilled", function(vic, klr, wep)
  if klr:IsPlayer() then
    PostWebData(klr:SteamID64(), "OnNPCKilled", 1)
  end
end)