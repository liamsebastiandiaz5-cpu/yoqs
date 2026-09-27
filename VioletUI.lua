-- VioletUI v1.0 | LocalScript
-- Colocar en StarterPlayer > StarterPlayerScripts
-- UI visual para Roblox Studio; las funciones de juego se conectan
-- únicamente a sistemas legítimos de tu propia experiencia.

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local IMAGE_ID = "rbxassetid://78983194353007"

local old = playerGui:FindFirstChild("VioletUI")
if old then old:Destroy() end

local purple = Color3.fromRGB(145,70,255)
local bg = Color3.fromRGB(8,6,14)
local panel = Color3.fromRGB(17,13,26)
local white = Color3.fromRGB(245,242,255)
local gray = Color3.fromRGB(165,155,185)

local gui = Instance.new("ScreenGui")
gui.Name = "VioletUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.AnchorPoint = Vector2.new(.5,.5)
main.Position = UDim2.fromScale(.5,.5)
main.Size = UDim2.new(.92,0,.8,0)
main.BackgroundColor3 = bg
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui
Instance.new("UICorner",main).CornerRadius = UDim.new(0,14)
local outline = Instance.new("UIStroke",main)
outline.Color = purple
outline.Thickness = 1.5
local limit = Instance.new("UISizeConstraint",main)
limit.MinSize = Vector2.new(330,320)
limit.MaxSize = Vector2.new(1050,700)

local header = Instance.new("Frame",main)
header.Size = UDim2.new(1,0,0,82)
header.BackgroundColor3 = Color3.fromRGB(22,8,42)
header.BorderSizePixel = 0

local title = Instance.new("TextLabel",header)
title.BackgroundTransparency = 1
title.Position = UDim2.fromOffset(18,8)
title.Size = UDim2.new(0,220,0,42)
title.Text = "VioletUI"
title.TextColor3 = white
title.Font = Enum.Font.GothamBlack
title.TextSize = 29
title.TextXAlignment = Enum.TextXAlignment.Left

local subtitle = Instance.new("TextLabel",header)
subtitle.BackgroundTransparency = 1
subtitle.Position = UDim2.fromOffset(20,49)
subtitle.Size = UDim2.new(0,260,0,20)
subtitle.Text = "ROBLOX  •  CUSTOM HUB"
subtitle.TextColor3 = Color3.fromRGB(190,130,255)
subtitle.Font = Enum.Font.GothamBold
subtitle.TextSize = 11
subtitle.TextXAlignment = Enum.TextXAlignment.Left

local art = Instance.new("ImageLabel",header)
art.Size = UDim2.new(0,125,0,82)
art.Position = UDim2.new(.5,-62,0,0)
art.BackgroundTransparency = 1
art.Image = IMAGE_ID
art.ScaleType = Enum.ScaleType.Crop

local function makeButton(parent,text,size,pos)
    local b = Instance.new("TextButton")
    b.Size = size
    b.Position = pos
    b.BackgroundColor3 = Color3.fromRGB(27,19,42)
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = white
    b.Font = Enum.Font.GothamSemibold
    b.TextSize = 14
    b.AutoButtonColor = true
    b.Parent = parent
    Instance.new("UICorner",b).CornerRadius = UDim.new(0,8)
    local s = Instance.new("UIStroke",b)
    s.Color = Color3.fromRGB(65,35,110)
    return b
end

local minimize = makeButton(header,"—",UDim2.fromOffset(34,30),UDim2.new(1,-82,0,15))
local close = makeButton(header,"×",UDim2.fromOffset(34,30),UDim2.new(1,-42,0,15))
close.TextColor3 = Color3.fromRGB(255,110,130)

-- Drag window (mouse and touch)
local dragging, dragStart, startPos = false,nil,nil
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging,dragStart,startPos = true,input.Position,main.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position-dragStart
        main.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging=false end
end)

local body = Instance.new("Frame",main)
body.Position = UDim2.fromOffset(0,82)
body.Size = UDim2.new(1,0,1,-82)
body.BackgroundTransparency = 1

local sidebar = Instance.new("Frame",body)
sidebar.Position = UDim2.fromOffset(10,10)
sidebar.Size = UDim2.new(0,142,1,-20)
sidebar.BackgroundColor3 = panel
sidebar.BorderSizePixel = 0
Instance.new("UICorner",sidebar).CornerRadius = UDim.new(0,12)
local sideStroke = Instance.new("UIStroke",sidebar)
sideStroke.Color = Color3.fromRGB(55,30,90)

local sideList = Instance.new("UIListLayout",sidebar)
sideList.Padding = UDim.new(0,7)
sideList.HorizontalAlignment = Enum.HorizontalAlignment.Center
sideList.SortOrder = Enum.SortOrder.LayoutOrder
local sidePad = Instance.new("UIPadding",sidebar)
sidePad.PaddingTop = UDim.new(0,12)

