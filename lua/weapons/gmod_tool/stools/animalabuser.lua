
TOOL.Category = "Crotools"

if ( CLIENT ) then
	language.Add("tool.animalabuser.name", "Animal Abuser")
	language.Add("tool.animalabuser.desc", "Spams animals that die instantly")
	language.Add("Tool.animalabuser.0", "Click anywhere to spam animals")
end

TOOL.Name = "#tool.animalabuser.name"
TOOL.LeftClickAutomatic = true
TOOL.RightClickAutomatic = true

function TOOL:LeftClick( trace )
	if ( IsValid( trace.Entity ) && trace.Entity:IsPlayer() ) then return false end
	if ( CLIENT ) then return true end
	local ply = self:GetOwner()
	timer.Simple(0.1, function()
		animal = ents.Create("npc_crow")
		if ( !IsValid( animal ) ) then return end
		animal:SetPos(trace.HitPos)
		animal:Spawn()
		animal:TakeDamage(animal:Health(), ply,ply)
	end)
end

function TOOL:RightClick( trace )
	return self:LeftClick( trace, true )
end