include('autorun/server/sv_config.lua')
include('autorun/server/sv_functions.lua')
include('autorun/server/sv_pluginloader.lua')

function GetLatestVersion(callback)
  http.Fetch('https://gmtrak.com/api/latest-version',
    function(body, len, headers, code)
      callback(body)
    end,

    function(err)
    end
  )
end

function CheckVersion(newversion)
  if GMTrak.Config.Version ~= tostring(newversion) then
    print('[GMTrak] You are not running the latest version of GMTrak!')
    print('[GMTrak] Go to https://gmtrak.com/download to get it!')
  end
end

function ValidateConfig()
  http.Post('https://gmtrak.com/api/validate-server/' .. GMTrak.Config.ServerKey, nil,
    function(resp, len, headers, code)
      print("[GMTrak] Server validated!")
    end,

    function(err)
      print('[GMTrak] Error validating this server: ' .. err)
    end
  )
end

-- hook.Add('InitPostEntity', 'IB_Startup', function()
  
-- end)

print('[GMTrak] v' .. GMTrak.Config.Version .. ' Loaded!')
//GetLatestVersion(CheckVersion)
ValidateConfig()