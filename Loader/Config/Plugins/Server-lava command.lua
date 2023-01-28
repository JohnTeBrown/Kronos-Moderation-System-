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
function findp(player)
	local plrfound = ''
	local plrs = game:GetService('Players'):GetPlayers()
	for i = 1,#plrs do
		print(plrs[i].name..' '..i)
		if string.sub(string.lower(plrs[i].Name),1,string.len(player)) == string.lower(player) then
			print(plrs[i].Name)
			return plrs[i].Name
		end
	end
end
return function()
	server.Commands.lava = {
		Prefix = server.Settings.Prefix;	-- Prefix to use for command
		Commands = {'lava'};	-- Commands
		Args = {"player"};	-- Command arguments
		Description = "[WARNING: others and all cannot be used: custom me.] Make lava under the targeted player that goes up and kill him.";	-- Command Description
		Hidden = false; -- Is it hidden from the command list?
		Fun = true;	-- Is it fun?
		AdminLevel = "Moderators";	    -- Admin level; If using settings.CustomRanks set this to the custom rank name (eg. "Baristas")
		Function = function(plr,args)    -- Function to run for command
			if args[1] == 'me' then
				local player = plr
				if player then
					if player.Character then
						if player.Character.HumanoidRootPart then
							local lava = Instance.new('Part',player.Character)
							lava.Position = player.Character.HumanoidRootPart.Position - Vector3.new(0,10,0)
							lava.Size = Vector3.new(5,1,5)
							lava.BottomSurface = 'Smooth'
							lava.TopSurface = 'Smooth'
							lava.BrickColor = BrickColor.new('Bright red')
							lava.CanCollide = false
							lava.Anchored = true
							lava.Name = 'ADONIS_LAVA_'..string.upper(player.Name)
							for i,v in pairs(player.Character:GetChildren()) do
								if v:IsA('Part') or v:IsA('MeshPart') then
									v.Anchored = true
								end
							end
							wait(1)
							local s = 6
							for i = 1,13 do
								lava.Position += Vector3.new(0,1,0)
								if s <= 0 then
									player.Character.Humanoid.Health = 0
								end
								s -= 0.7
								wait()
							end
							wait(1)
							lava:Destroy()
						end
					end
				end
			else
				local player = game:GetService('Players')[findp(args[1])]
				if player then
					if player.Character then
						if player.Character.HumanoidRootPart then
							local lava = Instance.new('Part',player.Character)
							lava.Position = player.Character.HumanoidRootPart.Position - Vector3.new(0,10,0)
							lava.Size = Vector3.new(5,1,5)
							lava.BrickColor = BrickColor.new('Bright red')
							lava.CanCollide = false
							lava.BottomSurface = 'Smooth'
							lava.TopSurface = 'Smooth'
							lava.Anchored = true
							lava.Name = 'ADONIS_LAVA_'..string.upper(player.Name)
							for i,v in pairs(player.Character:GetChildren()) do
								if v:IsA('Part') or v:IsA('MeshPart') then
									v.Anchored = true
								end
							end
							wait(1)
							local s = 6
							for i = 1,13 do
								lava.Position += Vector3.new(0,1,0)
								if s <= 0 then
									player.Character.Humanoid.Health = 0
								end
								s -= 0.7
								wait()
							end
							wait(1)
							lava:Destroy()
						end
					end
				end
			end
		end
	}
end