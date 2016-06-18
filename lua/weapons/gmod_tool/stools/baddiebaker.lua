
TOOL.Category = "Crotools"

if ( CLIENT ) then
	language.Add("tool.baddiebaker.name", "Baddie Baker")
	language.Add("tool.baddiebaker.desc", "Spams baddies that die instantly")
	language.Add("Tool.baddiebaker.0", "Click anywhere to spam baddies")
end

TOOL.Name = "#tool.baddiebaker.name"
TOOL.LeftClickAutomatic = true
TOOL.RightClickAutomatic = true

function TOOL:LeftClick( trace )
	if ( IsValid( trace.Entity ) && trace.Entity:IsPlayer() ) then return false end
	if ( CLIENT ) then return true end
	local ply = self:GetOwner()
	timer.Simple(0.1, function()
		baddie = ents.Create("npc_zombie")
		if ( !IsValid( baddie ) ) then return end
		baddie:SetPos(trace.HitPos)
		baddie:Spawn()
		baddie:TakeDamage(baddie:Health(), ply,ply)
	end)
end

function TOOL:RightClick( trace )
	return self:LeftClick( trace, true )
end