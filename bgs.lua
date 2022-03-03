local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/not-weuz/Lua/main/xlpui.lua"))()
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/not-weuz/xlpapi/main/api.lua"))()


--[[

    Script should be published with tutorial, but I forget to record it LOL
    Also script is useless af

]]


local Finity = library.new(true, "Bubble Gum Simulator | XLP ")
Finity.ChangeToggleKey(Enum.KeyCode.Semicolon)

--variables lol

local eggtable = {}

for i,v in pairs(game:GetService("ReplicatedStorage").Assets.Eggs:GetChildren()) do
    table.insert(eggtable, v.Name)
end

table.sort(eggtable)

-- anti afk

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

-- variables

local autoblow = false
local autoegg = false
local autotrippleegg = false
local merchantone = false
local merchanttwo = false
local merchantthree = false
local shardluckautobuy = false
local shardspeedautobuy = false
local shardshinyautobuy = false
local autoquest = false
local difficulty = "Hard"
local shardmythicautobuy = false
local egg = "Spikey Egg"
local rgbui = false

-- let's create categories

local homec = Finity:Category("Home")
local autoc = Finity:Category("Main")
local shardc = Finity:Category("Shard")
local settc = Finity:Category("Settings")



-- skip eggs thing

local eggserv = require(game:GetService("ReplicatedStorage").Assets.Modules.EggService)
repeat
wait()
eggserv = require(game:GetService("ReplicatedStorage").Assets.Modules.EggService)
until eggserv ~= nil
local hatch1 = eggserv.HatchEgg
local hatch3 = eggserv.MultiHatchEgg


--home

local infos = homec:Sector("Information")
infos:Cheat("Label", "Script by weuz_#7880")
infos:Cheat("Label", "UI library: Forked & Modified Finity UI")
infos:Cheat("Label", "w3uz @ v3rmillion.net")
infos:Cheat("Label", "Thanks for using my script, ".. api.nickname)

-- farming

local farm1 = autoc:Sector("Autofarming")

farm1:Cheat("Checkbox", "Auto Bubble Blow", function(State)
    autoblow = not autoblow
end)

local eggs = autoc:Sector("Eggs")

eggs:Cheat("Dropdown", "Select Egg", function(Option)
    egg = Option
end, {
    options = eggtable
})

eggs:Cheat("Label", "Or")

eggs:Cheat("Textbox", "Select Egg", function(Value)
    egg = Value
end, {placeholder = "Egg Name"})

eggs:Cheat("Checkbox", "Auto Buy Egg (x1)", function(State)
    if autoegg then
        autoegg = false
    else
        autoegg = true
    end
end)

eggs:Cheat("Checkbox", "Auto Buy Egg (x3)", function(State)
    if autotrippleegg then
        autotrippleegg = false
    else
        autotrippleegg = true
    end
end)

eggs:Cheat("Checkbox", "Revoke Egg Animation", function(State)
    eggserv.HatchEgg = (State == true and function()
    end or hatch1)
    eggserv.MultiHatchEgg = (State == true and function()
    end or hatch3)
end)

local merchants = autoc:Sector("Merchant")

merchants:Cheat("Checkbox", "Autobuy Merchant One", function(State)
    if merchantone == false then
        merchantone = true
            while merchantone and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyMerchantItem"
                local A_2 = 1
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
            end
        else
        end
        merchantone = false
end)

merchants:Cheat("Checkbox", "Autobuy Merchant Two", function(State)
    if merchanttwo == false then
        merchanttwo = true
            while merchanttwo and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyMerchantItem"
                local A_2 = 2
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
            end
        else
        end
        merchanttwo = false
end)

merchants:Cheat("Checkbox", "Autobuy Merchant Three", function(State)
    if merchantthree == false then
        merchantthree = true
            while merchantthree and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyMerchantItem"
                local A_2 = 3
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
            end
        else
        end
        merchantthree = false
end)

local shardq = shardc:Sector("Shard AutoQuest")

shardq:Cheat("Dropdown", "AutoQuest Difficulty", function(Option)
    difficulty = Option
end, {
    options = {
        "Easy",
        "Medium",
        "Hard"
    }
})

