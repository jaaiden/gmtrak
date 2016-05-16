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

function PostWebData(steamid, hookname, val, callback)
  local data

  http.Fetch('https://gmtrak.com/api/player/post/' .. GMTrak.Config.ServerKey .. '/' .. hookname .. '/' .. val .. '/' .. steamid, nil,
    function(body, lens, headers, code)
      if code >= 400 then
        data = util.JSONToTable(body)
        if data['status'] == "hook-not-allowed" then
          print("[GMTrak] Hook is not allowed. If you are a developer and would like this hook to be tracked, please request it at https://gmtrak.com/request/hook")
        else
          print("[GMTrak] Updated data successfully!")
          callback(data)
        end
      else
        print("GMTrak Error: Unhandled request in PostWebData (" .. code .. ")")
        print(body)
      end
    end, function(errorCode) print("[GMTrak] Error (PostWebData): " .. errorCode) end)

  return success
end

print('[GMTrak] Functions loaded!')