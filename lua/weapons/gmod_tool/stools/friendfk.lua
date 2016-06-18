
TOOL.Category = "Crotools"

if ( CLIENT ) then
	language.Add("tool.friendfk.name", "Friend F*cker")
	language.Add("tool.friendfk.desc", "Spams allies that die instantly")
	language.Add("Tool.friendfk.0", "Click anywhere to spam allies")
end

TOOL.Name = "#tool.friendfk.name"
TOOL.LeftClickAutomatic = true
TOOL.RightClickAutomatic = true

function TOOL:LeftClick( trace )
	if ( IsValid( trace.Entity ) && trace.Entity:IsPlayer() ) then return false end
	if ( CLIENT ) then return true end
	local ply = self:GetOwner()
	timer.Simple(0.1, function()
		friend = ents.Create("npc_alyx")
		if ( !IsValid( friend ) ) then return end
		friend:SetPos(trace.HitPos)
		friend:Spawn()
		friend:TakeDamage(friend:Health(), ply,ply)
	end)
end

function TOOL:RightClick( trace )
	return self:LeftClick( trace, true )
end