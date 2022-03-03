function Notify(text, time)
    pcall(function()
        if not time then
            time = 3
        end
        local Notification = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local Frame_2 = Instance.new("Frame")
        local Frame_3 = Instance.new("Frame")
        local ImageLabel = Instance.new("ImageLabel")
        local TextLabel = Instance.new("TextLabel")
        local TextLabel_2 = Instance.new("TextLabel")
        local Loading = Instance.new("Frame")
        
        Notification.Parent = game.StarterGui
        Notification.Name = "Notification"
        Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        Frame.Parent = Notification
        Frame.BackgroundColor3 = Color3.fromRGB(63, 63, 65)
        Frame.BorderColor3 = Color3.fromRGB(63, 63, 65)
        Frame.Size = UDim2.new(0, 280, 0, 65)
        
        Frame_2.Parent = Frame
        Frame_2.BackgroundColor3 = Color3.fromRGB(32, 32, 33)
        Frame_2.BorderColor3 = Color3.fromRGB(32, 32, 33)
        Frame_2.Size = UDim2.new(0, 280, 0, 23)
        
        Frame_3.Parent = Frame_2
        Frame_3.BackgroundColor3 = Color3.fromRGB(32, 32, 33)
        Frame_3.BorderColor3 = Color3.fromRGB(32, 32, 33)
        Frame_3.Position = UDim2.new(0, 0, 0.493027061, 0)
        Frame_3.Size = UDim2.new(0, 280, 0, 13)
        
        ImageLabel.Parent = Frame
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.BackgroundTransparency = 1.000
        ImageLabel.Position = UDim2.new(0.00912408717, 0, 0, 0)
        ImageLabel.Size = UDim2.new(0, 25, 0, 25)
        ImageLabel.Image = "rbxassetid://7628995628"
        
        TextLabel.Parent = Frame
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.Position = UDim2.new(0.125, 0, 0, 0)
        TextLabel.Size = UDim2.new(0, 55, 0, 25)
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.Text = "Bee Swarm Simulator | XLP"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 14.000
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        TextLabel_2.Parent = Frame
        TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.BackgroundTransparency = 1.000
        TextLabel_2.Position = UDim2.new(0.032142859, 0, 0.384615391, 0)
        TextLabel_2.Size = UDim2.new(0, 55, 0, 25)
        TextLabel_2.Font = Enum.Font.SourceSansBold
        TextLabel_2.Text = text
        TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel_2.TextSize = 18.000
        TextLabel_2.RichText = true
        TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left
        
        Loading.Name = "Loading"
        Loading.Parent = Frame
        Loading.BackgroundColor3 = Color3.fromRGB(151, 0, 227)
        Loading.BorderColor3 = Color3.fromRGB(151, 0, 227)
        Loading.Position = UDim2.new(0.0299999993, 0, 0.830000024, 0)
        Loading.Size = UDim2.new(0, 265, 0, 5)
        count = 1
        for i,v in pairs(game.StarterGui:GetChildren()) do
            if v.Name == "Notification" and v ~= Notification then
                count = count + 1
            end
        end
        Frame.Position = UDim2.new(0, Notification.AbsoluteSize.X, 0, Notification.AbsoluteSize.Y-Frame.Size.Y.Offset+75)
        for i = 1, count do
            Frame.Position = UDim2.new(0, Notification.AbsoluteSize.X, 0, Notification.AbsoluteSize.Y-Frame.Size.Y.Offset-(75*i))
        end
        --[[
        wait(0,1)
        Frame:TweenPosition(Frame.Position+UDim2.new(0,-300,0,0), "Out", "Sine", 0.5)
        wait(0.5)
        Loading:TweenSize(UDim2.new(0,0,0,5), "Out", "Sine", time)
        wait(time)
        Loading:Destroy()
        Frame:TweenPosition(Frame.Position+UDim2.new(0,300,0,0), "Out", "Sine", 1)
        wait(1)
        Notification:Destroy();
        count = count - 1
        ]]
        delay(0.1, function()
            Frame:TweenPosition(Frame.Position+UDim2.new(0,-300,0,0), "Out", "Sine", 0.5)
            delay(0.5, function()
                Loading:TweenSize(UDim2.new(0,0,0,5), "Out", "Sine", time)
                delay(time, function()
                    Frame:TweenPosition(Frame.Position+UDim2.new(0,300,0,0), "Out", "Sine", 1)
                    delay(1, function()
                        Notification:Destroy();
                        count = count - 1
                    end)
                end)
            end)
        end)
    end)
end
