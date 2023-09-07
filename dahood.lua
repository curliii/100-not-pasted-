--[[
Welcome to the most unreadable pasted code

big fat ass credits to azure for some stuff too lazy to count what bullshit i pasted (https://discord.gg/wRxZTR2AtG)
big fat ass credits to azure for some stuff too lazy to count what bullshit i pasted (https://discord.gg/wRxZTR2AtG)
]]--


if not game:IsLoaded() then
    game.Loaded:Wait()
end

--// do the funny and bypass the anti cheat
assert(getrawmetatable)
grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall

grm.__namecall = newcclosure(function(self, ...)
    local args = {...}  

    local methodName = tostring(args[1])

    local blockedMethods = {"TeleportDetect", "CHECKER_1", "CHECKER", "GUI_CHECK", "OneMoreTime", "checkingSPEED", "BANREMOTE", "PERMAIDBAN", "KICKREMOTE", "BR_KICKPC", "BR_KICKMOBILE"}

    if table.find(blockedMethods, methodName) then return end

    return old(self, ...)
end)

local hitsounds = {
    {name = "bell.wav", url = "https://github.com/nyulachan/nyula/blob/main/Sounds/bell.wav?raw=true"},
    {name = "bepis.wav", url = "https://github.com/nyulachan/nyula/blob/main/Sounds/bepis.wav?raw=true"},
    {name = "bubble.wav", url = "https://github.com/nyulachan/nyula/blob/main/Sounds/bubble.wav?raw=true"},
    {name = "cock.wav", url = "https://github.com/nyulachan/nyula/blob/main/Sounds/cock.wav?raw=true"},
    {name = "cod.wav", url = "https://github.com/nyulachan/nyula/blob/main/Sounds/cod.wav?raw=true"},
    {name = "fatality.wav", url = "https://github.com/nyulachan/nyula/blob/main/Sounds/fatality.wav?raw=true"},
    {name = "phonk.wav", url = "https://github.com/nyulachan/nyula/blob/main/Sounds/phonk.wav?raw=true"},
    {name = "sparkle.wav", url = "https://github.com/nyulachan/nyula/blob/main/Sounds/sparkle.wav?raw=true"}
}

if not isfolder("hitsounds") then
    makefolder("hitsounds")
end

for _, sound in pairs(hitsounds) do
    local path = "hitsounds" .. "/" .. sound.name
    if not isfile(path) then
        writefile(path, game:HttpGet(sound.url))
    end
end

--// Settings
local Settings = {
    Aimbot = {
        Enabled = nil,
        Prediction = {
            Vertical = nil,
            Horizontal = nil 
        },
        Smoothing = {
            Enabled = nil,
            Smoothing = nil
        },
        Hitbox = nil,
        VelocityResolver = nil,
        ReverseResolver = nil,
        Alerts = nil
    }, 
    Target = {
        Enabled = nil,
        Prediction = nil,
        Hitbox = nil,
        Alerts = nil,
        AutoSelect = nil,
        Wallcheck = nil,
        RageBot = nil,
        UseFov = nil,
        LookAt = nil,
        Fov = nil,
        FovColor = nil,
        AntiGroundShots = nil,
        Jumpoffset = {
            Enabled = nil,
            Value = nil
        },
        Visuals = {
            OnHit = {
                Enabled = nil,
                Method = nil,
                Hitsounds = {
                    Enabled = nil,
                    Sound = nil
                },
                Hitchams = {
                    Enabled = nil,
                    Color = nil
                },
            },
            PredVisualizer = {
                Enabled = nil,
                Type = nil,
                Color = nil
            },
            Chams = {
                Enabled = nil,
                Color = nil,
                Transparency = nil
            },
            TargetStrafe = {
                Enabled = nil,
                Speed = nil,
                Distance = nil,
                Height = nil,
                Visualize = {
                    Enabled = nil,
                    Color = nil
                },
            },
        }
    },
    Blatant = {
        Exploits = {
            NoRecoil = nil,
            NoJumpCooldown = nil,
            NoSlowdown = nil,
            NoFlashBang = nil,
            AutoStomp = nil,
            Desync = {
                Enabled = nil,
                Mode = nil, 
                SpinSpeed = nil,
                Jitter = {
                    Range = nil,
                    Angle = nil,
                },
                FakeLag = {
                    Enabled = nil,
                    Delay = nil,
                },
            },
        },
        CFrameSpeed = {
            Enabled = nil,
            Value = nil
        },
        Fly = {
            Value = nil
        },
    },
    Visuals = {
        Local = {
            Character = {
                Enabled = nil,
                Material = nil
            },
            BulletTracers = {
                Enabled = nil,
                Color = nil,
                HideBulletRays = nil,
                Thickness = nil,
                Duration = nil
            },
            BulletImpacts = {
                Enabled = nil,
                Color = nil,
                Size = nil,
                Duration = nil
            },
            Crosshair = {
                Enabled = nil,
                Rotation = nil,
                RotationSpeed = nil 
            },
            Atmosphere = {
                Ambient = {
                    Enabled = nil,
                    Color = nil
                },
                Fog = {
                    Enabled = nil,
                    Color = nil,
                    Start = nil,
                    End = nil
                },
                ColorShift = {
                    Enabled = nil,
                    Bottom = nil,
                    Top = nil
                },
                Brightness = {
                    Enabled = nil,
                    BrightnessValue = nil
                }
            },
            World = {
                TimeOfDay = {
                    Enabled = nil,
                    Time = nil
                }
            }
        },
    },
}

--// Variables
local lplr = game:GetService("Players").LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local mouse = lplr:GetMouse()

--// Library
local repo = "https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local funnydrawing = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/3D%20Drawing%20Api.lua"))()

local threeDcircle = funnydrawing:New3DCircle()
threeDcircle.Visible = false
threeDcircle.ZIndex = 999
local predcube = funnydrawing:New3DCube()
predcube.Visible = false
predcube.ZIndex = 1000
predcube.Transparency = 1
predcube.Color = Color3.fromRGB(255, 255, 255)
predcube.Thickness = 1
predcube.Filled = false
predcube.Size = Vector3.new(0.5, 0.5, 0.5)
local DotParent = Instance.new("Part", workspace)
local newBillboard = Instance.new("BillboardGui", DotParent)
local newFrame = Instance.new("Frame", newBillboard)
local newUiCornor = Instance.new("UICorner", newFrame)
newBillboard.Name = "billboarddot"
newBillboard.Adornee = DotParent
newBillboard.Size = UDim2.new(1, 0, 1, 0)
newBillboard.AlwaysOnTop = true
newFrame.Size = UDim2.new(1, 0, 1, 0)
newFrame.BackgroundTransparency = 0
newUiCornor.CornerRadius = UDim.new(50, 50)
DotParent.CanCollide = false
DotParent.Anchored = true
DotParent.CFrame = CFrame.new(0, 2000, 0)
DotParent.Transparency = 1

--// esp
getgenv().taffy_esp = {
    box = {
        enabled1 = true,
        enabled = false,
        filled = false,
        filledColor = Color3.fromRGB(255, 255, 255),
        outline = true,
        healthbar = false,
        color1 = Color3.fromRGB(255, 255, 255),
        color2 = Color3.fromRGB(0, 0, 0),
        healthbarcolor = Color3.fromRGB(4, 0, 255)
    },
    tracer = {
        enabled = false,
        unlocktracers = false,
        color = Color3.fromRGB(255, 255, 255)
    },
    armorbar = {
        enabled = false,
        color = Color3.new(42, 178, 201)
    },
    name = {
        enabled = false,
        outline = true,
        size = 15,
        font = 2,
        color = Color3.fromRGB(255, 255, 255)
    },
    misc = {
        teamcheck = false,
        useteamcolors = false,
        visibleonly = true,
        target = false,
        fade = false,
        fadespeed = 1
    },
    Toolsshow = {
        enable = false,
        outline = true,
        size = 8,
        font = 3,
        color = Color3.fromRGB(147, 39, 161)
    }
}

function lerp(a, b, t)
    return a + (b - a) * t
end

