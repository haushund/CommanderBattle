AddCSLuaFile ("shared.lua")
AddCSLuaFile ("cl_init.lua")

AddCSLuaFile ("Officers/UserInterface/interface_onRoundStart_client.lua")
--AddCSLuaFile ("Officers/UserInterface/interface_onRoundStart_shared.lua")

 
include( "shared.lua" )
--include( "Officers/UserInterface/interface_onRoundStart_shared.lua" )
--include( "Officers/UserInterface/interface_onRoundStart_server.lua" )

-------------------------
--GM:PlayerSelectSpawn

hook.Add ("PlayerConnect", "GM:PlayerConnect",
function (name, ip )
	
end)

hook.Add ("PlayerInitialSpawn", "GM:PlayerInitialSpawn",
function (ply)
	--ply:showMainMenu()
end)


hook.Add ("PlayerSpawn", "GM:PlayerSpawn",
function (ply)

end)

hook.Add ("PlayerDeath", "GM:PlayerDeath",
function (victim, inflictor, attacker)

end)