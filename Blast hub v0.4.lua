local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()
local UI = GUI:CreateWindow("Blast-Hub","v0.4")
local Home = UI:addPage("Home",1,true,6)
local Main = UI:addPage("Main",1,false,2)
local Muting = UI:addPage("Muting",1,false,0)
local TimePos = UI:addPage("Time Pos",1,false,0)
local Misc = UI:addPage("Misc",1,false,0)
local lp = game.Players.LocalPlayer
Home:addButton("Copy Discord Link",function()
	setclipboard("https://discord.gg/qT3qUnkS9B")
	        game.StarterGui:SetCore("SendNotification",{
            Title = "copied to clipboard";
            Text = "";
        })
end)
Main:addLabel("Playing", "put id in text box then hit play")
Main:addButton("Play", function()
		local Tool = game.Players.LocalPlayer.Backpack:FindFirstChild("BoomBox")
	if Tool then
		Tool.Parent =  game.Players.LocalPlayer.Character
		wait(.5)
		Tool.Remote:FireServer("PlaySong", ID)
	end
end)
Main:addButton("Massplay ( auto syncs )", function()
	    for _, obj in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if obj:IsA("Tool") then
            obj.Parent = lp.Character
            obj.Remote:FireServer("PlaySong", ID)
            wait(0)
            for _, obj in next, workspace:GetDescendants() do
            	if obj:IsA("Sound") then
            		obj.TimePosition = TimePosition or 0
				end
			end
        end
    end
end)
Main:addTextBox("ID","id here", function(ok)
	ID = ok
end)
Main:addLabel("Duping","Put in amount then hit enter or click")
Main:addTextBox("Dupe","amount here", function(new)
				for i=1,tonumber(new)
		do char=game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character=nil
		game.Players.LocalPlayer.Character=char
		char.Animate:Destroy()
		char.HumanoidRootPart.CFrame=CFrame.new(0,9999,0)
		wait(.1)
		char.HumanoidRootPart.Anchored=true
		for i,v in pairs(char:GetChildren()) do
			if v:IsA("Tool") then
				v.Parent=game.Players.LocalPlayer.Backpack
			end
		end
		wait(game.Players.RespawnTime-0.3)
		local t = {}
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			v.Parent=char
			v.Parent=workspace
			t[i]=v
		end
		char.Humanoid:Destroy()
		game.Players.LocalPlayer.Character=nil
		game.Players.LocalPlayer.CharacterAdded:Wait()
		char=game.Players.LocalPlayer.Character
		char:WaitForChild("Humanoid")
		wait(.1)
		for i,v in pairs(t) do
			char.Humanoid:EquipTool(v)
		end
		wait(.3)
	end	
end)
Muting:addTextBox("Target Name","EXACT NAME", function(d)
	Target = game.Players[d]
end)
Muting:addButton("Mute", function()
		    Muted = {}

	timemute = true
	repeat wait()
		 for _, obj in next, Target.Character:GetDescendants() do
			if obj:IsA("Sound") then
				obj.Playing = false
			end
		end
	until timemute == false
end)
Muting:addButton("Unmute", function()
	timemute = false
end)
Muting:addButton("Mute server", function()
			    Muted = {}

	servertimemute = true
	repeat wait()
		 for _, obj in next, workspace:GetDescendants() do
			if obj:IsA("Sound") then
				obj.Playing = false
			end
		end
	until servertimemute == false
end)
Muting:addButton("Unmute Server", function()
	servertimemute = false
end)
TimePos:addTextBox("Target","EXACT NAME", function(b)
	Target2 = game.Players[b]
end)
TimePos:addTextBox("Time Position","Number", function(c)
    TimePosition = c
end)
TimePos:addButton("Set Time Pos", function()
    for _, obj in next, Target2.Character:GetDescendants() do
        if obj:IsA("Sound") then
            obj.TimePosition = TimePosition or 0
        end
    end
end)
TimePos:addButton("Set Server Time Pos", function()
    for _, obj in next, Workspace:GetDescendants() do
        if obj:IsA("Sound") then
            obj.TimePosition = TimePosition or 0
        end
    end
end)
TimePos:addButton("Sync Server", function()
			 for _, obj in next, workspace:GetDescendants() do
			if obj:IsA("Sound") then
			obj.TimePosition = 0
		end
	end
end)
Misc:addButton("Grab tools", function()
			toolsget = true
	for i,v in pairs(workspace:GetChildren()) do
		if v:IsA("Tool") then
			v.Handle.CFrame =  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		end
	end
	workspace.ChildAdded:Connect(function(pt)
		if toolsget == true then
			if pt:IsA("Tool") then
				wait(0)
				pt.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			end
		end
	end)
end)
Misc:addButton("Ungrab tools", function()
	toolsget = false
end)
Main:addButton("Sync", function()
		print(pcall(function()
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			if v:IsA("Tool") and v:FindFirstChildOfClass("Part"):FindFirstChildOfClass("Sound") then
				coroutine.wrap(function()
					v:FindFirstChildOfClass("Part"):FindFirstChildOfClass("Sound").Playing=false
					wait()
					v:FindFirstChildOfClass("Part"):FindFirstChildOfClass("Sound").TimePosition=0
					v:FindFirstChildOfClass("Part"):FindFirstChildOfClass("Sound").Playing=true
				end)()
			end
		end
	end))
end)
Misc:addTextBox("Multiply's Daily reward coins","amount here", function(lol)
	Amount = lol
end)
Misc:addButton("daily reward dupe", function()
	    for lol = 1, Amount do
        game.ReplicatedStorage.ClaimReward:FireServer()
    end
end)
Muting:addButton("Backpack Mute", function()
	Muted = {}

	backpackmute = true
	repeat wait()
		for i,v in pairs(game.Players:GetDescendants()) do
			if v:IsA("Sound") then
				v.Playing = false
			end
		end
	until backpackmute == false
end)
Muting:addButton("Unbackpack Mute", function()
	backpackmute = false
end)
Misc:addButton("Suitcase boombox ( must be r6 )", function()
	local plr = game:GetService("Players").LocalPlayer
        local charr = game:GetService("Players").LocalPlayer.Character
        local players = game:GetService("Players"):GetPlayers()
        local gameid = game.PlaceId
        grip = true
        if plr.Character:FindFirstChild("Animate").Disabled == true then return end
                plr.Character.Humanoid:UnequipTools()
                
                plr.Character:FindFirstChild("Animate"):FindFirstChild("toolnone"):FindFirstChild("ToolNoneAnim").AnimationId = "nil"        
                plr.Character.Humanoid:UnequipTools()
        
        for _,z in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
            if z:IsA'Tool' then
                z.Parent = game.Players.LocalPlayer.Character
                z.Grip = CFrame.new(0.02, 0.71, 0)
                z.GripUp = Vector3.new(1, -0, 0)
                z.GripRight = Vector3.new(0, 0, 1)
                z.GripForward = Vector3.new(-0, -1, 0)
                        t.Handle.Massless = true
                        t.Parent = plr.Character
            end
        end      
end)
Misc:addTextBox("Rejoin dupe", "test", function(new, old, enter)
local AmountToDupe = tonumber(new)

local plr = game.Players.LocalPlayer
local char = plr.Character
local pos = char.HumanoidRootPart.Position
local http = game:GetService("HttpService")

local file = 'rejoindupe.json'
writefile(file,http:JSONEncode({
   ['AmountToDupe'] = AmountToDupe,
   ['CurrentAmount'] = 0
}))
char.HumanoidRootPart.CFrame = CFrame.new(0,999999,0)
for i,v in pairs(plr.Backpack:GetChildren()) do
   if v:IsA("Tool") then
       v.Parent = char
   end
end
wait(.3)
for i,v in pairs(char:GetChildren()) do
   if v:IsA("Tool") then
       v.Parent = workspace
   end
end

local dupescript = [[
   game:GetService("ReplicatedFirst"):RemoveDefaultLoadingScreen()
   repeat wait() until game.Players.LocalPlayer
   repeat wait() until game.Players.LocalPlayer.Character
   repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(%s)
   local plr = game.Players.LocalPlayer
   local char = plr.Character
   local file = "%s"
   local a = readfile(file)
   local data = game:GetService("HttpService"):JSONDecode(a)
   if data['CurrentAmount'] >= data['AmountToDupe'] then
       wait(0.5)
       for i,v in pairs(workspace:GetChildren()) do
           if v:IsA("Tool") then
               char.Humanoid:EquipTool(v)
           end
       end
       return
   else
       wait()
       char.HumanoidRootPart.CFrame = CFrame.new(0,999999,0)
       for i,v in pairs(plr.Backpack:GetChildren()) do
           if v:IsA("Tool") then
               v.Parent = char
           end
       end
       wait(.3)
       for i,v in pairs(char:GetChildren()) do
           if v:IsA("Tool") then
               v.Parent = workspace
           end
       end
       wait(.1)
       data['CurrentAmount'] = data['CurrentAmount'] + 1
       writefile(file,game:GetService("HttpService"):JSONEncode(data))
   end
   syn.queue_on_teleport(readfile("%s"))
   repeat
   game:GetService("TeleportService"):Teleport(game.PlaceId)    
   wait(0.5)
   until nil
]]
dupescript = string.format(dupescript,tostring(pos),file,"dupescript.lua")

writefile('dupescript.lua',dupescript)
syn.queue_on_teleport(dupescript)
game:GetService("TeleportService"):Teleport(game.PlaceId)
end)
TimePos:addButton("Troll Player, sets time pos at a random number", function()
	    for _, obj in next, Target2.Character:GetDescendants() do
        if obj:IsA("Sound") then
            obj.TimePosition = math.random(0, 60)
        end
    end
end)
TimePos:addButton("Troll Server, sets time pos at a random number",function()
	    for _, obj in next, Workspace:GetDescendants() do
        if obj:IsA("Sound") then
            obj.TimePosition = math.random(0, 70)
        end
    end
end)
