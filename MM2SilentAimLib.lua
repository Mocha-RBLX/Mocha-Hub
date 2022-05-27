local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer

local function GetClosestPlayer()
   local ClosestPlayer = nil
   local FarthestDistance = math.huge

   for i, v in pairs(Players.GetPlayers(Players)) do
       if v ~= LocalPlayer and v.Character and v.Character.FindFirstChild(v.Character, "HumanoidRootPart") then
           local DistanceFromPlayer = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

           if DistanceFromPlayer < FarthestDistance then
               FarthestDistance = DistanceFromPlayer
               ClosestPlayer = v
           end
       end
   end

   if ClosestPlayer then
       return ClosestPlayer
   end
end

local GameMetaTable = getrawmetatable(game)
local OldGameMetaTableNamecall = GameMetaTable.__namecall
setreadonly(GameMetaTable, false)

GameMetaTable.__namecall = newcclosure(function(object, ...)
   local NamecallMethod = getnamecallmethod()
   local Arguments = {...}

   if NamecallMethod == "FireServer" and tostring(object) == "Throw" then
       local ClosestPlayer = GetClosestPlayer()

       if ClosestPlayer and ClosestPlayer.Character then
           Arguments[2] = ClosestPlayer.Character.Head.Position
       end
   end

   return OldGameMetaTableNamecall(object, unpack(Arguments))
end)

local Lib = {}

function Lib:SlientAim(bool)
  if bool then 
     setreadonly(GameMetaTable, true)  
  else
     setreadonly(GameMetaTable, false)
  end
end

return Lib
