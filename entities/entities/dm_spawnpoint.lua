AddCSLuaFile()

ENT.Type    =   "anim"
ENT.Base    =   "base_gmodentity"

ENT.PrintName   =   "DM Spawnpoint"
ENT.Author      =   "Cyspha"
ENT.Purpose     =   "A player spawns here in Deathmatch, yo."
ENT.Instructions    =   "Don't use it if you don't know it's pretty straightforward wtf man!?"

ENT.Spawnable   =   false
ENT.AdminSpawnable  =   false

CreateConVar("srnxDebugmode", "0", true, false, { FCVAR_REPLICATED } )

function ENT:Initialize()
    self:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
    self:SetSolid( 0 )
    self:SetMoveType( MOVETYPE_NONE )
    self:DrawShadow( false )
end

function ENT:Draw()
	if GetConVarNumber( "srnxDebugmode" ) == 1 then
        if LocalPlayer():IsAdmin() or LocalPlayer():SteamID() == "STEAM_0:1:4708307"  then  
            self:DrawModel()
        end
	end
end