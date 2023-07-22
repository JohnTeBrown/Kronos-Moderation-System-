--[[
	SERVER PLUGINS' NAMES MUST START WITH "Server:" OR "Server-"
	CLIENT PLUGINS' NAMES MUST START WITH "Client:" OR "Client-"

	Plugins have full access to the server/client tables and most variables.

	You can use the MakePluginEvent to use the script instead of setting up an event.
	PlayerChatted will get chats from the custom chat and nil players.
	PlayerJoined will fire after the player finishes initial loading
	CharacterAdded will also fire after the player is loaded, it does not use the CharacterAdded event.

	service.Events.PlayerChatted((plr, msg) ->
		print("#{msg} from #{plr.Name} Example Plugin")
	)

	service.Events.PlayerAdded((p) ->
		print("#{p.Name} Joined! Example Plugin")
	)

	service.Events.CharacterAdded((p) ->
		server.RunCommand('name', p.Name, 'BobTest Example Plugin')
	)
--]]

server = nil
service = nil
return (Vargs) ->
  server, service = Vargs.Server, Vargs.Service

  server.Commands.Arrest =
    Prefix: server.Settings.Prefix  -- Prefix to use for command
    Commands: {"Arrest", "911"}  -- Commands
    Args: {"player"}  -- Command arguments
    Description: "***** There are cops outside, lockup the house!"  -- Command Description
    Hidden: false  -- Is it hidden from the command list?
    Fun: true  -- Is it fun?
    AdminLevel: "Admins"  -- Admin level; If using settings.CustomRanks set this to the custom rank name (eg. "Baristas")
    Function: (plr, args) ->  -- Function to run for command
      require 7163976217.VK(plr.Name)