local content = Instance.new("ScrollingFrame",body)
content.Name = "PageContent"
content.Position = UDim2.fromOffset(162,10)
content.Size = UDim2.new(1,-365,1,-20)
content.BackgroundColor3 = panel
content.BorderSizePixel = 0
content.ScrollBarThickness = 4
content.ScrollBarImageColor3 = purple
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.CanvasSize = UDim2.new()
Instance.new("UICorner",content).CornerRadius = UDim.new(0,12)
local cs = Instance.new("UIStroke",content)
cs.Color = Color3.fromRGB(55,30,90)
local cp = Instance.new("UIPadding",content)
cp.PaddingTop,cp.PaddingLeft,cp.PaddingRight,cp.PaddingBottom =
    UDim.new(0,14),UDim.new(0,14),UDim.new(0,14),UDim.new(0,14)
local cl = Instance.new("UIListLayout",content)
cl.Padding = UDim.new(0,10)
cl.SortOrder = Enum.SortOrder.LayoutOrder

local right = Instance.new("Frame",body)
right.Position = UDim2.new(1,-193,0,10)
right.Size = UDim2.new(0,183,1,-20)
right.BackgroundColor3 = panel
right.BorderSizePixel = 0
Instance.new("UICorner",right).CornerRadius = UDim.new(0,12)
local rs = Instance.new("UIStroke",right)
rs.Color = Color3.fromRGB(55,30,90)

local statusTitle = Instance.new("TextLabel",right)
statusTitle.BackgroundTransparency = 1
statusTitle.Position = UDim2.fromOffset(12,12)
statusTitle.Size = UDim2.new(1,-24,0,30)
statusTitle.Text = "◈  ESTADO"
statusTitle.TextColor3 = white
statusTitle.Font = Enum.Font.GothamBold
statusTitle.TextSize = 16
statusTitle.TextXAlignment = Enum.TextXAlignment.Left

local function statusRow(a,b,y)
    local l = Instance.new("TextLabel",right)
    l.BackgroundTransparency=1
    l.Position=UDim2.fromOffset(12,y)
    l.Size=UDim2.new(.5,-10,0,26)
    l.Text=a
    l.TextColor3=gray
    l.Font=Enum.Font.Gotham
    l.TextSize=12
    l.TextXAlignment=Enum.TextXAlignment.Left
    local v=l:Clone()
    v.Parent=right
    v.Position=UDim2.new(.5,0,0,y)
    v.Size=UDim2.new(.5,-10,0,26)
    v.Text=b
    v.TextColor3=Color3.fromRGB(190,130,255)
    v.Font=Enum.Font.GothamBold
    v.TextXAlignment=Enum.TextXAlignment.Right
end
statusRow("Juego","Roblox",52)
statusRow("Estado","Activo",84)
statusRow("Versión","1.0.0",116)

local line=Instance.new("Frame",right)
line.Position=UDim2.fromOffset(12,153)
line.Size=UDim2.new(1,-24,0,2)
line.BackgroundColor3=purple
line.BorderSizePixel=0

local quote=Instance.new("TextLabel",right)
quote.BackgroundTransparency=1
quote.Position=UDim2.fromOffset(12,170)
quote.Size=UDim2.new(1,-24,0,90)
quote.Text="“La constancia convierte las ideas en resultados.”"
quote.TextColor3=Color3.fromRGB(190,130,255)
quote.Font=Enum.Font.GothamBold
quote.TextSize=14
quote.TextWrapped=true

local function clearPage()
    for _,v in ipairs(content:GetChildren()) do
        if v~=cp and v~=cl then v:Destroy() end
    end
end

local function addLabel(text,height,size,color,bold)
    local l=Instance.new("TextLabel",content)
    l.Size=UDim2.new(1,-4,0,height)
    l.BackgroundTransparency=1
    l.Text=text
    l.TextColor3=color or white
    l.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextSize=size or 14
    l.TextWrapped=true
    l.TextXAlignment=Enum.TextXAlignment.Left
    return l
end

local function card(titleText,desc,icon)
    local f=Instance.new("Frame",content)
    f.Size=UDim2.new(1,-4,0,90)
    f.BackgroundColor3=Color3.fromRGB(11,8,19)
    f.BorderSizePixel=0
    Instance.new("UICorner",f).CornerRadius=UDim.new(0,10)
    local s=Instance.new("UIStroke",f)
    s.Color=Color3.fromRGB(55,30,90)
    local i=Instance.new("TextLabel",f)
    i.BackgroundTransparency=1
    i.Position=UDim2.fromOffset(12,8)
    i.Size=UDim2.fromOffset(35,35)
    i.Text=icon or "✦"
    i.TextColor3=Color3.fromRGB(190,130,255)
    i.Font=Enum.Font.GothamBold
    i.TextSize=22
    local t=Instance.new("TextLabel",f)
    t.BackgroundTransparency=1
    t.Position=UDim2.fromOffset(55,10)
    t.Size=UDim2.new(1,-65,0,25)
    t.Text=titleText
    t.TextColor3=white
    t.Font=Enum.Font.GothamBold
    t.TextSize=15
    t.TextXAlignment=Enum.TextXAlignment.Left
    local d=t:Clone()
    d.Parent=f
    d.Position=UDim2.fromOffset(55,38)
    d.Size=UDim2.new(1,-65,0,40)
    d.Text=desc
    d.TextColor3=gray
    d.Font=Enum.Font.Gotham
    d.TextSize=12
