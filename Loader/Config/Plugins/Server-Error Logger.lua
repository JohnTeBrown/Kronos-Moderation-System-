server = nil -- Mutes warnings about unknown globals
service = nil

return function(Vargs)
	local err,success = pcall(function()
		local server = Vargs.Server;
		local service = Vargs.Service;

		local Settings = server.Settings
		local Settings = server.Settings
		local Functions, Commands, Admin, Anti, Core, HTTP, Logs, Remote, Process, Variables, Deps
		local function Init()
			Functions = server.Functions;
			Admin = server.Admin;
			Anti = server.Anti;
			Core = server.Core;
			HTTP = server.HTTP;
			Logs = server.Logs;
			Remote = server.Remote;
			Process = server.Process;
			Variables = server.Variables;
			Commands = server.Commands;
			Deps = server.Deps;

			Logs:AddLog("Script", "Error Logger Module Initialized")
		end;
		
		local ScriptContextService = game:GetService("ScriptContext")
		ScriptContextService.Error:Connect(function(Message,Trace,Script)
			warn("\nINCOMING ERROR LOG \n -------------------\nMessage: " .. tostring(Message).."\n".. "Trace: "..tostring(Trace).."\n -------------------")
		end)
	end)
	if not success then warn("\nINCOMING ERROR LOG \n -------------------\nMessage: " .. tostring(err).. "\n -------------------") end
end