# vsColete

> Ao dar /colete seu colete será setado para 100%, claro se voce for STAFF né? E tambem temos a opção /colete ID que irá dar colete para o id solicitado.

> Framework: Creative

> Developed by: Vieira's Store

> Version: Stable 🟢

# Codigos

> Copie o codigo abaixo e coloque em qualquer server.lua do seu servidor.

**CREATIVE**
```lua
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
					vRP.setArmour(otherPlayer,100)
					TriggerClientEvent("Notify",source,"verde","Você deu colete para o ID: "..nuser_id.." ",5000)
					TriggerClientEvent("resetBleeding",source)
					TriggerClientEvent("resetDiagnostic",source)
					SendWebhookMessage(logcolete,"```prolog\n[ID]: " ..user_id.. " [DEU COLETE] para o ID: "..nuser_id.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
				end
			else
				vRP.setArmour(source,100)
				TriggerClientEvent("Notify",source,"verde","Você deu colete para si mesmo.",5000)
				TriggerClientEvent("resetHandcuff",source)
				TriggerClientEvent("resetBleeding",source)
				TriggerClientEvent("resetDiagnostic",source)
				SendWebhookMessage(logcolete,"```prolog\n[O ID]: " ..user_id.. " [DEU COLETE] para si mesmo."..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
			end
		end
	end
end)
```

# Suporte
Você pode buscar suporte em nosso discord: https://discord.gg/C5tXDsZhVJ. 🆘

# Contato
- Comercial: contato.vsdev@gmail.com 🧾
- Discord: https://discord.gg/C5tXDsZhVJ 🧾
- Website: https://sites.google.com/view/vieiras-store/home 🧾
