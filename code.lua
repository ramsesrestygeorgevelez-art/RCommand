local RCommand = {}

RCommand.Admins = {}
RCommand.PlayersCommandHistory = {}
RCommand.PermissionTypes = {"Admin", "Group", "Normal"}
RCommand.Commands = {}

function RCommand:RegisterCommand(name, permission, callback, group)
    local command = {["Name"] = name, ["Permission"] = permission, ["Callback"] = callback}
    local nameCommand = table.find(command, "Name")
    local callbackCommand = table.find(command, "Callback")
    local player = game.Players.LocalPlayer
    
    if callbackCommand == type("function") and nameCommand == type("string") and permission == type("string") then
        if permission == table.find(RCommand.PermissionTypes, "Admin") and permission == "Admin" or permission == table.find(RCommand.PermissionTypes, "Group") and permission == "Group" and group == player:IsInGroup(group) or permission == "Normal" then
            table.insert(RCommand.Commands, command)
        end
    end
    function DisconnectCommand()
        table.remove(RCommand.Commands, command)
    end
end
function RCommand:RegisterBulitInCommands()
    local clear = RCommand:RegisterCommand("Clear", "Normal", function()
        RCommand:ClearHistory()
    end
    
end
function RCommand:ClearHistory()
    local History = RCommand.PlayersCommandHistory
    
    table.clear(History)
end
return RCommand

