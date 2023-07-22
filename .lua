local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "💢 Aimware's Hoopz GUI 💢",
   LoadingTitle = "Loading",
   LoadingSubtitle = "Aimware's Hoopz",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Aimware Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "JBQUk38XWh", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Aimware's Hoopz",
      Subtitle = "Key System",
      Note = "Join the discord server for key",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://raw.githubusercontent.com/MainHackScripts/HoopzKeySystem/main/.lua"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main Stuff", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Features")

Rayfield:Notify({
   Title = "Executed Aimware's Hoopz",
   Content = "Welcome!",
   Duration = 3,
   Image = 4483362458,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Toggle = MainTab:CreateToggle({
   Name = "Aimbot V2",
   CurrentValue = false,
   Flag = "AimbotV2Flag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       _G.silentAim = Value 
       spawn(function()
    local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")

local shootingEvent = game:GetService("ReplicatedStorage").shootingEvent
 
if workspace:FindFirstChild("PracticeArea") then
    workspace.PracticeArea.Parent = workspace.Courts
end

function power()
    return plr.Power
end
 
function changePower(goal)
    power().Value = goal
end

function added(v)
    if v.Name == "Basketball" then
        task.wait(0.5)
        hasBall = true
    end
end
 
function removed(v)
    if v.Name == "Basketball" then
        hasBall = false
    end
end
 
local jumping = false
 
for i,v in pairs(getconnections(game:GetService("UserInputService").TouchTapInWorld)) do
    for z,x in pairs(getupvalues(v.Function)) do
        if type(x) == "table" and rawget(x, 1) then
            _G.method = x
        elseif z == 10 then
            _G.key = x
        end
    end
end

shootingEvent.OnClientEvent:Connect(function(newKey)
    _G.key = newKey
end)
 
function setup()
    local dist, goal = 9e9, nil
    for i,v in pairs(workspace.Courts:GetDescendants()) do
        if v.Name == "Swish" and v:IsA("Sound") and plr.Character and plr.Character:FindFirstChild("Torso") then
            local mag = (plr.Character.Torso.Position - v.Parent.Position).Magnitude
            if dist > mag then
                dist = mag; goal = v.Parent
            end
        end
    end
    return dist, goal
end
 
function power()
    return plr.Power
end

function table(a, b)
    local args = {
X1 = a.X,
Y1 = a.Y,
Z1 = a.Z,
X2 = b.X,
Y2 = b.Y,
Z2 = b.Z
};
 
return {args[_G.method[1]], args[_G.method[2]], args[_G.method[3]], args[_G.method[4]], args[_G.method[5]], args[_G.method[6]]}
end
 
function arc()
    local dist, goal = setup()
 
    dist = math.floor(dist)
    if dist == 12 or dist == 13 then
        return 15
    elseif dist == 14 or dist == 15 then
        return 20
    elseif dist == 16 or dist == 17 then
        return 15
    elseif dist == 18 then
        return 25
    elseif dist == 19 then
        return 20
    elseif dist == 20 or dist == 21 then
        return 20
    elseif dist == 22 or dist == 23 then
        return 25
    elseif dist == 24 or dist == 25 then
        return 20
    elseif dist == 26 then
        return 15
    elseif dist == 27 or dist == 28 then
        return 25
    elseif dist == 29 or dist == 30 then
        return 20
    elseif dist == 31 then
        return 15
    elseif dist == 32 or dist == 33 then
        return 30
    elseif dist == 34 or dist == 35 or dist == 36 then
        return 25
    elseif dist == 37 or dist == 38 then
        return 35
    elseif dist == 39 or dist == 40 then
        return 30
    elseif dist == 41 then
        return 25
    elseif dist == 42 or dist == 43 then
        return 40
    elseif dist == 44 then
        return 35
    elseif dist == 45 or dist == 46 then
        return 30
    elseif dist == 47 or dist == 48 then
        return 45
    elseif dist == 49 then
        return 40
    elseif dist == 50 then
        return 35
    elseif dist == 51 then
        return 50
    elseif dist == 52 then
        return 55
    elseif dist == 53 or dist == 54 then
        return 50
    elseif dist == 55 then
        return 45
    elseif dist == 56 then
        return 40
    elseif dist == 57 or dist == 58 then
        return 55
    elseif dist == 59 or dist == 60 or dist == 61 then
        return 50
    elseif dist == 62 or dist == 63 then
        return 65
    elseif dist == 64 then
        return 55
    elseif dist == 65 then
        return 60
    elseif dist == 66 or dist == 67 then
        return 50
    elseif dist == 68 or dist == 69 then
        return 75
    elseif dist == 70 or dist == 71 then
        return 70
    elseif dist == 72 then
        return 65
    elseif dist == 73 then
        return 60
    elseif dist == 74 then
        return 50
    elseif jumping then
        if dist == 9 or dist == 10 then
            return 20
        elseif dist == 11 or dist == 12 then
            return 15
        end
    end
end

function stepped()
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local pwr = power()
        local dist, goal = setup()
        local root = plr.Character.HumanoidRootPart
 
        dist = math.floor(dist)
 
        if root and hasBall then
 
            if dist >= 13 and dist <= 16 then
                changePower(30)
            elseif dist >= 17 and dist <= 21 then
                changePower(35)
            elseif dist >= 22 and dist <= 26 then
                changePower(40)
            elseif dist >= 27 and dist <= 31 then
                changePower(45)
            elseif dist >= 32 and dist <= 36 then
                changePower(50)
            elseif dist >= 37 and dist <= 41 then
                changePower(55)
            elseif dist >= 42 and dist <= 46 then
                changePower(60)
            elseif dist >= 47 and dist <= 50 then
                changePower(65)
            elseif dist >= 51 and dist <= 56 then
                changePower(70)
            elseif dist >= 57 and dist <= 61 then
                changePower(75)
            elseif dist >= 62 and dist <= 67 then
                changePower(80)
            elseif dist >= 68 and dist <= 74 then
                changePower(85)
            elseif jumping and dist == 9 or dist == 10 or dist == 11 or dist == 12 then
                changePower(25)
            end
        end
    end
end

function stepped2()
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        local pwr = power()
        local dist, goal = setup()
        local root = plr.Character.HumanoidRootPart
 
        dist = math.floor(dist)
 
        if root and hasBall then
 
            if dist >= 13 and dist <= 16 then
                changePower(35)
            elseif dist >= 17 and dist <= 21 then
                changePower(40)
            elseif dist >= 22 and dist <= 26 then
                changePower(45)
            elseif dist >= 27 and dist <= 31 then
                changePower(50)
            elseif dist >= 32 and dist <= 36 then
                changePower(55)
            elseif dist >= 37 and dist <= 41 then
                changePower(60)
            elseif dist >= 42 and dist <= 46 then
                changePower(65)
            elseif dist >= 47 and dist <= 50 then
                changePower(70)
            elseif dist >= 51 and dist <= 56 then
                changePower(75)
            elseif dist >= 57 and dist <= 61 then
                changePower(80)
            elseif dist >= 62 and dist <= 67 then
            	changePower(85)
            elseif jumping and dist == 9 or dist == 10 or dist == 11 or dist == 12 then
                changePower(30)
            end
        end
    end
end

function shoot()
    local dist, goal = setup()
    local pwr = power()
    local arc = arc()
 
    if arc ~= nil and plr.Character and plr.Character:FindFirstChild("Humanoid") then
        local args = table(plr.Character.Torso.Position, (goal.Position + Vector3.new(0, arc, 0) - plr.Character.HumanoidRootPart.Position + plr.Character.Humanoid.MoveDirection).Unit)
 
        shootingEvent:FireServer(
            plr.Character.Basketball,
            pwr.Value,
            args,
            _G.key
        )
    end
end

function shoot2()
	local dist, goal = setup()
    local pwr = power()
    local arc = arc()
    local dist, goal = setup()
 
    dist = math.floor(dist)
 
    if arc ~= nil and dist <= 67 and plr.Character and plr.Character:FindFirstChild("Humanoid") then
        local args = table(plr.Character.Torso.Position, (goal.Position + Vector3.new(0, arc, 0) - plr.Character.HumanoidRootPart.Position + plr.Character.Humanoid.MoveDirection).Unit)
 
        shootingEvent:FireServer(
            plr.Character.Basketball,
            pwr.Value,
            args,
            _G.key
        )
    end
end

function jumped()
    if plr.Character and hasBall and plr.Character:FindFirstChild("HumanoidRootPart") and _G.silentAim then
        jumping = true
        stepped()
        task.wait(0.325)
        shoot()
        task.wait(0.1)
        jumping = false
    end
end


uis.InputBegan:Connect(function(inp)
	if inp.KeyCode == Enum.KeyCode.X then
		stepped2()
		task.wait(0.005)
		shoot2()
	end
end)

plr.Character.ChildAdded:Connect(added)
plr.Character.ChildRemoved:Connect(removed)
plr.Character.Humanoid.Jumping:Connect(jumped)
       end)

    if Value == true then 
            Rayfield:Notify({
        Title = "Aimbot V2 On",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
    end
    
    if Value == false then 
            Rayfield:Notify({
        Title = "AimbotV2 Off",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
        end 

    end,
})







local Toggle = MainTab:CreateToggle({
   Name = "Aimbot",
   CurrentValue = false,
   Flag = "AimbotFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       _G.aimToggle = Value
spawn(function()
if _G.aimToggle == false then
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("AimbotGui"):Destroy()
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
    if v.Name == "AimbotGui" then
        v:Destroy()
    end
end
elseif _G.aimToggle == true then
    
local AimbotGui = Instance.new("ScreenGui")
local AimbotFrame = Instance.new("Frame")
local RangeText = Instance.new("TextLabel")
local Basketball = game:GetService("Players").LocalPlayer.Character:WaitForChild("Basketball")


AimbotGui.Name = "AimbotGui"
AimbotGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
AimbotGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

AimbotFrame.Name = "AimbotFrame"
AimbotFrame.Parent = AimbotGui
AimbotFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
AimbotFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
AimbotFrame.Position = UDim2.new(0.389353633, 0, 0, 0)
AimbotFrame.Size = UDim2.new(0, 290, 0, 45)

RangeText.Name = "RangeText"
RangeText.Parent = AimbotFrame
RangeText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RangeText.BackgroundTransparency = 1.000
RangeText.BorderColor3 = Color3.fromRGB(0, 0, 0)
RangeText.Position = UDim2.new(0, 0, -0.111111283, 0)
RangeText.Size = UDim2.new(0, 290, 0, 50)
RangeText.Font = Enum.Font.SourceSans
RangeText.Text = "Out Of Range"
RangeText.TextColor3 = Color3.fromRGB(255, 0, 0)
RangeText.TextSize = 40.000
RangeText.TextWrapped = true
end
end)


spawn(function()
    
-- Variables

local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local UIS = game:GetService("UserInputService")
local VIM = game:GetService("VirtualInputManager")
local camera = game:GetService("Workspace").CurrentCamera
local cameraMode = game:GetService("Players").LocalPlayer.CameraMode

-- Gets Closest Hoop

function getClosest()
    local closestDistance = math.huge
    local closestRim = nil
    for i,v in pairs(game:GetService("Workspace").Courts:GetDescendants()) do
        if v.Name == "hoop" then
        local distance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
        if distance < closestDistance then
            closestDistance = distance
            closestRim = v
        end
        end
    end
    return closestRim
end





-- Opens And Closes Gui When Player Has/ Has Not Got The Ball

spawn(function()
while wait() do
game:GetService("Players").LocalPlayer.Character:WaitForChild("Basketball")
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("AimbotGui").AimbotFrame.Visible = true
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") == nil
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("AimbotGui").AimbotFrame.Visible = false
end
end)









-- In Range And Out Of Range

spawn(function()
while wait() do
local playerAndHoopDistance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - getClosest().Position).magnitude
if playerAndHoopDistance <= 74 then
    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("AimbotGui").AimbotFrame.RangeText.Text = "In Range"
    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("AimbotGui").AimbotFrame.RangeText.TextColor3 = Color3.new(0, 255, 0)
elseif playerAndHoopDistance > 74 then
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("AimbotGui").AimbotFrame.RangeText.Text = "Out Of Range"
game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("AimbotGui").AimbotFrame.RangeText.TextColor3 = Color3.new(255, 0, 0)
end
end
end)


-- Power Adjustment

function getClosest()
    local closestDistance = math.huge
    local closestRim = nil
    for i,v in pairs(game:GetService("Workspace").Courts:GetDescendants()) do
        if v.Name == "hoop" then
        local distance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
        if distance < closestDistance then
            closestDistance = distance
            closestRim = v
        end
        end
    end
    return closestRim
end



spawn(function()
    while wait() do
        if _G.aim and _G.aimToggle then
        local power = game:GetService("Players").LocalPlayer.Power
        local playerAndHoopDistance2 = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - getClosest().Position).magnitude
        if playerAndHoopDistance2 <= 74 and playerAndHoopDistance2 > 63.5 then
            power.Value = 85
        elseif playerAndHoopDistance2 <= 63.5 and playerAndHoopDistance2 > 47.45 then
            power.Value = 80
        elseif playerAndHoopDistance2 <= 47.45 then
            power.Value = 75
            if _G.aim == false then return end
            end
        end
    end
end)











-- The Aimbot

UIS.InputBegan:Connect(function(inp)
    if inp.KeyCode == Enum.KeyCode.Space and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("AimbotGui").AimbotFrame.RangeText.Text == "In Range" then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") and game:GetService("Players").LocalPlayer.Character.Humanoid.Jump then
            if _G.aimToggle then
        _G.aim = true
        spawn(function()
            local ping = game:GetService("Players").LocalPlayer.Ping
        if ping.Value <= 83 then
        wait(0.195)
        VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
        VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
        elseif ping.Value >= 83 and ping.Value <= 120 then
        wait(0.155)
        VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
        VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
        elseif ping.Value >= 120 then
        wait(0.125)
        VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, true, game, 1)
        VIM:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0, false, game, 1)
        end
        end)
        while wait() do
            local playerAndHoopDistance3 = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - getClosest().Position).magnitude
            if playerAndHoopDistance3 <= 61.999999 and playerAndHoopDistance3 >= 59 then
            camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 60, 0))
            if _G.aim == false then return end
            elseif playerAndHoopDistance3 <= 47.2 and playerAndHoopDistance3 >= 39 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 65, 0))
            if _G.aim == false then return end
            elseif playerAndHoopDistance3 <= 49.1 and playerAndHoopDistance3 >= 47.2 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 75, 0))
            if _G.aim == false then return end
            elseif playerAndHoopDistance3 <= 58.999999 and playerAndHoopDistance3 >= 55 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 65, 0))
            if _G.aim == false then return end
            elseif playerAndHoopDistance3 <= 74 and playerAndHoopDistance3 >= 71 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 50, 0))
            if _G.aim == false then return end
            elseif playerAndHoopDistance3 <= 71 and playerAndHoopDistance3 >= 68 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 60, 0))
            if _G.aim == false then return end
            elseif playerAndHoopDistance3 <= 68 and playerAndHoopDistance3 >= 66 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 65, 0))
            if _G.aim == false then return end
            elseif playerAndHoopDistance3 <= 63.3 and playerAndHoopDistance3 >= 62 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 55, 0))
                if _G.aim == false then return end
            elseif playerAndHoopDistance3 <= 63.65 and playerAndHoopDistance3 >= 63.3 then
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 72.5, 0))
                if _G.aim == false then return end
            else
                camera.CFrame = CFrame.new(camera.CFrame.Position, getClosest().Position + Vector3.new(0, 70, 0))
            if _G.aim == false then return end
                    end
                end
            end
        end
    end