function esp(v)
    local function fade(drawObject)
        local currentAlpha = drawObject.Transparency
        local lerpAlpha = taffy_esp.misc.fadespeed * 0.05

        if taffy_esp.misc.fade then
            local oscillation = (math.sin(tick() * taffy_esp.misc.fadespeed) + 1) / 2
            drawObject.Transparency = lerp(currentAlpha, oscillation, lerpAlpha)
        else
            drawObject.Transparency = 1
        end
    end
    
    local function fadeFill(drawObject)
        local currentAlpha = drawObject.Transparency
        local lerpAlpha = taffy_esp.misc.fadespeed * 0.05
    
        if taffy_esp.misc.fade then
            local oscillation = (math.sin(tick() * taffy_esp.misc.fadespeed) + 1) / 2
            local newAlpha = lerp(currentAlpha, oscillation, lerpAlpha)
            drawObject.Transparency = math.min(newAlpha, 0.3)
        else
            drawObject.Transparency = 0.3
        end
    end
    
    local BLOCKOUTLINE = Drawing.new("Square")
    BLOCKOUTLINE.Visible = false
    BLOCKOUTLINE.Color = Color3.new(0, 0, 0)
    BLOCKOUTLINE.Thickness = 3
    BLOCKOUTLINE.Transparency = 1
    BLOCKOUTLINE.Filled = false

    local BOXPLAYER = Drawing.new("Square")
    BOXPLAYER.Visible = false
    BOXPLAYER.Color = taffy_esp.box.color1
    BOXPLAYER.Thickness = 1
    BOXPLAYER.Transparency = 1
    BOXPLAYER.Filled = false

    local HealthBarOUTLINE = Drawing.new("Square")
    HealthBarOUTLINE.Thickness = 1
    HealthBarOUTLINE.Filled = false
    HealthBarOUTLINE.Color = Color3.new(0, 0, 0)
    HealthBarOUTLINE.Transparency = 1
    HealthBarOUTLINE.Visible = false

    local HealthBarITSELF = Drawing.new("Square")
    HealthBarITSELF.Thickness = 1
    HealthBarITSELF.Filled = false
    HealthBarITSELF.Transparency = 1
    HealthBarITSELF.Visible = false

    local FILLEDBOXPLAYER = Drawing.new("Square")
    FILLEDBOXPLAYER.Visible = false
    FILLEDBOXPLAYER.Color = taffy_esp.box.filledColor
    FILLEDBOXPLAYER.Filled = true
    FILLEDBOXPLAYER.Transparency = 0.3

    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1, 1, 1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1

    local Name = Drawing.new("Text")
    Name.Transparency = 1
    Name.Visible = false
    Name.Color = taffy_esp.name.color
    Name.Size = 16
    Name.Center = true
    Name.Outline = false
    Name.Font = 2

    local ArmorBarOUTLINE = Drawing.new("Square")
    ArmorBarOUTLINE.Thickness = 1
    ArmorBarOUTLINE.Filled = false
    ArmorBarOUTLINE.Color = Color3.new(0, 0, 0)
    ArmorBarOUTLINE.Transparency = 1
    ArmorBarOUTLINE.Visible = false

    local ArmorBarITSELF = Drawing.new("Square")
    ArmorBarITSELF.Thickness = 1
    ArmorBarITSELF.Filled = false
    ArmorBarITSELF.Transparency = 1
    ArmorBarITSELF.Visible = false
    ArmorBarITSELF.Color = getgenv().taffy_esp.armorbar.color

    local toolshow = Drawing.new("Text")
    toolshow.Transparency = 1
    toolshow.Visible = false
    toolshow.Color = getgenv().taffy_esp.Toolsshow.color
    toolshow.Size = 16
    toolshow.Center = true
    toolshow.Outline = getgenv().taffy_esp.Toolsshow.outline
    toolshow.Font = 2

    game:GetService("RunService").RenderStepped:Connect(function()
        if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 and (not taffy_esp.misc.teamcheck or v.TeamColor == lplr.TeamColor) and v.Character:FindFirstChild("Head") ~= nil then
            local Vector, onScreen = CurrentCamera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
            if onScreen then
                local RootPart = v.Character.HumanoidRootPart
                local Head = v.Character.Head
                local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
                local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + Vector3.new(0, 0.5, 0))
                local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - Vector3.new(0, 3, 0))

                if not taffy_esp.misc.target or v == TargetTarget and TargetBindEnabled then
                    if taffy_esp.box.enabled1 then
                        local height = HeadPosition.Y - LegPosition.Y
                        local yOffset = 0
                        local centerHeight = LegPosition.Y + height / 2
                        local boxSize = Vector2.new(2500 / RootPosition.Z, height)
                        local boxPosition = Vector2.new(RootPosition.X - boxSize.X / 2, centerHeight - boxSize.Y / 2 + yOffset)
                        BLOCKOUTLINE.Size = boxSize
                        BLOCKOUTLINE.Position = boxPosition
                        BLOCKOUTLINE.Visible = taffy_esp.box.outline
                        BLOCKOUTLINE.Color = taffy_esp.box.color2
                        local healthBarSize = Vector2.new(4, (height) / (v.Character.Humanoid.MaxHealth / math.clamp(v.Character.Humanoid.Health, 0, v.Character.Humanoid.MaxHealth)))
                        local healthBarPosition = Vector2.new(boxPosition.X - 5, boxPosition.Y + (1 / healthBarSize.Y))
                        HealthBarOUTLINE.Size = healthBarSize
                        HealthBarOUTLINE.Position = healthBarPosition
                        HealthBarOUTLINE.Visible = taffy_esp.box.outline and taffy_esp.box.healthbar
                        HealthBarITSELF.Size = Vector2.new(healthBarSize.X - 2, healthBarSize.Y - 2)
                        HealthBarITSELF.Position = Vector2.new(healthBarPosition.X + 1, healthBarPosition.Y + 1)
                        HealthBarITSELF.Color = taffy_esp.box.healthbarcolor
                        HealthBarITSELF.Visible = taffy_esp.box.healthbar
                        BOXPLAYER.Size = boxSize
                        BOXPLAYER.Position = boxPosition
                        BOXPLAYER.Visible = taffy_esp.box.enabled
                        if not taffy_esp.misc.useteamcolors then
                            local color = v.TeamColor
                            BOXPLAYER.Color = taffy_esp.box.color1
                        else
                            BOXPLAYER.Color = taffy_esp.box.color1
                        end
                        if taffy_esp.box.filled then
                            FILLEDBOXPLAYER.Size = boxSize
                            FILLEDBOXPLAYER.Position = boxPosition
                            FILLEDBOXPLAYER.Visible = true

                            if not taffy_esp.misc.useteamcolors then
                                local color = v.TeamColor
                                FILLEDBOXPLAYER.Color = taffy_esp.box.filledColor
                            else
                                FILLEDBOXPLAYER.Color = taffy_esp.box.filledColor
                            end
                        else
                            FILLEDBOXPLAYER.Visible = false
                        end
                    end

                    if taffy_esp.armorbar.enabled then
                        local armorBarSize = Vector2.new(4, (HeadPosition.Y - LegPosition.Y) * (v.Character.BodyEffects.Armor.Value / 128))
                        local armorBarPosition = Vector2.new(BOXPLAYER.Position.X + BOXPLAYER.Size.X + 2, BOXPLAYER.Position.Y)
                        ArmorBarOUTLINE.Size = armorBarSize
                        ArmorBarOUTLINE.Position = armorBarPosition
                        ArmorBarOUTLINE.Visible = taffy_esp.armorbar.enabled
                        ArmorBarITSELF.Size = Vector2.new(armorBarSize.X - 2, armorBarSize.Y - 2)
                        ArmorBarITSELF.Position = Vector2.new(armorBarPosition.X + 1, armorBarPosition.Y + 1)
                        ArmorBarITSELF.Color = taffy_esp.armorbar.color
                        ArmorBarITSELF.Visible = taffy_esp.armorbar.enabled
                    else
                        ArmorBarOUTLINE.Visible = false
                        ArmorBarITSELF.Visible = false
                    end
                    
                    if taffy_esp.tracer.enabled then
                        if taffy_esp.tracer.unlocktracers then
                            Tracer.From = Vector2.new(mouse.X, mouse.Y + 36)
                        else
                            Tracer.From = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 1)
                        end

                        Tracer.To = Vector2.new(Vector.X, Vector.Y)
                        Tracer.Visible = taffy_esp.tracer.enabled

                        if not taffy_esp.misc.useteamcolors then
                            local color = v.TeamColor
                            Tracer.Color = taffy_esp.tracer.color
                        else
                            Tracer.Color = taffy_esp.tracer.color
                        end
                    else
                        Tracer.Visible = false
                    end

                    if taffy_esp.Toolsshow.enable then
                        local Equipped = v.Character:FindFirstChildOfClass("Tool") and v.Character:FindFirstChildOfClass("Tool").Name or "None"
                        toolshow.Text = Equipped
                        toolshow.Position = Vector2.new(CurrentCamera:WorldToViewportPoint(v.Character.Head.Position).X, CurrentCamera:WorldToViewportPoint(v.Character.Head.Position).Y + 30)
                        toolshow.Color = getgenv().taffy_esp.Toolsshow.color
                        toolshow.Font = 3
                        Name.Size = taffy_esp.Toolsshow.size
                        toolshow.Visible = true
                    else
                        toolshow.Visible = false
                    end

                    if taffy_esp.name.enabled then
                        Name.Text = "<" .. tostring(v.Character.Humanoid.DisplayName) .. ">"
                        Name.Position = Vector2.new(CurrentCamera:WorldToViewportPoint(v.Character.Head.Position).X, CurrentCamera:WorldToViewportPoint(v.Character.Head.Position).Y - 30)
                        Name.Visible = true
                        Name.Size = taffy_esp.name.size
                        if not taffy_esp.misc.useteamcolors then
                            local color = v.TeamColor
                            Name.Color = taffy_esp.name.color
                        else
                            Name.Color = taffy_esp.name.color
                        end
                        Name.Outline = taffy_esp.name.outline
                    else
                        Name.Visible = false
                    end
                    
                    

                    fade(BLOCKOUTLINE)
                    fade(BOXPLAYER)
                    fade(HealthBarOUTLINE)
                    fade(HealthBarITSELF)
                    fade(Tracer)
                    fade(Name)
                    fade(toolshow)
                    fade(ArmorBarOUTLINE)
                    fade(ArmorBarITSELF)
                    fadeFill(FILLEDBOXPLAYER)
                else
                    BLOCKOUTLINE.Visible = false
                    BOXPLAYER.Visible = false
                    toolshow.Visible = false
                    HealthBarOUTLINE.Visible = false
                    HealthBarITSELF.Visible = false
                    Tracer.Visible = false
                    Name.Visible = false
                    FILLEDBOXPLAYER.Visible = false
                    ArmorBarOUTLINE.Visible = false
                    ArmorBarITSELF.Visible = false
                end
            else
                toolshow.Visible = false
                BLOCKOUTLINE.Visible = false
                BOXPLAYER.Visible = false
                HealthBarOUTLINE.Visible = false
                HealthBarITSELF.Visible = false
                Tracer.Visible = false
                Name.Visible = false
                FILLEDBOXPLAYER.Visible = false
                ArmorBarOUTLINE.Visible = false
                ArmorBarITSELF.Visible = false
            end
        else
            toolshow.Visible = false
            BLOCKOUTLINE.Visible = false
            BOXPLAYER.Visible = false
            HealthBarOUTLINE.Visible = false
            HealthBarITSELF.Visible = false
            Tracer.Visible = false
            Name.Visible = false
            FILLEDBOXPLAYER.Visible = false
            ArmorBarOUTLINE.Visible = false
            ArmorBarITSELF.Visible = false
        end
    end)
end



for i, v in pairs(game:GetService("Players"):GetChildren()) do
    esp(v)
end

game:GetService("Players").PlayerAdded:Connect(function(v)
    esp(v)
end)

local TargetChams = Instance.new("Highlight")
TargetChams.Parent = game:GetService("CoreGui")
TargetChams.OutlineTransparency = 1
TargetChams.FillTransparency = 0


--// Create the  main window
local Window = Library:CreateWindow({
    Title = "LineScript",
    Center = true,
    TabPadding = 4,
    AutoShow = true,
})

--// Create the main tabs
local Tabs = {
    Aiming = Window:AddTab("Combat"),
    Main = Window:AddTab("Main"),
    UiSettings = Window:AddTab("Settings")
}

--// Sections
local AimbotTab = Tabs.Aiming:AddLeftGroupbox("Aim Assist")
local TargetTabOtherXD = Tabs.Aiming:AddRightTabbox()
local TargetTab = TargetTabOtherXD:AddTab("Target")
local OnHitTab = TargetTabOtherXD:AddTab("On Hit")
local EspTab = Tabs.Main:AddLeftGroupbox("Esp")
local MovementExploitsOtherBullshit = Tabs.Main:AddRightTabbox()
local ExploitsTab = MovementExploitsOtherBullshit:AddTab("Misc")
local MovementTab = MovementExploitsOtherBullshit:AddTab("Movement")
local CrosshairTab = MovementExploitsOtherBullshit:AddTab("Crosshair")
local BulletTracersTab = Tabs.Main:AddRightGroupbox("Bullet Tracers")
local BulletImpactsTab = Tabs.Main:AddRightGroupbox("Bullet Impacts")
local PredVisualTab = Tabs.Main:AddRightGroupbox("Prediction Visualizer")
local DesyncTab = Tabs.Main:AddRightGroupbox("Desync")
local WorldTabBoxXD = Tabs.Main:AddLeftTabbox()
local TargetVisualsTab = WorldTabBoxXD:AddTab("Target")
local WorldTab = WorldTabBoxXD:AddTab("World")
local AtmosphereTab = WorldTabBoxXD:AddTab("Atmosphere")
local CharacterTab = Tabs.Main:AddLeftGroupbox("Character")
local MenuGroup = Tabs.UiSettings:AddLeftGroupbox("Config")

--// Toggles and shit
AimbotTab:AddToggle("AimbotEnabledTggle", {
    Text = "Enable",
    Default = false,
    Tooltip = "Enable Aimbot",
})

Toggles.AimbotEnabledTggle:OnChanged(function()
   Settings.Aimbot.Enabled = Toggles.AimbotEnabledTggle.Value
end)

