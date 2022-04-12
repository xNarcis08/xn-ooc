RegisterServerEvent("W00PI:DisplayShare")
AddEventHandler("W00PI:DisplayShare", function(message)
    TriggerClientEvent("W00PI:DisplayTrigger", -1, message, source)
end)