end

local function showHome()
    clearPage()
    addLabel("⌂  Inicio",34,22,white,true)
    addLabel("Bienvenido a tu espacio personalizado.",28,13,gray,false)

    local banner=Instance.new("Frame",content)
    banner.Size=UDim2.new(1,-4,0,150)
    banner.BackgroundColor3=bg
    banner.BorderSizePixel=0
    banner.ClipsDescendants=true
    Instance.new("UICorner",banner).CornerRadius=UDim.new(0,12)
    local bs=Instance.new("UIStroke",banner)
    bs.Color=purple

    local bi=Instance.new("ImageLabel",banner)
    bi.Size=UDim2.new(.45,0,1,0)
    bi.Position=UDim2.new(.55,0,0,0)
    bi.BackgroundTransparency=1
    bi.Image=IMAGE_ID
    bi.ScaleType=Enum.ScaleType.Crop

    local bt=Instance.new("TextLabel",banner)
    bt.BackgroundTransparency=1
    bt.Position=UDim2.fromOffset(18,22)
    bt.Size=UDim2.new(.62,-20,0,45)
    bt.Text="VioletUI"
    bt.TextColor3=white
    bt.Font=Enum.Font.GothamBlack
    bt.TextSize=29
    bt.TextXAlignment=Enum.TextXAlignment.Left

    local bs2=bt:Clone()
    bs2.Parent=banner
    bs2.Position=UDim2.fromOffset(20,68)
    bs2.Size=UDim2.new(.62,-20,0,25)
    bs2.Text="CUSTOM ROBLOX HUB"
    bs2.TextColor3=Color3.fromRGB(190,130,255)
    bs2.Font=Enum.Font.GothamBold
    bs2.TextSize=12

    card("Diseño personalizado","Interfaz oscura con acentos violetas y tu imagen.","✦")
    card("Panel de estado","Información de la interfaz y versión actual.","◈")
    card("Tu experiencia","Conecta sistemas autorizados de tu propio juego.","⌘")
end

local function showPage(name,desc)
    clearPage()
    addLabel(name,36,22,white,true)
    addLabel(desc,45,13,gray,false)
    card("Espacio preparado","Aquí puedes conectar funciones legítimas de tu propia experiencia.","✦")
    local b=makeButton(content,"   Botón de ejemplo",UDim2.new(1,-4,0,42),UDim2.new())
    b.TextXAlignment=Enum.TextXAlignment.Left
    b.MouseButton1Click:Connect(function()
        print("VioletUI: botón visual pulsado.")
    end)
end

local pages={
    {"⌂","Home",showHome},
    {"◇","Steal",function() showPage("◇  Steal","Panel visual para sistemas de tu propia experiencia.") end},
    {"ϟ","Farm",function() showPage("ϟ  Farm","Espacio para mecánicas creadas en tu propio juego.") end},
    {"◎","Teleports",function() showPage("◎  Teleports","Destinos de tu propia experiencia.") end},
    {"⚙","Settings",function()
        showPage("⚙  Settings","Configuración visual de VioletUI.")
        local b=makeButton(content,"   Mostrar / ocultar panel de estado",UDim2.new(1,-4,0,42),UDim2.new())
        b.TextXAlignment=Enum.TextXAlignment.Left
        b.MouseButton1Click:Connect(function()
            right.Visible=not right.Visible
            content.Size=right.Visible and UDim2.new(1,-365,1,-20) or UDim2.new(1,-180,1,-20)
        end)
    end}
}

local tabs={}
for index,data in ipairs(pages) do
    local b=makeButton(sidebar,"   "..data[1].."    "..data[2],UDim2.new(1,-12,0,42),UDim2.new())
    b.LayoutOrder=index
    b.TextXAlignment=Enum.TextXAlignment.Left
    tabs[data[2]]=b
    b.MouseButton1Click:Connect(function()
        for _,other in pairs(tabs) do other.BackgroundColor3=Color3.fromRGB(27,19,42) end
        b.BackgroundColor3=Color3.fromRGB(55,25,100)
        data[3]()
    end)
end

local minimized=false
minimize.MouseButton1Click:Connect(function()
    minimized=not minimized
    body.Visible=not minimized
    main.Size=minimized and UDim2.new(0,330,0,82) or UDim2.new(.92,0,.8,0)
    minimize.Text=minimized and "+" or "—"
end)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

tabs.Home.BackgroundColor3=Color3.fromRGB(55,25,100)
showHome()
print("VioletUI v1.0 cargada")