Toggles.AimbotEnabledTggle:AddKeyPicker("AimbotKeyPickerXD", {
    Default = "None", 
    SyncToggleState = false, 

    Mode = "Toggle",

    Text = "Aimbot", 
    NoUI = false,
})

Options.AimbotKeyPickerXD:OnClick(function()
    if Settings.Aimbot.Enabled then
        AimbotBindEnabled = not AimbotBindEnabled
        if AimbotBindEnabled then
            AimbotTarget = GetClosestPlayer()
            if Settings.Aimbot.Alerts then
                Library:Notify("Aiming : "..tostring(AimbotTarget.Character.Humanoid.DisplayName))
            end
        elseif not AimbotBindEnabled then
            if Settings.Aimbot.Alerts then
                Library:Notify("Unaiming : "..tostring(AimbotTarget.Character.Humanoid.DisplayName))
            end
        end
    end
end)

AimbotTab:AddInput("AimbotPredictionTextbox", {
    Default = "7",
    Numeric = false,
    Finished = false,

    Text = "Horizontal Prediction",
    Tooltip = "Horizontal Aimbot Prediction",

    Placeholder = "Example = 7", 
})

Options.AimbotPredictionTextbox:OnChanged(function()
    Settings.Aimbot.Prediction.Horizontal = Options.AimbotPredictionTextbox.Value
end)

AimbotTab:AddInput("AimbotPredictionTextboxVertical", {
    Default = "7",
    Numeric = false,
    Finished = false,

    Text = "Vertical Prediction",
    Tooltip = "Vertical Aimbot Prediction",

    Placeholder = "Example = 7", 
})

Options.AimbotPredictionTextboxVertical:OnChanged(function()
    Settings.Aimbot.Prediction.Vertical = Options.AimbotPredictionTextboxVertical.Value
end)

AimbotTab:AddDropdown("AimbotHitboxDropdownn", {
    Values = { "Head", "HumanoidRootPart", "UpperTorso", "LowerTorso" },
    Default = 2,
    Multi = false,

    Text = "Hitbox",
    Tooltip = "Aimbot Hitbox",
})

Options.AimbotHitboxDropdownn:OnChanged(function()
    Settings.Aimbot.Hitbox = Options.AimbotHitboxDropdownn.Value
end)

AimbotTab:AddToggle("AimbotAlertsTggl", {
    Text = "Alerts",
    Default = false,
    Tooltip = "Enable Aimbot Alerts",
})

Toggles.AimbotAlertsTggl:OnChanged(function()
    Settings.Aimbot.Alerts = Toggles.AimbotAlertsTggl.Value
end)

AimbotTab:AddToggle("AimbotVelocityResolverToggle", {
    Text = "Velocity Resolver",
    Default = false,
    Tooltip = "Enable Aimbot Velocity Resolver",
})

Toggles.AimbotVelocityResolverToggle:OnChanged(function()
    Settings.VelocityResolver = Toggles.AimbotVelocityResolverToggle.Value
end)

AimbotTab:AddToggle("ReverseResolverAimbotTggle", {
    Text = "Reverse Resolver",
    Default = false,
    Tooltip = "Enable Aimbot Reverse Resolver",
})

Toggles.ReverseResolverAimbotTggle:OnChanged(function()
    Settings.Aimbot.ReverseResolver = Toggles.ReverseResolverAimbotTggle.Value
end)

AimbotTab:AddToggle("AimbotSmoothingEnabled", {
    Text = "Smoothing",
    Default = false,
    Tooltip = "Smooothing Enabled",
})

Toggles.AimbotSmoothingEnabled:OnChanged(function()
    Settings.Aimbot.Smoothing.Enabled = Toggles.AimbotSmoothingEnabled.Value
end)

AimbotTab:AddSlider("SmoothingValueAimbot", {
    Text = "Smoothing Value",
    Default = 0.1,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
})

Options.SmoothingValueAimbot:OnChanged(function()
    Settings.Aimbot.Smoothing.Smoothing = Options.SmoothingValueAimbot.Value
end)


TargetTab:AddToggle("TargetEnabledToggle", {
    Text = "Enable",
    Default = false,
    Tooltip = "Target Enabled",
})

Toggles.TargetEnabledToggle:OnChanged(function()
    Settings.Target.Enabled = Toggles.TargetEnabledToggle.Value
end)

Toggles.TargetEnabledToggle:AddKeyPicker("TargetKeyPickerNoway", {
    Default = "None",
    SyncToggleState = false,
    Mode = "Toggle",
    Text = "Target Aim",
    NoUI = false,
})

Options.TargetKeyPickerNoway:OnClick(function()
    if Settings.Target.Enabled then
        TargetBindEnabled = not TargetBindEnabled

        if TargetBindEnabled then
            TargetTarget = GetClosestPlayer()

            if Settings.Target.Alerts then
                Library:Notify("Targeting : " .. tostring(TargetTarget.Character.Humanoid.DisplayName))
            end
        elseif not TargetBindEnabled then
            if Settings.Target.Alerts then
                Library:Notify("Untargeting : " .. tostring(TargetTarget.Character.Humanoid.DisplayName))
            end
        end
    end
end)

TargetTab:AddDropdown("TargetHitboxDropdown", {
    Values = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
    Default = 2,
    Multi = false,
    Text = "Hit point",
    Tooltip = "Target Hit point",
})

Options.TargetHitboxDropdown:OnChanged(function()
    Settings.Target.Hitbox = Options.TargetHitboxDropdown.Value
end)

TargetTab:AddToggle("FunnyRageBotSettings", {
    Text = "Rage Bot",
    Default = false,
    Tooltip = "Rage Bot Enabled",
})

Toggles.FunnyRageBotSettings:OnChanged(function()
    Settings.Target.RageBot = Toggles.FunnyRageBotSettings.Value
end)

TargetTab:AddToggle("FunnyAutoSelectToggle", {
    Text = "Auto Select",
    Default = false,
    Tooltip = "Auto Select Enabled",
})

Toggles.FunnyAutoSelectToggle:OnChanged(function()
    Settings.Target.AutoSelect = Toggles.FunnyAutoSelectToggle.Value
end)

TargetTab:AddToggle("UseFovTargetToggle", {
    Text = "Use Fov",
    Default = false,
    Tooltip = "Fov Enabled",
})

Toggles.UseFovTargetToggle:OnChanged(function()
    Settings.Target.UseFov = Toggles.UseFovTargetToggle.Value
end)

Toggles.UseFovTargetToggle:AddColorPicker("FovColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Fov Color"
})

Options.FovColorPicker:OnChanged(function()
    Settings.Target.FovColor = Options.FovColorPicker.Value
end)

TargetTab:AddSlider("FovSliderRadius", {
    Text = "Fov Radius",
    Default = 80,
    Min = 10,
    Max = 800,
    Rounding = 1,
    Compact = false,
})

Options.FovSliderRadius:OnChanged(function()
    Settings.Target.Fov = Options.FovSliderRadius.Value
end)

TargetTab:AddToggle("TargetLookAtToggle", {
    Text = "Look At",
    Default = false,
    Tooltip = "Look At Enabled",
})

Toggles.TargetLookAtToggle:OnChanged(function()
    Settings.Target.LookAt = Toggles.TargetLookAtToggle.Value
end)

TargetTab:AddToggle("TargetAlertsToggle", {
    Text = "Alerts",
    Default = false,
    Tooltip = "Alerts Enabled",
})

Toggles.TargetAlertsToggle:OnChanged(function()
    Settings.Target.Alerts = Toggles.TargetAlertsToggle.Value
end)

TargetTab:AddToggle("TargetAimResolverToggleHaha", {
    Text = "Resolver",
    Default = false,
    Tooltip = "Resolver Enabled",
})

Toggles.TargetAimResolverToggleHaha:OnChanged(function()
    Settings.Target.Resolver = Toggles.TargetAimResolverToggleHaha.Value
end)

TargetTab:AddToggle("FunnyWallcheckToggle", {
    Text = "Wallcheck",
    Default = false,
    Tooltip = "Wallcheck Enabled",
})

Toggles.FunnyWallcheckToggle:OnChanged(function()
    Settings.Target.Wallcheck = Toggles.FunnyWallcheckToggle.Value
end)

local FOVring = Drawing.new("Circle")
FOVring.Visible = Settings.Target.UseFov
FOVring.Thickness = 1
FOVring.Radius = Settings.Target.Fov
FOVring.Transparency = 1
FOVring.Color = Settings.Target.FovColor
FOVring.Position = game:GetService("UserInputService"):GetMouseLocation()


TargetTab:AddToggle("TargetAntiUndergroundlo", {
    Text = "Anti Ground Shots",
    Default = false,
    Tooltip = "Anti Ground Shots Enabled",
})

Toggles.TargetAntiUndergroundlo:OnChanged(function()
    Settings.Target.AntiGroundShots = Toggles.TargetAntiUndergroundlo.Value
end)

TargetTab:AddToggle("JumpoffsetToggle", {
    Text = "Jump Offset",
    Default = false,
    Tooltip = "Jump Offset Enabled",
})

Toggles.JumpoffsetToggle:OnChanged(function()
    Settings.Target.Jumpoffset.Enabled = Toggles.JumpoffsetToggle.Value
end)

TargetTab:AddInput("JumpOffsetSlider", {
    Default = "0",
    Numeric = false,
    Finished = false,

    Text = "Jump Offset Value",
    Tooltip = "Jump Offset Value",

    Placeholder = "Example = 2.56", 
})

Options.JumpOffsetSlider:OnChanged(function()
    Settings.Target.Jumpoffset.Value = Options.JumpOffsetSlider.Value
end)

TargetTab:AddInput("PredictionTargetTextbox", {
    Default = "0.135",
    Numeric = true,
    Finished = false,
    Text = "Prediction",
    Tooltip = "Prediction to Use for Target",
    Placeholder = "Example = 0.135",
})

Options.PredictionTargetTextbox:OnChanged(function()
    Settings.Target.Prediction = Options.PredictionTargetTextbox.Value
end)

EspTab:AddToggle("BoxESPEnabled", {
    Text = "Box",
    Default = false,
    Tooltip = "Box ESP Enabled",
})

Toggles.BoxESPEnabled:OnChanged(function()
    getgenv().taffy_esp.box.enabled = Toggles.BoxESPEnabled.Value
end)

Toggles.BoxESPEnabled:AddColorPicker("BoxESPColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Box ESP Color"
})

Options.BoxESPColor:OnChanged(function()
    getgenv().taffy_esp.box.color1 = Options.BoxESPColor.Value
end)

EspTab:AddToggle("BoxESPFIlled", {
    Text = "Box Filled",
    Default = false,
    Tooltip = "Box ESP Filled Enabled",
})

Toggles.BoxESPFIlled:OnChanged(function()
    getgenv().taffy_esp.box.filled = Toggles.BoxESPFIlled.Value
end)

Toggles.BoxESPFIlled:AddColorPicker("BoxESPFilledColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Box ESP Filled Color"
})

Options.BoxESPFilledColor:OnChanged(function()
    getgenv().taffy_esp.box.filledColor = Options.BoxESPFilledColor.Value
end)

