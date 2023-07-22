server = nil
service = nil

return ->
  server.Logs.Kills = {}

  server.Logs.TabToType = (tab) ->
    indToName =
      Chats: "Chat"
      Joins: "Join"
      Script: "Script"
      Replications: "Replication"
      NetworkOwners: "NetworkOwner"
      RemoteFires: "RemoteFire"
      Commands: "Command"
      Exploit: "Exploit"
      Errors: "Error"
      Kills: "Kills"

    for ind, t in pairs(server.Logs)
      if t == tab
        return indToName[ind] or ind

  server.Logs.ListUpdaters.GetKillLogs = ->
    return server.Logs.Kills

  service.HookEvent("CharacterAdded", (plr) ->
    local humanoid = plr.Character:WaitForChild("Humanoid")
    humanoid.Died:Connect( ->
      local killer = humanoid:FindFirstChild("creator")
      if killer and killer.Value
        server.Logs.AddLog(server.Logs.Kills, {
          Text = killer.Value.Name .. " killed " .. plr.Name,
          Desc = killer.Value.Name .. " killed " .. plr.Name,
        })
      end
    )
  )

  server.Commands.KillLogs =
    Prefix: server.Settings.Prefix
    Commands: {"killlogs", "klogs"}
    Args: {"autoupdate"}
    Description: "Shows the kill logs."
    Hidden: false
    Fun: false
    Agents: true
    AdminLevel: "Moderators"
    Function: (plr, args) ->
      local auto
      if args[1] and type(args[1]) == "string" and (args[1]:lower() == "yes" or args[1]:lower() == "true")
        auto = 1

      server.Remote.MakeGui(plr, "List",
        Title: "Kill Logs"
        Tab: server.Logs.Kills
        Dots: true
        Update: "GetKillLogs"
        AutoUpdate: auto
      )
