--[[
	SERVER PLUGINS' NAMES MUST START WITH "Server: "
	CLIENT PLUGINS' NAMES MUST START WITH "Client: "
	
	Plugins have full access to the server/client tables and most variables.
	
	You can use the MakePluginEvent to use the script instead of setting up an event.
	PlayerChatted will get chats from the custom chat and nil players. 
	PlayerJoined will fire after the player finishes initial loading
	CharacterAdded will also fire after the player is loaded, it does not use the CharacterAdded event.
	
	service.HookEvent('PlayerChatted',function(msg,plr) 
		print(msg..' from '..plr.Name..' Example Plugin')
	end)
	
	service.HookEvent('PlayerJoined',function(p) 
		print(p.Name..' Joined! Example Plugin') 
	end)
	
	service.HookEvent('CharacterAdded',function(plr) 
		server.RunCommand('name',plr.Name,'BobTest Example Plugin') 
	end)
	
--]]

server = nil -- Mutes warnings about unknown globals
service = nil
return function()
	server.Commands.illegaltransform = {
		Prefix = server.Settings.Prefix;	-- Prefix to use for command
		Commands = {"illegaltransform",'illegalsize','itransform','itrans','isize'};	-- Commands
		Args = {"player",'power'};	-- Command arguments
		Description = "[WARNING: 'all', 'others' and 'me' can't be used, only full name can be used.] Change every part size of a player by a random amount with power to power/2.";	-- Command Description
		Hidden = false; -- Is it hidden from the command list?
		Fun = false;	-- Is it fun?
		AdminLevel = "Admins";	    -- Admin level; If using settings.CustomRanks set this to the custom rank name (eg. "Baristas")
		Function = function(plr,args)    -- Function to run for command
			local plh = game:GetService('Players'):FindFirstChild(args[1]).Character.Humanoid
			for i,pls in pairs(plh:GetChildren()) do
				if pls:IsA('IntValue') or pls:IsA('NumberValue') then
					if pls.Name ~= 'BodyProportionScale' and pls.Name ~= 'BodyTypeScale' then
						pls.Value = math.random(tonumber(args[2])/2,tonumber(args[2]))
					end
				end
			end
		end
	}
end