EspTab:AddToggle("HealthESPEnabled", {
    Text = "Health",
    Default = false,
    Tooltip = "Health ESP Enabled",
})

Toggles.HealthESPEnabled:OnChanged(function()
    getgenv().taffy_esp.box.healthbar = Toggles.HealthESPEnabled.Value
end)

Toggles.HealthESPEnabled:AddColorPicker("HealthESPColor", {
    Default = Color3.fromRGB(0, 255, 0),
    Title = "Health ESP Color"
})

Options.HealthESPColor:OnChanged(function()
    getgenv().taffy_esp.box.healthbarcolor = Options.HealthESPColor.Value
end)

EspTab:AddToggle("ArmorESPEnabled", {
    Text = "Armor",
    Default = false,
    Tooltip = "Armor ESP Enabled",
})

Toggles.ArmorESPEnabled:OnChanged(function()
    getgenv().taffy_esp.armorbar.enabled = Toggles.ArmorESPEnabled.Value
end)

Toggles.ArmorESPEnabled:AddColorPicker("ArmorESPColor", {
    Default = Color3.fromRGB(42, 178, 201),
    Title = "Armor ESP Color"
})

Options.ArmorESPColor:OnChanged(function()
    getgenv().taffy_esp.armorbar.color = Options.ArmorESPColor.Value
end)

task.spawn(function()
    while true do
        wait()

        if getgenv().taffy_esp.box.healthbar or getgenv().taffy_esp.box.enabled then
            getgenv().taffy_esp.box.outline = true
        elseif getgenv().taffy_esp.box.healthbar == false or getgenv().taffy_esp.box.enabled == false then
            getgenv().taffy_esp.box.outline = false
        end

        if getgenv().taffy_esp.box.healthbar == true and getgenv().taffy_esp.box.enabled == false then
            getgenv().taffy_esp.box.outline = false
        end
    end
end)

EspTab:AddToggle("TracerESPEnabled", {
    Text = "Tracer",
    Default = false,
    Tooltip = "Tracer ESP Enabled",
})

Toggles.TracerESPEnabled:OnChanged(function()
    getgenv().taffy_esp.tracer.enabled = Toggles.TracerESPEnabled.Value
end)

Toggles.TracerESPEnabled:AddColorPicker("TracerESPColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Tracer ESP Color"
})

Options.TracerESPColor:OnChanged(function()
    getgenv().taffy_esp.tracer.color = Options.TracerESPColor.Value
end)

EspTab:AddToggle("UnlockedTracerEnabled", {
    Text = "Unlock Tracer",
    Default = false,
    Tooltip = "Unlock Tracer Enabled",
})

Toggles.UnlockedTracerEnabled:OnChanged(function()
    getgenv().taffy_esp.tracer.unlocktracers = Toggles.UnlockedTracerEnabled.Value
end)

EspTab:AddToggle("NameESPEnabled", {
    Text = "Name",
    Default = false,
    Tooltip = "Name ESP Enabled",
})

Toggles.NameESPEnabled:OnChanged(function()
    getgenv().taffy_esp.name.enabled = Toggles.NameESPEnabled.Value
end)

Toggles.NameESPEnabled:AddColorPicker("NameESPColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Name ESP Color"
})

Options.NameESPColor:OnChanged(function()
    getgenv().taffy_esp.name.color = Options.NameESPColor.Value
end)

EspTab:AddToggle("ToolESPEnabled", {
    Text = "Held Tool",
    Default = false,
    Tooltip = "Held Tool ESP Enabled",
})

Toggles.ToolESPEnabled:OnChanged(function()
    getgenv().taffy_esp.Toolsshow.enable = Toggles.ToolESPEnabled.Value
end)

Toggles.ToolESPEnabled:AddColorPicker("ToolESPColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Held Tool ESP Color"
})

Options.ToolESPColor:OnChanged(function()
    getgenv().taffy_esp.Toolsshow.color = Options.ToolESPColor.Value
end)

EspTab:AddToggle("TargettedPlayerToggleEsp", {
    Text = "Target Only",
    Default = false,
    Tooltip = "Target Only Enabled",
})

Toggles.TargettedPlayerToggleEsp:OnChanged(function()
    getgenv().taffy_esp.misc.target = Toggles.TargettedPlayerToggleEsp.Value
end)

EspTab:AddToggle("FadeESPEnabled", {
    Text = "Fade",
    Default = false,
    Tooltip = "Fade Enabled",
})

Toggles.FadeESPEnabled:OnChanged(function()
    getgenv().taffy_esp.misc.fade = Toggles.FadeESPEnabled.Value
end)

EspTab:AddSlider("ESPFadeSpeed", {
    Text = "Fade Speed",
    Default = 0.1,
    Min = 0.1,
    Max = 10,
    Rounding = 2,
    Compact = false,
})

Options.ESPFadeSpeed:OnChanged(function()
    getgenv().taffy_esp.misc.fadespeed = Options.ESPFadeSpeed.Value
end)

BulletTracersTab:AddToggle("BulletTracersEnabledFunny", {
    Text = "Enabled",
    Default = false,
    Tooltip = "Bullet Tracers Enabled",
})

Toggles.BulletTracersEnabledFunny:OnChanged(function()
    Settings.Visuals.Local.BulletTracers.Enabled = Toggles.BulletTracersEnabledFunny.Value
end)

Toggles.BulletTracersEnabledFunny:AddColorPicker("BulletTracersColorFunny", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Bullet Tracers Color"
})

Options.BulletTracersColorFunny:OnChanged(function()
    Settings.Visuals.Local.BulletTracers.Color = Options.BulletTracersColorFunny.Value
end)

BulletTracersTab:AddToggle("BulletTracersHideBulletRays", {
    Text = "Hide BULLET_RAYS",
    Default = false,
    Tooltip = "Hide BULLET_RAYS Enabled",
})

Toggles.BulletTracersHideBulletRays:OnChanged(function()
    Settings.Visuals.Local.BulletTracers.HideBulletRays = Toggles.BulletTracersHideBulletRays.Value
end)

BulletTracersTab:AddSlider("BulletTracersDuration", {
    Text = "Duration",
    Default = 1,
    Min = 0.5,
    Max = 5,
    Rounding = 2,
    Compact = false,
})

Options.BulletTracersDuration:OnChanged(function()
    Settings.Visuals.Local.BulletTracers.Duration = Options.BulletTracersDuration.Value
end)

BulletTracersTab:AddSlider("BulletTracersThickness", {
    Text = "Thickness",
    Default = 1,
    Min = 0.1,
    Max = 5,
    Rounding = 2,
    Compact = false,
})

Options.BulletTracersThickness:OnChanged(function()
    Settings.Visuals.Local.BulletTracers.Thickness = Options.BulletTracersThickness.Value
end)

BulletImpactsTab:AddToggle("BulletImpactsEnabledFunny", {
    Text = "Enabled",
    Default = false,
    Tooltip = "Bullet Impacts Enabled",
})

Toggles.BulletImpactsEnabledFunny:OnChanged(function()
    Settings.Visuals.Local.BulletImpacts.Enabled = Toggles.BulletImpactsEnabledFunny.Value
end)

Toggles.BulletImpactsEnabledFunny:AddColorPicker("BulletImpactsColorFunny", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Bullet Impacts Color"
})

Options.BulletImpactsColorFunny:OnChanged(function()
    Settings.Visuals.Local.BulletImpacts.Color = Options.BulletImpactsColorFunny.Value
end)

BulletImpactsTab:AddSlider("BulletImpactsDuration", {
    Text = "Duration",
    Default = 1,
    Min = 0.5,
    Max = 5,
    Rounding = 2,
    Compact = false,
})

Options.BulletImpactsDuration:OnChanged(function()
    Settings.Visuals.Local.BulletImpacts.Duration = Options.BulletImpactsDuration.Value
end)

BulletImpactsTab:AddSlider("BulletImpactsSize", {
    Text = "Size",
    Default = 0.30,
    Min = 0.1,
    Max = 10,
    Rounding = 2,
    Compact = false,
})

Options.BulletImpactsSize:OnChanged(function()
    Settings.Visuals.Local.BulletImpacts.Size = Options.BulletImpactsSize.Value
end)

PredVisualTab:AddToggle("PredictionVisualizerEnabled", {
    Text = "Enabled",
    Default = false,
    Tooltip = "Prediction Visaulizer Enabled",
})

Toggles.PredictionVisualizerEnabled:OnChanged(function()
    Settings.Target.Visuals.PredVisualizer.Enabled = Toggles.PredictionVisualizerEnabled.Value
end)

Toggles.PredictionVisualizerEnabled:AddColorPicker("PredictionVisualizerColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Color"
})

Options.PredictionVisualizerColor:OnChanged(function()
    Settings.Target.Visuals.PredVisualizer.Color = Options.PredictionVisualizerColor.Value
end)

PredVisualTab:AddDropdown("PredictionVisualizerTypeDropdown", {
    Values = { "Box", "Dot" },
    Default = 1,
    Multi = false,
    Text = "Type",
    Tooltip = "Type For Prediction Visualizer",
})

Options.PredictionVisualizerTypeDropdown:OnChanged(function()
    Settings.Target.Visuals.PredVisualizer.Type = Options.PredictionVisualizerTypeDropdown.Value
end)

CrosshairTab:AddToggle("CrosshairEnabledFunny", {
    Text = "Enabled",
    Default = false,
    Tooltip = "Crosshair Enabled",
})

Toggles.CrosshairEnabledFunny:OnChanged(function()
    Settings.Visuals.Local.Crosshair.Enabled = Toggles.CrosshairEnabledFunny.Value
end)

CrosshairTab:AddToggle("FunnyRotationThing", {
    Text = "Rotation",
    Default = false,
    Tooltip = "Crosshair Rotation Enabled",
})

Toggles.FunnyRotationThing:OnChanged(function()
    Settings.Visuals.Local.Crosshair.Rotation = Toggles.FunnyRotationThing.Value
end)

CrosshairTab:AddSlider("FunnyRotationSpeed", {
    Text = "Rotation Speed",
    Default = 1,
    Min = 0.5,
    Max = 5,
    Rounding = 2,
    Compact = false,
})

Options.FunnyRotationSpeed:OnChanged(function()
    Settings.Visuals.Local.Crosshair.RotationSpeed = Options.FunnyRotationSpeed.Value
end)

OnHitTab:AddToggle("OnHitEnabledFUnny", {
    Text = "Enabled",
    Default = false,
    Tooltip = "On Hit Enabled",
})

Toggles.OnHitEnabledFUnny:OnChanged(function()
    Settings.Target.Visuals.OnHit.Enabled = Toggles.OnHitEnabledFUnny.Value
end)

OnHitTab:AddToggle("HitchamsEnabledRoblox", {
    Text = "Hitchams (Laggy)",
    Default = false,
    Tooltip = "Hitchams Enabled",
})

Toggles.HitchamsEnabledRoblox:OnChanged(function()
    Settings.Target.Visuals.OnHit.Hitchams.Enabled = Toggles.HitchamsEnabledRoblox.Value
end)


Toggles.HitchamsEnabledRoblox:AddColorPicker("HitChamsColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Hitchams Color"
})

