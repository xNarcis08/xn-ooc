RegisterServerEvent("xnarcis08:githubooc")
AddEventHandler("xnarcis08:githubooc", function(message)
    TriggerClientEvent("xnarcis08:github", -1, message, source)
end)
