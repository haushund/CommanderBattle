SWEP.Author = "Cyspha"
SWEP.Contact = "N/A"
SWEP.Purpose = "Heals you and gives you a speed boost for a short amount of time."
SWEP.Instructions = "Press MOUSE1"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/v_eq_smokegrenade.mdl"
SWEP.WorldModel = "models/weapons/w_eq_flashbang_thrown.mdl"

SWEP.Primary.ClipSize = 1

SWEP.Primary.DefaultClip = 1

SWEP.Primary.Automatic = false

SWEP.Primary.Ammo = "AR2AltFire"

SWEP.Primary.Delay = 1.5

local InjectSound = Sound( "weapons/weapon_adrenaline/bloodlust_target.wav" )

function SWEP:Reload()
end

function SWEP:Think()
end

function SWEP:PrimaryAttack()
    if self:Clip1() >= 1 or self:Ammo1() >= 1 then
        self:InjectAdrenaline()
    else return end
end

function SWEP:SecondaryAttack()
end

function SWEP:InjectAdrenaline()
    if ( !SERVER ) then return end
    
    if self.Owner:Health() >= 100 then return end
    self:TakePrimaryAmmo( 1 )
    local HealthAdditions = ( self.Owner:GetMaxHealth() - self.Owner:Health() ) / 2
    self.Owner:SetHealth( math.Clamp( self.Owner:Health() + HealthAdditions, 0, 100 ) )
    self:EmitSound( InjectSound )
    
    local OwningPlayer = self.Owner
    local PreWalkSpeed = OwningPlayer:GetWalkSpeed()
    local PreRunSpeed = OwningPlayer:GetRunSpeed() 
    local PostWalkSpeed = PreWalkSpeed * 2
    local PostRunSpeed = PreRunSpeed * 2
    local WalkSpeedDifference = ( PostWalkSpeed - PreWalkSpeed ) / 5
    local RunSpeedDifference = ( PostRunSpeed - PreRunSpeed ) / 5
    
    OwningPlayer:SetWalkSpeed( PostWalkSpeed )
    OwningPlayer:SetRunSpeed( PostRunSpeed )
    for i = 5, 9 do
            timer.Simple( i, function() if OwningPlayer:Alive() then OwningPlayer:SetWalkSpeed( OwningPlayer:GetWalkSpeed() - WalkSpeedDifference ) end end  )
            timer.Simple( i, function() if OwningPlayer:Alive() then OwningPlayer:SetRunSpeed( OwningPlayer:GetRunSpeed() - RunSpeedDifference ) end end )
            timer.Simple( i, function() if OwningPlayer:Alive() then OwningPlayer:SetHealth( OwningPlayer:Health() - HealthAdditions / 15, 0 ) end end )
    end
    timer.Simple( 2, function() if self:Clip1() <= 0 and self:Ammo1() <= 0 then OwningPlayer:StripWeapon( "weapon_adrenaline" ) end end )
end

AddCSLuaFile()
    
SWEP.Weight = 5
    
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
 
if CLIENT then
    SWEP.PrintName = "Adrenaline Shot"
    
    SWEP.Slot = 5
    SWEP.SlotPos = 1
    
    SWEP.DrawAmmo = true
    
    SWEP.DrawCrosshair = false
end