Options.HitChamsColorPicker:OnChanged(function()
    Settings.Target.Visuals.OnHit.Hitchams.Color = Options.HitChamsColorPicker.Value
end)

OnHitTab:AddToggle("HitsoundLowBudgetQuality", {
    Text = "Hitsounds",
    Default = false,
    Tooltip = "Hitsounds Enabled",
})

Toggles.HitsoundLowBudgetQuality:OnChanged(function()
    Settings.Target.Visuals.OnHit.Hitsounds.Enabled = Toggles.HitsoundLowBudgetQuality.Value
end)

OnHitTab:AddDropdown("SoundToUseFunny", {
    Values = {"hitsounds/sparkle.wav", "hitsounds/phonk.wav", "hitsounds/fatality.wav", "hitsounds/cod.wav", "hitsounds/cock.wav", "hitsounds/bubble.wav", "hitsounds/bepis.wav", "hitsounds/bell.wav"},
    Default = 1,
    Multi = false,
    Text = "Sound",
    Tooltip = "Hit sound",
})

Options.SoundToUseFunny:OnChanged(function()
    Settings.Target.Visuals.OnHit.Hitsounds.Sound = Options.SoundToUseFunny.Value
end)


OnHitTab:AddDropdown("HitMethodToUse", {
    Values = {"Raycast", "Retarded Method"},
    Default = 1,
    Multi = false,
    Text = "Method",
    Tooltip = "On Hit Method",
})

Options.HitMethodToUse:OnChanged(function()
    Settings.Target.Visuals.OnHit.Method = Options.HitMethodToUse.Value
end)

TargetVisualsTab:AddToggle("TargetVisualsChamsEnabled", {
    Text = "Chams",
    Default = false,
    Tooltip = "Target Chams Enabled",
})

Toggles.TargetVisualsChamsEnabled:OnChanged(function()
    Settings.Target.Visuals.Chams.Enabled = Toggles.TargetVisualsChamsEnabled.Value
end)

Toggles.TargetVisualsChamsEnabled:AddColorPicker("ChamsColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Chams Color"
})

Options.ChamsColorPicker:OnChanged(function()
    Settings.Target.Visuals.Chams.Color = Options.ChamsColorPicker.Value
end)

TargetVisualsTab:AddSlider("TargetChamsTransparency", {
    Text = "Chams Transparency",
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
})

Options.TargetChamsTransparency:OnChanged(function()
    Settings.Target.Visuals.Chams.Transparency = Options.TargetChamsTransparency.Value
end)

TargetVisualsTab:AddLabel("Target Strafe")

TargetVisualsTab:AddToggle("TargetStrafeEnabled", {
    Text = "Target Strafe Enabled",
    Default = false,
    Tooltip = "Target Strafe Enabled",
})

Toggles.TargetStrafeEnabled:OnChanged(function()
    Settings.Target.Visuals.TargetStrafe.Enabled = Toggles.TargetStrafeEnabled.Value
end)

Toggles.TargetStrafeEnabled:AddKeyPicker("TargetStrafeToggleKeybind", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "Target Strafe",
    NoUI = false,
})

TargetVisualsTab:AddSlider("TargetStrafeSpeedValue", {
	Text = "Speed",
	Default = 2,
	Min = 1,
	Max = 10,
	Rounding = 1,
	Compact = false
})
Options.TargetStrafeSpeedValue:OnChanged(function()
	Settings.Target.Visuals.TargetStrafe.Speed = Options.TargetStrafeSpeedValue.Value
end)

TargetVisualsTab:AddSlider("TargetStrafeDistance", {
	Text = "Distance",
	Default = 6,
	Min = 1,
	Max = 20,
	Rounding = 1,
	Compact = false
})
Options.TargetStrafeDistance:OnChanged(function()
	Settings.Target.Visuals.TargetStrafe.Distance = Options.TargetStrafeDistance.Value
end)

TargetVisualsTab:AddSlider("TargetStrafeHeight", {
	Text = "Height",
	Default = 0,
	Min = 0,
	Max = 20,
	Rounding = 1,
	Compact = false
})
Options.TargetStrafeHeight:OnChanged(function()
	Settings.Target.Visuals.TargetStrafe.Height = Options.TargetStrafeHeight.Value
end)    

TargetVisualsTab:AddToggle("VisualizeTargetStrafe", {
    Text = "Visualize Target Strafe",
    Default = false,
    Tooltip = "Target Strafe Visualize Enabled",
})

Toggles.VisualizeTargetStrafe:OnChanged(function()
    Settings.Target.Visuals.TargetStrafe.Visualize.Enabled = Toggles.VisualizeTargetStrafe.Value
end)

Toggles.VisualizeTargetStrafe:AddColorPicker("TargetStrafeVisualizeColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Target Strafe Visualize Color"
})

Options.TargetStrafeVisualizeColor:OnChanged(function()
    Settings.Target.Visuals.TargetStrafe.Visualize.Color = Options.TargetStrafeVisualizeColor.Value
end)


WorldTab:AddToggle("TimeOfDayToggleLmdao", {
    Text = "Time of Day",
    Default = false,
    Tooltip = "Time of Day Enabled",
})

Toggles.TimeOfDayToggleLmdao:OnChanged(function()
    Settings.Visuals.Local.World.TimeOfDay.Enabled = Toggles.TimeOfDayToggleLmdao.Value
end)

WorldTab:AddSlider("TimeOfDaySlider", {
    Text = "Day Time",
    Default = 1,
    Min = 1,
    Max = 24,
    Rounding = 0,
    Compact = false,
})

Options.TimeOfDaySlider:OnChanged(function()
    Settings.Visuals.Local.World.TimeOfDay.Time = Options.TimeOfDaySlider.Value
end)

AtmosphereTab:AddToggle("AmbientToggleFunny", {
    Text = "Ambient",
    Default = false,
    Tooltip = "Ambient Enabled",
})

Toggles.AmbientToggleFunny:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.Ambient.Enabled = Toggles.AmbientToggleFunny.Value
end)

Toggles.AmbientToggleFunny:AddColorPicker("AmbientColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Ambient Color"
})

Options.AmbientColorPicker:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.Ambient.Color = Options.AmbientColorPicker.Value
end)

AtmosphereTab:AddToggle("ColorShiftToggleFunny", {
    Text = "Color Shift",
    Default = false,
    Tooltip = "Color Shift Enabled",
})

Toggles.ColorShiftToggleFunny:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.ColorShift.Enabled = Toggles.ColorShiftToggleFunny.Value
end)

Toggles.ColorShiftToggleFunny:AddColorPicker("ColorShiftBottomColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Bottom Color"
})

Options.ColorShiftBottomColorPicker:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.ColorShift.Bottom = Options.ColorShiftBottomColorPicker.Value
end)

Toggles.ColorShiftToggleFunny:AddColorPicker("ColorShiftTopColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Top Color"
})

Options.ColorShiftTopColorPicker:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.ColorShift.Top = Options.ColorShiftTopColorPicker.Value
end)

AtmosphereTab:AddToggle("FogToggleFunny", {
    Text = "Fog",
    Default = false,
    Tooltip = "Fog Enabled Enabled",
})

Toggles.FogToggleFunny:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.Fog.Enabled = Toggles.FogToggleFunny.Value
end)

Toggles.FogToggleFunny:AddColorPicker("FogColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Fog Color"
})

Options.FogColorPicker:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.Fog.Color = Options.FogColorPicker.Value
end)

AtmosphereTab:AddSlider("FogStartFunnySlider", {
    Text = "Fog Start",
    Default = 1000,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,
})

Options.FogStartFunnySlider:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.Fog.Start = Options.FogStartFunnySlider.Value
end)

AtmosphereTab:AddSlider("FogEndFunny", {
    Text = "Fog End",
    Default = 1000,
    Min = 0,
    Max = 1000,
    Rounding = 1,
    Compact = false,
})

Options.FogEndFunny:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.Fog.End = Options.FogEndFunny.Value
end)

AtmosphereTab:AddToggle("GlobalShadowsToggleFunny", {
    Text = "Global Shadows",
    Default = true,
    Tooltip = "Global Shadows Enabled",
})

Toggles.GlobalShadowsToggleFunny:OnChanged(function()
    game:GetService("Lighting").GlobalShadows = Toggles.GlobalShadowsToggleFunny.Value
end)

AtmosphereTab:AddToggle("BrightnessEnabledLaughingMyDickOff", {
    Text = "Brightness",
    Default = false,
    Tooltip = "Brightness Enabled",
})

Toggles.BrightnessEnabledLaughingMyDickOff:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.Brightness.Enabled = Toggles.BrightnessEnabledLaughingMyDickOff.Value
end)

AtmosphereTab:AddSlider("BrightnessValueLaughingMyDickOff", {
    Text = "Brightness Amount",
    Default = 1,
    Min = 1,
    Max = 10,
    Rounding = 1,
    Compact = false,
})

Options.BrightnessValueLaughingMyDickOff:OnChanged(function()
    Settings.Visuals.Local.Atmosphere.Brightness.BrightnessValue = Options.BrightnessValueLaughingMyDickOff.Value
end)

ExploitsTab:AddToggle("NoRecoilToggleuwu", {
    Text = "No Recoil",
    Default = false,
    Tooltip = "No Recoil Enabled",
})

Toggles.NoRecoilToggleuwu:OnChanged(function()
    Settings.Blatant.Exploits.NoRecoil = Toggles.NoRecoilToggleuwu.Value
end)

ExploitsTab:AddToggle("NoFlashBangToggleNoFuckingWay", {
    Text = "No Flashbang",
    Default = false,
    Tooltip = "No Flashbang Enabled",
})

Toggles.NoFlashBangToggleNoFuckingWay:OnChanged(function()
    Settings.Blatant.Exploits.NoFlashBang = Toggles.NoFlashBangToggleNoFuckingWay.Value
end)


ExploitsTab:AddToggle("NoJumpCoolDownFunnyToggle", {
    Text = "No Jump Cooldown",
    Default = false,
    Tooltip = "No Jump Cooldown Enabled",
})

Toggles.NoJumpCoolDownFunnyToggle:OnChanged(function()
    Settings.Blatant.Exploits.NoJumpCooldown = Toggles.NoJumpCoolDownFunnyToggle.Value
end)

ExploitsTab:AddToggle("NoSlowdownToggleong", {
    Text = "No Slowdown",
    Default = false,
    Tooltip = "No Slowdown Enabled",
})

Toggles.NoSlowdownToggleong:OnChanged(function()
    Settings.Blatant.Exploits.NoSlowdown = Toggles.NoSlowdownToggleong.Value
end)

ExploitsTab:AddToggle("AutoStompToggleReal", {
    Text = "Auto Stomp",
    Default = false,
    Tooltip = "Auto Stomp Enabled",
})

Toggles.AutoStompToggleReal:OnChanged(function()
    Settings.Blatant.Exploits.AutoStomp = Toggles.AutoStompToggleReal.Value
end)

CharacterTab:AddToggle("FunnyCharacterToggle", {
    Text = "Enabled",
    Default = false,
    Tooltip = "Character Enabled",
})

