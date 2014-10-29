AddCSLuaFile()

ENT.Type    =   "anim"
ENT.Base    =   "base_gmodentity"

ENT.PrintName   =   "Team Spawnpoint"
ENT.Author      =   "Cyspha"
ENT.Purpose     =   "A player spawns here in team based game, yo."
ENT.Instructions    =   "Don't use it if you don't know it's pretty straightforward wtf man!?"

ENT.Spawnable   =   false
ENT.AdminSpawnable  =   false

function ENT:Initialize()
    self:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
    self:SetSolid( 0 )
    self:SetMoveType( MOVETYPE_NONE )
    self:DrawShadow( false )
end

function ENT:Draw()
	if GetConVarNumber( "srnxDebugmode" ) == 1 and LocalPlayer():IsAdmin() then
		self:DrawModel()
	end
end