end)








-- The Aimbot

UIS.InputEnded:Connect(function(inp)
    if inp.KeyCode == Enum.KeyCode.Space then
        _G.aim = false
    end
end)

-- Locking FirstPerson

spawn(function()
while wait() do
if _G.aim == true then
    game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
wait(0.2)
game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
end
end
end)
end)

    if Value == true then 
            Rayfield:Notify({
        Title = "Aimbot On",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
    end 
    
    if Value == false then 
            Rayfield:Notify({
        Title = "Aimbot Off",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
        end 
    
   end,
})







local Button = MainTab:CreateButton({
   Name = "Auto Guard",
   Callback = function()
     local plr = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local shootingEvent = game:GetService("ReplicatedStorage").shootingEvent

local tracking = false
local player = nil
local hasBall = false
local ground = nil

-- Helper function to find the nearest player with a basketball
function updateNearestPlayerWithBall()
    local dist = 9e9
    for i,v in pairs(game.Players:GetPlayers()) do
        if v.Name ~= plr.Name and v.Character and v.Character:FindFirstChild("Basketball") and not plr.Character:FindFirstChild("Basketball") and (plr.Character.Torso.Position - v.Character.Torso.Position).Magnitude < 50 then
            local mag = (plr.Character.Torso.Position - v.Character.Torso.Position).Magnitude
            if dist > mag then
                dist = mag
                player = v
            end
        end
    end
end

function moveToPlayerBasketball()
    if player and plr.Character and plr.Character:FindFirstChild("Humanoid") and not plr.Character:FindFirstChild("Basketball") and player.Character and player.Character:FindFirstChild("Basketball") then
        plr.Character.Humanoid:MoveTo(player.Character.Basketball:FindFirstChildOfClass("Part").Position + player.Character.Torso.CFrame.LookVector + ((player.Character.Humanoid.MoveDirection * 2) + (plr.Character.Torso.Velocity.Unit * 3)))

        if (player.Character.Torso.Position.Y - ground.Position.Y) > 2.5 then
            plr.Character.Humanoid.Jump = true
        end
    end
end

function updateGroundPosition()
    local part = workspace:FindPartOnRay(Ray.new(plr.Character.Torso.Position, Vector3.new(0, -100, 5)))
    if part then
        ground = part
    end
end

function onStepped()
    updateNearestPlayerWithBall()
    updateGroundPosition()

    if tracking then
        moveToPlayerBasketball()
    end
end

function began(key, gpe)
    if not gpe and key.KeyCode == Enum.KeyCode.LeftControl then
        if not tracking then
            tracking = true
        else
            tracking = false
        end
    end
end

-- Connect events
rs.Stepped:Connect(onStepped)
game:GetService("UserInputService").InputBegan:Connect(began)


local starterGui = game:GetService("StarterGui")

starterGui:SetCore("SendNotification", {
    Title = "Autoguard executed",
    Text = "Toggle is Left Control.",
    Duration = 5,
    Button1 = "Okay",
    Callback = function()
        print("Okay button clicked!")
    end
})
   end,
})

local Button = MainTab:CreateButton({
   Name = "Silent Aim",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/MainHackScripts/SilentAim/main/.lua'))()
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Reach",
   CurrentValue = false,
   Flag = "ReachFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       _G.ReachPlayer = Value 

        function getNearestPart(torso)
    local dist, part = 9e9
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
       if v:IsA("Part") and torso then
           local mag = (v.Position - torso.Position).Magnitude
           if dist > mag then
               dist = mag
               part = v
           end
        end
        end
        return part
        end



        function findClosestPlayerWithBall()
        local closestPlayerWithBasketball = nil
        local closestDistance = math.huge
        for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name ~= game:GetService("Players").LocalPlayer.Name and v.Character:FindFirstChildOfClass("Tool") then
        local distance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude
                if distance < closestDistance then
                closestDistance = distance
                closestPlayerWithBasketball = v
                end
            end
        end
        return closestPlayerWithBasketball
        end

        spawn(function()
        local RunService = game:GetService("RunService")
        RunService.RenderStepped:Connect(function()
        if _G.ReachPlayer and not game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool") and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - findClosestPlayerWithBall().Character.HumanoidRootPart.Position).magnitude <= 10 then
        firetouchinterest(getNearestPart(findClosestPlayerWithBall().Character.Torso), findClosestPlayerWithBall().Character.Basketball.Ball, 0)
        firetouchinterest(getNearestPart(findClosestPlayerWithBall().Character.Torso), findClosestPlayerWithBall().Character.Basketball.Ball, 1)
        end
        end)
        end)
        
        if Value == false then 
            Rayfield:Notify({
        Title = "Reach Turned Off",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
        end 
        
        if Value == true then 
            Rayfield:Notify({
        Title = "Reach Turned On",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
        end 
        
        
   end,
})


local Toggle = MainTab:CreateToggle({
   Name = "Ball Mag",
   CurrentValue = false,
   Flag = "BallMagFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       _G.mag = Value
        _G.magRange = 25
function getClosestBasketball()
    local closestDistance = math.huge
    local closestBasketball = nil
    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v.Name == "Basketball" then
            local distance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Ball.Position).magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestBasketball = v.Ball
            end
        end
    end
    return closestBasketball
end


spawn(function()
while _G.mag == true do
wait()
if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - getClosestBasketball().Position).magnitude <= _G.magRange then
wait()
firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, getClosestBasketball(), 0)
wait(0.001)
firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, getClosestBasketball(), 1)
if _G.mag == false then return end
end
end
end)

        if Value == true then 
            Rayfield:Notify({
        Title = "Mag Turned On",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
        end 
        
        if Value == false then 
            Rayfield:Notify({
        Title = "Mag Turned Off",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
        end 
        
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Mag Range",
   Range = {0, 25},
   Increment = 1,
   Suffix = "Mag Range",
   CurrentValue = 0,
   Flag = "MagRangeFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       _G.magRange = value
   end,
})



local Toggle = MainTab:CreateToggle({
   Name = "Anti Travel",
   CurrentValue = false,
   Flag = "AntiTravelFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       local mt = getrawmetatable(game)
	    local namecall = mt.__namecall
	    setreadonly(mt,false)
	    mt.__namecall = function(self,...)
		local args = {...}
		local method = getnamecallmethod()

		if tostring(self) == "shootingEvent" and method == "FireServer" and args[1] == "xd" then
		    if Value == false then
			args[1] = "xd"
			return self.FireServer(self, unpack(args))
		    elseif Value == true then
		    return;
			end
		end
		return namecall(self,...)
	    end
	    
	    if Value == true then
        Rayfield:Notify({
        Title = "Anti Travel On",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        },
        },
        })
	    end
	    
	    if Value == false then 
            Rayfield:Notify({
        Title = "Anti Travel Off",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
        end 
	    
   end,
})


local Toggle = MainTab:CreateToggle({
   Name = "Auto Dunk",
   CurrentValue = false,
   Flag = "AutoDunkFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       _G.autoDunk = Value

        function getCourt()
        local closestDistance = math.huge
        local closestCourt = nil
        for i,v in pairs(game:GetService("Workspace").Courts:GetDescendants()) do
        if v.Name == "CourtFloor" then
        local distance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
        if distance < closestDistance then
            closestDistance = distance
            closestCourt = v
        end
        end
        end
        return closestCourt.Parent.Parent.Parent
        end


        function getClosest()
        local closestDistance = math.huge
        local closestRim = nil
        for i,v in pairs(game:GetService("Workspace").Courts:GetDescendants()) do
        if v.Name == "hoop" then
        local distance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude
        if distance < closestDistance then
            closestDistance = distance
            closestRim = v
        end
        end
        end
        return closestRim
        end



        function returnDunkDistance()
        local dunkDistance = (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - getClosest().Position).magnitude
        return dunkDistance   
        end

        spawn(function()
        while _G.autoDunk do
        wait()
        if returnDunkDistance() <= 28 then
        local args = {
        [1] = game:GetService("Players").LocalPlayer.Character:WaitForChild("Basketball")
        }

        getCourt().FieldGoal.dunkFunction:InvokeServer(unpack(args))
        if _G.autoDunk == false then return end
        end
        end
        end)
        
        if Value == true then
        Rayfield:Notify({
        Title = "Auto Dunk On",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        },
        },
        })
    
        if Value == false then 
            Rayfield:Notify({
        Title = "Auto Dunk Off",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
        end
        end
end, 
})






                                 -- Animations

local AnimationTab = Window:CreateTab("🕺Animations", nil) -- Title, Image
local Section = AnimationTab:CreateSection("Animations")

local Button = AnimationTab:CreateButton({
   Name = "Intros/Dunks",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/MainHackScripts/AimwareIntros/main/.lua'))()
       
        Rayfield:Notify({
        Title = "Executed",
        Content = "Aimware's Hoopz",
        Duration = 1,
        Image = 4483362458,
        Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay",
         Callback = function()
         print("The user tapped Okay!")
      end
        }, 
        },
        })
   end,
})



                               -- Servers -- 

local ServerTab = Window:CreateTab("Servers", 4483362458) -- Title, Image
local Section = ServerTab:CreateSection("Server Options")

local Button = ServerTab:CreateButton({
   Name = "Rejoin",
   Callback = function()
       repeat
wait()  
until game:IsLoaded() 
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,game.JobId) 
   end,
})

local Button = ServerTab:CreateButton({
   Name = "Server Hop",
   Callback = function()
       local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
        end)
        if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
        end
        function TPReturner()
        local Site;
        if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
         end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
                end
            end
        end
        end

        function Teleport()
        while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
        end
        end

        Teleport()
   end,
})


                                        -- Player -- 


local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image
local Section = PlayerTab:CreateSection("Features")

local Slider = PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 19},
   Increment = 0.1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})


local Slider = PlayerTab:CreateSlider({
   Name = "Jump Power",
   Range = {50, 60},
   Increment = 1,
   Suffix = "JumpPower",
   CurrentValue = 50,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})


local Button = PlayerTab:CreateButton({
   Name = "Reset",
   Callback = function()
       game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
   end,
})