Toggles.FunnyCharacterToggle:OnChanged(function()
    Settings.Visuals.Local.Character.Enabled = Toggles.FunnyCharacterToggle.Value
end)


CharacterTab:AddDropdown("FunnyCharacterMaterialDropdown", {
    Values = { "ForceField", "Neon" },
    Default = 1,
    Multi = false,
    Text = "Material",
    Tooltip = "Local Player Material",
})

Options.FunnyCharacterMaterialDropdown:OnChanged(function()
    Settings.Visuals.Local.Character.Material = Options.FunnyCharacterMaterialDropdown.Value
end)


MovementTab:AddToggle("CFrameSpeedToggleFunny", {
    Text = "Enabled",
    Default = false,
    Tooltip = "Enable CFrame Speed",
})

Toggles.CFrameSpeedToggleFunny:OnChanged(function()
    Settings.Blatant.CFrameSpeed.Enabled = Toggles.CFrameSpeedToggleFunny.Value
end)

DesyncTab:AddToggle("DesyncEnabled", {
    Text = "Enabled",
    Default = false,
    Tooltip = "Desync Enabled",
})

Toggles.DesyncEnabled:OnChanged(function()
    Settings.Blatant.Exploits.Desync.Enabled = Toggles.DesyncEnabled.Value
end)

DesyncTab:AddDropdown("DesyncMode", {
    Values = { "Jitter", "Spin" },
    Default = 2,
    Multi = false,

    Text = "Mode",
    Tooltip = "Desync Mode",
})

Options.DesyncMode:OnChanged(function()
    Settings.Blatant.Exploits.Desync.Mode = Options.DesyncMode.Value
end)

DesyncTab:AddSlider("DesyncSpinSpeed", {
    Text = "Spin Speed",
    Default = 10,
    Min = 1,
    Max = 100,
    Rounding = 1,
    Compact = false,
})

Options.DesyncSpinSpeed:OnChanged(function()
    Settings.Blatant.Exploits.Desync.SpinSpeed = Options.DesyncSpinSpeed.Value
end)

DesyncTab:AddSlider("DesyncJitterAngle", {
    Text = "Jitter Angle",
    Default = 40,
    Min = 40,
    Max = 100,
    Rounding = 2,
    Compact = false,
})

Options.DesyncJitterAngle:OnChanged(function()
    Settings.Blatant.Exploits.Desync.Jitter.Angle = Options.DesyncJitterAngle.Value
end)

DesyncTab:AddSlider("DesyncJitterRange", {
    Text = "Jitter Range",
    Default = 40,
    Min = 40,
    Max = 100,
    Rounding = 2,
    Compact = false,
})

Options.DesyncJitterAngle:OnChanged(function()
    Settings.Blatant.Exploits.Desync.Jitter.Range = Options.DesyncJitterAngle.Value
end)


Toggles.CFrameSpeedToggleFunny:AddKeyPicker("CFrameSpeedKeyBind", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "CFrame",
    NoUI = false,
})

MovementTab:AddSlider("CFrameSpeedValue", {
    Text = "CFrame Speed Amount",
    Default = 1,
    Min = 1,
    Max = 5,
    Rounding = 0,
    Compact = false,
})

Options.CFrameSpeedValue:OnChanged(function()
    Settings.Blatant.CFrameSpeed.Value = Options.CFrameSpeedValue.Value
end)

MovementTab:AddToggle("FlyToggleFunny", {
    Text = "Enabled",
    Default = false,
    Tooltip = "Fly Enabled",
})


Toggles.FlyToggleFunny:OnChanged(function()
    if Toggles.FlyToggleFunny.Value == true then
        FlyLoop = game:GetService("RunService").RenderStepped:Connect(function()
            spawn(function()
                pcall(function()
                    local speed = Settings.Blatant.Fly.Value
                    local velocity = Vector3.new(0, 0, 0)
                    local UserInputService = game:GetService("UserInputService")
                    local flyUpwards = UserInputService:IsKeyDown(Enum.KeyCode.Space)
                    local flyDownwards = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) 
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        velocity = velocity + (CurrentCamera.CoordinateFrame.lookVector * speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        velocity = velocity + (CurrentCamera.CoordinateFrame.rightVector * -speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        velocity = velocity + (CurrentCamera.CoordinateFrame.lookVector * -speed)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        velocity = velocity + (CurrentCamera.CoordinateFrame.rightVector * speed)
                    end

                    if flyUpwards then
                        velocity = velocity + (Vector3.new(0, 1, 0) * speed)
                    end
                    if flyDownwards then
                        velocity = velocity + (Vector3.new(0, -1, 0) * speed)
                    end
                    lplr.Character.HumanoidRootPart.Velocity = velocity
                    lplr.Character.Humanoid:ChangeState("Freefall")
                end)
            end)
        end)
    elseif Toggles.FlyToggleFunny.Value == false and FlyLoop then
        FlyLoop:Disconnect()
        lplr.Character.Humanoid:ChangeState("Landing")
    end
end)



Toggles.FlyToggleFunny:AddKeyPicker("FlyKeyBind", {
    Default = "None",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "Fly",
    NoUI = false,
})

MovementTab:AddSlider("FlyValue", {
    Text =  "Fly Amount",
    Default = 1,
    Min = 1,
    Max = 5,
    Rounding = 2,
    Compact = false,
})

Options.FlyValue:OnChanged(function()
    Settings.Blatant.Fly.Value = Options.FlyValue.Value * 50
end)

--// Main functions
local prevAmmo = nil
local prevHealth = nil
local prevArmor = nil
local currentHealth = nil
local currentArmor = nil
local isWalking = false
local currentClone = nil

local function hitchams(player) 
    if currentClone then
        currentClone:Destroy()
    end

    player.Character.Archivable = true
    local Clone = player.Character:Clone()           
    for _, Obj in next, Clone:GetDescendants() do
        if Obj.Name == "HumanoidRootPart" or Obj:IsA("Humanoid") or Obj:IsA("LocalScript") or Obj:IsA("Script") or Obj:IsA("Decal") then
            Obj:Destroy()
        elseif Obj:IsA("BasePart") or Obj:IsA("MeshPart") or Obj:IsA("Part") then
            if Obj.Transparency == 1 then
                Obj:Destroy()
            else
                Obj.CanCollide = false
                Obj.Anchored = true
                Obj.Material = Enum.Material.ForceField
                Obj.Color = Settings.Target.Visuals.OnHit.Hitchams.Color
                Obj.Transparency = 0
                Obj.Size = Obj.Size + Vector3.new(0.03, 0.03, 0.03)
            end
        end
    end
    Clone.Parent = workspace
    currentClone = Clone
    local start = tick()
    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if tick() - start >= 3 then
            connection:Disconnect() 
            Clone:Destroy()
            currentClone = nil
        end
    end)
end


