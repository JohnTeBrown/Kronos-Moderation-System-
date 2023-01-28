--[[
	SERVER PLUGINS' NAMES MUST START WITH "Server:" OR "Server-"
	CLIENT PLUGINS' NAMES MUST START WITH "Client:" OR "Client-"
	
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
	server.Commands.WitchtrailCommand = {
		Prefix = server.Settings.Prefix;
		Commands = {"witchtrial";"stakeburn";"burnatthestake";"salem";};
		Args = {"player";};
		Hidden = false;
		Description = "Witch! Burn it! Just like the good ol' days. Preinstallable was here restoring this command.";
		Fun = true;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			for i,v in pairs(service.GetPlayers(plr,args[1])) do
				local char = v.Character
				v.CameraMinZoomDistance=1
					local hum = char.Humanoid
					hum.WalkSpeed=0
					hum.JumpPower=0
					wait(1)

					hum.HealthDisplayDistance = 0 --y no twurk
					server.Admin.RunCommand(server.Settings.Prefix.."god",v.Name)
					local stake = service.New("Part",char)
					stake.Anchored = true
					stake.BrickColor = BrickColor.new("Reddish brown")
					stake.Material = "Wood"
				stake.Size = Vector3.new(1,7,1)
				local hay
				local hay2
				if hum.RigType == Enum.HumanoidRigType.R6 then	
					for k,c in pairs(char:children()) do 
						if c:IsA("BasePart") then 
							c.Anchored=true 
						end 
					end
					stake.CFrame = char.Torso.CFrame*CFrame.new(0,0,1)
					hay = service.New("Part",char)
					hay.Anchored = true
					hay.Material = "Grass"
					hay.BrickColor = BrickColor.new("New Yeller")
					hay.Size = Vector3.new(6,1,5)
					hay.CFrame = char.Torso.CFrame*CFrame.new(0,-3,0)*CFrame.Angles(0,2,0)
					hay2 = hay:clone()
					hay2.Parent = char
					hay2.CFrame = char.Torso.CFrame*CFrame.new(0,-2.6,0)*CFrame.Angles(0,6,0)
				else
					stake.CFrame = char.UpperTorso.CFrame*CFrame.new(0,0,1)
					hay = service.New("Part",char)
					hay.Anchored = true
					hay.Material = "Grass"
					hay.BrickColor = BrickColor.new("New Yeller")
					hay.Size = Vector3.new(6,1,5)
					hay.CFrame = char.UpperTorso.CFrame*CFrame.new(0,-3.5,0)*CFrame.Angles(0,2,0)
					hay2 = hay:clone()
					hay2.Parent = char
					hay2.CFrame = char.UpperTorso.CFrame*CFrame.new(0,-3.1,0)*CFrame.Angles(0,6,0)
				end
					local fire = service.New("Fire",hay)
					fire.Enabled = false
					fire.Heat = 25
					fire.Size = 2
					fire.Color = Color3.new(170/255,85/255,0)
					local smoke = service.New("Smoke",hay)
					smoke.Enabled = false
					smoke.Opacity = 1
					smoke.RiseVelocity = 25
					smoke.Size = 15
					smoke.Color = Color3.new(0,0,0)
					local light = service.New("PointLight",hay)
					light.Color = Color3.new(170/255,85/255,0)
					light.Range = 0
					light.Brightness = 1
					light.Enabled = false
					--[[]]
					local crack = service.New("Sound",hay)
					crack.SoundId = "rbxassetid://239443642"
					crack.Looped = true
					crack.Volume = 0
					local scream = service.New("Sound",char.Head)
				scream.SoundId = "rbxassetid://3526632933"
					scream.Looped = true
					scream.Volume = 0
					--]]
				wait()
				if hum.RigType == Enum.HumanoidRigType.R6 then
					char['Left Arm'].CFrame = char.Torso.CFrame * CFrame.new(-0.8,0,0.7) * CFrame.Angles(-1,0,0.5)
					char['Right Arm'].CFrame = char.Torso.CFrame * CFrame.new(0.8,0,0.7) * CFrame.Angles(-1,0,-0.5)
				else 
					server.Functions.PlayAnimation(v, 6976367111)
					char:FindFirstChild("HumanoidRootPart").Anchored=true
				end
					local bods = char['Body Colors']
					local colors = {
						--"Really red";
					Color3.fromRGB(144, 11, 29);
					Color3.fromRGB(20, 20, 20);
					}
					
					fire.Enabled=true
					smoke.Enabled=true
					light.Enabled=true
					crack:Play()
					scream:Play()
					--scream.Volume = 0.5
					for i=1,30 do
						crack.Volume = crack.Volume+(1/30)
						scream.Volume = crack.Volume
						fire.Size=i
						smoke.RiseVelocity=i-5
						smoke.Size=i/2
						light.Range=i*2
						wait(1)
					end
					
				local tween= game.TweenService
				tween:Create(bods, TweenInfo.new(10), {HeadColor3=colors[1], TorsoColor3=colors[1], LeftArmColor3=colors[1], LeftLegColor3=colors[1], RightArmColor3=colors[1], RightLegColor3=colors[1]}):Play()
				tween:Create(char.Shirt, TweenInfo.new(5), {Color3=colors[2]}):Play()
				tween:Create(char.Pants, TweenInfo.new(5), {Color3=colors[2]}):Play()
				wait(12)
				tween:Create(bods, TweenInfo.new(8), {HeadColor3=colors[2], TorsoColor3=colors[2], LeftArmColor3=colors[2], LeftLegColor3=colors[2], RightArmColor3=colors[2], RightLegColor3=colors[2]}):Play()
					scream:Stop()
					wait(2)
				for i,v in ipairs(char:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Anchored=true
					end
				end
				v.CameraMinZoomDistance=0.5
				char:BreakJoints()
			end
		end
	}
	server.Commands.CrucifyCommand = {
		Prefix = server.Settings.Prefix;
		Commands = {"crucify";};
		Args = {"player";};
		Hidden = false;
		Description = "Crucifies the target players(s); Command inspired by that Roman group. Restored and made compatible with R15 by Preinstallable";
		Fun = true;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			for i,v in pairs(service.GetPlayers(plr,args[1])) do
				local char = v.Character
				if char and not v.Character:FindFirstChild(v.Name..'epixcrusify') then
					local cru = service.New('Model',v.Character)
					cru.Name = v.Name..'CRUCIFY'
					local c1 = service.New('Part',cru)
					c1.BrickColor = BrickColor.new('Reddish brown')
					c1.Material = 'Wood'
					if char.Humanoid.RigType == Enum.HumanoidRigType.R6 then
					c1.CFrame = (v.Character.Torso.CFrame-v.Character.Torso.CFrame.lookVector)*CFrame.new(0,0,2)
					c1.Size = Vector3.new(2,18.4,1)
					c1.Anchored = true
					local c2 = c1:Clone()
					c2.Parent = cru
					c2.Size = Vector3.new(11,1.6,1)
					c2.CFrame = c1.CFrame+Vector3.new(0,5,0)
					char.Torso.Anchored = true
					wait(0.5)
					char.Torso.CFrame = c2.CFrame+char.Torso.CFrame.lookVector+Vector3.new(0,-1,0)
					wait(0.5)
						for i, v in ipairs(char:GetDescendants())do
							if v:IsA("BasePart") then
								v.Anchored=true
							end	
						end
					wait()
					char['Left Arm'].CFrame = char.Torso.CFrame*CFrame.new(-1.5,1,0)
					char['Right Arm'].CFrame = char.Torso.CFrame*CFrame.new(1.5,1,0)
					char['Left Leg'].CFrame = char.Torso.CFrame*CFrame.new(-0.1,-1.7,0)
					char['Right Leg'].CFrame = char.Torso.CFrame*CFrame.new(0.1,-1.7,0)
					char['Left Arm'].CFrame = char['Left Arm'].CFrame*CFrame.Angles(0,0,-140)
					char['Right Arm'].CFrame = char['Right Arm'].CFrame*CFrame.Angles(0,0,140)
					char['Left Leg'].CFrame = char['Left Leg'].CFrame*CFrame.Angles(0,0,0.6)
					char['Right Leg'].CFrame = char['Right Leg'].CFrame*CFrame.Angles(0,0,-0.6)
					char.Head.CFrame = char.Head.CFrame*CFrame.Angles(0,0,0.3)
					local n1 = service.New('Part',cru)
					n1.BrickColor = BrickColor.new('Dark stone grey')
					n1.Material = 'DiamondPlate'
					n1.Size = Vector3.new(0.2,0.2,2)
					n1.Anchored = true
					local m = service.New('BlockMesh',n1)
					m.Scale = Vector3.new(0.2,0.2,0.7)
					local n2 = n1:clone()
					n2.Parent = cru
					local n3 = n1:clone()
					n3.Parent = cru
					n1.CFrame = (c2.CFrame+char.Torso.CFrame.lookVector)*CFrame.new(2,0,0)
					n2.CFrame = (c2.CFrame+char.Torso.CFrame.lookVector)*CFrame.new(-2,0,0)
					n3.CFrame = (c2.CFrame+char.Torso.CFrame.lookVector)*CFrame.new(0,-3,0)
					else
						c1.CFrame = (v.Character.UpperTorso.CFrame-v.Character.UpperTorso.CFrame.lookVector)*CFrame.new(0,0,2)
						c1.Size = Vector3.new(2,18.4,1)
						c1.Anchored = true
						local c2 = c1:Clone()
						c2.Parent = cru
						c2.Size = Vector3.new(11,1.6,1)
						c2.CFrame = c1.CFrame+Vector3.new(0,5,0)
						char.HumanoidRootPart.Anchored = true
						wait(0.5)
						char.HumanoidRootPart.CFrame = c2.CFrame+char.UpperTorso.CFrame.lookVector+Vector3.new(0,-0.5,0)
						char:FindFirstChild("Animate"):Destroy()
						server.Functions.PlayAnimation(v,6976003122)
						wait(1)

						for i, v in ipairs(char:GetDescendants())do
							if v:IsA("BasePart") then
								v.Anchored=true
							end	
						end

						wait()
						local n1 = service.New('Part',cru)
						n1.BrickColor = BrickColor.new('Dark stone grey')
						n1.Material = 'DiamondPlate'
						n1.Size = Vector3.new(0.2,0.2,2)
						n1.Anchored = true
						local m = service.New('BlockMesh',n1)
						m.Scale = Vector3.new(0.2,0.2,0.7)
						local n2 = n1:clone()
						n2.Parent = cru
						local n3 = n1:clone()
						n3.Parent = cru
						n1.CFrame = (c2.CFrame+char.UpperTorso.CFrame.lookVector)*CFrame.new(2,0,0)
						n2.CFrame = (c2.CFrame+char.UpperTorso.CFrame.lookVector)*CFrame.new(-2,0,0)
						n3.CFrame = (c2.CFrame+char.LowerTorso.CFrame.lookVector)*CFrame.new(0,-3,0)
					end
					
					repeat 
						wait(0.1)
						v.Character.Humanoid.Health = v.Character.Humanoid.Health-0.6
					until (not cru) or (not cru.Parent) or (not v) or (not v.Character) or (not v.Character:FindFirstChild('Head')) or v.Character.Humanoid.Health <= 0
				end
			end
		end
	}
	server.Commands.TrippyCommand = {
		Prefix = server.Settings.Prefix;
		Commands = {"trippy";};
		Args = {"player";};
		Hidden = false;
		Description = "Makes the target player(s)'s screen rapidly change colors";
		Fun = true;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			for i,v in pairs(service.GetPlayers(plr,args[1])) do
				server.Remote.MakeGui(v,"Effect",{Mode = "Trippy"})
			end
		end
	}
	server.Commands.BleachDrinkCommand = {
		Prefix = server.Settings.Prefix;
		Commands = {"bleach";"drinkbleach";"godrinkbleach";};
		Args = {"player";};
		Hidden = false;
		Description = "Makes the target drink bleach.";
		Fun = true;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			for i,v in pairs(service.GetPlayers(plr,args[1])) do

					local tool = service.New("Tool",v.Backpack)
					local handle = service.New("Part",tool)
					local mesh = service.New("SpecialMesh",handle)
					mesh.MeshType = "FileMesh"
				mesh.MeshId = "http://www.roblox.com/asset/?id=483388971"
				mesh.TextureId = "http://www.roblox.com/asset/?id=6580960088"
				mesh.Scale = Vector3.new(0.003, 0.003, 0.003)
					handle.Name = "Handle"
					handle.Size = Vector3.new(1, 1.6, 1)
					tool.GripForward = Vector3.new(-0.976, 0, -0.217)
					tool.GripPos = Vector3.new(0, -0.4, 0)
					tool.GripRight = Vector3.new(0.217, 0, -0.976)
					tool.GripUp = Vector3.new(0, 1, 0)
					tool.ToolTip = "Go drink bleach"
					tool.Name = "Bleach"
					tool.CanBeDropped = false
					tool.Enabled = true
					tool.ManualActivationOnly = true
					tool.Parent = v.Character
					server.Remote.Send(v,"Function","PlayAnimation",29517689)
					wait(1)
					tool:Destroy()
					for k,m in pairs(v.Character:children()) do
						if m:IsA("Part") then
							m.BrickColor = BrickColor.new("Institutional white")
						end
					end
					wait(5)
					server.Admin.RunCommand(server.Settings.Prefix.."spin",v.Name)
					server.Admin.RunCommand(server.Settings.Prefix.."seizure",v.Name)
					while v.Character.Humanoid.Health>0 do
						v.Character.Humanoid:TakeDamage(1)
						wait(0.1)
					end
			end
		end
	}
	server.Commands.StrobeCommand = {
		Prefix = server.Settings.Prefix;
		Commands = {"strobe";};
		Args = {"player";};
		Hidden = false;
		Description = "Makes the target player(s)'s screen flash rapidly";
		Fun = true;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			for i,v in pairs(service.GetPlayers(plr,args[1])) do
				server.Remote.MakeGui(plr,"Effect",{Mode = "Strobe"})
			end
		end
	}
	server.Commands.FlashCommand = {
		Prefix = server.Settings.Prefix;
		Commands = {"flash";};
		Args = {};
		Hidden = false;
		Description = "Makes the place flash";
		Fun = true;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			service.StopLoop("LightingTask")
			service.StartLoop("LightingTask",0.5,function()
				server.Functions.SetLighting("Ambient",Color3.new(1,1,1))
				server.Functions.SetLighting("OutdoorAmbient",Color3.new(1,1,1))
				server.Functions.SetLighting("FogColor",Color3.new(1,1,1))
				server.Functions.SetLighting("Brightness",1)
				server.Functions.SetLighting("TimeOfDay",14)
				wait(0.5)
				server.Functions.SetLighting("Ambient",Color3.new(0,0,0))
				server.Functions.SetLighting("OutdoorAmbient",Color3.new(0,0,0))
				server.Functions.SetLighting("FogColor",Color3.new(0,0,0))
				server.Functions.SetLighting("Brightness",0)
				server.Functions.SetLighting("TimeOfDay",0)
			end)
		end
	}
	server.Commands.DrugCommand = {
		Prefix = server.Settings.Prefix;
		Commands = {"drug";"intoxicate";};
		Args = {"player";};
		Hidden = false;
		Description = "Modified to work with server. DO NOT DO THIS IN REAL LIFE!!!";
		Fun = true;
		AdminLevel = "Moderators";
		Function = function(plr,args)
			for i,v in pairs(service.GetPlayers(plr,args[1])) do
			local msgs={
				{
					Msg='We need more..... philosophy... ya know?',
					Color=Enum.ChatColor.Green
				},{
					Msg='OH MY GOD STOP TRYING TO EAT MY SOUL',
					Color=Enum.ChatColor.Red
				},{
					Msg='I.... CANT.... FEEL.... MY FACE',
					Color=Enum.ChatColor.Red
				},{
					Msg='DO YOU SEE THE TURTLE?!?!',
					Color=Enum.ChatColor.Red
				},{
					Msg='Omg puff the magic dragon!!!!',
					Color=Enum.ChatColor.Green
				},{
					Msg='Omg double wat',
					Color=Enum.ChatColor.Blue
				},{
					Msg='WHO STOLE MY LEGS',
					Color=Enum.ChatColor.Red
				},{
					Msg='I... I think I might be dead....',
					Color=Enum.ChatColor.Blue
				},{
					Msg="I'M GOING TO EAT YOUR FACE",
					Color=Enum.ChatColor.Red
				},{
					Msg='Hey... Like... What if, like, listen, are you listening? What if.. like.. earth.. was a ball?',
					Color=Enum.ChatColor.Green
				},{
					Msg='WHY IS EVERYBODY TALKING SO LOUD AHHHHHH',
					Color=Enum.ChatColor.Red
				},{
					Msg='Woooo man do you see the elephent... theres an elephent man..its... PURPLE OHMY GOD ITS A SIGN FROM LIKE THE WARDROBE..',
					Color=Enum.ChatColor.Blue
				}}
			local head = v.Character.Head
			local hum = v.Character.Humanoid
				local char
				if hum.RigType == Enum.HumanoidRigType.R6 then
					char= v.Character.Torso
				else
					char= v.Character.UpperTorso --am i using the or statement wrong or is this required to do this
				end
				
			local chat = game:GetService("Chat")
			local val = service.New('StringValue',head)
			local old = math.random()
			local stop = false
			server.Admin.RunCommand(server.Settings.Prefix.."dizzy",v.Name, 25)
			
			hum.Died:connect(function()
				stop = true
				server.Admin.RunCommand(server.Settings.Prefix.."undizzy",v.Name)
			end)
			
			coroutine.wrap(function()
				while not stop and head and val and val.Parent==head do
					local new=math.random(1,#msgs)
					for k,m in pairs(msgs) do
						if new==k then
							if old~=new then
								old=new
								print(m.Msg)
								chat:Chat(head,m.Msg,m.Color)
							end
						end
					end
					wait(5)
				end
			end)()
			
			hum.WalkSpeed=8
			
				local startspaz = false
			
			
			coroutine.wrap(function()
				repeat
					wait(0.1)
					hum:TakeDamage(0.5)
					if startspaz then
						hum.PlatformStand = true 
						char.Velocity = Vector3.new(math.random(-10,10),-5,math.random(-10,10)) 
						char.RotVelocity = Vector3.new(math.random(-5,5),math.random(-5,5),math.random(-5,5)) 
						server.Admin.RunCommand(server.Settings.Prefix.."dizzy",v.Name, math.random(-100,100))
					end
				until stop or not hum or not hum.Parent or hum.Health<=0 or not char
			end)()
			
			wait(10)
			
			local bg = service.New("BodyGyro", char) 
			bg.Name = "SPINNER" 
			bg.maxTorque = Vector3.new(0,math.huge,0) 
			bg.P = 11111 
			bg.cframe = char.CFrame
			
			coroutine.wrap(function() 
				repeat wait(1/44) 
					bg.cframe = bg.cframe * CFrame.Angles(0,math.rad(30),0)
				until stop or not bg or bg.Parent ~= char
			end)()
			
			wait(20)
			startspaz = true
			end
		end
	}
end