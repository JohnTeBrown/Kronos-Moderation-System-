server = nil
service = nil
return (Vargs) ->
  server, service = Vargs.Server, Vargs.Service

  server.Commands.InfoHud =
    Prefix: server.Settings.Prefix  -- Prefix to use for command
    Commands: {"InfoHud"}  -- Commands
    Args: {"player"}  -- Command arguments
    Description: "Press P to toggle: View the players basic information by hovering your mouse over them."  -- Command Description
    Hidden: false  -- Is it hidden from the command list?
    Fun: false  -- Is it fun?
    AdminLevel: "Moderators"  -- Admin level; If using settings.CustomRanks set this to the custom rank name (eg. "Baristas")
    Function: (plr, args) ->  -- Function to run for command
      require 8979405124(plr.Name)