game:GetService("RunService").RenderStepped:Connect(function()
    if Settings.Visuals.Local.Atmosphere.Fog.Enabled then
        game:GetService("Lighting").FogEnd = Settings.Visuals.Local.Atmosphere.Fog.End
        game:GetService("Lighting").FogStart = Settings.Visuals.Local.Atmosphere.Fog.Start
        game:GetService("Lighting").FogColor = Settings.Visuals.Local.Atmosphere.Fog.Color
    else
        game:GetService("Lighting").FogEnd = 500
        game:GetService("Lighting").FogStart = 0
        game:GetService("Lighting").FogColor = Color3.new(0.392157, 0.341176, 0.282353)
    end

    if Settings.Visuals.Local.Atmosphere.Brightness.Enabled then
        game:GetService("Lighting").Brightness = Settings.Visuals.Local.Atmosphere.Brightness.BrightnessValue
    else
        game:GetService("Lighting").Brightness = 1
    end

    if Settings.Visuals.Local.Atmosphere.Ambient.Enabled then
        game:GetService("Lighting").Ambient = Settings.Visuals.Local.Atmosphere.Ambient.Color
    else
        game:GetService("Lighting").Ambient = Color3.new(178/255, 178/255, 178/255)
    end

    if Settings.Visuals.Local.Atmosphere.ColorShift.Enabled then
        game:GetService("Lighting").ColorShift_Bottom = Settings.Visuals.Local.Atmosphere.ColorShift.Bottom
        game:GetService("Lighting").ColorShift_Top = Settings.Visuals.Local.Atmosphere.ColorShift.Top
    else
        game:GetService("Lighting").ColorShift_Bottom = Color3.new(0, 0, 0)
        game:GetService("Lighting").ColorShift_Top = Color3.new(0, 0, 0)
    end

    if Settings.Target.Enabled and
       Settings.Target.AntiGroundShots and
       TargetBindEnabled and
       TargetTarget and
       TargetTarget.Character and
       TargetTarget.Character:FindFirstChild("Humanoid") then
        if TargetTarget.Character:FindFirstChild("Humanoid") then
            local TargetVel = TargetTarget.Character:FindFirstChild(Settings.Target.Hitbox)
            local currentState = TargetTarget.Character:FindFirstChild("Humanoid"):GetState()
            if currentState == Enum.HumanoidStateType.Physics and
               (currentState == Enum.HumanoidStateType.Jumping or
                currentState == Enum.HumanoidStateType.Freefall or
                Humanoid:GetState() == Enum.HumanoidStateType.Freefall) then
                pcall(function()
                    if TargetVel then
                        local newVelocity = Vector3.new(TargetVel.Velocity.X, math.abs(TargetVel.Velocity.Y * 0.4), TargetVel.Velocity.Z)
                        TargetVel.Velocity = newVelocity
                        TargetVel.AssemblyLinearVelocity = newVelocity
                    end
                end)
            end
        end
    end
 
    if Settings.Visuals.Local.World.TimeOfDay.Enabled then
        game:GetService("Lighting").ClockTime = Settings.Visuals.Local.World.TimeOfDay.Time
    end

    if Settings.Blatant.Exploits.NoSlowdown then
        if lplr.Character and lplr.Character:FindFirstChild("BodyEffects") then
            local bodyEffects = lplr.Character.BodyEffects
    
            local bodyEffectsMovement = bodyEffects.Movement
            if bodyEffectsMovement then
                local noJumping = bodyEffectsMovement:FindFirstChild("NoJumping")
                local reduceWalk = bodyEffectsMovement:FindFirstChild("ReduceWalk")
                local noWalkSpeed = bodyEffectsMovement:FindFirstChild("NoWalkSpeed")
    
                if noJumping or reduceWalk or noWalkSpeed then
                    if noJumping then
                        noJumping:Destroy()
                    end
                    if reduceWalk then
                        reduceWalk:Destroy()
                    end
                    if noWalkSpeed then
                        noWalkSpeed:Destroy()
                    end
                end
            end
    
            local reload = bodyEffects.Reload
            if reload and reload.Value == true then
                reload.Value = false
            end
        end
    end
    

    if Settings.Blatant.Exploits.AutoStomp then
        game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
    end

    if Settings.Blatant.Exploits.NoJumpCooldown then
        lplr.Character.Humanoid.UseJumpPower = false
    else
        lplr.Character.Humanoid.UseJumpPower = true
    end

    local mainScreenGui = lplr.PlayerGui:FindFirstChild("MainScreenGui")

    if mainScreenGui then
        local aim = mainScreenGui.Aim

        if aim and Settings.Visuals.Local.Crosshair.Rotation and Settings.Visuals.Local.Crosshair.Enabled then
            aim.Rotation = aim.Rotation + Settings.Visuals.Local.Crosshair.RotationSpeed 
        else
            aim.Rotation = 0
        end
    end


    if Settings.Aimbot.VelocityResolver then
        pcall(function()
            AimbotTargetVelocity = AimbotTarget.Character.HumanoidRootPart.Velocity
            AimbotTarget.Character.HumanoidRootPart.Velocity = Vector3.new(AimbotTargetVelocity.X, -0.000000000000000000000000000000001, AimbotTargetVelocity.Z)
        end)
    end

    if Settings.Aimbot.Enabled and AimbotBindEnabled then
        if Settings.Aimbot.ReverseResolver then
            local aimPosition = AimbotTarget.Character[Settings.Aimbot.Hitbox].Position - AimbotTarget.Character[Settings.Aimbot.Hitbox].Velocity / tonumber(Settings.Aimbot.Prediction.Vertical)
            aimPosition = aimPosition + AimbotTarget.Character[Settings.Aimbot.Hitbox].Velocity / tonumber(Settings.Aimbot.Prediction.Horizontal)
            if Settings.Aimbot.Smoothing.Enabled then
                workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:lerp(CFrame.new(workspace.CurrentCamera.CFrame.p, aimPosition), Settings.Aimbot.Smoothing.Smoothing)
            else
                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, aimPosition)
            end
        else
            local aimPosition = AimbotTarget.Character[Settings.Aimbot.Hitbox].Position + AimbotTarget.Character[Settings.Aimbot.Hitbox].Velocity / tonumber(Settings.Aimbot.Prediction.Vertical)
            aimPosition = aimPosition + AimbotTarget.Character[Settings.Aimbot.Hitbox].Velocity / tonumber(Settings.Aimbot.Prediction.Horizontal)
            if Settings.Aimbot.Smoothing.Enabled then
                workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:lerp(CFrame.new(workspace.CurrentCamera.CFrame.p, aimPosition), Settings.Aimbot.Smoothing.Smoothing)
            else
                workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, aimPosition)
            end
        end
    end

    local gun = GetGun()
    if gun then
        local currentAmmo = gun.Ammo.value
        if prevAmmo ~= nil and currentAmmo < prevAmmo then
            if Settings.Visuals.Local.BulletTracers.Enabled then
                Beam(gun.Handle.Position, lplr.Character.BodyEffects["MousePos"].Value)
            end
            if Settings.Visuals.Local.BulletImpacts.Enabled then
                Impact(lplr.Character.BodyEffects["MousePos"].Value)
            end

            if Settings.Target.Visuals.OnHit.Enabled then
                if Settings.Target.Visuals.OnHit.Method == "Raycast" then
                    if game:GetService("Workspace").Ignored.Siren.Radius then
                        for _, v in pairs(Workspace.Ignored.Siren.Radius:GetChildren()) do
                            if v.Name == "BULLET_RAYS" then
                                for _, f in pairs(v:GetChildren()) do
                                    if f:IsA("Attachment") then
                                        local hitPosition = f.WorldPosition
                                        local raycastParams = RaycastParams.new()
                                        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                                        raycastParams.FilterDescendantsInstances = {f.Parent, lplr.Character}
                                        local rayDirection = f.WorldCFrame.LookVector
                                        local raycastResult = Workspace:Raycast(hitPosition, hitPosition + rayDirection * 2000, raycastParams)
                                        
                                        if raycastResult then
                                            local hitPart = raycastResult.Instance
                                            local character = hitPart.Parent
                                            local hitPlayer = game:GetService("Players"):GetPlayerFromCharacter(character)
                                            
                                            if hitPlayer then
                                                if Settings.Target.Visuals.OnHit.Hitchams.Enabled then
                                                    hitchams(hitPlayer)
                                                end
                                                if Settings.Target.Visuals.OnHit.Hitsounds.Enabled then
                                                    local sound = Instance.new("Sound")
                                                    sound.Parent = Workspace
                                                    sound.Volume = 3
                                                    sound.SoundId = getcustomasset(Settings.Target.Visuals.OnHit.Hitsounds.Sound)
                                                    sound:Play()
                                                    sound.Ended:Connect(function()
                                                        sound:Destroy()
                                                    end)
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                else
                    if TargetTarget and TargetTarget.Character and Settings.Target.Enabled and TargetBindEnabled then
                        local humanoid = TargetTarget.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            currentHealth = humanoid.Health
                            currentArmor = TargetTarget.Character.BodyEffects.Armor.Value
                            
                            if (prevHealth and currentHealth < prevHealth) or (prevArmor and currentArmor < prevArmor) then
                                if Settings.Target.Visuals.OnHit.Hitchams.Enabled then
                                    hitchams(TargetTarget)
                                end
                                
                                if Settings.Target.Visuals.OnHit.Hitsounds.Enabled then
                                    local sound = Instance.new("Sound")
                                    sound.Parent = Workspace
                                    sound.Volume = 3
                                    sound.SoundId = getcustomasset(Settings.Target.Visuals.OnHit.Hitsounds.Sound)
                                    sound:Play()
                                    sound.Ended:Connect(function()
                                        sound:Destroy()
                                    end)
                                end
                            end
                            
                            prevHealth = currentHealth
                            prevArmor = currentArmor
                        end
                    end
                end
            end
        end
        prevAmmo = currentAmmo
    end

    if Settings.Target.Enabled and TargetBindEnabled and TargetTarget.Character and Settings.Target.Visuals.OnHit.Enabled then
        currentHealth = TargetTarget.Character:FindFirstChild("Humanoid").Health
        currentArmor = TargetTarget.Character.BodyEffects.Armor.Value
    end

    if Settings.Target.Enabled and Settings.Target.AutoSelect then
        local newTarget = GetClosestPlayer()
        
        if newTarget and newTarget.Character then
            TargetBindEnabled = true
            TargetTarget = newTarget
        else
            TargetBindEnabled = false
            TargetTarget = nil
        end
    end
    

    if Settings.Target.Enabled and TargetBindEnabled then
        if TargetTarget and not TargetTarget.Character then
            TargetBindEnabled = false
            TargetTarget = nil
        end
    end
    
    if Settings.Target.Jumpoffset.Enabled and TargetBindEnabled and Settings.Target.Enabled and TargetTarget.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
		jumpoffsetnoway = Settings.Target.Jumpoffset.Value
	else
		jumpoffsetnoway = 0
	end
    
    FOVring.Visible = Settings.Target.UseFov
    FOVring.Radius = Settings.Target.Fov
    FOVring.Color = Settings.Target.FovColor
    FOVring.Position = game:GetService("UserInputService"):GetMouseLocation()


    if Settings.Target.Visuals.Chams.Enabled and TargetBindEnabled and Settings.Target.Enabled then
        if TargetTarget and TargetTarget.Character then
            TargetChams.Parent = TargetTarget.Character
            TargetChams.FillColor = Settings.Target.Visuals.Chams.Color
        end
    else
        TargetChams.Parent = game:GetService("CoreGui")
    end
    TargetChams.FillColor = Settings.Target.Visuals.Chams.Color
    TargetChams.FillTransparency = Settings.Target.Visuals.Chams.Transparency


    if Settings.Visuals.Local.Character.Enabled then
        if lplr.Character then
            for _, part in pairs(lplr.Character:GetChildren()) do
                if part:IsA("MeshPart") or part:IsA("Part") or part:IsA("BasePart") then
                    if Settings.Visuals.Local.Character.Material == "ForceField" then
                        part.Material = Enum.Material.ForceField
                    elseif Settings.Visuals.Local.Character.Material == "Neon" then
                        part.Material = Enum.Material.Neon
                    end
                end
            end
        end
    else
        if lplr.Character then
            for _, part in pairs(lplr.Character:GetChildren()) do
                if part:IsA("MeshPart") or part:IsA("Part") or part:IsA("BasePart") then
                    part.Material = Enum.Material.Plastic
                end
            end
        end
    end
    if TargetBindEnabled and Settings.Target.Enabled and TargetTarget and TargetTarget.Character and TargetTarget.Character:FindFirstChild("HumanoidRootPart") then
        if Settings.Target.LookAt then
            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.CFrame.Position, Vector3.new(TargetTarget.Character.HumanoidRootPart.CFrame.X, lplr.Character.HumanoidRootPart.CFrame.Position.Y, TargetTarget.Character.HumanoidRootPart.CFrame.Z))
            lplr.Character.Humanoid.AutoRotate = false

            spawn(function()
                if Settings.Target.LookAt == false then
                    lplr.Character.Humanoid.AutoRotate = true
                end
            end)
        end
    else
        lplr.Character.Humanoid.AutoRotate = true
    end

    if Settings.Target.Enabled and TargetBindEnabled and Settings.Target.Visuals.TargetStrafe.Enabled and Settings.Target.Visuals.TargetStrafe.Visualize.Enabled then
        threeDcircle.Color = Settings.Target.Visuals.TargetStrafe.Visualize.Color
        threeDcircle.Thickness = 1
        threeDcircle.Visible = true
        threeDcircle.Radius = Settings.Target.Visuals.TargetStrafe.Distance
        threeDcircle.Position = TargetTarget.Character.HumanoidRootPart.Position
    else
        threeDcircle.Visible = false
    end

    if Settings.Target.Enabled and TargetBindEnabled and Settings.Target.Visuals.TargetStrafe.Enabled then
        local currentTime = tick() 
        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(TargetTarget.Character.HumanoidRootPart.Position) * CFrame.Angles(0, 2 * math.pi * currentTime * Settings.Target.Visuals.TargetStrafe.Speed % (2 * math.pi), 0) * CFrame.new(0, Settings.Target.Visuals.TargetStrafe.Height, Settings.Target.Visuals.TargetStrafe.Distance)
    end    

    if Settings.Target.Enabled and TargetBindEnabled and Settings.Target.Visuals.PredVisualizer.Enabled then
        if Settings.Target.Visuals.PredVisualizer.Type == "Box" then
            predcube.Visible = true
            predcube.Color = Settings.Target.Visuals.PredVisualizer.Color
            predcube.Position = TargetTarget.Character.HumanoidRootPart.Position + (TargetTarget.Character.HumanoidRootPart.Velocity * Settings.Target.Prediction)
            DotParent.CFrame = CFrame.new(0, 2000, 0)
        else
            predcube.Visible = false
            DotParent.CFrame = CFrame.new(TargetTarget.Character[Settings.Target.Hitbox].Position + (TargetTarget.Character[Settings.Target.Hitbox].Velocity * Settings.Target.Prediction))
            newFrame.BackgroundColor3 = Settings.Target.Visuals.PredVisualizer.Color
        end
    else
        predcube.Visible = false
        DotParent.CFrame = CFrame.new(0, 2000, 0)
    end

    if Settings.Blatant.Exploits.NoFlashBang then
        for i, v in pairs(lplr.PlayerGui.MainScreenGui:GetChildren()) do
            if v.Name == "whiteScreen" then
                v:Destroy()
            end
        end
    end
    
    if Settings.Visuals.Local.BulletTracers.HideBulletRays then
        for i, v in pairs(game:GetService("Workspace").Ignored.Siren.Radius:GetChildren()) do 
            if v.Name == "BULLET_RAYS" then
                v:Destroy()
            end
        end
    end

    if Settings.Blatant.Exploits.Desync.Enabled then
        if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            isWalking = true
        else
            isWalking = false
        end
    end

    if Settings.Target.RageBot then
        local localPlayer = game:GetService("Players").LocalPlayer
        local closestDistance = math.huge
        local chosenTarget = nil
    
        for _, player in pairs(game:GetService("Players"):GetPlayers()) do
            if player ~= localPlayer then
                local hasKO = player.Character.BodyEffects["K.O"].value
                local hasFF = player.Character:FindFirstChild("ForceField_TESTING")
                local isGrabbed = player.Character.BodyEffects.Grabbed.value
    
                if not hasKO and not hasFF and not isGrabbed then
                    local playerPosition = player.Character.HumanoidRootPart.Position
                    local localPosition = localPlayer.Character.HumanoidRootPart.Position
                    local distance = (playerPosition - localPosition).Magnitude
    
                    if distance < closestDistance then
                        closestDistance = distance
                        chosenTarget = player
                    end
                end
            end
        end
    
        if chosenTarget then
            TargetTarget = chosenTarget
            TargetBindEnabled = true
        end
    end
    
