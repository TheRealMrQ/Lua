-- checks
if not game:GetService("Workspace")["__THINGS"]["__REMOTES"]:FindFirstChild("equip pet") then
    local ohString1 = "a"
    local ohString2 = "equip pet"
    workspace.__THINGS.__REMOTES.MAIN:FireServer(ohString1, ohString2)
end
if not game:GetService("Workspace")["__THINGS"]["__REMOTES"]:FindFirstChild("unequip pet") then
    local ohString1 = "a"
    local ohString2 = "unequip pet"
    workspace.__THINGS.__REMOTES.MAIN:FireServer(ohString1, ohString2)
end

local library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/not-weuz/Lua/main/wallyfork.lua"), true))()

local vuser = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function() vuser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vuser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local pets = {}
for i, v in next, getgc(true) do if type(v) == "table" and rawget(v, "uid") and tostring(v.owner) == tostring(game:GetService("Players").LocalPlayer) then table.insert(pets, v.uid) end end

function func(state) 
    for _, pet in next, pets do 
        local ohTable1 = {[1] = pet} 
        workspace.__THINGS.__REMOTES[state]:InvokeServer(ohTable1) 
    end 
end

local main = library:CreateWindow("XLP PSX Helper")

main:Section("This GUI should help you")
main:Section("With re-equipping pets")
main:Section("For OP gems farming")

main:Button("Equip Team", function()
    func("equip pet")
end)

main:Button("Unequip Team", function()
    func("unequip pet")
end)

main:Toggle('Instant Collect', {flag = 'instant'})
main:Toggle('Collect Rewards', {flag = 'rew'})

main:Button("Refresh Team",function()
    table.clear(pets)
    for i, v in next, getgc(true) do if type(v) == "table" and rawget(v, "uid") and tostring(v.owner) == tostring(game:GetService("Players").LocalPlayer) then table.insert(pets, v.uid) end end
end)

main:Section("Other")

main:Button("Destroy GUI", function()
    game.CoreGui.ScreenGui:Destroy()
end)

main:Button("https://discord.gg/9vG8UJXuNf", function()
    setclipboard("https://discord.gg/9vG8UJXuNf")
end)

spawn(function()
    while wait() do
       if main.flags.instant then
            for i,v in pairs(game:GetService("Workspace")["__THINGS"].Orbs:GetChildren()) do
                local A_1 = { 
                    [1] = { 
                        [1] = v.Name 
                    } 
                } 
                local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"]["claim orbs"]
                Event:FireServer(A_1)
            end    
        end
        if main.flags.rew then
                local A_1 = {} local Event = game:GetService("Workspace")["__THINGS"]["__REMOTES"]["redeem rank rewards"] Event:InvokeServer(A_1)
        end
    end
end)
