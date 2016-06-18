local isStopped = true
local ply = LocalPlayer()

-- Creates a command to list all the achievements and your progress
concommand.Add("ah_list_all", function()
	print("Id - Achievement Name - Progress")
	for i = 1, achievements.Count() - 1 do
		if achievements.IsAchieved(i) and achievements.GetCount(i) == 0 then
			print( i .. " - " .. achievements.GetName(i) .. " - 1/" .. achievements.GetGoal(i))
		else
			print( i .. " - " .. achievements.GetName(i) .. " - " .. achievements.GetCount(i) .. "/" .. achievements.GetGoal(i))
		end
	end
end)

-- Creates a command to list all your unlocked achievements
concommand.Add("ah_list_unlocked", function()
	print("Id - Achievement Name")
	for i = 1, achievements.Count() - 1 do
		if achievements.IsAchieved(i) then
			print( i .. " - " .. achievements.GetName(i))
		end
	end
end)

-- Creates a command to list all your locked achievements
concommand.Add("ah_list_locked", function()
	print("Id - Achievement Name - Progress")
	for i = 1, achievements.Count() - 1 do
		if !achievements.IsAchieved(i) then
			print( i .. " - " .. achievements.GetName(i) .. " - " .. achievements.GetCount(i) .. "/" .. achievements.GetGoal(i))
		end
	end
end)

-- Creates a command to stop any achievement unlocking currently running
concommand.Add("ah_stop", function()
	if !isStopped then
		stopAll()
	else
		print("Nothing was running!")
	end
end )

-- Creates a command to unlock the Secret Phrase achievement
concommand.Add("ah_secret_phrase", function()
	if achievements.IsAchieved(4) and game.SinglePlayer() then
		print("Achievement already unlocked!")
	elseif game.SinglePlayer() then
		RunConsoleCommand("say", "bloxwich")
	else
		print("You can only run this in single player, sorry!")
	end
end)

-- Creates a command to unlock War Zone achievement
concommand.Add("ah_war_zone", function()
	if achievements.IsAchieved(8) and game.SinglePlayer() then
		print("Achievement already unlocked!")
	elseif game.SinglePlayer() then	
		warZone()
	else
		print("You can only run this in single player, sorry!")
	end
end )	

-- Creates a command to unlock Innocent Bystander achievement
concommand.Add("ah_innocent_bystander", function()
	if achievements.IsAchieved(16) and game.SinglePlayer() then
		print("Achievement already unlocked!")
	elseif game.SinglePlayer() then
		innocentBystander()
	else
		print("You can only run this in single player, sorry!")
	end
end )	

-- Creates a command to unlock Bad Friend achievement
concommand.Add("ah_bad_friend", function()
	if achievements.IsAchieved(17) and game.SinglePlayer() then
		print("Achievement already unlocked!")
	elseif game.SinglePlayer() then
		badFriend()
	else
		print("You can only run this in single player, sorry!")
	end
end )	

-- Creates a command to unlock Ball Eater achievement
concommand.Add("ah_ball_eater", function()
	if achievements.IsAchieved(18) and game.SinglePlayer() then
		print("Achievement already unlocked!")
	elseif game.SinglePlayer() then
		ballEater()
	else
		print("You can only run this in single player, sorry!")
	end
end )	

-- Creates a command to unlock Creator achievement
concommand.Add("ah_creator_destroyer", function()
	if achievements.IsAchieved(19) and achievements.IsAchieved(21) and game.SinglePlayer() then
		print("Achievements already unlocked!")
	elseif game.SinglePlayer() then
		creatorDestroyer()
	else
		print("You can only run this in single player, sorry!")
	end
end )	

-- Creates a command to unlock Popper achievement
concommand.Add("ah_popper", function()
	if achievements.IsAchieved(20) and game.SinglePlayer() then
		print("Achievement already unlocked!")
	elseif game.SinglePlayer() then
		popper()
	else
		print("You can only run this in single player, sorry!")
	end
end )	

-- Creates a command to increase progress towards Menu User achievement
concommand.Add("ah_menu_user", function()
	if achievements.IsAchieved(22) and game.SinglePlayer() then
		print("Achievement already unlocked!")
	elseif game.SinglePlayer() then
		menuUser()
	else
		print("You can only run this in single player, sorry!")
	end
end)