end)


--// Main heartbeat function
game:GetService("RunService").Heartbeat:Connect(function()
    if Settings.Blatant.CFrameSpeed.Enabled then
        if lplr.Character.Humanoid.MoveDirection.Magnitude > 0 then
            for i = 1, Settings.Blatant.CFrameSpeed.Value do
                lplr.Character:TranslateBy(lplr.Character.Humanoid.MoveDirection)
            end
        end
    end
    
    if not isWalking and Settings.Blatant.Exploits.Desync.Enabled then   
        if Settings.Blatant.Exploits.Desync.Mode == "Jitter" then
            lplr.Character.HumanoidRootPart.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.CFrame.Position) * CFrame.Angles(0, math.rad(Settings.Blatant.Exploits.Desync.Jitter.Angle) + math.rad((math.random(1, 2) == 1 and Settings.Blatant.Exploits.Desync.Jitter.Range or -Settings.Blatant.Exploits.Desync.Jitter.Range)), 0)
        else
            lplr.Character.HumanoidRootPart.CFrame = lplr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(Settings.Blatant.Exploits.Desync.SpinSpeed), 0)
        end
        local fixer = lplr.Character.HumanoidRootPart.Velocity    
        lplr.Character.HumanoidRootPart.Velocity = Vector3.new(0,-16384,0)
        game:GetService("RunService").RenderStepped:Wait()
        lplr.Character.HumanoidRootPart.Velocity = fixer
    end
end)

local jumpoffsetnoway = 0   

function GetClosestPlayer()
    local distance = Settings.Target.UseFov and Settings.Target.Fov or math.huge
    local closestPlayer

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= lplr and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos =  game:GetService("Workspace").CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local pos2D = Vector2.new(pos.X, pos.Y)
            local magnitude = (pos2D - game:GetService("UserInputService"):GetMouseLocation()).magnitude

            if magnitude < distance then
                if not Settings.Target.Wallcheck then
                    closestPlayer = v
                    distance = magnitude
                else
                    local partsObscuring =  game:GetService("Workspace").CurrentCamera:GetPartsObscuringTarget({lplr.Character.PrimaryPart.Position, v.Character.PrimaryPart.Position}, {v.Character})

                    if #partsObscuring == 0 then
                        closestPlayer = v
                        distance = magnitude
                    end
                end
            end
        end
    end

    return closestPlayer
end


--// Function to get the gun first
function GetGun()
    local character = lplr.Character
    if character then
        for _, tool in pairs(character:GetChildren()) do
            if tool:IsA("Tool") then
                if tool:FindFirstChild("Ammo") then
                    return tool
                end
            end
        end
    end
    return nil
end

--// Function to create the line for the bullet tracers
function Beam(v1, v2)
    local line = Drawing.new("Line")
    line.Visible = true
    line.Color = Settings.Visuals.Local.BulletTracers.Color
    line.Thickness = Settings.Visuals.Local.BulletTracers.Thickness
    
    local function UpdateLine()
        local startPos = workspace.CurrentCamera:WorldToViewportPoint(v1)
        local endPos = workspace.CurrentCamera:WorldToViewportPoint(v2)
        local isVisible = startPos.Z > 0 and endPos.Z > 0
        if isVisible then
            line.From = Vector2.new(startPos.X, startPos.Y)
            line.To = Vector2.new(endPos.X, endPos.Y)
        else
            line.Visible = false
        end
    end
    
    local duration = Settings.Visuals.Local.BulletTracers.Duration
    local startTime = tick()
    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        UpdateLine()
        
        local elapsedTime = tick() - startTime
        if elapsedTime >= duration then
            connection:Disconnect()
            line:Remove()
        else
            local alpha = 1 - (elapsedTime / duration)
            line.Transparency = alpha
        end
    end)
end

local impacts = {}

function Impact(position)
    local size = Settings.Visuals.Local.BulletImpacts.Size
    local impactInfo = {
        Position = position,
        Lines = {} 
    }
    local function CreateOrUpdateLine(line, p1, p2)
        if not line then
            line = Drawing.new("Line")
            line.Visible = true
            line.Color = Settings.Visuals.Local.BulletImpacts.Color
            table.insert(impactInfo.Lines, line)
        end
        line.From = p1
        line.To = p2
    end
    local function UpdateBox()
        local camera = workspace.CurrentCamera
        local vertices = {
            Vector3.new(Settings.Visuals.Local.BulletImpacts.Size, Settings.Visuals.Local.BulletImpacts.Size, Settings.Visuals.Local.BulletImpacts.Size),
            Vector3.new(Settings.Visuals.Local.BulletImpacts.Size, -Settings.Visuals.Local.BulletImpacts.Size, Settings.Visuals.Local.BulletImpacts.Size),
            Vector3.new(-Settings.Visuals.Local.BulletImpacts.Size, -Settings.Visuals.Local.BulletImpacts.Size, Settings.Visuals.Local.BulletImpacts.Size),
            Vector3.new(-Settings.Visuals.Local.BulletImpacts.Size, Settings.Visuals.Local.BulletImpacts.Size, Settings.Visuals.Local.BulletImpacts.Size),
            Vector3.new(Settings.Visuals.Local.BulletImpacts.Size, Settings.Visuals.Local.BulletImpacts.Size, -Settings.Visuals.Local.BulletImpacts.Size),
            Vector3.new(Settings.Visuals.Local.BulletImpacts.Size, -Settings.Visuals.Local.BulletImpacts.Size, -Settings.Visuals.Local.BulletImpacts.Size),
            Vector3.new(-Settings.Visuals.Local.BulletImpacts.Size, -Settings.Visuals.Local.BulletImpacts.Size, -Settings.Visuals.Local.BulletImpacts.Size),
            Vector3.new(-Settings.Visuals.Local.BulletImpacts.Size, Settings.Visuals.Local.BulletImpacts.Size, -Settings.Visuals.Local.BulletImpacts.Size)
        }
        for i = 1, 4 do
            local j = i % 4 + 1
            local p1 = camera:WorldToViewportPoint(position + vertices[i])
            local p2 = camera:WorldToViewportPoint(position + vertices[j])
            CreateOrUpdateLine(impactInfo.Lines[i], p1, p2)

            p1 = camera:WorldToViewportPoint(position + vertices[i + 4])
            p2 = camera:WorldToViewportPoint(position + vertices[j + 4])
            CreateOrUpdateLine(impactInfo.Lines[i + 4], p1, p2)

            p1 = camera:WorldToViewportPoint(position + vertices[i])
            p2 = camera:WorldToViewportPoint(position + vertices[i + 4])
            CreateOrUpdateLine(impactInfo.Lines[i + 8], p1, p2)
        end
    end
    local startTime = tick()
    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        UpdateBox()
        local elapsedTime = tick() - startTime
        if elapsedTime >= Settings.Visuals.Local.BulletImpacts.Duration then
            connection:Disconnect()
            for _, line in ipairs(impactInfo.Lines) do
                line:Remove()
            end
            for i, data in ipairs(impacts) do
                if data == impactInfo then
                    table.remove(impacts, i)
                    break
                end
            end
        else
            local alpha = 1 - (elapsedTime / Settings.Visuals.Local.BulletImpacts.Duration)
            for _, line in ipairs(impactInfo.Lines) do
                line.Transparency = alpha
            end
        end
    end)
    table.insert(impacts, impactInfo)
end



--// Pasted from some vault idk
newindex = hookmetamethod(game, "__newindex", function(self, index, value)
    local callingScr = getcallingscript()

    if tostring(callingScr) == "Framework" and tostring(self):lower():find("camera") and tostring(index) == "CFrame" and Settings.Blatant.Exploits.NoRecoil then
        return;
    end

    return newindex(self, index, value)
end)

--// thanks to azure for the very cool exploits https://discord.gg/wRxZTR2AtG (im a paster)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(...)
    local args = {...}

    local MousePositions = {"UpdateMousePos", "GetMousePos", "MousePos", "MOUSE"}

    if Settings.Target.Enabled and TargetBindEnabled and table.find(MousePositions, args[2]) and getnamecallmethod() == "FireServer" then
        if Settings.Target.Resolver then
            args[3] = TargetTarget.Character[Settings.Target.Hitbox].Position + (TargetTarget.Character.Humanoid.MoveDirection * Settings.Target.Prediction * TargetTarget.Character.Humanoid.WalkSpeed)
            if Settings.Target.Jumpoffset.Enabled then
                args[3] = args[3] + Vector3.new(0, jumpoffsetnoway, 0)
            end
        else
            args[3] = TargetTarget.Character[Settings.Target.Hitbox].Position + (TargetTarget.Character[Settings.Target.Hitbox].Velocity * Settings.Target.Prediction)
            if Settings.Target.Jumpoffset.Enabled then
                args[3] = args[3] + Vector3.new(0, jumpoffsetnoway, 0)
            end
        end

        return old(unpack(args))
    end

    return old(...)
end)


--// Config and shit
MenuGroup:AddButton("Unload Cheat", function()
    Library:Unload()
end)

MenuGroup:AddToggle("WatermarkEnabled", {
    Text = "Watermark",
    Default = true,
    Tooltip = "Watermark Enabled",
})

Toggles.WatermarkEnabled:OnChanged(function()
    Library:SetWatermarkVisibility(Toggles.WatermarkEnabled.Value)
end)

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()

Library:SetWatermark("LineScript")

SaveManager:SetIgnoreIndexes({"MenuKeybind"})

ThemeManager:SetFolder("LineScript")
SaveManager:SetFolder("LineScript/Configs")
SaveManager:BuildConfigSection(Tabs.UiSettings)
ThemeManager:ApplyToTab(Tabs.UiSettings)

MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
    Default = "Insert",
    NoUI = true,
    Text = "Menu keybind"
})

Library.ToggleKeybind = Options.MenuKeybind
