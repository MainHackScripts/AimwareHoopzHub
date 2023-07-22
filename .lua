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

local Dropdown = AnimationTab:CreateDropdown({
   Name = "Animations",
   Options = {"Intro_AnthonyShuffle_L","Intro_Backstand_U","Intro_BillieJean_C","Intro_Boo!_L","Intro_BringItOn_U","Intro_CaramellaDance_C","Intro_ChronoSteps_R","Intro_Clap_C","Intro_ComeOn_R","Intro_CleanGroove_C","Intro_Crabby_E","Intro_Cradles_L","Intro_CrissCross_R","Intro_CutePose_C","Intro_Dab2_U","Intro_Dab_C","Intro_Dirty_R","Intro_Default","Intro_DefaultDance_U","Intro_Distraction_E","Intro_ElectroShuffle_L","Intro_ElectroSwing_U","Intro_Dribble_R","Intro_FlapperDance_U","Intro_FrameSkin_R","Intro_Freestyle_R","Intro_GetDown_U","Intro_GoBanana_E","Intro_HandShuffle_R","Intro_Hate_C","Intro_Handstand_C","Intro_Headflips_E","Intro_Hiphop_L","Intro_Headless_C","Intro_JojoGang_E","Intro_JumpingJacks_R","Intro_Kickflip_E","Intro_LDance_U","Intro_Lavish_R","Intro_LeapingDance_C","Intro_LegShake_U","Intro_Levitate_L","Intro_MarioOdyssey_R","Intro_MickyJacky_E","Intro_Mood_L","Intro_NaeNae_L","Intro_OrangeJustice_L","Intro_NanaDance_C","Intro_Roasted_U","Intro_ScoutKick_C","Intro_Poop_E","Intro_PraiseTheLord_R","Intro_Reanimated_L","Intro_Shake&Clap_E","Intro_Separate_U","Intro_ShakeItUp_U","Intro_ShowOff_U","Intro_ShuffleV2_E","Intro_Shuffle_E","Intro_SideHustle_R","Intro_Sit&Sway_C","Intro_SlapDisrespect_U","Intro_Sit_C","Intro_Slick_E","Intro_Smeeze_E","Intro_Springy_R","Intro_SmugDance_U","Intro_Swipe_R","Intro_Thriller_R","Intro_TrashCompacter_U","Intro_Wave_C","Intro_WhipIt_E","Intro_Wiggle_C","Intro_Zany_R"}, 
   CurrentOption = {nil},
   MultipleOptions = true,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
       game:GetService("Players").LocalPlayer.Equipping.Intro = Option 
   end,
})

local Dropdown = AnimationTab:CreateDropdown({
   Name = "Dropdown Example",
   Options = {"Dunk_1HClutchReverse_L","Dunk_2HWindmill_U","Dunk_360BTL_R","Dunk_360Scoop_E","Dunk_360MailMan_L","Dunk_360Pump_E","Dunk_360Windmill_Special","Dunk_360_R","Dunk_BTB2HReverse_E","Dunk_BTBScorpion_E","Dunk_BTB_U","Dunk_BTLReverse2H_Special","Dunk_BTLBTB_E","Dunk_Backscratcher_C","Dunk_BTL_R","Dunk_Cradle_E","Dunk_CuffCradle_E","Dunk_Default","Dunk_DoubleBTL_E","Dunk_FakeBTB_Special","Dunk_FakeBTL_Special","Dunk_FrontClutch_C","Dunk_Inverter_Special","Dunk_LostAndFound_Special","Dunk_MJ_L","Dunk_MailMan_U","Dunk_PumpReverse_R","Dunk_Pendulum_R","Dunk_Reverse2HWindmill_U","Dunk_Reverse360BTB2H_Special","Dunk_Reverse360BTL_E","Dunk_Reverse360BTB_E","Dunk_Scorpion2_R","Dunk_Reverse_C","Dunk_Scorpion_R","Dunk_Switcheroo_C","Dunk_UberTomahawk_U","Dunk_Tomahawk_C","Dunk_UnderTheLegs_R","Dunk_VinceCarter360_E","Dunk_Windmill_U"},
   CurrentOption = {nil},
   MultipleOptions = true,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
        game:GetService("Players").LocalPlayer.Equipping.Dunk = Option
        game:GetService("Players").LocalPlayer.Equipping.Dunk2 = Option
        game:GetService("Players").LocalPlayer.Equipping.Dunk3 = Option 
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






