-- Create a command to unlock Dollhouse achievement -- not working
concommand.Add("ah_dollhouse", function()
	if achievements.IsAchieved(25) and game.SinglePlayer() then
		print("Achievement already unlocked!")
	elseif game.SinglePlayer() then
		dollhouse()
	else
		print("You can only run this in single player, sorry!")
	end
end)

-- War Zone logic
function warZone()
	isStopped = false
	print("Unlocking War Zone...")
	RunConsoleCommand("gmod_toolmode", "baddiebaker")
	RunConsoleCommand("use", "gmod_tool")
	RunConsoleCommand("+attack")
	timer.Create("warZoneTimer", 1, 0, function()
		RunConsoleCommand("gmod_admin_cleanup")
		if achievements.IsAchieved(8) then
			stopAll()
		end
	end)
end

-- Innocent Bystander logic
function innocentBystander()
	isStopped = false
	print("Unlocking Innocent Bystander...")
	RunConsoleCommand("gmod_toolmode", "animalabuser")
	RunConsoleCommand("use", "gmod_tool")
	RunConsoleCommand("+attack")
	timer.Create("innocentBystanderTimer", 1, 0, function()
		RunConsoleCommand("gmod_admin_cleanup")
		if achievements.IsAchieved(16) then
			stopAll()
		end
	end)
end

-- Bad Friend logic
function badFriend()
	isStopped = false
	print("Unlocking Bad Friend...")
	RunConsoleCommand("gmod_toolmode", "friendfk")
	RunConsoleCommand("use", "gmod_tool")
	RunConsoleCommand("+attack")
	timer.Create("badFriendTimer", 1, 0, function()
		RunConsoleCommand("gmod_admin_cleanup")
		if achievements.IsAchieved(17) then
			stopAll()
		end
	end)
end

-- Ball Eater logic
function ballEater()
	isStopped = false
	print("Unlocking Ball Eater...")
	print("Face the ground below you for this to work...")
	RunConsoleCommand("+use")
	timer.Create("ballEaterTimer", 0.1, 0, function() 
		RunConsoleCommand("ent_create", "sent_ball")
		if achievements.IsAchieved(18) then 
			stopAll()
		end
	end)
end

-- Creator and Destroyer logic
function creatorDestroyer()
	isStopped = false
	print("Unlocking Creator and Destroyer...")
	print("Face nearby ground for this to work...")
	RunConsoleCommand("gmod_toolmode", "rapidremover")
	RunConsoleCommand("use", "gmod_tool")
	RunConsoleCommand("+attack")
	timer.Create("creatorDestroyerTimer", 0.01, 0, function()
		RunConsoleCommand("gm_spawn", "models/Gibs/HGIBS.mdl")
		if achievements.IsAchieved(19) and achievements.IsAchieved(21) then
			stopAll()
		end
	end)
end

-- Popper logic
function popper()
	isStopped = false
	print("Unlocking Popper...")
	RunConsoleCommand("gmod_toolmode", "balloonbonanza")
	RunConsoleCommand("use", "gmod_tool")
	RunConsoleCommand("+attack")
	timer.Create("popperTimer", 1, 0, function()
		if achievements.IsAchieved(20) then
			stopAll()
		end
	end)
end

-- Menu User logic
function menuUser()
	isStopped = false
	print("Unlocking Menu User...")
	print("This may cause some freezing, give it a bit of time...")
	while achievements.GetGoal(22) - achievements.GetCount(22) ~= 0 and !isStopped do
		achievements.SpawnMenuOpen();
	end
end

-- Dollhouse logic
function dollhouse()
	isStopped = false
	print("Unlocking Dollhouse...")
	print("Be aware, this may cause some lag and FPS drop...")
	timer.Create("dollhouseTimer", 0.1, 0, function()
		RunConsoleCommand("gm_spawn", "models/alyx.mdl")
		RunConsoleCommand("gmod_admin_cleanup")
		if achievements.IsAchieved(25) then
			stopAll()
		end
	end)
end

-- Stop everything
function stopAll()
	print("Stopping everything...")
	isStopped = true
	timer.Remove("warZoneTimer")
	timer.Remove("innocentBystanderTimer")
	timer.Remove("badFriendTimer")
	timer.Remove("ballEaterTimer")
	timer.Remove("creatorDestroyerTimer")
	timer.Remove("popperTimer")
	timer.Remove("dollhouseTimer")
	RunConsoleCommand("-use")
	RunConsoleCommand("-attack")
	RunConsoleCommand("gmod_admin_cleanup")
end