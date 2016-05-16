function GetWebData(steamid, hookname, callback)
  local data

  http.Fetch('https://gmtrak.com/api/player/get/' .. GMTrak.Config.ServerKey .. '/' .. hookname .. '/' .. steamid,
    function(body, len, headers, code)
      data = util.JSONToTable(body)
      callback(data)
    end,
    
    function(err)
    end
  )

  return returnData
end

function PostWebData(steamid, hookname, val)
  local data = {}
  local params = {}
  params['key'] = GMTrak.Config.ServerKey
  params['hookname'] = tostring(hookname)
  params['value'] = tostring(val)
  params['steamid'] = tostring(steamid)

  http.Post('https://gmtrak.com/api/player/post', params,
    function(resp, len, headers, code)
      if code == 200 then
        print("[GMTrak] Sent request to server (" .. hookname .. ").")
        print(resp)
      else
        print("GMTrak Error: Unhandled request in PostWebData (" .. code .. ")")
        print(resp)
      end
    end, function(errorCode) print("[GMTrak] Error (PostWebData): " .. errorCode) end)

  return success
end

print('[GMTrak] Functions loaded!')