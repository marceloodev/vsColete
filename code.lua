-----------------------------------------------------------------------------------------------------------------------------------------
-- /COLETE
-----------------------------------------------------------------------------------------------------------------------------------------
function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end

local logcolete = "SUA WEBHOOK AQUI" -- Configure a log aqui!

RegisterCommand("colete",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasGroup(user_id,"Suporte") then
			if args[1] then
				local nuser_id = parseInt(args[1])
				local otherPlayer = vRP.userSource(nuser_id)
				if otherPlayer then
					vRPC.setArmour(otherPlayer,100)
					TriggerClientEvent("resetBleeding",source)
					TriggerClientEvent("resetDiagnostic",source)
					SendWebhookMessage(logcolete,"```prolog\n[ID]: " ..user_id.. " [DEU COLETE] para o ID: "..nuser_id.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			else
				vRPC.setArmour(source,100)
				TriggerClientEvent("resetHandcuff",source)
				TriggerClientEvent("resetBleeding",source)
				TriggerClientEvent("resetDiagnostic",source)
				SendWebhookMessage(logcolete,"```prolog\n[O ID]: " ..user_id.. " [DEU COLETE] para si mesmo."..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)