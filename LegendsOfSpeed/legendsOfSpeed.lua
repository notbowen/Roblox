_G.isFarm = true;
_G.isRebirth = true;
_G.isExp = true;
_G.isBuyPets = true;

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Legends of Speed Autofarm") -- Creates the window

local a = w:CreateFolder("Steps")
local b = w:CreateFolder("Rebirth")
local c = w:CreateFolder("Exp")

a:Toggle("Autofarm Steps",function(bool)
    getgenv().isFarm = bool
    if bool then
        autoSteps()
    end
end
)

b:Toggle("Auto Rebirth",function(bool)
    getgenv().isRebirth = bool
    if bool then
        autoRebirth()
    end
end
)

c:Toggle("Auto Exp", function(bool)
    getgenv().isExp = bool
    if bool then
        autoExp()
    end    
end)

function autoSteps()
    spawn(
        function()
            while _G.isFarm do
                local A_1 = "collectOrb"
                local A_2 = "Red Orb"
                local A_3 = "City"
                local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
                Event:FireServer(A_1, A_2, A_3)


                wait(0.01)
            end
        end
    )
end

function autoExp()
    spawn(
        function()
            while _G.isExp do
                local A_1 = "collectOrb"
                local A_2 = "Yellow Orb"
                local A_3 = "City"
                local Event = game:GetService("ReplicatedStorage").rEvents.orbEvent
                Event:FireServer(A_1, A_2, A_3)
            end
        end
    )
end

function autoRebirth()
    spawn(
        function()
            while _G.isRebirth do
                local A_1 = "\114\101\98\105\114\116\104\82\101\113\117\101\115\116"
                local Event = game:GetService("ReplicatedStorage").rEvents.rebirthEvent
                Event:FireServer(A_1)
                wait(5)
            end
        end
    )
end

autoSteps()
autoRebirth()
