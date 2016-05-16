----------------------------------------
-- GMTrak DarkRP Plugin               --
-- Developed by digital               --
----------------------------------------
-- Tracks player data within a server --
-- running DarkRP.                    --
----------------------------------------

if engine.ActiveGamemode() == "darkrp" then
  print("[GMTrak-DarkRP] Server is running DarkRP. Now tracking DarkRP hooks...")

  include("autorun/server/sv_functions.lua")
  -- Include the functions file, needed to
  -- actually allow this file to work.



  hook.Add("playerArrested", "GMTrak_darkrp_playerArrested", function(criminal, time, actor)
    PostWebData(criminal:SteamID64(), "playerArrested", 1, nil)
  end)

  hook.Add("playerBoughtDoor", "GMTrak_darkrp_playerBoughtDoor", function(ply, ent, cost)
    PostWebData(ply:SteamID64(), "playerBoughtDoor", 1, nil)
  end)

  hook.Add("playerWanted", "GMTrak_darkrp_playerWanted", function(criminal, actor, reason)
    PostWebData(criminal:SteamID64(), "playerWanted", 1, nil)
  end)

  hook.Add("playerGetSalary", "GMTrak_darkrp_playerGetSalary", function(ply, amount)
    PostWebData(ply:SteamID64(), "playerGetSalary", tonumber(amount), nil)
  end)

  hook.Add("onHitCompleted", "GMTrak_darkrp_onHitCompleted", function(hitman, target, customer)
    PostWebData(hitman:SteamID64(), "onHitCompleted", 1, nil)
  end)

  hook.Add("onHitFailed", "GMTrak_darkrp_onHitFailed", function(hitman, target, reason)
    PostWebData(hitman:SteamID64(), "onHitFailed", 1, nil)
  end)

  hook.Add("onLockpickCompleted", "GMTrak_darkrp_onLockpickCompleted", function(ply, success, ent)
    if success == true then
      PostWebData(ply:SteamID64(), "onLockpickCompleted", 1, nil)
    end
  end)

  hook.Add("OnPlayerChangedTeam", "GMTrak_darkrp_OnPlayerChangedTeam", function(ply, before, after)
    PostWebData(ply:SteamID64(), "OnPlayerChangedTeam", 1, nil)
  end)


end