shardq:Cheat("Checkbox", "Get/Confirm Shard Quests", function(State)
    if autoquest == false then
        autoquest = true
            while autoquest and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "ClaimShardQuestReward"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1)
    			wait(1)
                local A_1 = "GetShardQuest"
                local A_2 = difficulty
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        autoquest = false
end)

local shardab = shardc:Sector("Shard AutoBuy")

shardab:Cheat("Checkbox", "Autobuy Luck", function(State)
    if shardluckautobuy == false then
        shardluckautobuy = true
            while shardluckautobuy and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyShardShopItem"
    			local A_2 = 1
    			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    			Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        shardluckautobuy = false
end)

shardab:Cheat("Checkbox", "Autobuy Speed", function(State)
    if shardspeedautobuy == false then
        shardspeedautobuy = true
            while shardspeedautobuy and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyShardShopItem"
    			local A_2 = 2
    			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    			Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        shardspeedautobuy = false
end)

shardab:Cheat("Checkbox", "Autobuy Shiny", function(State)
    if shardshinyautobuy == false then
        shardshinyautobuy = true
            while shardshinyautobuy and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyShardShopItem"
    			local A_2 = 3
    			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    			Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        shardshinyautobuy = false
end)

shardab:Cheat("Checkbox", "Autobuy Mythic", function(State)
    if shardmythicautobuy == false then
        shardmythicautobuy = true
            while shardmythicautobuy and game:GetService("RunService").RenderStepped:wait() do
                wait()
                local A_1 = "BuyShardShopItem"
    			local A_2 = 4
    			local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
    			Event:FireServer(A_1, A_2)
    			wait(1)
            end
        else
        end
        shardmythicautobuy = false
end)


-- lol

local guisettings = settc:Sector("GUI Settings")

guisettings:Cheat("Dropdown", "GUI Options (Dropdown)", function(Option)
    if Option == "Color Reset" then
        game:GetService("CoreGui").xlpUI.Container.BackgroundColor3 = Color3.fromRGB(32,32,33)
    else
        game.CoreGui.xlpUI:Destroy()
    end
end, {
	options = {
        "Destroy GUI",
        "Color Reset"
	}
})

guisettings:Cheat("Checkbox", "Disable Separators", function(State)
    if disableseperators == false then
        disableseperators = true
        for i,v in pairs(game:GetService("CoreGui").xlpUI.Container:GetChildren()) do
            if v.Name == "Separator" then
                v.Visible = false
            end
            wait()
        end
    else
        for i,v in pairs(game:GetService("CoreGui").xlpUI.Container:GetChildren()) do
            if v.Name == "Separator" then
                v.Visible = true
            end
            wait()
        end
        disableseperators = false
    end
end)

guisettings:Cheat("Checkbox", "RGB GUI", function(State)
    if rgbui == false then
        rgbui = true
            while rgbui do
                for hue = 0, 255, 4 do
                    if rgbui then
                        game.CoreGui.xlpUI.Container.BorderColor3 = Color3.fromHSV(hue/256, 1, 1)
                        game.CoreGui.xlpUI.Container.BackgroundColor3 = Color3.fromHSV(hue/256, .5, .8)
                        wait()
                    end
                end
            end
        else
        end
        rgbui = false
end)

guisettings:Cheat("ColorPicker", "GUI Color", function(Value)
    game:GetService("CoreGui").xlpUI.Container.BackgroundColor3 = Value
end)

guisettings:Cheat("Keybind", "GUI Keybind", function(Value)
    Finity.ChangeToggleKey(Value)
end)


spawn(
    function()
        while wait() do
            if autoblow then
                local ohString1 = "BlowBubble"
                game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(ohString1)
            end
            if autoegg then
                local ohString1 = "PurchaseEgg"
                local ohString2 = egg
                game:GetService("ReplicatedStorage").NetworkRemoteEvent:FireServer(ohString1, ohString2)
            end
            if autotrippleegg then
                local A_1 = "PurchaseEgg"
                local A_2 = egg
                local A_3 = "Multi"
                local Event = game:GetService("ReplicatedStorage").NetworkRemoteEvent
                Event:FireServer(A_1, A_2, A_3)
            end
        end
    end
)
