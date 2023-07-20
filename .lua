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
   Increment = 0.1,
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


local AnimationTab = Window:CreateTab("🕺Animations", nil) -- Title, Image
local Section = AnimationTab:CreateSection("Intros")

local Dropdown = AnimationTab:CreateDropdown({
   Name = "Animations",
   Options = {"Intro_AnthonyShuffle_L","Intro_Backstand_U", "Intro_BillieJean_C", "Intro_Boo!_L", "Intro_BringItOn_U", "Intro_CaramellaDance_C", "Intro_ChronoSteps_R", "Intro_Clap_C", "Intro_ComeOn_R", "Intro_CleanGroove_C", "Intro_Crabby_E", "Intro_Cradles_L", "Intro_CrissCross_R", "Intro_CutePose_C", "Intro_Dab2_U", "Intro_Dab_C", "Intro_Dirty_R", "Intro_Default", "Intro_DefaultDance_U", "Intro_Distraction_E", "Intro_ElectroShuffle_L", "Intro_ElectroSwing_U", "Intro_Dribble_R", "Intro_FlapperDance_U", "Intro_FrameSkin_R", "Intro_Freestyle_R", "Intro_GetDown_U", "Intro_GoBanana_E", "Intro_HandShuffle_R", "Intro_Hate_C", "Intro_Handstand_C", "Intro_Headflips_E", "Intro_Hiphop_L", "Intro_Headless_C", "Intro_JojoGang_E", "Intro_JumpingJacks_R", "Intro_Kickflip_E", "Intro_LDance_U", "Intro_Lavish_R", "Intro_LeapingDance_C", "Intro_LegShake_U", "Intro_Levitate_L", "Intro_MarioOdyssey_R", "Intro_MickyJacky_E", "Intro_Mood_L", "Intro_NaeNae_L", "Intro_OrangeJustice_L", "Intro_NanaDance_C", "Intro_Roasted_U", "Intro_ScoutKick_C", "Intro_Poop_E", "Intro_PraiseTheLord_R", "Intro_Reanimated_L", "Intro_Reanimated_L", "Intro_Shake&Clap_E", "Intro_Separate_U", "Intro_ShakeItUp_U", "Intro_ShowOff_U", "Intro_ShuffleV2_E", "Intro_Shuffle_E", "Intro_SideHustle_R", "Intro_Sit&Sway_C", "Intro_SlapDisrespect_U", "Intro_Sit_C", "Intro_Slick_E","Intro_Smeeze_E","Intro_Springy_R","Intro_SmugDance_U","Intro_Swipe_R","Intro_Thriller_R","Intro_TrashCompacter_U","Intro_Wave_C","Intro_WhipIt_E","Intro_Wiggle_C","Intro_Zany_R"}, 
   CurrentOption = {"Option 1"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
       game:GetService("Players").LocalPlayer.Equipping.Intro.Value = Option 
   end,
})
























