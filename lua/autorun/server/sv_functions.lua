function GetWebData(steamid, hookname)
  local returnData = ""
  http.Fetch('https://gmtrak.com/get/' .. GMTrak.Config.ServerKey .. '/' .. hookname .. '/' .. steamid,
    function(body, len, headers, code)
      returnData = body
    end,
    
    function(err)

    end
  )

  return util.JSONToTable(returnData)
end

function PostWebData(steamid, hookname, val=1)
  local success = false
  local postData = {}
  postData["steamid"] = steamid
  postData["hook"] = hookname
  postData["value"] = val
  postData["serverkey"] = GMTrak.Config.ServerKey

  http.Post('https://gmtrak.com/post', postData,
    function(body, lens, headers, code)
      if code >= 400 then
        success = true
      end
    end, function(errorCode) end)

  return success
end

concommand.Add("gmtrak_getplayerinfo", function(ply, cmd, args)
  PrintTable(GetWebData(ply:CommunityID(), args[1]))
end)

print('[GMTrak] Functions loaded!')