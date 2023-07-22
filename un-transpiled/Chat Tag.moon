server = nil -- Mutes warnings about unknown globals
service = nil
local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner"):WaitForChild("ChatService"))

return (Vargs) ->
  local server = Vargs.Server
  local service = Vargs.Service

  local Settings = server.Settings
  local Settings = server.Settings
  local Functions, Commands, Admin, Anti, Core, HTTP, Logs, Remote, Process, Variables, Deps

  local function Init()
    Functions = server.Functions
    Admin = server.Admin
    Anti = server.Anti
    Core = server.Core
    HTTP = server.HTTP
    Logs = server.Logs
    Remote = server.Remote
    Process = server.Process
    Variables = server.Variables
    Commands = server.Commands
    Deps = server.Deps

    Logs:AddLog("Script", "Chat tag Module Initialized")
  end

  game.Players.PlayerAdded:Connect((Player) ->
    if _G.Adonis.GetLevel(Player) == 1
      local tags =
        {
          {
            TagText: "Moderator"  -- Tag
            TagColor: Color3.fromRGB(85, 255, 0)  -- VIP Color
          }
        }

      local speaker = nil
      while not speaker
        speaker = ChatService:GetSpeaker(Player.Name)
        if speaker then break end
        wait(0.01)
      end

      speaker:SetExtraData("Tags", tags)
      speaker:SetExtraData("ChatColor", Color3.fromRGB(85, 255, 0))  -- Text Color

    elseif _G.Adonis.GetLevel(Player) == 2
      local tags =
        {
          {
            TagText: "Administrator"  -- Tag
            TagColor: Color3.fromRGB(85, 255, 0)  -- VIP Color
          }
        }

      local speaker = nil
      while not speaker
        speaker = ChatService:GetSpeaker(Player.Name)
        if speaker then break end
        wait(0.01)
      end

      speaker:SetExtraData("Tags", tags)
      speaker:SetExtraData("ChatColor", Color3.fromRGB(85, 255, 0))  -- Text Color

    elseif _G.Adonis.GetLevel(Player) == 5
      local tags =
        {
          {
            TagText: "Co-Owner"  -- Tag
            TagColor: Color3.fromRGB(85, 255, 0)  -- VIP Color
          }
        }

      local speaker = nil
      while not speaker
        speaker = ChatService:GetSpeaker(Player.Name)
        if speaker then break end
        wait(0.01)
      end

      speaker:SetExtraData("Tags", tags)
      speaker:SetExtraData("ChatColor", Color3.fromRGB(85, 255, 0))  -- Text Color
    end
  )
