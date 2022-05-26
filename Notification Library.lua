local Mocha = {}
local TweenService = game:GetService("TweenService");
local RunService = game:GetService("RunService");
local TextService = game:GetService("TextService");
local Player = game:GetService("Players").LocalPlayer;
local TweenTime = 1
local TweenStyle = Enum.EasingStyle.Sine
local TweenDirection = Enum.EasingDirection.Out
local PropertyTweenOut = {
	Text = "TextTransparency",
	Fram = "BackgroundTransparency",
	Imag = "ImageTransparency"
}

if game:GetService("CoreGui"):FindFirstChild("MochaNotif") then
  warn("Mocha Notification Library is already in CoreGui!")
  game.CoreGui.MochaNotif.Container.Position = UDim2.new(1, -350, 0.2, 0)
else
  local MochaNotif = Instance.new("ScreenGui")
  MochaNotif.Name = "MochaNotif"
  MochaNotif.Parent = game:GetService("CoreGui");
  MochaNotif.IgnoreGuiInset = false
  MochaNotif.ResetOnSpawn = false

  local Container = Instance.new("Frame")
  Container.Name = "Container"
  Container.Parent = MochaNotif
  Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  Container.BackgroundTransparency = 1
  Container.Position = UDim2.new(1, -350, 0.2, 0)
  Container.Size = UDim2.new(0.239999995, 0, 0.800000012, 0)

  local UIListLayout = Instance.new("UIListLayout")

  UIListLayout.Parent = Container
  UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
  UIListLayout.Padding = UDim.new(0, 6)
end

function DropShadow(o)
    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Parent = o
    Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Shadow.BackgroundTransparency = 1.000
    Shadow.Position = -UDim2.fromOffset(15, 15);
    Shadow.Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30);
    Shadow.Image = "rbxassetid://5761498316"
    Shadow.ImageColor3 = Color3.fromRGB(30, 30, 30)
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(17, 17, 283, 283)
    Shadow.ImageTransparency = 1
end

function FadeInProperty(o)
	local Prop = PropertyTweenOut[string.sub(o.ClassName, 1, 4)];
	TweenService:Create(o, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 0;
	}):Play();
end

