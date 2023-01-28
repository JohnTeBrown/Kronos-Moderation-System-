--[[
Place in the plugins folder.
This gives notifications to a specific admin level that a player was kicked.
--]]

server, service = nil, nil
return function()
	local kickFunc = server.Commands.Kick.Function
	server.Commands.Kick.Function = function(plr: Player, args: {string}, data)
		for _, v: Player in ipairs(service.GetPlayers(plr, args[1])) do
			for _, a: Player in ipairs(service.Players:GetPlayers()) do
				if server.Admin.GetLevel(a) >= 100 then --change 100 to admin levels for default values Players - 0, Moderators - 100, Admins - 200, HeadAdmins - 300, Creators - 900.
					task.defer(server.Remote.MakeGui, a, "Notification", {
						Title = "Player Kicked",
						Icon = server.MatIcons.Gavel,
						Text = service.FormatPlayer(v).." has been kicked from the server.",
						Time = 30 --Time in seconds
					})
				end
			end
		end
		return kickFunc(plr, args, data)
	end
end