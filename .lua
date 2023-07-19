local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏀 Ultimate Hoopz GUI 🏀",
   LoadingTitle = "Aimware's Hoopz",
   LoadingSubtitle = "by Aimware",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Aimware Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Aimware's Hoopz",
      Subtitle = "Key System",
      Note = "Join the discord server for key",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://[Log in to view URL]"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
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

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 19},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Reach",
   CurrentValue = false,
   Flag = "ReachFlag", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       Rayfield:Notify({
   Title = "Under Developement!",
   Content = "Reach is currently being worked on",
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
   end,
})











