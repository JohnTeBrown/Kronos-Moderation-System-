--!nolint UnknownGlobal
--[[
	SERVER PLUGINS' NAMES MUST START WITH "Server:" OR "Server-"
	CLIENT PLUGINS' NAMES MUST START WITH "Client:" OR "Client-"

	Plugins have full access to the server/client tables and most variables.

	You can use the MakePluginEvent to use the script instead of setting up an event.
	PlayerChatted will get chats from the custom chat and nil players.
	PlayerJoined will fire after the player finishes initial loading
	CharacterAdded will also fire after the player is loaded, it does not use the CharacterAdded event.

	service.Events.PlayerChatted(function(plr, msg)
		print(msg..' from '..plr.Name..' Example Plugin')
	end)

	service.Events.PlayerJoined(function(p)
		print(p.Name..' Joined! Example Plugin')
	end)

	service.Events.CharacterAdded(function(p)
		server.RunCommand('name',plr.Name,'BobTest Example Plugin')
	end)

--]]

return function(Vargs)
	local service, server = Vargs.Service, Vargs.Server

	local Remote = server.Remote

	service.Events.PlayerBanned:Connect(function(playerBanned, reason, saved: boolean?)
		for _, player in ipairs(service.Players:GetPlayers()) do
			Remote.MakeGui(player, "Notification", {
				Title = "Player blacklisted";
				Message = string.format("Player %s has been banned/blacklisted by kronos moderation system", playerBanned.Name);
				Time = 60;
			})
		end
	end)
end