function Mocha:CreateNotif(properties)
    local NotificationFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local NotificationTitle = Instance.new("TextLabel")
    local NotificationDescription = Instance.new("TextLabel")

    NotificationFrame.Name = "NotificationFrame"
    NotificationFrame.Parent = game.CoreGui.MochaNotif.Container
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    NotificationFrame.Size = UDim2.new(1, 0, NotificationDescription.Position.Y.Offset + 0.1, 0)
    NotificationFrame.BackgroundTransparency = 1

    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = NotificationFrame

    NotificationTitle.Name = "NotificationTitle"
    NotificationTitle.Parent = NotificationFrame
    NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotificationTitle.BackgroundTransparency = 1.000
    NotificationTitle.Position = UDim2.new(0, 10, 0, 12)
    NotificationTitle.Size = UDim2.new(0, 80, 0, 15)
    NotificationTitle.Font = Enum.Font.GothamSemibold
    NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotificationTitle.TextSize = 14.000
    NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
    NotificationTitle.TextYAlignment = Enum.TextYAlignment.Top
    NotificationTitle.TextTransparency = 1

    NotificationDescription.Name = "NotificationDescription"
    NotificationDescription.Parent = NotificationFrame
    NotificationDescription.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotificationDescription.BackgroundTransparency = 1.000
    NotificationDescription.Position = UDim2.new(0, 10, 0, 29)
    NotificationDescription.Size = UDim2.new(0, 235, 0, 37)
    NotificationDescription.Font = Enum.Font.GothamSemibold
    NotificationDescription.TextColor3 = Color3.fromRGB(255, 255, 255)
    NotificationDescription.TextSize = 14.000
    NotificationDescription.TextXAlignment = Enum.TextXAlignment.Left
    NotificationDescription.TextYAlignment = Enum.TextYAlignment.Top
    NotificationDescription.TextTransparency = 1

    NotificationTitle.Text = properties.Title or "Neon Hub"
    NotificationDescription.Text = properties.Description or "nil"

    DropShadow(NotificationFrame)
    local Prop = PropertyTweenOut[string.sub(NotificationFrame.ClassName, 1, 4)];
    TweenService:Create(NotificationFrame, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 0;
	}):Play();
    local Prop = PropertyTweenOut[string.sub(NotificationTitle.ClassName, 1, 4)];
    TweenService:Create(NotificationTitle, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 0;
	}):Play();
    local Prop = PropertyTweenOut[string.sub(NotificationDescription.ClassName, 1, 4)];
    TweenService:Create(NotificationDescription, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 0;
	}):Play();

    local duration = properties.Duration or 5

    function Close()
		local Prop = PropertyTweenOut[string.sub(NotificationTitle.ClassName, 1, 4)];
    TweenService:Create(NotificationTitle, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 1;
	}):Play();
	wait(0.4)
	local Prop = PropertyTweenOut[string.sub(NotificationDescription.ClassName, 1, 4)];
    TweenService:Create(NotificationDescription, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 1;
	  }):Play();
	wait(0.4)
      local Prop = PropertyTweenOut[string.sub(NotificationFrame.ClassName, 1, 4)];
    TweenService:Create(NotificationFrame, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 1;
	}):Play();
  wait(0.4)
  NotificationFrame:Destroy()
    end
    if properties.Accept then
      wait(0.4)
      TweenService:Create(NotificationFrame, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
        Size = UDim2.new(1, 0, 0.15, 0)
      }):Play();
      local ButtonFrame = Instance.new("Frame")
      local Accept = Instance.new("Frame")
      local UICorner = Instance.new("UICorner")
      local TextButton = Instance.new("TextButton")

      ButtonFrame.Name = "ButtonFrame"
      ButtonFrame.Parent = NotificationFrame
      ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      ButtonFrame.BackgroundTransparency = 1.000
      ButtonFrame.Position = UDim2.new(0.5, 0, 0.6, 0)
      ButtonFrame.Size = UDim2.new(0, 155, 0, 25)

      Accept.Name = "Accept"
      Accept.Parent = ButtonFrame
      Accept.BackgroundColor3 = Color3.fromRGB(144, 238, 144)
      Accept.Position = UDim2.new(0.54838711, 0, 0, 0)
      Accept.Size = UDim2.new(0.45161289, 0, 1, 0)
      Accept.BackgroundTransparency = 1

      UICorner.CornerRadius = UDim.new(0, 4)
      UICorner.Parent = Accept

      TextButton.Parent = Accept
      TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      TextButton.BackgroundTransparency = 1.000
      TextButton.Selectable = false
      TextButton.Size = UDim2.new(1, 0, 1, 0)
      TextButton.Font = Enum.Font.GothamSemibold
      TextButton.Text = "Okay"
      TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
      TextButton.TextSize = 14.000
      TextButton.TextTransparency = 1

      wait(0.4)

      local Prop = PropertyTweenOut[string.sub(Accept.ClassName, 1, 4)];
      TweenService:Create(Accept, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
      [Prop] = 0;
    }):Play();
      wait(0.2)
      local Prop = PropertyTweenOut[string.sub(TextButton.ClassName, 1, 4)];
      TweenService:Create(TextButton, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
      [Prop] = 0;
    }):Play();
      properties.Accept.Callback = properties.Accept.Callback or function() end
      TextButton.MouseButton1Down:Connect(function()
        spawn(function()
          local Prop = PropertyTweenOut[string.sub(Accept.ClassName, 1, 4)];
    TweenService:Create(Accept, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 1;
	}):Play();
  local Prop = PropertyTweenOut[string.sub(TextButton.ClassName, 1, 4)];
    TweenService:Create(TextButton, TweenInfo.new(0.25, TweenStyle, TweenDirection), {
		[Prop] = 1;
	}):Play();
        end)
        Close()
      end)
    else
      wait(duration)
      Close()
    end
end

return Mocha
