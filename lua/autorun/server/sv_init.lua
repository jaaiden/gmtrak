include('autorun/server/sv_config.lua')
include('autorun/server/sv_functions.lua')
include('autorun/server/sv_pluginloader.lua')

function GetLatestVersion()
  local ver = GMTrak.Config.Version
  http.Fetch('https://gmtrak.com/latest-version',
    function(body, len, headers, code)
      ver = body
    end,

    function(err)
    end
  )

  return ver
end

function CheckVersion()
  if tonumber(GMTrak.Config.Version, 10) < tonumber(GetLatestVersion(), 10) then
    print('[GMTrak] There is a new update available to GMTrak!')
    print('[GMTrak] Go to https://gmtrak.com/download to get it!')
  end
end

function ValidateConfig()
  local configData = {}
  configData["serverkey"] = GMTrak.Config.ServerKey

  http.Post('https://gmtrak.com/validate-version', {}, function() print("[GMTrak] Server validated!") end, function(err) print('[GMTrak] Error validating this server: ' .. err) end)
end

-- hook.Add('InitPostEntity', 'IB_Startup', function()
  
-- end)

print('[GMTrak] v' .. GMTrak.Config.Version .. ' Loaded!')
CheckVersion()
ValidateConfig()