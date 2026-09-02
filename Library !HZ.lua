
local ExistingFluent = getgenv and getgenv().Fluent
if ExistingFluent and ExistingFluent.Window and ExistingFluent.GUI and ExistingFluent.GUI.Parent then
	return
end

local GuiParent = game:GetService("RunService"):IsStudio()
	and game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	or game:GetService("CoreGui")

if GuiParent:FindFirstChild("FluentUI") then
	return
end

local a, b = {
	{
		1,
		"ModuleScript",
		{ "MainModule" },
		{
			{ 18, "ModuleScript", { "Creator" } },
			{ 28, "ModuleScript", { "Icons" } },
			{
				47,
				"ModuleScript",
				{ "Themes" },
				{
					{ 50, "ModuleScript", { "Dark" } },
					{ 52, "ModuleScript", { "Light" } },
					{ 51, "ModuleScript", { "Darker" } },
					{ 53, "ModuleScript", { "Rose" } },
					{ 49, "ModuleScript", { "Aqua" } },
					{ 48, "ModuleScript", { "Amethyst" } },
				},
			},
			{
				19,
				"ModuleScript",
				{ "Elements" },
				{
					{ 21, "ModuleScript", { "Colorpicker" } },
					{ 27, "ModuleScript", { "Toggle" } },
					{ 23, "ModuleScript", { "Input" } },
					{ 20, "ModuleScript", { "Button" } },
					{ 25, "ModuleScript", { "Paragraph" } },
					{ 22, "ModuleScript", { "Dropdown" } },
					{ 26, "ModuleScript", { "Slider" } },
					{ 24, "ModuleScript", { "Keybind" } },
				},
			},
			{
				29,
				"Folder",
				{ "Packages" },
				{
					{
						30,
						"ModuleScript",
						{ "Flipper" },
						{
							{ 33, "ModuleScript", { "GroupMotor" } },
							{ 46, "ModuleScript", { "isMotor.spec" } },
							{ 39, "ModuleScript", { "Signal" } },
							{ 40, "ModuleScript", { "Signal.spec" } },
							{ 45, "ModuleScript", { "isMotor" } },
							{ 36, "ModuleScript", { "Instant.spec" } },
							{ 44, "ModuleScript", { "Spring.spec" } },
							{ 42, "ModuleScript", { "SingleMotor.spec" } },
							{ 38, "ModuleScript", { "Linear.spec" } },
							{ 31, "ModuleScript", { "BaseMotor" } },
							{ 43, "ModuleScript", { "Spring" } },
							{ 35, "ModuleScript", { "Instant" } },
							{ 37, "ModuleScript", { "Linear" } },
							{ 41, "ModuleScript", { "SingleMotor" } },
							{ 34, "ModuleScript", { "GroupMotor.spec" } },
							{ 32, "ModuleScript", { "BaseMotor.spec" } },
						},
					},
				},
			},
			{
				2,
				"ModuleScript",
				{ "Acrylic" },
				{
					{ 3, "ModuleScript", { "AcrylicBlur" } },
					{ 5, "ModuleScript", { "CreateAcrylic" } },
					{ 6, "ModuleScript", { "Utils" } },
					{ 4, "ModuleScript", { "AcrylicPaint" } },
				},
			},
			{
				7,
				"Folder",
				{ "Components" },
				{
					{ 9, "ModuleScript", { "Button" } },
					{ 12, "ModuleScript", { "Notification" } },
					{ 13, "ModuleScript", { "Section" } },
					{ 17, "ModuleScript", { "Window" } },
					{ 14, "ModuleScript", { "Tab" } },
					{ 10, "ModuleScript", { "Dialog" } },
					{ 8, "ModuleScript", { "Assets" } },
					{ 16, "ModuleScript", { "TitleBar" } },
					{ 15, "ModuleScript", { "Textbox" } },
					{ 11, "ModuleScript", { "Element" } },
				},
			},
		},
	},
}

local UI_FONT_FAMILY = "rbxasset://fonts/families/BuilderSans.json"
local UI_FONT_REGULAR = Font.new(UI_FONT_FAMILY, Enum.FontWeight.Regular, Enum.FontStyle.Normal)
local UI_FONT_MEDIUM = Font.new(UI_FONT_FAMILY, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
local UI_FONT_SEMIBOLD = Font.new(UI_FONT_FAMILY, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)

local aa = {
	function()
		local c, d, e, f, g = b(1)
		local h, i, j, k, l, m =
			game:GetService("Lighting"),
			game:GetService("RunService"),
			game:GetService("Players").LocalPlayer,
			game:GetService("UserInputService"),
			game:GetService("TweenService"),
			game:GetService("Workspace").CurrentCamera
		local n, o = j:GetMouse(), d
		local p, q, r, s = e(o.Creator), e(o.Elements), e(o.Acrylic), o.Components
		local t, u, v = e(s.Notification), p.New, protectgui or (syn and syn.protect_gui) or function() end
		local w = u("ScreenGui", { Name = "FluentUI", Parent = i:IsStudio() and j.PlayerGui or game:GetService("CoreGui") })
		v(w)
		t:Init(w)
		local x = {
			Version = "1.1.0",
			OpenFrames = {},
			Options = {},
			Themes = e(o.Themes).Names,
			Window = nil,
			WindowFrame = nil,
			Unloaded = false,
			Theme = "Dark",
			DialogOpen = false,
			UseAcrylic = false,
			Acrylic = false,
			Transparency = true,
			MinimizeKeybind = nil,
			MinimizeKey = Enum.KeyCode.LeftControl,
			GUI = w,
		}
		function x.SafeCallback(y, z, ...)
			if not z then
				return
			end
			local A, B = pcall(z, ...)
			if not A then
				local C, D = B:find(":%d+: ")
				if not D then
					return x:Notify({ Title = "Interface", Content = "Callback error", SubContent = B, Duration = 5 })
				end
				return x:Notify({ Title = "Interface", Content = "Callback error", SubContent = B:sub(D + 1), Duration = 5 })
			end
		end
		function x.Round(y, z, A)
			if A == 0 then
				return math.floor(z)
			end
			z = tostring(z)
			return z:find("%.") and tonumber(z:sub(1, z:find("%.") + A)) or z
		end
		local y = e(o.Icons)
		function x.GetIcon(z, A)
			if A ~= nil then
				return y.GetAsset(A)
			end
			return nil
		end
		local z = {}
		z.__index = z
		z.__namecall = function(A, B, ...)
			return z[B](...)
		end
		for A, B in ipairs(q) do
			z["Add" .. B.__type] = function(C, D, E)
				B.Container = C.Container
				B.Type = C.Type
				B.ScrollFrame = C.ScrollFrame
				B.Library = x
				return B:New(D, E)
			end
		end
		x.Elements = z
		function x.CreateWindow(C, D)
			assert(D.Title, "Window - Missing Title")
			if x.Window then
				print("You cannot create more than one window.")
				return
			end
			x.MinimizeKey = D.MinimizeKey
			x.UseAcrylic = D.Acrylic
			if D.Acrylic then
				r.init()
			end
			local E =
				e(s.Window)({ Parent = w, Size = D.Size, Title = D.Title, SubTitle = D.SubTitle, TabWidth = D.TabWidth })
			x.Window = E
			x:SetTheme(D.Theme)
			return E
		end
		function x.SetTheme(C, D)
			if x.Window and table.find(x.Themes, D) then
				x.Theme = D
				p.UpdateTheme()
			end
		end
		function x.Destroy(C)
			if x.Window then
				x.Unloaded = true
				if x.UseAcrylic then
					x.Window.AcrylicPaint.Model:Destroy()
				end
				p.Disconnect()
				x.GUI:Destroy()
			end
		end
		function x.ToggleAcrylic(C, D)
			if x.Window then
				if x.UseAcrylic then
					x.Acrylic = D
					x.Window.AcrylicPaint.Model.Transparency = D and 0.98 or 1
					if D then
						r.Enable()
					else
						r.Disable()
					end
				end
			end
		end
		function x.ToggleTransparency(C, D)
			if x.Window then
				x.Window.AcrylicPaint.Frame.Background.BackgroundTransparency = D and 0.35 or 0
			end
		end
		function x.Notify(C, D)
			return t:New(D)
		end
		if getgenv then
			getgenv().Fluent = x
		end
		return x
	end,
	function()
		local c, d, e, f, g = b(2)
		local h =
			{ AcrylicBlur = e(d.AcrylicBlur), CreateAcrylic = e(d.CreateAcrylic), AcrylicPaint = e(d.AcrylicPaint) }
		function h.init()
			local i = Instance.new("DepthOfFieldEffect")
			i.FarIntensity = 0
			i.InFocusRadius = 0.1
			i.NearIntensity = 1
			local j = {}
			function h.Enable()
				for k, l in pairs(j) do
					l.Enabled = false
				end
				i.Parent = game:GetService("Lighting")
			end
			function h.Disable()
				for k, l in pairs(j) do
					l.Enabled = l.enabled
				end
				i.Parent = nil
			end
			local k = function()
				local k = function(k)
					if k:IsA("DepthOfFieldEffect") then
						j[k] = { enabled = k.Enabled }
					end
				end
				for l, m in pairs(game:GetService("Lighting"):GetChildren()) do
					k(m)
				end
				if game:GetService("Workspace").CurrentCamera then
					for n, o in pairs(game:GetService("Workspace").CurrentCamera:GetChildren()) do
						k(o)
					end
				end
			end
			k()
			h.Enable()
		end
		return h
	end,
	function()
		local c, d, e, f, g = b(3)
		local h, i, j, k = e(d.Parent.Parent.Creator), e(d.Parent.CreateAcrylic), unpack(e(d.Parent.Utils))
		local l = function(l)
			local m = {}
			l = l or 0.001
			local n, o = { topLeft = Vector2.new(), topRight = Vector2.new(), bottomRight = Vector2.new() }, i()
			o.Parent = workspace
			local p, q =
				function(p, q)
					n.topLeft = q
					n.topRight = q + Vector2.new(p.X, 0)
					n.bottomRight = q + p
				end, function()
					local p = game:GetService("Workspace").CurrentCamera
					if p then
						p = p.CFrame
					end
					local q = p
					if not q then
						q = CFrame.new()
					end
					local r, s, t, u = q, n.topLeft, n.topRight, n.bottomRight
					local v, w, x = j(s, l), j(t, l), j(u, l)
					local y, z = (w - v).Magnitude, (w - x).Magnitude
					o.CFrame = CFrame.fromMatrix((v + x) / 2, r.XVector, r.YVector, r.ZVector)
					o.Mesh.Scale = Vector3.new(y, z, 0)
				end
			local r, s =
				function(r)
					-- 使用完整的 UI 矩形投影，让 Glass 层覆盖整个窗口而不会留下未模糊的边缘。
					local t, u = r.AbsoluteSize, r.AbsolutePosition
					p(t, u)
					task.spawn(q)
				end, function()
					local r = game:GetService("Workspace").CurrentCamera
					if not r then
						return
					end
					table.insert(m, r:GetPropertyChangedSignal("CFrame"):Connect(q))
					table.insert(m, r:GetPropertyChangedSignal("ViewportSize"):Connect(q))
					table.insert(m, r:GetPropertyChangedSignal("FieldOfView"):Connect(q))
					task.spawn(q)
				end
			o.Destroying:Connect(function()
				for t, u in m do
					pcall(function()
						u:Disconnect()
					end)
				end
			end)
			s()
			return r, o
		end
		return function(m)
			local n, o, p = {}, l(m)
			local q = h.New("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) })
			h.AddSignal(q:GetPropertyChangedSignal("AbsolutePosition"), function()
				o(q)
			end)
			h.AddSignal(q:GetPropertyChangedSignal("AbsoluteSize"), function()
				o(q)
			end)
			n.AddParent = function(r)
				h.AddSignal(r:GetPropertyChangedSignal("Visible"), function()
					n.SetVisibility(r.Visible)
				end)
			end
			n.SetVisibility = function(r)
				p.Transparency = r and 0.98 or 1
			end
			n.Frame = q
			n.Model = p
			return n
		end
	end,
	function()
		local c, d, e, f, g = b(4)
		local h, i = e(d.Parent.Parent.Creator), e(d.Parent.AcrylicBlur)
		local j = h.New
		return function(k)
			local l = {}
			-- 裁剪亚克力纹理，避免放大的阴影层越过窗口边界造成漏光。
			l.Frame = j(
				"Frame",
				{
					Size = UDim2.fromScale(1, 1),
					ClipsDescendants = true,
					BackgroundTransparency = 0.9,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BorderSizePixel = 0,
				},
				{
					j(
						"ImageLabel",
						{
							Image = "rbxassetid://8992230677",
							ScaleType = "Slice",
							SliceCenter = Rect.new(Vector2.new(99, 99), Vector2.new(99, 99)),
							AnchorPoint = Vector2.new(0.5, 0.5),
							Size = UDim2.new(1, 120, 1, 116),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							BackgroundTransparency = 1,
							ImageColor3 = Color3.fromRGB(0, 0, 0),
							ImageTransparency = 0.7,
						}
					),
					j("UICorner", { CornerRadius = UDim.new(0, 8) }),
					j(
						"Frame",
						{
							BackgroundTransparency = 0.45,
							Size = UDim2.fromScale(1, 1),
							Name = "Background",
							ThemeTag = { BackgroundColor3 = "AcrylicMain" },
						},
						{ j("UICorner", { CornerRadius = UDim.new(0, 8) }) }
					),
					j(
						"Frame",
						{
							BackgroundColor3 = Color3.fromRGB(255, 255, 255),
							BackgroundTransparency = 0.4,
							Size = UDim2.fromScale(1, 1),
						},
						{
							j("UICorner", { CornerRadius = UDim.new(0, 8) }),
							j("UIGradient", { Rotation = 90, ThemeTag = { Color = "AcrylicGradient" } }),
						}
					),
					j(
						"ImageLabel",
						{
							Image = "rbxassetid://9968344105",
							ImageTransparency = 0.98,
							ScaleType = Enum.ScaleType.Tile,
							TileSize = UDim2.new(0, 128, 0, 128),
							Size = UDim2.fromScale(1, 1),
							BackgroundTransparency = 1,
						},
						{ j("UICorner", { CornerRadius = UDim.new(0, 8) }) }
					),
					j(
						"ImageLabel",
						{
							Image = "rbxassetid://9968344227",
							ImageTransparency = 0.9,
							ScaleType = Enum.ScaleType.Tile,
							TileSize = UDim2.new(0, 128, 0, 128),
							Size = UDim2.fromScale(1, 1),
							BackgroundTransparency = 1,
							ThemeTag = { ImageTransparency = "AcrylicNoise" },
						},
						{ j("UICorner", { CornerRadius = UDim.new(0, 8) }) }
					),
					j(
						"Frame",
						{ BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 2 },
						{
							j("UICorner", { CornerRadius = UDim.new(0, 8) }),
							j(
								"UIStroke",
								{ Transparency = 0.5, Thickness = 1, ThemeTag = { Color = "AcrylicBorder" } }
							),
						}
					),
				}
			)
			local m
			if e(d.Parent.Parent).UseAcrylic then
				m = i()
				m.Frame.Parent = l.Frame
				l.Model = m.Model
				l.AddParent = m.AddParent
				l.SetVisibility = m.SetVisibility
			end
			return l
		end
	end,
	function()
		local c, d, e, f, g = b(5)
		local h = d.Parent.Parent
		local i = e(h.Creator)
		local j = function()
			local j = i.New(
				"Part",
				{
					Name = "Body",
					Color = Color3.new(0, 0, 0),
					Material = Enum.Material.Glass,
					Size = Vector3.new(1, 1, 0),
					Anchored = true,
					CanCollide = false,
					Locked = true,
					CastShadow = false,
					Transparency = 0.98,
				},
				{ i.New("SpecialMesh", { MeshType = Enum.MeshType.Brick, Offset = Vector3.new(0, 0, -1E-6) }) }
			)
			return j
		end
		return j
	end,
	function()
		local c, d, e, f, g = b(6)
		local h, i =
			function(h, i, j, k, l)
				return (h - i) * (l - k) / (j - i) + k
			end, function(h, i)
				local j = game:GetService("Workspace").CurrentCamera:ScreenPointToRay(h.X, h.Y)
				return j.Origin + j.Direction * i
			end
		local j = function()
			local j = game:GetService("Workspace").CurrentCamera.ViewportSize.Y
			return h(j, 0, 2560, 8, 56)
		end
		return { i, j }
	end,
	[8] = function()
		local c, d, e, f, g = b(8)
		return {
			Close = "rbxassetid://9886659671",
			Min = "rbxassetid://9886659276",
			Max = "rbxassetid://9886659406",
			Restore = "rbxassetid://9886659001",
		}
	end,
	[9] = function()
		local c, d, e, f, g = b(9)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l = j.New, i.Spring.new
		return function(m, n, o)
			o = o or false
			local p = {}
			p.Title = k(
				"TextLabel",
				{
					FontFace = UI_FONT_REGULAR,
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 16,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ThemeTag = { TextColor3 = "Text" },
				}
			)
			p.HoverFrame = k(
				"Frame",
				{ Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ThemeTag = { BackgroundColor3 = "Hover" } },
				{ k("UICorner", { CornerRadius = UDim.new(0, 4) }) }
			)
			p.Frame = k(
				"TextButton",
				{ Size = UDim2.new(0, 0, 0, 32), Parent = n, ThemeTag = { BackgroundColor3 = "DialogButton" } },
				{
					k("UICorner", { CornerRadius = UDim.new(0, 4) }),
					k(
						"UIStroke",
						{
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Transparency = 0.65,
							ThemeTag = { Color = "DialogButtonBorder" },
						}
					),
					p.HoverFrame,
					p.Title,
				}
			)
			local q, r = j.SpringMotor(1, p.HoverFrame, "BackgroundTransparency", o)
			j.AddSignal(p.Frame.MouseEnter, function()
				r(0.97)
			end)
			j.AddSignal(p.Frame.MouseLeave, function()
				r(1)
			end)
			j.AddSignal(p.Frame.MouseButton1Down, function()
				r(1)
			end)
			j.AddSignal(p.Frame.MouseButton1Up, function()
				r(0.97)
			end)
			return p
		end
	end,
	[10] = function()
		local c, d, e, f, g = b(10)
		local h, i, j, k =
			game:GetService("UserInputService"),
			game:GetService("Players").LocalPlayer:GetMouse(),
			game:GetService("Workspace").CurrentCamera,
			d.Parent.Parent
		local l, m = e(k.Packages.Flipper), e(k.Creator)
		local n, o, p, q = l.Spring.new, l.Instant.new, m.New, { Window = nil }
		function q.Init(r, s)
			q.Window = s
			return q
		end
		function q.Create(r)
			local s = { Buttons = 0 }
			s.TintFrame = p(
				"TextButton",
				{
					Text = "",
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 1,
					Parent = q.Window.Root,
				},
				{ p("UICorner", { CornerRadius = UDim.new(0, 8) }) }
			)
			local t, u = m.SpringMotor(1, s.TintFrame, "BackgroundTransparency", true)
			s.ButtonHolder = p(
				"Frame",
				{
					Size = UDim2.new(1, -40, 1, -40),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					BackgroundTransparency = 1,
				},
				{
					p(
						"UIListLayout",
						{
							Padding = UDim.new(0, 10),
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
						}
					),
				}
			)
			s.ButtonHolderFrame = p(
				"Frame",
				{ Size = UDim2.new(1, 0, 0, 70), Position = UDim2.new(0, 0, 1, -70), ThemeTag = {
					BackgroundColor3 = "DialogHolder",
				} },
				{ p("Frame", { Size = UDim2.new(1, 0, 0, 1), ThemeTag = { BackgroundColor3 = "DialogHolderLine" } }), s.ButtonHolder }
			)
			s.Title = p(
				"TextLabel",
				{
					FontFace = UI_FONT_SEMIBOLD,
					Text = "Dialog",
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 25,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 25),
					Position = UDim2.fromOffset(20, 25),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					ThemeTag = { TextColor3 = "Text" },
				}
			)
			s.Scale = p("UIScale", { Scale = 1 })
			local v, w = m.SpringMotor(1.1, s.Scale, "Scale")
			s.Root = p(
				"CanvasGroup",
				{
					Size = UDim2.fromOffset(300, 165),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					GroupTransparency = 1,
					Parent = s.TintFrame,
					ThemeTag = { BackgroundColor3 = "Dialog" },
				},
				{
					p("UICorner", { CornerRadius = UDim.new(0, 8) }),
					p("UIStroke", { Transparency = 0.5, ThemeTag = { Color = "DialogBorder" } }),
					s.Scale,
					s.Title,
					s.ButtonHolderFrame,
				}
			)
			local x, y = m.SpringMotor(1, s.Root, "GroupTransparency")
			function s.Open(z)
				e(k).DialogOpen = true
				s.Scale.Scale = 1.1
				u(0.75)
				y(0)
				w(1)
			end
			function s.Close(z)
				e(k).DialogOpen = false
				u(1)
				y(1)
				w(1.1)
				s.Root.UIStroke:Destroy()
				task.wait(0.15)
				s.TintFrame:Destroy()
			end
			function s.Button(z, A, B)
				s.Buttons = s.Buttons + 1
				A = A or "Button"
				B = B or function() end
				local C = e(k.Components.Button)("", s.ButtonHolder, true)
				C.Title.Text = A
				for D, E in next, s.ButtonHolder:GetChildren() do
					if E:IsA("TextButton") then
						E.Size = UDim2.new(1 / s.Buttons, -(((s.Buttons - 1) * 10) / s.Buttons), 0, 32)
					end
				end
				m.AddSignal(C.Frame.MouseButton1Click, function()
					e(k):SafeCallback(B)
					pcall(function()
						s:Close()
					end)
				end)
				return C
			end
			return s
		end
		return q
	end,
	[11] = function()
		local c, d, e, f, g = b(11)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l = j.New, i.Spring.new
		return function(m, n, o, p)
			local q = {}
			q.TitleLabel = k(
				"TextLabel",
				{
					FontFace = UI_FONT_MEDIUM,
					Text = m,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 15,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, 16),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					ThemeTag = { TextColor3 = "Text" },
				}
			)
			q.DescLabel = k(
				"TextLabel",
				{
					FontFace = UI_FONT_REGULAR,
					Text = n,
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 14,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 16),
					ThemeTag = { TextColor3 = "SubText" },
				}
			)
			q.LabelHolder = k(
				"Frame",
				{
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(10, 0),
					Size = UDim2.new(1, -28, 0, 0),
				},
				{
					k(
						"UIListLayout",
						{ SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center }
					),
					k("UIPadding", { PaddingBottom = UDim.new(0, 13), PaddingTop = UDim.new(0, 13) }),
					q.TitleLabel,
					q.DescLabel,
				}
			)
			q.Border = k(
				"UIStroke",
				{
					Transparency = 0.5,
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = Color3.fromRGB(0, 0, 0),
					ThemeTag = { Color = "ElementBorder" },
				}
			)
			q.Frame = k(
				"TextButton",
				{
					Size = UDim2.new(1, 0, 0, 0),
					BackgroundTransparency = 0.89,
					BackgroundColor3 = Color3.fromRGB(130, 130, 130),
					Parent = o,
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = "",
					LayoutOrder = 7,
					ThemeTag = { BackgroundColor3 = "Element", BackgroundTransparency = "ElementTransparency" },
				},
				{ k("UICorner", { CornerRadius = UDim.new(0, 4) }), q.Border, q.LabelHolder }
			)
			function q.SetTitle(r, s)
				q.TitleLabel.Text = s
			end
			function q.SetDesc(r, s)
				if s == nil then
					s = ""
				end
				if s == "" then
					q.DescLabel.Visible = false
				else
					q.DescLabel.Visible = true
				end
				q.DescLabel.Text = s
			end
			function q.Destroy(r)
				q.Frame:Destroy()
			end
			q:SetTitle(m)
			q:SetDesc(n)
			if p then
				local r, s, t =
					h.Themes,
					j.SpringMotor(
						j.GetThemeProperty("ElementTransparency"),
						q.Frame,
						"BackgroundTransparency",
						false,
						true
					)
				j.AddSignal(q.Frame.MouseEnter, function()
					t(j.GetThemeProperty("ElementTransparency") - j.GetThemeProperty("HoverChange"))
				end)
				j.AddSignal(q.Frame.MouseLeave, function()
					t(j.GetThemeProperty("ElementTransparency"))
				end)
				j.AddSignal(q.Frame.MouseButton1Down, function()
					t(j.GetThemeProperty("ElementTransparency") + j.GetThemeProperty("HoverChange"))
				end)
				j.AddSignal(q.Frame.MouseButton1Up, function()
					t(j.GetThemeProperty("ElementTransparency") - j.GetThemeProperty("HoverChange"))
				end)
			end
			return q
		end
	end,
	[12] = function()
		local c, d, e, f, g = b(12)
		local h = d.Parent.Parent
		local i, j, k = e(h.Packages.Flipper), e(h.Creator), e(h.Acrylic)
		local l, m, n, o = i.Spring.new, i.Instant.new, j.New, {}
		function o.Init(p, q)
			o.Holder = n(
				"Frame",
				{
					Position = UDim2.new(1, -30, 1, -30),
					Size = UDim2.new(0, 310, 1, -30),
					AnchorPoint = Vector2.new(1, 1),
					BackgroundTransparency = 1,
					Parent = q,
				},
				{
					n(
						"UIListLayout",
						{
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Bottom,
							Padding = UDim.new(0, 20),
						}
					),
				}
			)
		end
		function o.New(p, q)
			q.Title = q.Title or "Title"
			q.Content = q.Content or "Content"
			q.SubContent = q.SubContent or ""
			q.Duration = q.Duration or nil
			q.Buttons = q.Buttons or {}
			local r = { Closed = false }
			r.AcrylicPaint = k.AcrylicPaint()
			r.Title = n(
				"TextLabel",
				{
					Position = UDim2.new(0, 14, 0, 17),
					Text = q.Title,
					RichText = true,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					TextTransparency = 0,
					FontFace = UI_FONT_REGULAR,
					TextSize = 15,
					TextXAlignment = "Left",
					TextYAlignment = "Center",
					Size = UDim2.new(1, -12, 0, 16),
					TextWrapped = true,
					BackgroundTransparency = 1,
					ThemeTag = { TextColor3 = "Text" },
				}
			)
			r.ContentLabel = n(
				"TextLabel",
				{
					FontFace = UI_FONT_REGULAR,
					Text = q.Content,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 16,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 16),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					TextWrapped = true,
					ThemeTag = { TextColor3 = "Text" },
				}
			)
			r.SubContentLabel = n(
				"TextLabel",
				{
					FontFace = UI_FONT_REGULAR,
					Text = q.SubContent,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 16,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 16),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					TextWrapped = true,
					ThemeTag = { TextColor3 = "SubText" },
				}
			)
			r.LabelHolder = n(
				"Frame",
				{
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(14, 40),
					Size = UDim2.new(1, -28, 0, 0),
				},
				{
					n(
						"UIListLayout",
						{
							SortOrder = Enum.SortOrder.LayoutOrder,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 3),
						}
					),
					r.ContentLabel,
					r.SubContentLabel,
				}
			)
			r.CloseButton = n(
				"TextButton",
				{
					Text = "",
					Position = UDim2.new(1, -14, 0, 13),
					Size = UDim2.fromOffset(20, 20),
					AnchorPoint = Vector2.new(1, 0),
					BackgroundTransparency = 1,
				},
				{
					n(
						"ImageLabel",
						{
							Image = e(d.Parent.Assets).Close,
							Size = UDim2.fromOffset(16, 16),
							Position = UDim2.fromScale(0.5, 0.5),
							AnchorPoint = Vector2.new(0.5, 0.5),
							BackgroundTransparency = 1,
							ThemeTag = { ImageColor3 = "Text" },
						}
					),
				}
			)
			r.Root = n(
				"Frame",
				{ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Position = UDim2.fromScale(1, 0) },
				{ r.AcrylicPaint.Frame, r.Title, r.CloseButton, r.LabelHolder }
			)
			if q.Content == "" then
				r.ContentLabel.Visible = false
			end
			if q.SubContent == "" then
				r.SubContentLabel.Visible = false
			end
			r.Holder = n(
				"Frame",
				{ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 200), Parent = o.Holder },
				{ r.Root }
			)
			local s = i.GroupMotor.new({ Scale = 1, Offset = 60 })
			s:onStep(function(t)
				r.Root.Position = UDim2.new(t.Scale, t.Offset, 0, 0)
			end)
			j.AddSignal(r.CloseButton.MouseButton1Click, function()
				r:Close()
			end)
			function r.Open(t)
				local u = r.LabelHolder.AbsoluteSize.Y
				r.Holder.Size = UDim2.new(1, 0, 0, 58 + u)
				s:setGoal({ Scale = l(0, { frequency = 5 }), Offset = l(0, { frequency = 5 }) })
			end
			function r.Close(t)
				if not r.Closed then
					r.Closed = true
					task.spawn(function()
						s:setGoal({ Scale = l(1, { frequency = 5 }), Offset = l(60, { frequency = 5 }) })
						task.wait(0.4)
						if e(h).UseAcrylic then
							r.AcrylicPaint.Model:Destroy()
						end
						r.Holder:Destroy()
					end)
				end
			end
			r:Open()
			if q.Duration then
				task.delay(q.Duration, function()
					r:Close()
				end)
			end
			return r
		end
		return o
	end,
	[13] = function()
		local c, d, e, f, g = b(13)
		local h = d.Parent.Parent
		local i = e(h.Creator)
		local j = i.New
		return function(k, l)
			local m = {}
			m.Layout = j("UIListLayout", { Padding = UDim.new(0, 5) })
			m.Container = j(
				"Frame",
				{ Size = UDim2.new(1, 0, 0, 26), Position = UDim2.fromOffset(0, 24), BackgroundTransparency = 1 },
				{ m.Layout }
			)
			m.Root = j(
				"Frame",
				{ BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 26), LayoutOrder = 7, Parent = l },
				{
					j(
						"TextLabel",
						{
							RichText = true,
							Text = k,
							TextTransparency = 0,
							FontFace = Font.new(
								UI_FONT_FAMILY,
								Enum.FontWeight.SemiBold,
								Enum.FontStyle.Normal
							),
							TextSize = 16,
							TextXAlignment = "Left",
							TextYAlignment = "Center",
							Size = UDim2.new(1, -16, 0, 21),
							Position = UDim2.fromOffset(0, 2),
							ThemeTag = { TextColor3 = "Text" },
						}
					),
					m.Container,
				}
			)
			i.AddSignal(m.Layout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				m.Container.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y)
				m.Root.Size = UDim2.new(1, 0, 0, m.Layout.AbsoluteContentSize.Y + 25)
			end)
			return m
		end
	end,
	[14] = function()
		local c, d, e, f, g = b(14)
		local h = d.Parent.Parent
		local i, j = e(h.Packages.Flipper), e(h.Creator)
		local k, l, m, n, o =
			j.New,
			i.Spring.new,
			i.Instant.new,
			h.Components,
			{ Window = nil, Tabs = {}, Containers = {}, SelectedTab = 0, TabCount = 0 }
		function o.Init(p, q)
			o.Window = q
			return o
		end
		function o.GetCurrentTabPos(p)
			local q, r = o.Window.TabHolder.AbsolutePosition.Y, o.Tabs[o.SelectedTab].Frame.AbsolutePosition.Y
			return r - q
		end
		function o.New(p, q, r, s)
			local t, u = e(h), o.Window
			local v = t.Elements
			o.TabCount = o.TabCount + 1
			local w, x = o.TabCount, { Selected = false, Name = q, Type = "Tab" }
			local iconData = t:GetIcon(r)
			if iconData then
				r = iconData
			end
			if r == "" or nil then
				r = nil
			end
			x.Frame = k(
				"TextButton",
				{ Size = UDim2.new(1, 0, 0, 34), BackgroundTransparency = 1, Parent = s, ThemeTag = {
					BackgroundColor3 = "Tab",
				} },
				{
					k("UICorner", { CornerRadius = UDim.new(0, 6) }),
					k(
						"TextLabel",
						{
							AnchorPoint = Vector2.new(0, 0.5),
							Position = r and UDim2.new(0, 30, 0.5, 0) or UDim2.new(0, 12, 0.5, 0),
							Text = "",
							RichText = true,
							TextColor3 = Color3.fromRGB(255, 255, 255),
							TextTransparency = 0,
							FontFace = UI_FONT_REGULAR,
							TextSize = 14,
							TextXAlignment = "Left",
							TextYAlignment = "Center",
							Size = UDim2.new(1, -12, 1, 0),
							BackgroundTransparency = 1,
							ThemeTag = { TextColor3 = "Text" },
						}
					),
					k(
						"ImageLabel",
						{
							AnchorPoint = Vector2.new(0.5, 0.5),
							Size = UDim2.fromOffset(18, 18),
							Position = UDim2.fromScale(0.5, 0.5),
							BackgroundTransparency = 1,
							Image = iconData and iconData.Url or r or nil,
							ImageRectSize = iconData and iconData.ImageRectSize or nil,
							ImageRectOffset = iconData and iconData.ImageRectOffset or nil,
							ThemeTag = { ImageColor3 = "Text" },
						}
					),
				}
			)
			local y = k("UIListLayout", { Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder })
			x.ContainerFrame = k(
				"ScrollingFrame",
				{
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					Parent = u.ContainerHolder,
					Visible = false,
					BottomImage = "rbxassetid://6889812791",
					MidImage = "rbxassetid://6889812721",
					TopImage = "rbxassetid://6276641225",
					ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
					ScrollBarImageTransparency = 0.95,
					ScrollBarThickness = 3,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromScale(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
				},
				{
					y,
					k(
						"UIPadding",
						{
							PaddingRight = UDim.new(0, 10),
							PaddingLeft = UDim.new(0, 1),
							PaddingTop = UDim.new(0, 1),
							PaddingBottom = UDim.new(0, 1),
						}
					),
				}
			)
			j.AddSignal(y:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				x.ContainerFrame.CanvasSize = UDim2.new(0, 0, 0, y.AbsoluteContentSize.Y + 2)
			end)
			x.Motor, x.SetTransparency = j.SpringMotor(1, x.Frame, "BackgroundTransparency")
			j.AddSignal(x.Frame.MouseEnter, function()
				x.SetTransparency(x.Selected and 0.72 or 0.9)
			end)
			j.AddSignal(x.Frame.MouseLeave, function()
				x.SetTransparency(x.Selected and 0.78 or 1)
			end)
			j.AddSignal(x.Frame.MouseButton1Down, function()
				x.SetTransparency(0.68)
			end)
			j.AddSignal(x.Frame.MouseButton1Up, function()
				x.SetTransparency(x.Selected and 0.72 or 0.9)
			end)
			j.AddSignal(x.Frame.MouseButton1Click, function()
				o:SelectTab(w)
			end)
			o.Containers[w] = x.ContainerFrame
			o.Tabs[w] = x
			x.Container = x.ContainerFrame
			x.ScrollFrame = x.Container
			function x.AddSection(z, A)
				local B, C = { Type = "Section" }, e(n.Section)(A, x.Container)
				B.Container = C.Container
				B.ScrollFrame = x.Container
				setmetatable(B, v)
				return B
			end
			setmetatable(x, v)
			return x
		end
		function o.SelectTab(p, q)
			local r = o.Window
			o.SelectedTab = q
			for s, t in next, o.Tabs do
				t.SetTransparency(1)
				t.Selected = false
			end
			o.Tabs[q].SetTransparency(0.72)
			o.Tabs[q].Selected = true
			r.TabDisplay.Text = o.Tabs[q].Name
			r.SelectorPosMotor:setGoal(l(o:GetCurrentTabPos(), { frequency = 6 }))
			task.spawn(function()
				r.ContainerPosMotor:setGoal(l(78, { frequency = 10 }))
				r.ContainerBackMotor:setGoal(l(1, { frequency = 10 }))
				task.wait(0.15)
				for u, v in next, o.Containers do
					v.Visible = false
				end
				o.Containers[q].Visible = true
				r.ContainerPosMotor:setGoal(l(54, { frequency = 5 }))
				r.ContainerBackMotor:setGoal(l(0, { frequency = 8 }))
			end)
		end
		return o
	end,
	[15] = function()
		local c, d, e, f, g = b(15)
		local h, i = game:GetService("TextService"), d.Parent.Parent
		local j, k = e(i.Packages.Flipper), e(i.Creator)
		local l = k.New
		return function(m, n)
			n = n or false
			local o = {}
			o.Input = l(
				"TextBox",
				{
					FontFace = UI_FONT_REGULAR,
					TextColor3 = Color3.fromRGB(200, 200, 200),
					TextSize = 16,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Position = UDim2.fromOffset(10, 0),
					ThemeTag = { TextColor3 = "Text", PlaceholderColor3 = "SubText" },
				}
			)
			o.Container = l(
				"Frame",
				{ BackgroundTransparency = 1, ClipsDescendants = true, Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(
					1,
					-12,
					1,
					0
				) },
				{ o.Input }
			)
			o.Indicator = l(
				"Frame",
				{
					Size = UDim2.new(1, -4, 0, 1),
					Position = UDim2.new(0, 2, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = n and 0.5 or 0,
					ThemeTag = { BackgroundColor3 = n and "InputIndicator" or "DialogInputLine" },
				}
			)
			o.Frame = l(
				"Frame",
				{
					Size = UDim2.new(0, 0, 0, 30),
					BackgroundTransparency = n and 0.9 or 0,
					Parent = m,
					ThemeTag = { BackgroundColor3 = n and "Input" or "DialogInput" },
				},
				{
					l("UICorner", { CornerRadius = UDim.new(0, 4) }),
					l(
						"UIStroke",
						{
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							Transparency = n and 0.5 or 0.65,
							ThemeTag = { Color = n and "InElementBorder" or "DialogButtonBorder" },
						}
					),
					o.Indicator,
					o.Container,
				}
			)
			local p = function()
				local p, q = 2, o.Container.AbsoluteSize.X
				if not o.Input:IsFocused() or o.Input.TextBounds.X <= q - 2 * p then
					o.Input.Position = UDim2.new(0, p, 0, 0)
				else
					local r = o.Input.CursorPosition
					if r ~= -1 then
						local s = string.sub(o.Input.Text, 1, r - 1)
						local t = h:GetTextSize(s, o.Input.TextSize, o.Input.Font, Vector2.new(math.huge, math.huge)).X
						local u = o.Input.Position.X.Offset + t
						if u < p then
							o.Input.Position = UDim2.fromOffset(p - t, 0)
						elseif u > q - p - 1 then
							o.Input.Position = UDim2.fromOffset(q - t - p - 1, 0)
						end
					end
				end
			end
			task.spawn(p)
			k.AddSignal(o.Input:GetPropertyChangedSignal("Text"), p)
			k.AddSignal(o.Input:GetPropertyChangedSignal("CursorPosition"), p)
			k.AddSignal(o.Input.Focused, function()
				p()
				o.Indicator.Size = UDim2.new(1, -2, 0, 2)
				o.Indicator.Position = UDim2.new(0, 1, 1, 0)
				o.Indicator.BackgroundTransparency = 0
				k.OverrideTag(o.Frame, { BackgroundColor3 = n and "InputFocused" or "DialogHolder" })
				k.OverrideTag(o.Indicator, { BackgroundColor3 = "Accent" })
			end)
			k.AddSignal(o.Input.FocusLost, function()
				p()
				o.Indicator.Size = UDim2.new(1, -4, 0, 1)
				o.Indicator.Position = UDim2.new(0, 2, 1, 0)
				o.Indicator.BackgroundTransparency = 0.5
				k.OverrideTag(o.Frame, { BackgroundColor3 = n and "Input" or "DialogInput" })
				k.OverrideTag(o.Indicator, { BackgroundColor3 = n and "InputIndicator" or "DialogInputLine" })
			end)
			return o
		end
	end,
	[16] = function()
		local c, d, e, f, g = b(16)
		local h, i = d.Parent.Parent, e(d.Parent.Assets)
		local j, k = e(h.Creator), e(h.Packages.Flipper)
		local l, m = j.New, j.AddSignal
		return function(n)
			local o, p, q =
				{}, e(h), function(o, p, q, r)
					local s = { Callback = r or function() end }
					s.Frame = l("TextButton", { Size = UDim2.new(0, 34, 1, -8), AnchorPoint = Vector2.new(1, 0), BackgroundTransparency = 1, Parent = q, Position = p, Text = "", ThemeTag = { BackgroundColor3 = "Text" } }, { l("UICorner", { CornerRadius = UDim.new(0, 7) }), l("ImageLabel", { Image = o, Size = UDim2.fromOffset(16, 16), Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Name = "Icon", ThemeTag = { ImageColor3 = "Text" } }) })
					local t, u = j.SpringMotor(1, s.Frame, "BackgroundTransparency")
					m(s.Frame.MouseEnter, function()
						u(0.94)
					end)
					m(s.Frame.MouseLeave, function()
						u(1, true)
					end)
					m(s.Frame.MouseButton1Down, function()
						u(0.96)
					end)
					m(s.Frame.MouseButton1Up, function()
						u(0.94)
					end)
					m(s.Frame.MouseButton1Click, s.Callback)
					s.SetCallback = function(v)
						s.Callback = v
					end
					return s
				end
			o.Frame = l(
				"Frame",
				{ Size = UDim2.new(1, 0, 0, 42), BackgroundTransparency = 1, Parent = n.Parent },
				{
					l(
						"Frame",
						{ Size = UDim2.new(1, -16, 1, 0), Position = UDim2.new(0, 16, 0, 0), BackgroundTransparency = 1 },
						{
							l(
								"UIListLayout",
								{
									Padding = UDim.new(0, 5),
									FillDirection = Enum.FillDirection.Horizontal,
									SortOrder = Enum.SortOrder.LayoutOrder,
								}
							),
							l(
								"TextLabel",
								{
									RichText = true,
									Text = n.Title,
									FontFace = Font.new(
										UI_FONT_FAMILY,
										Enum.FontWeight.Regular,
										Enum.FontStyle.Normal
									),
									TextSize = 14,
									TextXAlignment = "Left",
									TextYAlignment = "Center",
									Size = UDim2.fromScale(0, 1),
									AutomaticSize = Enum.AutomaticSize.X,
									BackgroundTransparency = 1,
									ThemeTag = { TextColor3 = "Text" },
								}
							),
							l(
								"TextLabel",
								{
									RichText = true,
									Text = n.SubTitle,
									TextTransparency = 0.4,
									FontFace = Font.new(
										UI_FONT_FAMILY,
										Enum.FontWeight.Regular,
										Enum.FontStyle.Normal
									),
									TextSize = 14,
									TextXAlignment = "Left",
									TextYAlignment = "Center",
									Size = UDim2.fromScale(0, 1),
									AutomaticSize = Enum.AutomaticSize.X,
									BackgroundTransparency = 1,
									ThemeTag = { TextColor3 = "Text" },
								}
							),
						}
					),
					l(
						"Frame",
						{
							BackgroundTransparency = 0.5,
							Size = UDim2.new(1, 0, 0, 1),
							Position = UDim2.new(0, 0, 1, 0),
							ThemeTag = { BackgroundColor3 = "TitleBarLine" },
						}
					),
				}
			)
			o.CloseButton = q(i.Close, UDim2.new(1, -4, 0, 4), o.Frame, function()
				p.Window:Dialog({
					Title = "Close",
					Content = "Are you sure you want to unload the interface?",
					Buttons = { {
						Title = "Yes",
						Callback = function()
							p:Destroy()
						end,
					}, {
						Title = "No",
					} },
				})
			end)
			o.MaxButton = q(i.Max, UDim2.new(1, -40, 0, 4), o.Frame, function()
				n.Window.Maximize(not n.Window.Maximized)
			end)
			o.MinButton = q(i.Min, UDim2.new(1, -80, 0, 4), o.Frame, function()
				p.Window:Minimize()
			end)
			return o
		end
	end,
	[17] = function()
		local c, d, e, f, g = b(17)
		local h, i, j, k =
			game:GetService("UserInputService"),
			game:GetService("Players").LocalPlayer:GetMouse(),
			game:GetService("Workspace").CurrentCamera,
			d.Parent.Parent
		local l, m, n, o, p = e(k.Packages.Flipper), e(k.Creator), e(k.Acrylic), e(d.Parent.Assets), d.Parent
		local q, r, s = l.Spring.new, l.Instant.new, m.New
		return function(t)
			local u, v, w, x, y, z =
				e(k),
				{
					Minimized = false,
					Maximized = false,
					Size = t.Size,
					CurrentPos = 0,
					Position = UDim2.fromOffset(
						j.ViewportSize.X / 2 - t.Size.X.Offset / 2,
						j.ViewportSize.Y / 2 - t.Size.Y.Offset / 2
					),
				},
				false
			local A, B = false
			local C = false
			v.AcrylicPaint = n.AcrylicPaint()
			local D, E =
				s(
					"Frame",
					{
						Size = UDim2.fromOffset(4, 0),
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(76, 194, 255),
						Position = UDim2.fromOffset(0, 17),
						AnchorPoint = Vector2.new(0, 0.5),
						ThemeTag = { BackgroundColor3 = "Accent" },
					},
					{ s("UICorner", { CornerRadius = UDim.new(0, 2) }) }
				),
				s(
					"Frame",
					{ Size = UDim2.fromOffset(20, 20), BackgroundTransparency = 1, Position = UDim2.new(1, -20, 1, -20) }
				)
			v.TabHolder = s(
				"ScrollingFrame",
				{
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ScrollBarImageTransparency = 1,
					ScrollBarThickness = 0,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromScale(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
				},
				{ s("UIListLayout", { Padding = UDim.new(0, 4) }) }
			)
			local F = s(
				"Frame",
				{
					Size = UDim2.new(0, t.TabWidth, 1, -66),
					Position = UDim2.new(0, 12, 0, 54),
					BackgroundTransparency = 1,
					ClipsDescendants = true,
				},
				{ v.TabHolder, D }
			)
			v.TabDisplay = s(
				"TextLabel",
				{
					RichText = true,
					Text = "Tab",
					TextTransparency = 0,
					Visible = false,
					FontFace = UI_FONT_SEMIBOLD,
					TextSize = 32,
					TextXAlignment = "Left",
					TextYAlignment = "Center",
					Size = UDim2.new(1, -16, 0, 32),
					Position = UDim2.fromOffset(t.TabWidth + 26, 56),
					BackgroundTransparency = 1,
					ThemeTag = { TextColor3 = "Text" },
				}
			)
			v.ContainerHolder = s(
				"CanvasGroup",
				{
					Size = UDim2.new(1, -t.TabWidth - 32, 1, -68),
					Position = UDim2.fromOffset(t.TabWidth + 26, 54),
					BackgroundTransparency = 1,
				}
			)
			v.Root = s(
				"Frame",
				{ BackgroundTransparency = 1, Size = v.Size, Position = v.Position, Parent = t.Parent },
				{ v.AcrylicPaint.Frame, v.TabDisplay, v.ContainerHolder, F, E }
			)
			v.TitleBar = e(d.Parent.TitleBar)({ Title = t.Title, SubTitle = t.SubTitle, Parent = v.Root, Window = v })
			if e(k).UseAcrylic then
				v.AcrylicPaint.AddParent(v.Root)
			end
			local G, H =
				l.GroupMotor.new({ X = v.Size.X.Offset, Y = v.Size.Y.Offset }),
				l.GroupMotor.new({ X = v.Position.X.Offset, Y = v.Position.Y.Offset })
			v.SelectorPosMotor = l.SingleMotor.new(17)
			v.SelectorSizeMotor = l.SingleMotor.new(0)
			v.ContainerBackMotor = l.SingleMotor.new(0)
			v.ContainerPosMotor = l.SingleMotor.new(54)
			G:onStep(function(I)
				v.Root.Size = UDim2.new(0, I.X, 0, I.Y)
			end)
			H:onStep(function(I)
				v.Root.Position = UDim2.new(0, I.X, 0, I.Y)
			end)
			local I, J = 0, 0
			v.SelectorPosMotor:onStep(function(K)
				D.Position = UDim2.new(0, 0, 0, K + 17)
				local L = tick()
				local M = L - J
				if I ~= nil then
					v.SelectorSizeMotor:setGoal(q((math.abs(K - I) / (M * 60)) + 16))
					I = K
				end
				J = L
			end)
			v.SelectorSizeMotor:onStep(function(K)
				D.Size = UDim2.new(0, 4, 0, K)
			end)
			v.ContainerBackMotor:onStep(function(K)
				v.ContainerHolder.GroupTransparency = K
			end)
			v.ContainerPosMotor:onStep(function(K)
				v.ContainerHolder.Position = UDim2.fromOffset(t.TabWidth + 26, K)
			end)
			local K, L
			v.Maximize = function(M, N, O)
				v.Maximized = M
				v.TitleBar.MaxButton.Frame.Icon.Image = M and o.Restore or o.Max
				if M then
					K = v.Size.X.Offset
					L = v.Size.Y.Offset
				end
				local P, Q = M and j.ViewportSize.X or K, M and j.ViewportSize.Y or L
				G:setGoal({
					X = l[O and "Instant" or "Spring"].new(P, { frequency = 6 }),
					Y = l[O and "Instant" or "Spring"].new(Q, { frequency = 6 }),
				})
				v.Size = UDim2.fromOffset(P, Q)
				if not N then
					H:setGoal({
						X = q(M and 0 or v.Position.X.Offset, { frequency = 6 }),
						Y = q(M and 0 or v.Position.Y.Offset, { frequency = 6 }),
					})
				end
			end
			m.AddSignal(v.TitleBar.Frame.InputBegan, function(M)
				if
					M.UserInputType == Enum.UserInputType.MouseButton1
					or M.UserInputType == Enum.UserInputType.Touch
				then
					w = true
					y = M.Position
					z = v.Root.Position
					if v.Maximized then
						z = UDim2.fromOffset(
							i.X - (i.X * ((K - 100) / v.Root.AbsoluteSize.X)),
							i.Y - (i.Y * (L / v.Root.AbsoluteSize.Y))
						)
					end
					M.Changed:Connect(function()
						if M.UserInputState == Enum.UserInputState.End then
							w = false
						end
					end)
				end
			end)
			m.AddSignal(v.TitleBar.Frame.InputChanged, function(M)
				if
					M.UserInputType == Enum.UserInputType.MouseMovement
					or M.UserInputType == Enum.UserInputType.Touch
				then
					x = M
				end
			end)
			m.AddSignal(E.InputBegan, function(M)
				if
					M.UserInputType == Enum.UserInputType.MouseButton1
					or M.UserInputType == Enum.UserInputType.Touch
				then
					A = true
					B = M.Position
				end
			end)
			m.AddSignal(h.InputChanged, function(M)
				if M == x and w then
					local N = M.Position - y
					v.Position = UDim2.fromOffset(z.X.Offset + N.X, z.Y.Offset + N.Y)
					H:setGoal({ X = r(v.Position.X.Offset), Y = r(v.Position.Y.Offset) })
					if v.Maximized then
						v.Maximize(false, true, true)
					end
				end
				if
					(M.UserInputType == Enum.UserInputType.MouseMovement or M.UserInputType == Enum.UserInputType.Touch)
					and A
				then
					local N, O = M.Position - B, v.Size
					local P = Vector3.new(O.X.Offset, O.Y.Offset, 0) + Vector3.new(1, 1, 0) * N
					local Q = Vector2.new(math.clamp(P.X, 470, 2048), math.clamp(P.Y, 380, 2048))
					G:setGoal({ X = l.Instant.new(Q.X), Y = l.Instant.new(Q.Y) })
				end
			end)
			m.AddSignal(h.InputEnded, function(M)
				if A == true or M.UserInputType == Enum.UserInputType.Touch then
					A = false
					v.Size = UDim2.fromOffset(G:getValue().X, G:getValue().Y)
				end
			end)
			m.AddSignal(v.TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				v.TabHolder.CanvasSize = UDim2.new(0, 0, 0, v.TabHolder.UIListLayout.AbsoluteContentSize.Y)
			end)
			m.AddSignal(h.InputBegan, function(M)
				if
					type(u.MinimizeKeybind) == "table"
					and u.MinimizeKeybind.Type == "Keybind"
					and not h:GetFocusedTextBox()
				then
					if M.KeyCode.Name == u.MinimizeKeybind.Value then
						v:Minimize()
					end
				elseif M.KeyCode == u.MinimizeKey and not h:GetFocusedTextBox() then
					v:Minimize()
				end
			end)
			function v.Minimize(M)
				v.Minimized = not v.Minimized
				v.Root.Visible = not v.Minimized
				if not C then
					C = true
					local N = u.MinimizeKeybind and u.MinimizeKeybind.Value or u.MinimizeKey.Name
					u:Notify({ Title = "Interface", Content = "Press " .. N .. " to toggle the inteface.", Duration = 6 })
				end
			end
			function v.Destroy(M)
				if e(k).UseAcrylic then
					v.AcrylicPaint.Model:Destroy()
				end
				v.Root:Destroy()
			end
			local M = e(p.Dialog):Init(v)
			function v.Dialog(N, O)
				local P = M:Create()
				P.Title.Text = O.Title
				local Q = s(
					"TextLabel",
					{
						FontFace = UI_FONT_REGULAR,
						Text = O.Content,
						TextColor3 = Color3.fromRGB(240, 240, 240),
						TextSize = 16,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top,
						Size = UDim2.new(1, -40, 1, 0),
						Position = UDim2.fromOffset(20, 60),
						BackgroundTransparency = 1,
						Parent = P.Root,
						ClipsDescendants = false,
						ThemeTag = { TextColor3 = "Text" },
					}
				)
				s(
					"UISizeConstraint",
					{ MinSize = Vector2.new(300, 165), MaxSize = Vector2.new(620, math.huge), Parent = P.Root }
				)
				P.Root.Size = UDim2.fromOffset(Q.TextBounds.X + 40, 165)
				if Q.TextBounds.X + 40 > v.Size.X.Offset - 120 then
					P.Root.Size = UDim2.fromOffset(v.Size.X.Offset - 120, 165)
					Q.TextWrapped = true
					P.Root.Size = UDim2.fromOffset(v.Size.X.Offset - 120, Q.TextBounds.Y + 150)
				end
				for R, S in next, O.Buttons do
					P:Button(S.Title, S.Callback)
				end
				P:Open()
			end
			local N = e(p.Tab):Init(v)
			function v.AddTab(O, P)
				return N:New(P.Title, P.Icon, v.TabHolder)
			end
			function v.SelectTab(O, P)
				N:SelectTab(1)
			end
			m.AddSignal(v.TabHolder:GetPropertyChangedSignal("CanvasPosition"), function()
				I = N:GetCurrentTabPos() + 16
				J = 0
				v.SelectorPosMotor:setGoal(r(N:GetCurrentTabPos()))
			end)
			return v
		end
	end,
	[18] = function()
		local c, d, e, f, g = b(18)
		local h = d.Parent
		local i, j, k =
			e(h.Themes),
			e(h.Packages.Flipper),
			{
				Registry = {},
				Signals = {},
				TransparencyMotors = {},
				DefaultProperties = {
					ScreenGui = { ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling },
					Frame = { BackgroundColor3 = Color3.new(1, 1, 1), BorderColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0 },
					ScrollingFrame = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						ScrollBarImageColor3 = Color3.new(0, 0, 0),
					},
					TextLabel = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						Font = Enum.Font.BuilderSans,
						Text = "",
						TextColor3 = Color3.new(0, 0, 0),
						BackgroundTransparency = 1,
						TextSize = 16,
					},
					TextButton = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						AutoButtonColor = false,
						Font = Enum.Font.BuilderSans,
						Text = "",
						TextColor3 = Color3.new(0, 0, 0),
						TextSize = 16,
					},
					TextBox = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						ClearTextOnFocus = false,
						Font = Enum.Font.BuilderSans,
						Text = "",
						TextColor3 = Color3.new(0, 0, 0),
						TextSize = 16,
					},
					ImageLabel = {
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						BorderSizePixel = 0,
					},
					ImageButton = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						AutoButtonColor = false,
					},
					CanvasGroup = {
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderColor3 = Color3.new(0, 0, 0),
						BorderSizePixel = 0,
					},
				},
			}
		local l = function(l, m)
			if m.ThemeTag then
				k.AddThemeObject(l, m.ThemeTag)
			end
		end
		function k.AddSignal(m, n)
			table.insert(k.Signals, m:Connect(n))
		end
		function k.Disconnect()
			for m = #k.Signals, 1, -1 do
				local n = table.remove(k.Signals, m)
				n:Disconnect()
			end
		end
		function k.GetThemeProperty(m)
			if i[e(h).Theme][m] then
				return i[e(h).Theme][m]
			end
			return i.Dark[m]
		end
		function k.UpdateTheme()
			for m, n in next, k.Registry do
				for o, p in next, n.Properties do
					m[o] = k.GetThemeProperty(p)
				end
			end
			for o, p in next, k.TransparencyMotors do
				p:setGoal(j.Instant.new(k.GetThemeProperty("ElementTransparency")))
			end
		end
		function k.AddThemeObject(m, n)
			local o = #k.Registry + 1
			local p = { Object = m, Properties = n, Idx = o }
			k.Registry[m] = p
			k.UpdateTheme()
			return m
		end
		function k.OverrideTag(m, n)
			k.Registry[m].Properties = n
			k.UpdateTheme()
		end
		function k.New(m, n, o)
			local p = Instance.new(m)
			for q, r in next, k.DefaultProperties[m] or {} do
				p[q] = r
			end
			for s, t in next, n or {} do
				if s ~= "ThemeTag" then
					p[s] = t
				end
			end
			for u, v in next, o or {} do
				v.Parent = p
			end
			l(p, n)
			return p
		end
		function k.SpringMotor(m, n, o, p, s)
			p = p or false
			s = s or false
			local t = j.SingleMotor.new(m)
			t:onStep(function(u)
				n[o] = u
			end)
			if s then
				table.insert(k.TransparencyMotors, t)
			end
			local u = function(u, v)
				v = v or false
				if not p then
					if not v then
						if o == "BackgroundTransparency" and e(h).DialogOpen then
							return
						end
					end
				end
				t:setGoal(j.Spring.new(u, { frequency = 8 }))
			end
			return t, u
		end
		return k
	end,
	[19] = function()
		local c, d, e, f, g = b(19)
		local h = {}
		for i, j in next, d:GetChildren() do
			table.insert(h, e(j))
		end
		return h
	end,
	[20] = function()
		local c, d, e, f, g = b(20)
		local h = d.Parent.Parent
		local i = e(h.Creator)
		local j, k, l = i.New, h.Components, {}
		l.__index = l
		l.__type = "Button"
		function l.New(m, n)
			assert(n.Title, "Button - Missing Title")
			n.Callback = n.Callback or function() end
			local o = e(k.Element)(n.Title, n.Description, m.Container, true)
			local p = j(
				"ImageLabel",
				{
					Image = "rbxassetid://10709791437",
					Size = UDim2.fromOffset(16, 16),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -10, 0.5, 0),
					BackgroundTransparency = 1,
					Parent = o.Frame,
					ThemeTag = { ImageColor3 = "Text" },
				}
			)
			i.AddSignal(o.Frame.MouseButton1Click, function()
				m.Library:SafeCallback(n.Callback)
			end)
			return o
		end
		return l
	end,
	[21] = function()
		local c, d, e, f, g = b(21)
		local h, i, j, k =
			game:GetService("UserInputService"),
			game:GetService("TouchInputService"),
			game:GetService("RunService"),
			game:GetService("Players")
		local l, m = j.RenderStepped, k.LocalPlayer
		local n, o = m:GetMouse(), d.Parent.Parent
		local p = e(o.Creator)
		local s, t, u = p.New, o.Components, {}
		u.__index = u
		u.__type = "Colorpicker"
		function u.New(v, w, x)
			local y = v.Library
			assert(x.Title, "Colorpicker - Missing Title")
			assert(x.Default, "AddColorPicker: Missing default value.")
			local z = {
				Value = x.Default,
				Transparency = x.Transparency or 0,
				Type = "Colorpicker",
				Title = type(x.Title) == "string" and x.Title or "Colorpicker",
				Callback = x.Callback or function(z) end,
			}
			function z.SetHSVFromRGB(A, B)
				local C, D, E = Color3.toHSV(B)
				z.Hue = C
				z.Sat = D
				z.Vib = E
			end
			z:SetHSVFromRGB(z.Value)
			local A = e(t.Element)(x.Title, x.Description, v.Container, true)
			z.SetTitle = A.SetTitle
			z.SetDesc = A.SetDesc
			local B = s(
				"Frame",
				{ Size = UDim2.fromScale(1, 1), BackgroundColor3 = z.Value, Parent = A.Frame },
				{ s("UICorner", { CornerRadius = UDim.new(0, 4) }) }
			)
			local aa, ab =
				s(
					"ImageLabel",
					{
						Size = UDim2.fromOffset(26, 26),
						Position = UDim2.new(1, -10, 0.5, 0),
						AnchorPoint = Vector2.new(1, 0.5),
						Parent = A.Frame,
						Image = "http://www.roblox.com/asset/?id=14204231522",
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
					},
					{ s("UICorner", { CornerRadius = UDim.new(0, 4) }), B }
				),
				function()
					local C = e(t.Dialog):Create()
					C.Title.Text = z.Title
					C.Root.Size = UDim2.fromOffset(430, 330)
					local D, E, F, G, H, I =
						z.Hue, z.Sat, z.Vib, z.Transparency, function()
							local D = e(t.Textbox)()
							D.Frame.Parent = C.Root
							D.Frame.Size = UDim2.new(0, 90, 0, 32)
							return D
						end, function(D, E)
							return s("TextLabel", { FontFace = UI_FONT_MEDIUM, Text = D, TextColor3 = Color3.fromRGB(240, 240, 240), TextSize = 15, TextXAlignment = Enum.TextXAlignment.Left, Size = UDim2.new(1, 0, 0, 32), Position = E, BackgroundTransparency = 1, Parent = C.Root, ThemeTag = { TextColor3 = "Text" } })
						end
					local J, K =
						function()
							local J = Color3.fromHSV(D, E, F)
							return { R = math.floor(J.r * 255), G = math.floor(J.g * 255), B = math.floor(J.b * 255) }
						end, s("ImageLabel", { Size = UDim2.new(0, 18, 0, 18), ScaleType = Enum.ScaleType.Fit, AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Image = "http://www.roblox.com/asset/?id=4805639000" })
					local L, M =
						s(
							"ImageLabel",
							{
								Size = UDim2.fromOffset(180, 160),
								Position = UDim2.fromOffset(20, 55),
								Image = "rbxassetid://4155801252",
								BackgroundColor3 = z.Value,
								BackgroundTransparency = 0,
								Parent = C.Root,
							},
							{ s("UICorner", { CornerRadius = UDim.new(0, 4) }), K }
						),
						s(
							"Frame",
							{ BackgroundColor3 = z.Value, Size = UDim2.fromScale(1, 1), BackgroundTransparency = z.Transparency },
							{ s("UICorner", { CornerRadius = UDim.new(0, 4) }) }
						)
					local N, O =
						s(
							"ImageLabel",
							{
								Image = "http://www.roblox.com/asset/?id=14204231522",
								ImageTransparency = 0.45,
								ScaleType = Enum.ScaleType.Tile,
								TileSize = UDim2.fromOffset(40, 40),
								BackgroundTransparency = 1,
								Position = UDim2.fromOffset(112, 220),
								Size = UDim2.fromOffset(88, 24),
								Parent = C.Root,
							},
							{
								s("UICorner", { CornerRadius = UDim.new(0, 4) }),
								s("UIStroke", { Thickness = 2, Transparency = 0.75 }),
								M,
							}
						),
						s(
							"Frame",
							{ BackgroundColor3 = z.Value, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 0 },
							{ s("UICorner", { CornerRadius = UDim.new(0, 4) }) }
						)
					local P, Q =
						s(
							"ImageLabel",
							{
								Image = "http://www.roblox.com/asset/?id=14204231522",
								ImageTransparency = 0.45,
								ScaleType = Enum.ScaleType.Tile,
								TileSize = UDim2.fromOffset(40, 40),
								BackgroundTransparency = 1,
								Position = UDim2.fromOffset(20, 220),
								Size = UDim2.fromOffset(88, 24),
								Parent = C.Root,
							},
							{
								s("UICorner", { CornerRadius = UDim.new(0, 4) }),
								s("UIStroke", { Thickness = 2, Transparency = 0.75 }),
								O,
							}
						),
						{}
					for R = 0, 1, 0.1 do
						table.insert(Q, ColorSequenceKeypoint.new(R, Color3.fromHSV(R, 1, 1)))
					end
					local R, S =
						s("UIGradient", { Color = ColorSequence.new(Q), Rotation = 90 }),
						s(
							"Frame",
							{ Size = UDim2.new(1, 0, 1, -10), Position = UDim2.fromOffset(0, 5), BackgroundTransparency = 1 }
						)
					local T, U, V =
						s(
							"ImageLabel",
							{
								Size = UDim2.fromOffset(14, 14),
								Image = "http://www.roblox.com/asset/?id=12266946128",
								Parent = S,
								ThemeTag = { ImageColor3 = "DialogInput" },
							}
						),
						s(
							"Frame",
							{ Size = UDim2.fromOffset(12, 190), Position = UDim2.fromOffset(210, 55), Parent = C.Root },
							{ s("UICorner", { CornerRadius = UDim.new(1, 0) }), R, S }
						),
						H()
					V.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 55)
					I("Hex", UDim2.fromOffset(x.Transparency and 360 or 340, 55))
					local W = H()
					W.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 95)
					I("Red", UDim2.fromOffset(x.Transparency and 360 or 340, 95))
					local X = H()
					X.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 135)
					I("Green", UDim2.fromOffset(x.Transparency and 360 or 340, 135))
					local Y = H()
					Y.Frame.Position = UDim2.fromOffset(x.Transparency and 260 or 240, 175)
					I("Blue", UDim2.fromOffset(x.Transparency and 360 or 340, 175))
					local Z
					if x.Transparency then
						Z = H()
						Z.Frame.Position = UDim2.fromOffset(260, 215)
						I("Alpha", UDim2.fromOffset(360, 215))
					end
					local _, aa, ab
					if x.Transparency then
						local ac = s(
							"Frame",
							{ Size = UDim2.new(1, 0, 1, -10), Position = UDim2.fromOffset(0, 5), BackgroundTransparency = 1 }
						)
						aa = s(
							"ImageLabel",
							{
								Size = UDim2.fromOffset(14, 14),
								Image = "http://www.roblox.com/asset/?id=12266946128",
								Parent = ac,
								ThemeTag = { ImageColor3 = "DialogInput" },
							}
						)
						ab = s(
							"Frame",
							{ Size = UDim2.fromScale(1, 1) },
							{
								s(
									"UIGradient",
									{
										Transparency = NumberSequence.new({
											NumberSequenceKeypoint.new(0, 0),
											NumberSequenceKeypoint.new(1, 1),
										}),
										Rotation = 270,
									}
								),
								s("UICorner", { CornerRadius = UDim.new(1, 0) }),
							}
						)
						_ = s(
							"Frame",
							{
								Size = UDim2.fromOffset(12, 190),
								Position = UDim2.fromOffset(230, 55),
								Parent = C.Root,
								BackgroundTransparency = 1,
							},
							{
								s("UICorner", { CornerRadius = UDim.new(1, 0) }),
								s(
									"ImageLabel",
									{
										Image = "http://www.roblox.com/asset/?id=14204231522",
										ImageTransparency = 0.45,
										ScaleType = Enum.ScaleType.Tile,
										TileSize = UDim2.fromOffset(40, 40),
										BackgroundTransparency = 1,
										Size = UDim2.fromScale(1, 1),
										Parent = C.Root,
									},
									{ s("UICorner", { CornerRadius = UDim.new(1, 0) }) }
								),
								ab,
								ac,
							}
						)
					end
					local ac = function()
						L.BackgroundColor3 = Color3.fromHSV(D, 1, 1)
						T.Position = UDim2.new(0, -1, D, -6)
						K.Position = UDim2.new(E, 0, 1 - F, 0)
						O.BackgroundColor3 = Color3.fromHSV(D, E, F)
						V.Input.Text = "#" .. Color3.fromHSV(D, E, F):ToHex()
						W.Input.Text = J().R
						X.Input.Text = J().G
						Y.Input.Text = J().B
						if x.Transparency then
							ab.BackgroundColor3 = Color3.fromHSV(D, E, F)
							O.BackgroundTransparency = G
							aa.Position = UDim2.new(0, -1, 1 - G, -6)
							Z.Input.Text = e(o):Round((1 - G) * 100, 0) .. "%"
						end
					end
					p.AddSignal(V.Input.FocusLost, function(ad)
						if ad then
							local ae, af = pcall(Color3.fromHex, V.Input.Text)
							if ae and typeof(af) == "Color3" then
								D, E, F = Color3.toHSV(af)
							end
						end
						ac()
					end)
					p.AddSignal(W.Input.FocusLost, function(ad)
						if ad then
							local ae = J()
							local af, ag = pcall(Color3.fromRGB, W.Input.Text, ae.G, ae.B)
							if af and typeof(ag) == "Color3" then
								if tonumber(W.Input.Text) <= 255 then
									D, E, F = Color3.toHSV(ag)
								end
							end
						end
						ac()
					end)
					p.AddSignal(X.Input.FocusLost, function(ad)
						if ad then
							local ae = J()
							local af, ag = pcall(Color3.fromRGB, ae.R, X.Input.Text, ae.B)
							if af and typeof(ag) == "Color3" then
								if tonumber(X.Input.Text) <= 255 then
									D, E, F = Color3.toHSV(ag)
								end
							end
						end
						ac()
					end)
					p.AddSignal(Y.Input.FocusLost, function(ad)
						if ad then
							local ae = J()
							local af, ag = pcall(Color3.fromRGB, ae.R, ae.G, Y.Input.Text)
							if af and typeof(ag) == "Color3" then
								if tonumber(Y.Input.Text) <= 255 then
									D, E, F = Color3.toHSV(ag)
								end
							end
						end
						ac()
					end)
					if x.Transparency then
						p.AddSignal(Z.Input.FocusLost, function(ad)
							if ad then
								pcall(function()
									local ae = tonumber(Z.Input.Text)
									if ae >= 0 and ae <= 100 then
										G = 1 - ae * 0.01
									end
								end)
							end
							ac()
						end)
					end
					p.AddSignal(L.InputBegan, function(ad)
						if
							ad.UserInputType == Enum.UserInputType.MouseButton1
							or ad.UserInputType == Enum.UserInputType.Touch
						then
							while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								local ae = L.AbsolutePosition.X
								local af = ae + L.AbsoluteSize.X
								local ag, ah = math.clamp(n.X, ae, af), L.AbsolutePosition.Y
								local ai = ah + L.AbsoluteSize.Y
								local aj = math.clamp(n.Y, ah, ai)
								E = (ag - ae) / (af - ae)
								F = 1 - ((aj - ah) / (ai - ah))
								ac()
								l:Wait()
							end
						end
					end)
					p.AddSignal(U.InputBegan, function(ad)
						if
							ad.UserInputType == Enum.UserInputType.MouseButton1
							or ad.UserInputType == Enum.UserInputType.Touch
						then
							while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								local ae = U.AbsolutePosition.Y
								local af = ae + U.AbsoluteSize.Y
								local ag = math.clamp(n.Y, ae, af)
								D = ((ag - ae) / (af - ae))
								ac()
								l:Wait()
							end
						end
					end)
					if x.Transparency then
						p.AddSignal(_.InputBegan, function(ad)
							if ad.UserInputType == Enum.UserInputType.MouseButton1 then
								while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
									local ae = _.AbsolutePosition.Y
									local af = ae + _.AbsoluteSize.Y
									local ag = math.clamp(n.Y, ae, af)
									G = 1 - ((ag - ae) / (af - ae))
									ac()
									l:Wait()
								end
							end
						end)
					end
					ac()
					C:Button("Done", function()
						z:SetValue({ D, E, F }, G)
					end)
					C:Button("Cancel")
					C:Open()
				end
			function z.Display(ac)
				z.Value = Color3.fromHSV(z.Hue, z.Sat, z.Vib)
				B.BackgroundColor3 = z.Value
				B.BackgroundTransparency = z.Transparency
				u.Library:SafeCallback(z.Callback, z.Value)
				u.Library:SafeCallback(z.Changed, z.Value)
			end
			function z.SetValue(ac, ad, ae)
				local af = Color3.fromHSV(ad[1], ad[2], ad[3])
				z.Transparency = ae or 0
				z:SetHSVFromRGB(af)
				z:Display()
			end
			function z.SetValueRGB(ac, ad, ae)
				z.Transparency = ae or 0
				z:SetHSVFromRGB(ad)
				z:Display()
			end
			function z.OnChanged(ac, ad)
				z.Changed = ad
				ad(z.Value)
			end
			function z.Destroy(ac)
				A:Destroy()
				y.Options[w] = nil
			end
			p.AddSignal(A.Frame.MouseButton1Click, function()
				ab()
			end)
			z:Display()
			y.Options[w] = z
			return z
		end
		return u
	end,
	[22] = function()
		local aa, ab, ac, ad, ae = b(22)
		local af, ag, ah, ai, aj =
			game:GetService("TweenService"),
			game:GetService("UserInputService"),
			game:GetService("Players").LocalPlayer:GetMouse(),
			game:GetService("Workspace").CurrentCamera,
			ab.Parent.Parent
		local c, d = ac(aj.Creator), ac(aj.Packages.Flipper)
		local e, f, g = c.New, aj.Components, {}
		g.__index = g
		g.__type = "Dropdown"
		function g.New(h, i, j)
			local k, l, m =
				h.Library,
				{
					Values = j.Values,
					Value = j.Default,
					Multi = j.Multi,
					Search = j.Search == true,
					SearchText = "",
					VisibleCount = 0,
					Buttons = {},
					Opened = false,
					Type = "Dropdown",
					Callback = j.Callback or function() end,
				},
				ac(f.Element)(j.Title, j.Description, h.Container, false)
			m.DescLabel.Size = UDim2.new(1, -170, 0, 16)
			l.SetTitle = m.SetTitle
			l.SetDesc = m.SetDesc
			local n, o =
				e(
					"TextLabel",
					{
						FontFace = Font.new(
							UI_FONT_FAMILY,
							Enum.FontWeight.Regular,
							Enum.FontStyle.Normal
						),
						Text = "Value",
						TextColor3 = Color3.fromRGB(240, 240, 240),
						TextSize = 15,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -30, 0, 16),
						Position = UDim2.new(0, 8, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5),
						BackgroundColor3 = Color3.fromRGB(255, 255, 255),
						BackgroundTransparency = 1,
						TextTruncate = Enum.TextTruncate.AtEnd,
						ThemeTag = { TextColor3 = "Text" },
					}
				),
				e(
					"ImageLabel",
					{
						Image = "rbxassetid://10709790948",
						Size = UDim2.fromOffset(16, 16),
						AnchorPoint = Vector2.new(1, 0.5),
						Position = UDim2.new(1, -8, 0.5, 0),
						BackgroundTransparency = 1,
						ThemeTag = { ImageColor3 = "SubText" },
					}
				)
			local p, s =
				e(
					"TextButton",
					{
						Size = UDim2.fromOffset(160, 30),
						Position = UDim2.new(1, -10, 0.5, 0),
						AnchorPoint = Vector2.new(1, 0.5),
						BackgroundTransparency = 0.9,
						Parent = m.Frame,
						ThemeTag = { BackgroundColor3 = "DropdownFrame" },
					},
					{
						e("UICorner", { CornerRadius = UDim.new(0, 5) }),
						e(
							"UIStroke",
							{
								Transparency = 0.5,
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								ThemeTag = { Color = "InElementBorder" },
							}
						),
						o,
						n,
					}
				),
				e("UIListLayout", { Padding = UDim.new(0, 3) })
			local searchInput = l.Search and e(
				"TextBox",
				{
					Size = UDim2.new(1, -10, 0, 30),
					Position = UDim2.fromOffset(5, 5),
					BackgroundTransparency = 0.9,
					ClearTextOnFocus = false,
					PlaceholderText = "Search...",
					Text = "",
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center,
					ZIndex = 22,
					FontFace = UI_FONT_REGULAR,
					ThemeTag = { BackgroundColor3 = "DropdownFrame", TextColor3 = "Text", PlaceholderColor3 = "SubText" },
				},
				{
					e("UICorner", { CornerRadius = UDim.new(0, 5) }),
					e("UIPadding", { PaddingLeft = UDim.new(0, 9), PaddingRight = UDim.new(0, 9) }),
					e(
						"UIStroke",
						{ Transparency = 0.5, ApplyStrokeMode = Enum.ApplyStrokeMode.Border, ThemeTag = { Color = "InElementBorder" } }
					),
				}
			)
			local t = e(
				"ScrollingFrame",
				{
					Size = l.Search and UDim2.new(1, -10, 1, -45) or UDim2.new(1, -5, 1, -10),
					Position = l.Search and UDim2.fromOffset(5, 40) or UDim2.fromOffset(5, 5),
					BackgroundTransparency = 1,
					BottomImage = "rbxassetid://6889812791",
					MidImage = "rbxassetid://6889812721",
					TopImage = "rbxassetid://6276641225",
					ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
					ScrollBarImageTransparency = 0.65,
					ScrollBarThickness = 5,
					BorderSizePixel = 0,
					CanvasSize = UDim2.fromScale(0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
				},
				{ s }
			)
			local uChildren = {
				t,
				e("UICorner", { CornerRadius = UDim.new(0, 7) }),
				e(
					"UIStroke",
					{ ApplyStrokeMode = Enum.ApplyStrokeMode.Border, ThemeTag = { Color = "DropdownBorder" } }
				),
				e(
					"ImageLabel",
					{
						BackgroundTransparency = 1,
						Image = "http://www.roblox.com/asset/?id=5554236805",
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(23, 23, 277, 277),
						Size = UDim2.fromScale(1, 1) + UDim2.fromOffset(30, 30),
						Position = UDim2.fromOffset(-15, -15),
						ImageColor3 = Color3.fromRGB(0, 0, 0),
						ImageTransparency = 0.1,
					}
				),
			}
			if searchInput then
				table.insert(uChildren, 1, searchInput)
			end
			local u = e(
				"Frame",
				{ Size = UDim2.fromScale(1, 0.6), ThemeTag = { BackgroundColor3 = "DropdownHolder" } },
				uChildren
			)
			local v = e(
				"Frame",
				{ BackgroundTransparency = 1, Size = UDim2.fromOffset(220, 250), Parent = h.Library.GUI, Visible = false },
				{ u, e("UISizeConstraint", { MinSize = Vector2.new(220, 0) }) }
			)
			table.insert(k.OpenFrames, v)
			local w, x =
				function()
					local w = 0
					if ai.ViewportSize.Y - p.AbsolutePosition.Y < v.AbsoluteSize.Y - 5 then
						w = v.AbsoluteSize.Y - 5 - (ai.ViewportSize.Y - p.AbsolutePosition.Y) + 40
					end
					v.Position = UDim2.fromOffset(p.AbsolutePosition.X - 1, p.AbsolutePosition.Y - 5 - w)
				end, 0
			local y, z =
				function()
					if l.VisibleCount > 10 then
						v.Size = UDim2.fromOffset(x, 250)
					else
						v.Size = UDim2.fromOffset(x, math.min(s.AbsoluteContentSize.Y + (l.Search and 45 or 10), 250))
					end
				end, function()
					t.CanvasSize = UDim2.fromOffset(0, s.AbsoluteContentSize.Y)
				end
			w()
			y()
			c.AddSignal(p:GetPropertyChangedSignal("AbsolutePosition"), w)
			c.AddSignal(p.MouseButton1Click, function()
				l:Open()
			end)
			c.AddSignal(ag.InputBegan, function(A)
				if
					A.UserInputType == Enum.UserInputType.MouseButton1
					or A.UserInputType == Enum.UserInputType.Touch
				then
					local B, C = u.AbsolutePosition, u.AbsoluteSize
					if ah.X < B.X or ah.X > B.X + C.X or ah.Y < (B.Y - 20 - 1) or ah.Y > B.Y + C.Y then
						l:Close()
					end
				end
			end)
			local A = h.ScrollFrame
			function l.Open(B)
				l.Opened = true
				A.ScrollingEnabled = false
				v.Visible = true
				af:Create(
					u,
					TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
					{ Size = UDim2.fromScale(1, 1) }
				):Play()
			end
			function l.Close(B)
				l.Opened = false
				A.ScrollingEnabled = true
				if searchInput then
					searchInput.Text = ""
					l.SearchText = ""
				end
				u.Size = UDim2.fromScale(1, 0.6)
				v.Visible = false
			end
			function l.Display(B)
				local C, D = l.Values, ""
				if j.Multi then
					for E, F in next, C do
						if l.Value[F] then
							D = D .. F .. ", "
						end
					end
					D = D:sub(1, #D - 2)
				else
					D = l.Value or ""
				end
				n.Text = (D == "" and "--" or D)
			end
			function l.GetActiveValues(B)
				if j.Multi then
					local C = {}
					for D, E in next, l.Value do
						table.insert(C, D)
					end
					return C
				else
					return l.Value and 1 or 0
				end
			end
			function l.BuildDropdownList(B)
				local C, D = l.Values, {}
				for E, F in next, t:GetChildren() do
					if not F:IsA("UIListLayout") then
						F:Destroy()
					end
				end
				local G = 0
				local query = string.lower(l.SearchText or "")
				for H, I in next, C do
					local text = tostring(I)
					if query == "" or string.find(string.lower(text), query, 1, true) then
						local J = {}
						G = G + 1
					local K, L =
						e(
							"Frame",
							{
								Size = UDim2.fromOffset(4, 14),
								BackgroundColor3 = Color3.fromRGB(76, 194, 255),
								Position = UDim2.fromOffset(-1, 16),
								AnchorPoint = Vector2.new(0, 0.5),
								ThemeTag = { BackgroundColor3 = "Accent" },
							},
							{ e("UICorner", { CornerRadius = UDim.new(0, 2) }) }
						),
						e(
							"TextLabel",
							{
								FontFace = UI_FONT_REGULAR,
								Text = text,
								TextColor3 = Color3.fromRGB(200, 200, 200),
								TextSize = 15,
								TextXAlignment = Enum.TextXAlignment.Left,
								BackgroundColor3 = Color3.fromRGB(255, 255, 255),
								AutomaticSize = Enum.AutomaticSize.Y,
								BackgroundTransparency = 1,
								Size = UDim2.fromScale(1, 1),
								Position = UDim2.fromOffset(10, 0),
								Name = "ButtonLabel",
								ThemeTag = { TextColor3 = "Text" },
							}
						)
					local M, N = (
						e(
							"TextButton",
							{
								Size = UDim2.new(1, -5, 0, 32),
								BackgroundTransparency = 1,
								ZIndex = 23,
								Text = "",
								Parent = t,
								ThemeTag = { BackgroundColor3 = "DropdownOption" },
							},
							{ K, L, e("UICorner", { CornerRadius = UDim.new(0, 6) }) }
						)
					)
					if j.Multi then
						N = l.Value[I]
					else
						N = l.Value == I
					end
					local O, P = c.SpringMotor(1, M, "BackgroundTransparency")
					local Q, R = c.SpringMotor(1, K, "BackgroundTransparency")
					local S = d.SingleMotor.new(6)
					S:onStep(function(T)
						K.Size = UDim2.new(0, 4, 0, T)
					end)
					c.AddSignal(M.MouseEnter, function()
						P(N and 0.85 or 0.89)
					end)
					c.AddSignal(M.MouseLeave, function()
						P(N and 0.89 or 1)
					end)
					c.AddSignal(M.MouseButton1Down, function()
						P(0.92)
					end)
					c.AddSignal(M.MouseButton1Up, function()
						P(N and 0.85 or 0.89)
					end)
					function J.UpdateButton(T)
						if j.Multi then
							N = l.Value[I]
							if N then
								P(0.89)
							end
						else
							N = l.Value == I
							P(N and 0.89 or 1)
						end
						S:setGoal(d.Spring.new(N and 14 or 6, { frequency = 6 }))
						R(N and 0 or 1)
					end
					L.InputBegan:Connect(function(T)
						if
							T.UserInputType == Enum.UserInputType.MouseButton1
							or T.UserInputType == Enum.UserInputType.Touch
						then
							local U = not N
							if l:GetActiveValues() == 1 and not U and not j.AllowNull then
							else
								if j.Multi then
									N = U
									l.Value[I] = N and true or nil
								else
									N = U
									l.Value = N and I or nil
									for V, W in next, D do
										W:UpdateButton()
									end
								end
								J:UpdateButton()
								l:Display()
								k:SafeCallback(l.Callback, l.Value)
								k:SafeCallback(l.Changed, l.Value)
							end
						end
					end)
					J:UpdateButton()
					l:Display()
					D[M] = J
					end
				end
				l.VisibleCount = G
				x = 0
				for J, K in next, D do
					if J.ButtonLabel then
						if J.ButtonLabel.TextBounds.X > x then
							x = J.ButtonLabel.TextBounds.X
						end
					end
				end
				x = math.max(x + 30, 220)
				z()
				y()
			end
			if searchInput then
				c.AddSignal(searchInput:GetPropertyChangedSignal("Text"), function()
					l.SearchText = searchInput.Text
					l:BuildDropdownList()
				end)
			end
			function l.SetValues(B, C)
				if C then
					l.Values = C
				end
				l:BuildDropdownList()
			end
			function l.OnChanged(B, C)
				l.Changed = C
				C(l.Value)
			end
			function l.SetValue(B, C)
				if l.Multi then
					local D = {}
					for E, F in next, C do
						if table.find(l.Values, E) then
							D[E] = true
						end
					end
					l.Value = D
				else
					if not C then
						l.Value = nil
					elseif table.find(l.Values, C) then
						l.Value = C
					end
				end
				l:BuildDropdownList()
				k:SafeCallback(l.Callback, l.Value)
				k:SafeCallback(l.Changed, l.Value)
			end
			function l.Destroy(B)
				m:Destroy()
				k.Options[i] = nil
			end
			l:BuildDropdownList()
			l:Display()
			local B = {}
			if type(j.Default) == "string" then
				local C = table.find(l.Values, j.Default)
				if C then
					table.insert(B, C)
				end
			elseif type(j.Default) == "table" then
				for C, D in next, j.Default do
					local E = table.find(l.Values, D)
					if E then
						table.insert(B, E)
					end
				end
			elseif type(j.Default) == "number" and l.Values[j.Default] ~= nil then
				table.insert(B, j.Default)
			end
			if next(B) then
				for C = 1, #B do
					local D = B[C]
					if j.Multi then
						l.Value[l.Values[D]] = true
					else
						l.Value = l.Values[D]
					end
					if not j.Multi then
						break
					end
				end
				l:BuildDropdownList()
				l:Display()
			end
			k.Options[i] = l
			return l
		end
		return g
	end,
	[23] = function()
		local aa, ab, ac, ad, ae = b(23)
		local af = ab.Parent.Parent
		local ag = ac(af.Creator)
		local ah, ai, aj, c = ag.New, ag.AddSignal, af.Components, {}
		c.__index = c
		c.__type = "Input"
		function c.New(d, e, f)
			local g = d.Library
			assert(f.Title, "Input - Missing Title")
			f.Callback = f.Callback or function() end
			local h, i =
				{
					Value = f.Default or "",
					Numeric = f.Numeric or false,
					Finished = f.Finished or false,
					Callback = f.Callback or function(h) end,
					Type = "Input",
				},
				ac(aj.Element)(f.Title, f.Description, d.Container, false)
			h.SetTitle = i.SetTitle
			h.SetDesc = i.SetDesc
			local j = ac(aj.Textbox)(i.Frame, true)
			j.Frame.Position = UDim2.new(1, -10, 0.5, 0)
			j.Frame.AnchorPoint = Vector2.new(1, 0.5)
			j.Frame.Size = UDim2.fromOffset(160, 30)
			j.Input.Text = f.Default or ""
			j.Input.PlaceholderText = f.Placeholder or ""
			local k = j.Input
			function h.SetValue(l, m)
				if f.MaxLength and #m > f.MaxLength then
					m = m:sub(1, f.MaxLength)
				end
				if h.Numeric then
					if (not tonumber(m)) and m:len() > 0 then
						m = h.Value
					end
				end
				h.Value = m
				k.Text = m
				g:SafeCallback(h.Callback, h.Value)
				g:SafeCallback(h.Changed, h.Value)
			end
			if h.Finished then
				ai(k.FocusLost, function(l)
					if not l then
						return
					end
					h:SetValue(k.Text)
				end)
			else
				ai(k:GetPropertyChangedSignal("Text"), function()
					h:SetValue(k.Text)
				end)
			end
			function h.OnChanged(l, m)
				h.Changed = m
				m(h.Value)
			end
			function h.Destroy(l)
				i:Destroy()
				g.Options[e] = nil
			end
			g.Options[e] = h
			return h
		end
		return c
	end,
	[24] = function()
		local aa, ab, ac, ad, ae = b(24)
		local af, ag = game:GetService("UserInputService"), ab.Parent.Parent
		local ah = ac(ag.Creator)
		local ai, aj, c = ah.New, ag.Components, {}
		c.__index = c
		c.__type = "Keybind"
		function c.New(d, e, f)
			local g = d.Library
			assert(f.Title, "KeyBind - Missing Title")
			assert(f.Default, "KeyBind - Missing default value.")
			local h, i, j =
				{
					Value = f.Default,
					Toggled = false,
					Mode = f.Mode or "Toggle",
					Type = "Keybind",
					Callback = f.Callback or function(h) end,
					ChangedCallback = f.ChangedCallback or function(h) end,
				},
				false,
				ac(aj.Element)(f.Title, f.Description, d.Container, true)
			h.SetTitle = j.SetTitle
			h.SetDesc = j.SetDesc
			local k = ai(
				"TextLabel",
				{
					FontFace = Font.new(
						UI_FONT_FAMILY,
						Enum.FontWeight.Regular,
						Enum.FontStyle.Normal
					),
					Text = f.Default,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					TextSize = 15,
					TextXAlignment = Enum.TextXAlignment.Center,
					Size = UDim2.new(0, 0, 0, 16),
					Position = UDim2.new(0, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundTransparency = 1,
					ThemeTag = { TextColor3 = "Text" },
				}
			)
			local l = ai(
				"TextButton",
				{
					Size = UDim2.fromOffset(0, 30),
					Position = UDim2.new(1, -10, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundTransparency = 0.9,
					Parent = j.Frame,
					AutomaticSize = Enum.AutomaticSize.X,
					ThemeTag = { BackgroundColor3 = "Keybind" },
				},
				{
					ai("UICorner", { CornerRadius = UDim.new(0, 5) }),
					ai("UIPadding", { PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8) }),
					ai(
						"UIStroke",
						{
							Transparency = 0.5,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							ThemeTag = { Color = "InElementBorder" },
						}
					),
					k,
				}
			)
			function h.GetState(m)
				if af:GetFocusedTextBox() and h.Mode ~= "Always" then
					return false
				end
				if h.Mode == "Always" then
					return true
				elseif h.Mode == "Hold" then
					if h.Value == "None" then
						return false
					end
					local n = h.Value
					if n == "MouseLeft" or n == "MouseRight" then
						return n == "MouseLeft" and af:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
							or n == "MouseRight" and af:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
					else
						return af:IsKeyDown(Enum.KeyCode[h.Value])
					end
				else
					return h.Toggled
				end
			end
			function h.SetValue(m, n, o)
				n = n or h.Key
				o = o or h.Mode
				k.Text = n
				h.Value = n
				h.Mode = o
			end
			function h.OnClick(m, n)
				h.Clicked = n
			end
			function h.OnChanged(m, n)
				h.Changed = n
				n(h.Value)
			end
			function h.DoClick(m)
				g:SafeCallback(h.Callback, h.Toggled)
				g:SafeCallback(h.Clicked, h.Toggled)
			end
			function h.Destroy(m)
				j:Destroy()
				g.Options[e] = nil
			end
			ah.AddSignal(l.InputBegan, function(m)
				if
					m.UserInputType == Enum.UserInputType.MouseButton1
					or m.UserInputType == Enum.UserInputType.Touch
				then
					i = true
					k.Text = "..."
					wait(0.2)
					local n
					n = af.InputBegan:Connect(function(o)
						local p
						if o.UserInputType == Enum.UserInputType.Keyboard then
							p = o.KeyCode.Name
						elseif o.UserInputType == Enum.UserInputType.MouseButton1 then
							p = "MouseLeft"
						elseif o.UserInputType == Enum.UserInputType.MouseButton2 then
							p = "MouseRight"
						end
						local s
						s = af.InputEnded:Connect(function(t)
							if
								t.KeyCode.Name == p
								or p == "MouseLeft" and t.UserInputType == Enum.UserInputType.MouseButton1
								or p == "MouseRight" and t.UserInputType == Enum.UserInputType.MouseButton2
							then
								i = false
								k.Text = p
								h.Value = p
								g:SafeCallback(h.ChangedCallback, t.KeyCode or t.UserInputType)
								g:SafeCallback(h.Changed, t.KeyCode or t.UserInputType)
								n:Disconnect()
								s:Disconnect()
							end
						end)
					end)
				end
			end)
			ah.AddSignal(af.InputBegan, function(m)
				if not i and not af:GetFocusedTextBox() then
					if h.Mode == "Toggle" then
						local n = h.Value
						if n == "MouseLeft" or n == "MouseRight" then
							if
								n == "MouseLeft" and m.UserInputType == Enum.UserInputType.MouseButton1
								or n == "MouseRight" and m.UserInputType == Enum.UserInputType.MouseButton2
							then
								h.Toggled = not h.Toggled
								h:DoClick()
							end
						elseif m.UserInputType == Enum.UserInputType.Keyboard then
							if m.KeyCode.Name == n then
								h.Toggled = not h.Toggled
								h:DoClick()
							end
						end
					end
				end
			end)
			g.Options[e] = h
			return h
		end
		return c
	end,
	[25] = function()
		local aa, ab, ac, ad, ae = b(25)
		local af = ab.Parent.Parent
		local ag, ah, ai, aj = af.Components, ac(af.Packages.Flipper), ac(af.Creator), {}
		aj.__index = aj
		aj.__type = "Paragraph"
		function aj.New(c, d)
			assert(d.Title, "Paragraph - Missing Title")
			d.Content = d.Content or ""
			local e = ac(ag.Element)(d.Title, d.Content, aj.Container, false)
			e.Frame.BackgroundTransparency = 0.92
			e.Border.Transparency = 0.6
			return e
		end
		return aj
	end,
	[26] = function()
		local aa, ab, ac, ad, ae = b(26)
		local af, ag = game:GetService("UserInputService"), ab.Parent.Parent
		local ah = ac(ag.Creator)
		local ai, aj, c = ah.New, ag.Components, {}
		c.__index = c
		c.__type = "Slider"
		function c.New(d, e, f)
			local g = d.Library
			assert(f.Title, "Slider - Missing Title.")
			assert(f.Default ~= nil, "Slider - Missing default value.")
			assert(f.Min ~= nil, "Slider - Missing minimum value.")
			assert(f.Max ~= nil, "Slider - Missing maximum value.")
			assert(f.Rounding ~= nil, "Slider - Missing rounding value.")
			local h, i, j =
				{ Value = nil, Min = f.Min, Max = f.Max, Rounding = f.Rounding, Callback = f.Callback or function(h) end, Type = "Slider" },
				false,
				ac(aj.Element)(f.Title, f.Description, d.Container, false)
			j.DescLabel.Size = UDim2.new(1, -170, 0, 16)
			h.SetTitle = j.SetTitle
			h.SetDesc = j.SetDesc
			local k = ai(
				"ImageLabel",
				{
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, -7, 0.5, 0),
					Size = UDim2.fromOffset(14, 14),
					Image = "http://www.roblox.com/asset/?id=12266946128",
					ThemeTag = { ImageColor3 = "Accent" },
				}
			)
			local l, m =
				ai(
					"Frame",
					{ BackgroundTransparency = 1, Position = UDim2.fromOffset(7, 0), Size = UDim2.new(1, -14, 1, 0) },
					{ k }
				),
				ai(
					"Frame",
					{ Size = UDim2.new(0, 0, 1, 0), ThemeTag = { BackgroundColor3 = "Accent" } },
					{ ai("UICorner", { CornerRadius = UDim.new(1, 0) }) }
				)
			local n = ai(
				"TextBox",
				{
					FontFace = UI_FONT_REGULAR,
					Text = "Value",
					TextSize = 14,
					TextWrapped = true,
					TextEditable = true,
					ClearTextOnFocus = false,
					MultiLine = false,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -8, 1, 0),
					Position = UDim2.fromOffset(4, 0),
					ThemeTag = { TextColor3 = "SubText", PlaceholderColor3 = "SubText" },
				}
			)
			local p = ai(
				"Frame",
				{
					Size = UDim2.fromOffset(38, 22),
					Position = UDim2.new(1, -164, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					BackgroundTransparency = 0.5,
					Active = true,
					ZIndex = 3,
					Parent = j.Frame,
					-- Keep the value box black and translucent instead of inheriting the Input theme.
				},
				{
					ai("UICorner", { CornerRadius = UDim.new(0, 6) }),
					ai(
						"UIStroke",
						{
							Transparency = 0.45,
							ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
							ThemeTag = { Color = "InElementBorder" },
						}
					),
					n,
				}
			)
			local o = ai(
				"Frame",
				{
					Size = UDim2.new(1, 0, 0, 4),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -10, 0.5, 0),
					BackgroundTransparency = 0.4,
					Active = true,
					ZIndex = 1,
					Parent = j.Frame,
					ThemeTag = { BackgroundColor3 = "SliderRail" },
				},
				{
					ai("UICorner", { CornerRadius = UDim.new(1, 0) }),
					ai("UISizeConstraint", { MaxSize = Vector2.new(150, math.huge) }),
					m,
					l,
				}
			)
			local q = ai(
				"Frame",
				{
					Size = UDim2.new(1, 0, 0, 28),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -10, 0.5, 0),
					BackgroundTransparency = 1,
					Active = true,
					ZIndex = 2,
					Parent = j.Frame,
				},
				{ ai("UISizeConstraint", { MaxSize = Vector2.new(150, math.huge) }) }
			)
			local activeInput
			local function updateSliderFromX(p)
				local q = l.AbsoluteSize.X
				if q <= 0 then
					return
				end
				local r = math.clamp((p - l.AbsolutePosition.X) / q, 0, 1)
				h:SetValue(h.Min + ((h.Max - h.Min) * r))
			end
			local function beginSliderInput(p)
				if
					p.UserInputType == Enum.UserInputType.MouseButton1
					or p.UserInputType == Enum.UserInputType.Touch
				then
					i = true
					activeInput = p
					updateSliderFromX(p.Position.X)
				end
			end
			ah.AddSignal(k.InputBegan, beginSliderInput)
			ah.AddSignal(o.InputBegan, beginSliderInput)
			ah.AddSignal(q.InputBegan, beginSliderInput)
			ah.AddSignal(af.InputChanged, function(p)
				if
					i
					and activeInput
					and (
						(activeInput.UserInputType == Enum.UserInputType.MouseButton1 and p.UserInputType == Enum.UserInputType.MouseMovement)
						or (activeInput.UserInputType == Enum.UserInputType.Touch and p == activeInput)
					)
				then
					updateSliderFromX(p.Position.X)
				end
			end)
			ah.AddSignal(af.InputEnded, function(p)
				if
					i
					and activeInput
					and (
						p.UserInputType == Enum.UserInputType.MouseButton1
						or (p.UserInputType == Enum.UserInputType.Touch and p == activeInput)
					)
				then
					i = false
					activeInput = nil
				end
			end)
			ah.AddSignal(n.FocusLost, function()
				local p = tonumber(n.Text)
				if p then
					h:SetValue(p)
				else
					n.Text = tostring(h.Value)
				end
			end)
			function h.OnChanged(p, s)
				h.Changed = s
				s(h.Value)
			end
			function h.SetValue(p, s)
				local q = g:Round(math.clamp(tonumber(s) or h.Min, h.Min, h.Max), h.Rounding)
				p.Value = tonumber(q) or q
				local r = h.Max == h.Min and 0 or (p.Value - h.Min) / (h.Max - h.Min)
				k.Position = UDim2.new(r, -7, 0.5, 0)
				m.Size = UDim2.fromScale(r, 1)
				n.Text = tostring(p.Value)
				g:SafeCallback(h.Callback, p.Value)
				g:SafeCallback(h.Changed, p.Value)
			end
			function h.Destroy(p)
				j:Destroy()
				g.Options[e] = nil
			end
			h:SetValue(f.Default)
			g.Options[e] = h
			return h
		end
		return c
	end,
	[27] = function()
		local aa, ab, ac, ad, ae = b(27)
		local af, ag = game:GetService("TweenService"), ab.Parent.Parent
		local ah = ac(ag.Creator)
		local ai, aj, c = ah.New, ag.Components, {}
		c.__index = c
		c.__type = "Toggle"
		function c.New(d, e, f)
			local g = d.Library
			assert(f.Title, "Toggle - Missing Title")
			local h, i =
				{ Value = f.Default or false, Callback = f.Callback or function(h) end, Type = "Toggle" },
				ac(aj.Element)(f.Title, f.Description, d.Container, true)
			i.DescLabel.Size = UDim2.new(1, -54, 0, 16)
			h.SetTitle = i.SetTitle
			h.SetDesc = i.SetDesc
			local j, k =
				ai(
					"ImageLabel",
					{
						AnchorPoint = Vector2.new(0, 0.5),
						Size = UDim2.fromOffset(14, 14),
						Position = UDim2.new(0, 2, 0.5, 0),
						Image = "http://www.roblox.com/asset/?id=12266946128",
						ImageTransparency = 0.5,
						ThemeTag = { ImageColor3 = "ToggleSlider" },
					}
				),
				ai("UIStroke", { Transparency = 0.5, ThemeTag = { Color = "ToggleSlider" } })
			local l = ai(
				"Frame",
				{
					Size = UDim2.fromOffset(36, 18),
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -10, 0.5, 0),
					Parent = i.Frame,
					BackgroundTransparency = 1,
					ThemeTag = { BackgroundColor3 = "Accent" },
				},
				{ ai("UICorner", { CornerRadius = UDim.new(0, 9) }), k, j }
			)
			function h.OnChanged(m, n)
				h.Changed = n
				n(h.Value)
			end
			function h.SetValue(m, n)
				n = not not n
				h.Value = n
				ah.OverrideTag(k, { Color = h.Value and "Accent" or "ToggleSlider" })
				ah.OverrideTag(j, { ImageColor3 = h.Value and "ToggleToggled" or "ToggleSlider" })
				af:Create(
					j,
					TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{ Position = UDim2.new(0, h.Value and 19 or 2, 0.5, 0) }
				):Play()
				af:Create(
					l,
					TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
					{ BackgroundTransparency = h.Value and 0 or 1 }
				):Play()
				j.ImageTransparency = h.Value and 0 or 0.5
				g:SafeCallback(h.Callback, h.Value)
				g:SafeCallback(h.Changed, h.Value)
			end
			function h.Destroy(m)
				i:Destroy()
				g.Options[e] = nil
			end
			ah.AddSignal(i.Frame.MouseButton1Click, function()
				h:SetValue(not h.Value)
			end)
			h:SetValue(h.Value)
			g.Options[e] = h
			return h
		end
		return c
	end,
	[28] = function()
		local Lucide = {}
		
		local IS_GETCUSTOMASSET_BROKEN = false
		
		if writefile and isfolder and makefolder and getcustomasset then
			if not isfolder("lucide-icons") then
				makefolder("lucide-icons")
			end
		
			if not isfile("lucide-icons/version.txt") then
				writefile("lucide-icons/version.txt", "2026-09-01T00:12:05.460931359+00:00")
			end
		
			local ShouldUpdate = readfile("lucide-icons/version.txt") ~= "2026-09-01T00:12:05.460931359+00:00"
		
			if ShouldUpdate then
				writefile("lucide-icons/version.txt", "2026-09-01T00:12:05.460931359+00:00")
			end
		
			for spritesheet = 1, 2 do
				if isfile(`lucide-icons/{spritesheet}.png`) and not ShouldUpdate then
					continue
				end
		
				writefile(
					`lucide-icons/{spritesheet}.png`,
					game:HttpGet(
						`https://gitlab.com/upio/lucide-roblox-direct/-/raw/main/spritesheets/{spritesheet}.png`
					)
				)
			end
		
			local Success, _Error = pcall(function()
				return getcustomasset("lucide-icons/1.png")
			end)
		
			IS_GETCUSTOMASSET_BROKEN = not Success
		end
		
		local icons = {{"align-vertical-distribute-center","chevron-down","list-restart","table-cells-split","gavel","dna-off","refresh-ccw-dot","venus","bean","circle-question-mark","folder-code","bolt","heater","feather","align-horizontal-distribute-center","grip-vertical","pill-bottle","person-standing","badge-swiss-franc","between-horizontal-end","file-braces-corner","rotate-cw","house-plus","bus-front","shield-ellipsis","between-vertical-end","globe-lock","tags","concierge-bell","bookmark-minus","file-down","picture-in-picture","messages-square","scissors","file-check-corner","phone-call","anchor","hand-helping","text-wrap","birdhouse","wifi-off","cloud-alert","message-square","cloud-download","folder-plus","cctv-off","mirror-round","user-round","pointer","between-horizontal-start","chevrons-up-down","brush","message-circle-more","parentheses","book-up-2","flame","chevrons-up","square-dashed","square-mouse-pointer","superscript","signal","wifi-cog","hexagon","navigation-2-off","eye-off","arrows-up-from-line","file-code-corner","square-centerline-dashed-horizontal","panels-right-bottom","scaling","hash","arrow-left-from-line","ship","ticket-percent","calendar-clock","x","non-binary","voicemail","presentation","tree-palm","badge","captions-off","align-vertical-justify-center","download","mouse-right","lens-convex","focus","diamond-percent","arrow-big-up","volume-x","mouse-pointer-click","face-slightly-smiling-plus","hard-drive","grid-2x2-x","package-minus","cloud","pipette","corner-left-down","badge-cent","cloud-lightning","user-round-pen","arrow-left-to-line","book-open-text","monitor-cloud","parking-meter","cat","heart-handshake","dam","trees","ham","circle-pause","chess-king","bean-off","rat","separator-horizontal","ambulance","signal-zero","citrus","phone-missed","calendar-off","chart-column","battery-medium","square-minus","star-check","decimals-arrow-left","folder-output","menu","image-down","terminal","circle-dot-dashed","medal","cake-slice","git-graph","armchair","tickets","qr-code","copy","goal","trending-down","creative-commons","layers-arrow-down","ev-charger","user-star","road","nfc","align-center-horizontal","car","notebook-tabs","ear","videotape","sun-moon","chart-scatter","podium","toolbox","calendar","calendar-cog","gallery-horizontal","clipboard-x","list-sort-ascending","book-open","circle-pile","rectangle-ellipsis","badge-plus","badge-info","file-headphone","bow-arrow","clipboard-pen-line","user-round-key","folder-search","utensils-crossed","arrow-up","arrow-up-from-dot","align-vertical-justify-start","layers-minus","pause","shrub","flag","biceps-flexed","align-horizontal-distribute-end","donut","calendar-plus-2","move-vertical","file-pen-line","badge-russian-ruble","radius","pilcrow","corner-left-up","georgian-lari","cable","book-user","square-arrow-down","circle-plus","view","cctv","circle-arrow-left","square-off","octagon-alert","panel-bottom-dashed","book-a","align-end-vertical","thumbs-up","globe","rabbit","layers-plus","banknote-arrow-down","message-square-off","dice-4","message-circle-x","folder-x","message-circle-warning","map","move","arrow-up-left","award","arrow-down-wide-narrow","unfold-horizontal","lens-concave","motorbike","music-4","shield-x","file-volume","disc-3","file-signal","columns-4","archive-x","square-dashed-kanban","mouse-pointer-2","clock-arrow-up","clock-fading","pencil-sparkles","vegan","star-plus","message-circle-plus","credit-card-plus","fast-forward","user-pen","chess-knight","wifi-pen","files","send-to-back","alarm-clock","shopping-basket","send","brush-cleaning","skip-back","book-audio","file-scan","midi-port","message-square-dashed","chevrons-left","umbrella","skip-forward","clipboard-copy","map-pin-off","arrow-up-from-line","circle-chevron-up","circle-small","align-vertical-space-between","lamp-desk","circle-arrow-up","zap","beaker","paintbrush","broccoli","chevron-up","pen-tool","database-check","form","pencil-ruler","dna","arrow-big-down-dash","chart-area","bug-off","card-sim","map-pin-search","eye-dashed","ellipse","spell-check","popcorn","blocks","layer-arrow-up","microchip","badge-minus","cloud-sun","circle","shield-alert","map-minus","separator-vertical","scan-square","ampersands","user-search","fence","square-user-round","sunrise","strikethrough","calendar-days","folder-bookmark","banknote-arrow-up","zoom-out","dollar-sign","message-square-quote","zoom-in","zodiac-virgo","list-chevrons-down-up","list-minus","cloud-hail","contact","eye-closed","app-window-mac","folder-lock","ellipsis","copy-check","zodiac-pisces","satellite","bookmark-plus","text-align-justify","folder-key","coffee","circle-power","zodiac-libra","hourglass","tickets-plane","folder-git","zodiac-leo","bomb","layers-2","battery-full","zodiac-gemini","user-minus","chart-gantt","folder-tree","command","badge-dollar-sign","align-start-vertical","briefcase-conveyor-belt","message-circle-question-mark","square-arrow-out-up-right","bluetooth-off","save","square-square","cannabis","zodiac-aries","book","grip-horizontal","circle-minus","audio-waveform","moon-star","arrow-down-narrow-wide","zodiac-aquarius","database-backup","wand","receipt-turkish-lira","robot-arm","calendar-minus-2","copy-minus","x-line-top","folder-input","book-image","stamp","mouse-left","tag-plus","shirt","infinity","server-off","move-up","worm","workflow","plug-2","wine-off","chess-rook","brackets","calendar-heart","list-ordered","wine","star-x","mic-off","wind-arrow-down","arrow-big-left","square-split-horizontal","joystick","phone-forwarded","clover","sun-snow","sofa","wifi-sync","square-arrow-out-up-left","funnel-x","wifi-high","clock-2","calendar-fold","fish-off","baby","database-x","fold-vertical","wifi","hop","face-angry","van","cigarette","minus","wheat-off","wheat","diamond-plus","weight-tilde","file-chart-column","triangle-dashed","git-pull-request-closed","badge-check","weight","shrimp","layers-arrow-up","plug-zap","heading-4","chess-queen","graduation-cap","grid-3x2","zodiac-sagittarius","webcam-off","square-dashed-bottom-code","clock-7","ethernet-port","scan-text","webcam","shower-head","equal-not","waypoints","move-down","clock-arrow-down","ticket-slash","ruler","waves-vertical","waves-ladder","circle-user-round","waves-horizontal","settings-2","list-filter","map-pin-check","egg-off","waves-arrow-down","cog","dog","watch","swords","spotlight","panel-right-dashed","washing-machine","paper-bag","truck-electric","house-wifi","check-line","wand-sparkles","bubbles","bot","chart-bar-increasing","wallpaper","playing-card","air-vent","wallet-minimal","dot","wallet-cards","wallet","file-symlink","clipboard-paste","chevron-last","book-heart","vote","circle-parking","globe-check","cloud-check","panel-left","circle-chevron-right","volume-off","search-alert","squares-unite","arrow-down-up","git-fork","forward","brain-circuit","between-vertical-start","database","panel-right","volume-1","volume","volleyball","log-out","git-branch-plus","clipboard-minus","file-text","touchpad","video","ship-wheel","table-rows-split","milk-off","tv-minimal","cloud-upload","banknote","vibrate","message-circle-dashed-check","drumstick","venus-and-mars","calendar-search","pound-sterling","map-pin-x-inside","bell-ring","circle-chevron-left","vector-polygon","arrow-down","arrow-up-down","folder-dot","vault","badge-x","whole-word","monitor","disc-2","trending-up-down","utility-pole","user-shield","utensils","tv-minimal-play","circle-stop","align-vertical-space-around","users-round","users","user-x","arrow-big-down","circle-parking-off","calendar-x-2","user-plus","move-diagonal-2","bandage","gallery-horizontal-end","panel-top-dashed","user-round-x","user-round-search","tram-front","message-square-plus","fuel","user-round-cog","audio-lines","user-round-check","user-round-arrow-left","user-lock","flip-vertical-2","rocket","user-key","ear-off","square-chart-gantt","save-check","shuffle","user","printer","megaphone-off","usb-c-port","arrow-big-right","section","file-clock","magnet","toy-brick","square-chevron-down","dice-1","drill","app-window","robot-vacuum","hand-metal","upload","spell-check-2","unplug","square","list-plus","unlink","rotate-ccw-key","university","chart-pie","ungroup","unfold-vertical","copy-slash","wind","undo-2","layout-panel-left","undo","circle-percent","underline","circle-arrow-out-down-right","square-x","italic","chart-column-increasing","umbrella-off","step-forward","type-outline","a-arrow-down","broom-sparkles","sticker","folder-minus","file-minus","flower","turntable","turkish-lira","truck","import","badge-turkish-lira","square-terminal","file-music","trophy","beef","route-off","file-user","folder-search-2","square-radical","triangle-alert","image-upscale","book-type","triangle","signpost-big","trending-up","cloudy","thermometer-snowflake","square-percent","tree-deciduous","navigation-off","arrow-left","car-taxi-front","trash-2","message-square-share","chevrons-right-left","transgender","chevron-left","train-front-tunnel","milestone","file-chart-column-increasing","traffic-cone","square-dimensions","face-slightly-smiling","align-end-horizontal","layer-arrow-down","equal","megaphone","calendar-x","tractor","tower-control","egg","receipt-swiss-franc","touchpad-off","ship-cargo","circle-pound-sterling","video-off","japanese-yen","torus","tornado","tool-case","library","file-terminal","circle-chevron-down","accessibility","toilet","square-library","amphora","salad","tally-2","toggle-left","timer-reset","pin-off","timer","sheet","circle-check-big","timeline","ticket-x","map-pinned","corner-down-left","circuit-board","square-dot","list-clock","save-plus","monitor-check","folder-open-dot","book-dashed","line-squiggle","thermometer-sun","bluetooth","tree-pine","receipt-indian-rupee","thermometer","theater","heading-3","text-quote","origami","text-cursor-input","flask-conical","text-cursor","funnel","square-star","folder-sync","ice-cream-cone","zodiac-ophiuchus","text-align-end","text-align-center","arrow-up-narrow-wide","fishing-hook","test-tubes","test-tube-diagonal","brick-wall-fire","frame","calendar-arrow-down","clock-12","star-minus","switch-camera","tent","images","lollipop","book-text","telescope","lamp-floor","file-plus-corner","image","iteration-cw","badge-euro","bike","angle","tangent","settings","list-chevrons-up-down","tally-3","calendar-minus","scan-box","option","banknote-check","scroll-text","server-plus","tag","tablets","tablet-smartphone","toggle-right","table-properties","ferris-wheel","camera-off","table-of-contents","table-columns-split","table-cells-merge","table-2","table","group","syringe","battery","cookie","tent-tree","swiss-franc","rectangle-horizontal","snail","sunset","sun-medium","bitcoin","sun-dim","battery-plus","database-search","school","file-diff","folder-open","subscript","stretch-vertical","spline-pointer","stretch-horizontal","axis-3d","mic-audio-lines","stone","binoculars","house-plug","sticky-note-x","chart-bar-stacked","rose","factory","mail-minus","git-commit-vertical","sticky-note-check","sticky-note","stethoscope","clipboard-pen","bottle-wine","alarm-clock-off","step-back","list","star-off","square-arrow-right","sandwich","badge-pound-sterling","bookmark-check","star","wrench-off","squirrel","a-arrow-up","clock-check","flag-off","squircle","vibrate-off","face-grinning","zodiac-cancer","squares-exclude","file-code","square-user","chart-column-big","square-text","monitor-pause","cassette-tape","battery-low","square-stack","square-split-vertical","signpost","square-slash","calendar-arrow-up","landmark","fish-symbol","square-sigma","loader","bold","dice-2","file-type","clipboard-clock","beer","lectern","square-scissors","square-round-corner","layers","binary","move-diagonal","square-plus","door-closed","square-play","layout-template","square-pilcrow","square-pi","monitor-off","bookmark-off","hand-heart","square-pause","scan-qr-code","message-square-check","iteration-ccw","square-parking","radar","brain","square-m","square-kanban","bed-single","key","clock-11","square-equal","ticket-plus","arrow-up-0-1","bell-electric","square-divide","heading","book-open-check","panel-top-close","lasso-select","soup","speech","puzzle","square-dashed-bottom","bus","square-code","audio-lines-x","chart-no-axes-gantt","file-spreadsheet","square-chevron-up","clipboard-list","pen-line","contact-round","square-chevron-left","keyboard-off","rewind","file-badge","battery-warning","mail-question-mark","arrow-down-from-line","briefcase","biohazard","rectangle-circle","braces","scale-3d","panel-top-bottom-dashed","mail-x","square-dashed-mouse-pointer","user-cog","lock-open","square-centerline-dashed-vertical","pizza","list-indent-decrease","arrow-up-wide-narrow","square-bottom-dashed-scissors","clock-5","square-asterisk","rotate-ccw","align-horizontal-justify-center","square-arrow-up-right","antenna","memory-stick","scan-eye","search","square-check","heart-plus","square-arrow-right-exit","map-pin-minus-inside","git-merge","gallery-vertical-end","square-arrow-right-enter","hand-coins","zodiac-capricorn","wifi-low","move-right","clock","file-pen","git-compare-arrows","cloud-sun-rain","align-horizontal-justify-start","square-arrow-out-down-left","headset","square-arrow-down-right","calendar-plus","git-commit-horizontal","arrow-down-z-a","bath","navigation-2","unlink-2","sprout","spray-can","folder-check","sport-shoe","book-key","ribbon","microwave","smartphone-nfc","gallery-vertical","shield-plus","folder","square-dashed-text","map-pin-pen","move-up-left","speaker","folder-heart","sparkles","sparkle","spade","arrow-up-a-z","file-up","square-dashed-top-solid","solar-panel","soap-dispenser-droplet","snowflake","swatch-book","receipt-cent","spool","folder-archive","folder-symlink","columns-3","ban","message-square-x","paint-roller","chevrons-left-right-ellipsis","archive","smartphone","sliders-vertical","building-2","circle-slash-2","sliders-horizontal","cake","cloud-rain","chart-bar","circle-play","wrench","skull","siren","signature","flag-triangle-right","signal-medium","signal-low","bell","keyboard","sigma","music-3","chart-bar-big","user-check","proportions","eject","plane","webhook-off","carrot","square-arrow-left","file-cog","circle-dashed","move-up-right","panels-left-bottom","shopping-bag","mailbox","squares-subtract","shield-user","shield-question-mark","split","list-sort-descending","shield-off","forklift","hand-platter","alarm-clock-minus","heart-x","eraser","book-marked","shield-lock","bluetooth-connected","rotate-ccw-square","chart-no-axes-column","cannabis-off","folder-kanban","shield-keyhole","mars-stroke","shield-half","shield-cog-corner","shield-cog","file-box","shield-check","paint-bucket","glass-water","shield-ban","glasses","piggy-bank","shield","cuboid","cloud-off","check-check","activity","axe","plane-takeoff","shelving-unit","cloud-rain-wind","shell","clipboard","copy-x","file-axis-3d","radical","chart-column-decreasing","share","bug-play","align-vertical-distribute-start","shapes","waves-arrow-up","tally-5","server-crash","server-cog","server","circle-divide","send-horizontal","search-x","search-slash","life-buoy","search-code","cloud-sync","volume-2","battery-charging","russian-ruble","square-arrow-up-left","brick-wall-shield","footprints","scroll","building","screen-share-off","screen-share","list-indent-increase","tag-x","book-alert","link-2","astroid","bell-minus","image-up","closed-caption","drum","arrow-up-z-a","sun","scan-search","pyramid","file-key","monitor-up","scan-face","scissors-line-dashed","scan-barcode","scan","ratio","ticket-check","combine","printer-check","save-off","mountain","mars","picture-in-picture-2","radio-off","flower-2","house-heart","squares-intersect","saudi-riyal","satellite-dish","keyboard-music","star-half","playing-cards-fan","code-xml","pencil-line","mails","brain-cog","tablet","sailboat","pi","trash","book-down","hdmi-port","trailer","case-upper","circle-fading-arrow-up","rows-4","croissant","rows-3","rows-2","barcode","router","route","bed","rectangle-vertical","divide","grape","rotate-cw-fading-clock","party-popper","file-chart-pie","rotate-ccw-clock","rotate-3d","dice-6","roller-coaster","blender","notepad-text","zap-off","square-check-big","link","reply","replace-all","laptop-minimal","replace","repeat-off","map-pin-minus","repeat-2","chart-spline","message-square-more","repeat-1","chart-candlestick","repeat","arrow-down-a-z","remove-formatting","regex","move-horizontal","file-sliders","refrigerator","refresh-cw-off","cup-soda","refresh-cw","power","sword","radio","redo","earth","slice","dice-3","milk","mouse-pointer-ban","crown","circle-slash","circle-star","rotate-cw-square","atom","package-x","bed-double","rectangle-goggles","circle-dot","file-exclamation-point","hand-fist","message-circle-code","folder-git-2","message-square-code","grip","towel-rack","receipt-russian-ruble","arrow-big-left-dash","circle-arrow-right","dumbbell","receipt-japanese-yen","receipt-euro","phone-incoming","scale","rainbow","flashlight","panel-top-open","panel-right-close","radio-receiver","notebook","redo-2","radiation","square-menu","quote","monitor-smartphone","laptop","scan-line","clock-4","square-arrow-up","book-minus","file-question-mark","projector","line-dot-right-horizontal","save-pen","arrow-down-to-line","power-off","refresh-ccw","venetian-mask","calendar-check-2","popsicle","spline","banknote-x","git-pull-request-create-arrow","link-2-off","circle-check","plus","plug","playing-cards","play-off","play","plane-landing","timer-off","arrow-big-right-dash","pin","pill","message-square-diff","backpack","pilcrow-left","pickaxe","piano","circle-alert","mic-signal","arrow-down-right","phone-off","receipt","wifi-zero","phone","flashlight-off","phi","percent","image-off","pentagon","pencil-off","database-arrow-down","pen-off","square-chevron-right","mail-search","heading-2","bone-fracture","pc-case","moon","parasol","paperclip","tally-1","ampersand","ad","shopping-cart","align-vertical-justify-end","panel-top","alarm-smoke","panel-right-open","file-input","clock-8","hand-grab","cloud-cog","blend","hd","radio-tower","list-tree","droplet","panel-left-right-dashed","eye","panel-left-open","panel-left-dashed","banana","gpu","message-square-lock","file-minus-corner","circle-equal","face-slightly-frowning","panel-bottom-close","panel-bottom","panda","text-initial","arrow-up-right","paintbrush-vertical","leafy-green","message-square-dot","file-chart-line","columns-3-cog","package-search","package-plus","minimize-2","package-open","component","cone","package-2","file-image","package","palette","barrel","gallery-thumbnails","orbit","cpu","omega","thumbs-down","merge","hamburger","octagon-pause","hat-glasses","code","octagon-minus","monitor-cog","nut-off","nut","file-video-camera","notepad-text-dashed","kanban","bone","apple","rocking-chair","bot-off","list-collapse","mic","newspaper","circle-arrow-out-up-left","network","cable-car","arrow-down-left","square-activity","navigation","cigarette-off","music-2","message-circle","circle-arrow-out-up-right","car-battery","face-neutral","fold-horizontal","shovel","calendar-1","cloud-moon","square-arrow-out-down-right","move-left","clock-plus","circle-euro","cloud-snow","anvil","arrow-big-up-dash","move-down-right","move-down-left","move-3d","maximize","mouse-pointer","mouse-off","chevrons-down-up","clipboard-plus","circle-x","list-end","lock-keyhole-open","circle-ellipsis","chevrons-right","audio-lines-off","message-square-reply","corner-down-right","cloud-backup","summary","lamp-wall-down","mop","paw-print","ellipsis-vertical","globe-off","square-stop","arrow-up-1-0","align-horizontal-justify-end","scan-heart","align-vertical-distribute-end","heart-crack","airplay","monitor-stop","monitor-speaker","monitor-play","monitor-x","bell-check","database-minus","square-pen","map-pin-plus","monitor-dot","dice-5","octagon","ticket","locate","lock-keyhole","train-front","bookmark","microscope","album","mic-vocal","chart-bar-decreasing","database-plus","calendar-sync","funnel-plus","store","circle-arrow-down","notebook-pen","egg-fried","case-sensitive","message-square-warning","corner-right-up","message-square-text","ruler-dimension-line","user-round-plus","panel-left-close","message-square-heart","pilcrow-right","user-round-minus","message-circle-off","message-circle-heart","mail-plus","message-circle-dashed","message-circle-check","maximize-2","mouse-pointer-2-off","drone","slash","credit-card-x","aperture","arrow-right-left","layout-panel-top","vector-square","circle-gauge","map-pin-x","check","text-search","arrow-down-to-dot","monitor-down","delete","chef-hat","fan","map-pin","file-archive","signal-high","inbox","flip-horizontal-2","bell-off","image-play","align-horizontal-space-between","mail-clock","calendar-check","database-zap","droplets","mail-check","broom","mail-badge","layout-list","file-search","mail","alarm-clock-plus","circle-dollar-sign","usb","house","receipt-pound-sterling","logs","log-in","id-card","mouse","minimize","lock","calculator","galaxy","locate-fixed","book-x","mirror-rectangular","loader-pinwheel","loader-circle","crosshair","headphone-off","asterisk","list-video","octagon-x","languages","lightbulb","alarm-clock-check","guitar","list-music","beer-off","scooter","square-parking-off","notebook-text","arrow-right-to-line","ticket-minus","tally-4","zodiac-taurus","list-checks","door-open","flag-triangle-left","grid-3x3","file","list-check","pocket-knife","book-copy","castle","car-front","clock-alert","reply-all","cloud-moon-rain","clipboard-type","line-style","list-todo","printer-x","calendar-range","list-start","ligature","a-large-small","library-big","leaf","map-plus","layout-grid","layout-freeform","layout-dashboard","database-arrow-up","arrow-right-from-line","flame-kindling","square-power","lasso","bring-to-front","bird","land-plot","bell-plus","lamp-wall-up","lamp-ceiling","lamp","folders","mail-warning","key-square","file-play","kayak","chevrons-left-right","chart-line","file-lock","cast","circle-fading-plus","clock-10","undo-dot","target","list-filter-plus","inspection-panel","drama","info","baseline","martini","contrast","indian-rupee","candy-off","image-plus","book-check","image-minus","book-lock","id-card-lanyard","briefcase-medical","calendars","text-align-start","ice-cream-bowl","hop-off","warehouse","sticky-notes","drafting-compass","save-all","hotel","hospital","highlighter","helicopter","heart-pulse","fishing-rod","book-headphones","credit-card","heart-off","heart-minus","heart","shredder","panel-bottom-open","heading-6","heading-5","credit-card-check","balloon","map-pin-plus-inside","bookmark-x","badge-question-mark","pen","heading-1","candy-cane","haze","hard-hat","gamepad-2","hard-drive-upload","hard-drive-download","external-link","handbag","shield-minus","circle-off","dessert","eclipse","church","hand","cylinder","badge-japanese-yen","hammer","receipt-text","fingerprint-pattern","grid-2x2-check","grid-2x2","globe-x","file-output","disc-album","git-pull-request-draft","arrow-down-0-1","captions","git-pull-request-create","construction","philippine-peso","badge-alert","git-merge-conflict","folder-pen","cross","git-compare","chevron-right","sticky-note-minus","square-arrow-down-left","share-2","git-branch","gift","ghost","gem","gauge","gamepad-directional","chess-pawn","gamepad","briefcase-business","fullscreen","message-circle-reply","folder-up","triangle-right","folder-clock","folder-root","mop-sparkles","type","webhook","compass","align-horizontal-distribute-start","folder-cog","folder-closed","pointer-off","turtle","camera","flask-round","flask-conical-off","git-pull-request","bluetooth-searching","arrow-up-to-line","squircle-dashed","clock-3","badge-percent","face-expressionless","fish","fire-extinguisher","grid-2x2-plus","film","box","file-x-corner","clock-1","file-heart","file-x","space","file-type-corner","file-stack","file-search-corner","corner-up-left","clock-6","zodiac-scorpio","key-round","headphones","tv","file-digit","file-check","rss","file-braces","at-sign","map-pin-check-inside","sticky-note-off","music","handshake","expand","circle-user","copy-plus","euro","equal-approximately","shrink","earth-lock","droplet-off","search-check","clipboard-check","columns-2","dock","disc","align-center-vertical","diff","dices","diamond-minus","cloud-fog","mosque","diameter","map-pin-house","package-check","chevron-first","pencil","currency","list-x","crop","caravan","corner-up-right","corner-right-down","clock-arrow-left","copyright","copyleft","badge-indian-rupee","boxes","redo-dot","container","align-start-horizontal","chart-column-stacked","file-plus","git-pull-request-arrow","computer","decimals-arrow-right","bell-dot","folder-down","coins","club","align-horizontal-space-around","door-closed-locked","cloud-drizzle","diamond","blinds","clock-arrow-right","clock-9","book-search","git-branch-minus","clapperboard","recycle","mountain-snow","luggage","circle-arrow-out-down-left","bot-message-square","phone-outgoing","smartphone-charging","chevrons-down","train-track","chess-bishop","cherry","sticky-note-plus","chart-no-axes-column-increasing","chart-no-axes-column-decreasing","chart-network","chart-no-axes-combined","metronome","case-lower","arrow-down-1-0","credit-card-minus","candy","arrow-left-right","lightbulb-off","panels-top-left","beef-off","locate-off","bug","test-tube","brick-wall","cooking-pot","boom-box","book-up","book-plus","laptop-minimal-check","mail-open","square-function","baggage-claim","variable","arrow-right","archive-restore"},{if getcustomasset and not IS_GETCUSTOMASSET_BROKEN then getcustomasset("lucide-icons/1.png") else "rbxassetid://96002185714923",if getcustomasset and not IS_GETCUSTOMASSET_BROKEN then getcustomasset("lucide-icons/2.png") else "rbxassetid://87698990103132"},{[48]={{1,{24,24},{150,25}},{1,{24,24},{175,450}},{1,{24,24},{825,250}},{1,{24,24},{925,850}},{1,{24,24},{750,200}},{1,{24,24},{100,700}},{1,{24,24},{425,900}},{2,{24,24},{50,300}},{1,{24,24},{50,350}},{1,{24,24},{175,500}},{1,{24,24},{0,900}},{1,{24,24},{50,400}},{1,{24,24},{650,350}},{1,{24,24},{425,425}},{1,{24,24},{25,100}},{1,{24,24},{750,225}},{1,{24,24},{750,525}},{1,{24,24},{500,750}},{1,{24,24},{300,75}},{1,{24,24},{100,325}},{1,{24,24},{250,600}},{1,{24,24},{925,450}},{1,{24,24},{375,625}},{1,{24,24},{500,50}},{1,{24,24},{775,675}},{1,{24,24},{50,375}},{1,{24,24},{125,825}},{1,{24,24},{825,975}},{1,{24,24},{325,425}},{1,{24,24},{300,200}},{1,{24,24},{800,75}},{1,{24,24},{875,400}},{1,{24,24},{200,925}},{1,{24,24},{550,850}},{1,{24,24},{100,750}},{1,{24,24},{425,825}},{1,{24,24},{75,125}},{1,{24,24},{475,500}},{2,{24,24},{0,25}},{1,{24,24},{325,125}},{2,{24,24},{275,150}},{1,{24,24},{475,250}},{1,{24,24},{225,900}},{1,{24,24},{375,350}},{1,{24,24},{550,375}},{1,{24,24},{425,175}},{1,{24,24},{600,550}},{2,{24,24},{150,175}},{1,{24,24},{925,375}},{1,{24,24},{75,350}},{1,{24,24},{525,125}},{1,{24,24},{100,425}},{1,{24,24},{825,300}},{1,{24,24},{925,325}},{1,{24,24},{450,50}},{1,{24,24},{450,450}},{1,{24,24},{500,150}},{1,{24,24},{650,925}},{1,{24,24},{775,825}},{1,{24,24},{925,825}},{1,{24,24},{550,925}},{2,{24,24},{350,75}},{1,{24,24},{600,400}},{1,{24,24},{975,225}},{1,{24,24},{725,125}},{1,{24,24},{225,100}},{1,{24,24},{25,825}},{1,{24,24},{625,925}},{1,{24,24},{300,925}},{1,{24,24},{900,500}},{1,{24,24},{225,750}},{1,{24,24},{75,200}},{1,{24,24},{975,500}},{2,{24,24},{75,25}},{1,{24,24},{200,350}},{2,{24,24},{400,50}},{1,{24,24},{800,400}},{2,{24,24},{275,100}},{1,{24,24},{775,525}},{2,{24,24},{225,0}},{1,{24,24},{225,150}},{1,{24,24},{200,375}},{1,{24,24},{75,100}},{1,{24,24},{700,125}},{1,{24,24},{675,500}},{1,{24,24},{600,450}},{1,{24,24},{200,700}},{1,{24,24},{500,300}},{1,{24,24},{125,125}},{2,{24,24},{150,225}},{1,{24,24},{725,450}},{1,{24,24},{550,300}},{1,{24,24},{275,700}},{1,{24,24},{875,100}},{1,{24,24},{300,900}},{1,{24,24},{0,725}},{1,{24,24},{650,625}},{1,{24,24},{650,125}},{1,{24,24},{225,125}},{1,{24,24},{275,450}},{2,{24,24},{250,75}},{1,{24,24},{25,250}},{1,{24,24},{75,400}},{1,{24,24},{550,600}},{1,{24,24},{900,350}},{1,{24,24},{450,150}},{1,{24,24},{825,175}},{1,{24,24},{100,675}},{2,{24,24},{175,50}},{1,{24,24},{650,325}},{1,{24,24},{350,325}},{1,{24,24},{300,325}},{1,{24,24},{75,325}},{1,{24,24},{950,375}},{1,{24,24},{725,700}},{1,{24,24},{175,25}},{1,{24,24},{575,900}},{1,{24,24},{625,75}},{1,{24,24},{350,900}},{1,{24,24},{25,525}},{1,{24,24},{100,500}},{1,{24,24},{200,200}},{1,{24,24},{800,800}},{1,{24,24},{900,775}},{1,{24,24},{650,150}},{1,{24,24},{600,325}},{1,{24,24},{125,975}},{1,{24,24},{200,800}},{1,{24,24},{875,975}},{1,{24,24},{650,25}},{1,{24,24},{225,875}},{1,{24,24},{400,150}},{1,{24,24},{425,525}},{1,{24,24},{50,175}},{2,{24,24},{75,50}},{1,{24,24},{575,725}},{1,{24,24},{775,0}},{1,{24,24},{25,925}},{2,{24,24},{150,75}},{1,{24,24},{475,300}},{1,{24,24},{50,975}},{1,{24,24},{850,0}},{2,{24,24},{75,250}},{1,{24,24},{650,700}},{1,{24,24},{825,375}},{1,{24,24},{125,0}},{1,{24,24},{75,500}},{1,{24,24},{750,450}},{1,{24,24},{400,425}},{2,{24,24},{325,50}},{1,{24,24},{800,925}},{1,{24,24},{500,125}},{1,{24,24},{975,325}},{2,{24,24},{25,125}},{1,{24,24},{425,150}},{1,{24,24},{175,375}},{1,{24,24},{950,0}},{1,{24,24},{325,375}},{1,{24,24},{800,275}},{1,{24,24},{50,425}},{1,{24,24},{300,375}},{1,{24,24},{625,700}},{1,{24,24},{0,350}},{1,{24,24},{100,250}},{1,{24,24},{750,125}},{1,{24,24},{50,450}},{1,{24,24},{425,275}},{2,{24,24},{300,25}},{1,{24,24},{475,450}},{2,{24,24},{325,25}},{1,{24,24},{250,75}},{1,{24,24},{100,200}},{1,{24,24},{25,150}},{1,{24,24},{950,100}},{1,{24,24},{850,400}},{1,{24,24},{725,750}},{1,{24,24},{500,400}},{1,{24,24},{0,425}},{1,{24,24},{0,125}},{1,{24,24},{825,0}},{1,{24,24},{0,550}},{1,{24,24},{325,850}},{1,{24,24},{500,375}},{1,{24,24},{325,50}},{1,{24,24},{325,975}},{1,{24,24},{775,500}},{1,{24,24},{625,150}},{1,{24,24},{700,250}},{1,{24,24},{425,125}},{1,{24,24},{400,100}},{1,{24,24},{975,575}},{1,{24,24},{250,425}},{2,{24,24},{300,75}},{1,{24,24},{400,200}},{1,{24,24},{350,300}},{1,{24,24},{750,850}},{1,{24,24},{575,625}},{1,{24,24},{750,475}},{1,{24,24},{450,25}},{1,{24,24},{50,75}},{2,{24,24},{25,50}},{1,{24,24},{50,900}},{1,{24,24},{525,775}},{1,{24,24},{925,125}},{1,{24,24},{75,300}},{1,{24,24},{425,700}},{1,{24,24},{350,450}},{1,{24,24},{675,450}},{1,{24,24},{350,575}},{1,{24,24},{700,425}},{1,{24,24},{375,725}},{1,{24,24},{300,875}},{1,{24,24},{50,250}},{1,{24,24},{0,325}},{1,{24,24},{150,125}},{2,{24,24},{125,150}},{1,{24,24},{625,425}},{1,{24,24},{925,250}},{1,{24,24},{225,950}},{1,{24,24},{550,900}},{1,{24,24},{900,0}},{1,{24,24},{200,600}},{1,{24,24},{275,600}},{1,{24,24},{475,275}},{1,{24,24},{100,125}},{1,{24,24},{750,825}},{1,{24,24},{775,400}},{1,{24,24},{625,100}},{1,{24,24},{575,150}},{1,{24,24},{600,650}},{2,{24,24},{125,225}},{1,{24,24},{800,875}},{1,{24,24},{775,350}},{1,{24,24},{400,375}},{1,{24,24},{450,400}},{2,{24,24},{75,225}},{1,{24,24},{275,350}},{2,{24,24},{250,175}},{1,{24,24},{800,100}},{1,{24,24},{775,650}},{1,{24,24},{50,50}},{1,{24,24},{900,575}},{1,{24,24},{750,675}},{1,{24,24},{125,400}},{1,{24,24},{925,575}},{1,{24,24},{400,75}},{1,{24,24},{350,525}},{1,{24,24},{800,350}},{1,{24,24},{575,550}},{1,{24,24},{600,50}},{2,{24,24},{250,25}},{1,{24,24},{900,600}},{1,{24,24},{525,175}},{1,{24,24},{625,475}},{1,{24,24},{75,225}},{1,{24,24},{50,600}},{1,{24,24},{100,575}},{1,{24,24},{200,0}},{1,{24,24},{450,575}},{1,{24,24},{200,450}},{2,{24,24},{350,100}},{1,{24,24},{100,300}},{1,{24,24},{850,375}},{1,{24,24},{200,325}},{1,{24,24},{50,575}},{1,{24,24},{725,525}},{1,{24,24},{0,775}},{1,{24,24},{225,700}},{1,{24,24},{625,625}},{1,{24,24},{75,725}},{1,{24,24},{25,200}},{1,{24,24},{375,225}},{1,{24,24},{50,475}},{1,{24,24},{25,550}},{1,{24,24},{525,575}},{1,{24,24},{750,100}},{1,{24,24},{200,625}},{1,{24,24},{825,700}},{1,{24,24},{900,400}},{1,{24,24},{200,250}},{1,{24,24},{100,925}},{1,{24,24},{875,275}},{1,{24,24},{50,300}},{1,{24,24},{75,650}},{1,{24,24},{675,25}},{1,{24,24},{900,550}},{1,{24,24},{775,325}},{1,{24,24},{700,725}},{1,{24,24},{675,725}},{1,{24,24},{125,75}},{2,{24,24},{125,200}},{1,{24,24},{400,450}},{1,{24,24},{875,775}},{1,{24,24},{975,775}},{1,{24,24},{925,800}},{1,{24,24},{150,400}},{1,{24,24},{100,800}},{1,{24,24},{50,325}},{2,{24,24},{475,0}},{1,{24,24},{0,800}},{1,{24,24},{375,750}},{2,{24,24},{0,450}},{2,{24,24},{25,425}},{1,{24,24},{225,825}},{1,{24,24},{925,150}},{1,{24,24},{300,425}},{1,{24,24},{225,525}},{1,{24,24},{775,75}},{1,{24,24},{200,25}},{1,{24,24},{700,225}},{1,{24,24},{150,675}},{1,{24,24},{100,650}},{2,{24,24},{125,325}},{1,{24,24},{550,825}},{1,{24,24},{250,250}},{1,{24,24},{950,950}},{1,{24,24},{725,200}},{1,{24,24},{625,125}},{1,{24,24},{200,475}},{2,{24,24},{175,275}},{1,{24,24},{450,550}},{2,{24,24},{100,25}},{1,{24,24},{825,100}},{2,{24,24},{200,250}},{1,{24,24},{25,425}},{1,{24,24},{75,950}},{1,{24,24},{250,150}},{2,{24,24},{225,225}},{2,{24,24},{100,200}},{1,{24,24},{75,525}},{1,{24,24},{400,525}},{1,{24,24},{425,325}},{1,{24,24},{175,175}},{1,{24,24},{175,0}},{1,{24,24},{300,225}},{1,{24,24},{750,375}},{1,{24,24},{850,700}},{1,{24,24},{150,300}},{1,{24,24},{975,425}},{1,{24,24},{675,950}},{1,{24,24},{225,350}},{2,{24,24},{300,150}},{1,{24,24},{350,150}},{1,{24,24},{775,200}},{1,{24,24},{450,225}},{1,{24,24},{25,300}},{1,{24,24},{225,925}},{1,{24,24},{275,0}},{2,{24,24},{325,125}},{1,{24,24},{25,750}},{2,{24,24},{375,25}},{1,{24,24},{700,625}},{1,{24,24},{625,725}},{1,{24,24},{75,475}},{1,{24,24},{75,675}},{2,{24,24},{425,25}},{1,{24,24},{775,150}},{1,{24,24},{225,250}},{1,{24,24},{925,750}},{1,{24,24},{850,325}},{1,{24,24},{900,900}},{1,{24,24},{950,525}},{1,{24,24},{875,150}},{1,{24,24},{625,800}},{1,{24,24},{350,825}},{2,{24,24},{25,400}},{2,{24,24},{50,375}},{1,{24,24},{400,875}},{2,{24,24},{100,325}},{1,{24,24},{200,425}},{1,{24,24},{500,25}},{1,{24,24},{100,450}},{1,{24,24},{875,200}},{2,{24,24},{75,350}},{1,{24,24},{775,900}},{1,{24,24},{975,175}},{2,{24,24},{150,275}},{1,{24,24},{225,25}},{1,{24,24},{725,900}},{1,{24,24},{700,325}},{1,{24,24},{400,850}},{1,{24,24},{725,25}},{1,{24,24},{775,950}},{1,{24,24},{600,900}},{2,{24,24},{225,200}},{1,{24,24},{875,675}},{1,{24,24},{75,850}},{2,{24,24},{325,100}},{1,{24,24},{175,525}},{1,{24,24},{125,425}},{1,{24,24},{700,200}},{1,{24,24},{300,50}},{1,{24,24},{725,75}},{1,{24,24},{150,750}},{2,{24,24},{175,250}},{1,{24,24},{525,475}},{1,{24,24},{675,175}},{2,{24,24},{250,100}},{1,{24,24},{425,225}},{1,{24,24},{650,500}},{2,{24,24},{425,0}},{2,{24,24},{400,25}},{1,{24,24},{475,325}},{2,{24,24},{25,375}},{1,{24,24},{175,675}},{2,{24,24},{50,175}},{1,{24,24},{325,625}},{1,{24,24},{200,150}},{2,{24,24},{0,400}},{1,{24,24},{775,700}},{1,{24,24},{975,75}},{1,{24,24},{375,900}},{1,{24,24},{25,950}},{1,{24,24},{225,400}},{1,{24,24},{975,0}},{1,{24,24},{825,150}},{2,{24,24},{100,350}},{2,{24,24},{125,275}},{1,{24,24},{800,775}},{1,{24,24},{50,650}},{1,{24,24},{25,800}},{1,{24,24},{650,750}},{2,{24,24},{100,300}},{1,{24,24},{825,650}},{1,{24,24},{100,725}},{2,{24,24},{150,250}},{1,{24,24},{500,675}},{1,{24,24},{700,25}},{2,{24,24},{25,75}},{1,{24,24},{700,675}},{2,{24,24},{175,225}},{2,{24,24},{200,200}},{1,{24,24},{25,650}},{2,{24,24},{225,175}},{1,{24,24},{550,875}},{1,{24,24},{75,975}},{1,{24,24},{725,375}},{1,{24,24},{275,550}},{2,{24,24},{275,125}},{1,{24,24},{600,150}},{1,{24,24},{25,775}},{2,{24,24},{300,100}},{1,{24,24},{800,950}},{1,{24,24},{675,850}},{1,{24,24},{525,700}},{2,{24,24},{325,75}},{1,{24,24},{250,975}},{2,{24,24},{225,25}},{1,{24,24},{350,650}},{1,{24,24},{425,200}},{2,{24,24},{400,0}},{1,{24,24},{75,450}},{1,{24,24},{100,400}},{1,{24,24},{300,300}},{2,{24,24},{0,375}},{1,{24,24},{475,800}},{1,{24,24},{75,0}},{2,{24,24},{50,325}},{1,{24,24},{725,100}},{2,{24,24},{75,300}},{2,{24,24},{25,350}},{1,{24,24},{175,700}},{1,{24,24},{450,250}},{1,{24,24},{125,500}},{1,{24,24},{250,225}},{2,{24,24},{100,275}},{1,{24,24},{375,300}},{1,{24,24},{150,800}},{1,{24,24},{425,300}},{1,{24,24},{575,650}},{1,{24,24},{75,575}},{2,{24,24},{175,200}},{1,{24,24},{975,450}},{1,{24,24},{700,950}},{1,{24,24},{175,100}},{1,{24,24},{450,500}},{1,{24,24},{200,725}},{1,{24,24},{475,50}},{1,{24,24},{25,400}},{1,{24,24},{675,125}},{1,{24,24},{475,750}},{2,{24,24},{225,150}},{2,{24,24},{125,250}},{2,{24,24},{250,125}},{1,{24,24},{325,750}},{1,{24,24},{600,350}},{1,{24,24},{475,225}},{1,{24,24},{125,750}},{2,{24,24},{125,50}},{2,{24,24},{350,25}},{1,{24,24},{475,975}},{1,{24,24},{825,950}},{1,{24,24},{750,400}},{2,{24,24},{75,175}},{1,{24,24},{25,700}},{1,{24,24},{400,0}},{2,{24,24},{0,350}},{1,{24,24},{900,225}},{1,{24,24},{475,350}},{2,{24,24},{75,275}},{1,{24,24},{525,50}},{1,{24,24},{850,450}},{1,{24,24},{500,600}},{1,{24,24},{150,275}},{1,{24,24},{100,550}},{2,{24,24},{175,175}},{1,{24,24},{100,175}},{1,{24,24},{125,175}},{1,{24,24},{900,25}},{2,{24,24},{200,150}},{1,{24,24},{250,125}},{2,{24,24},{375,50}},{1,{24,24},{250,900}},{1,{24,24},{225,575}},{2,{24,24},{125,100}},{2,{24,24},{275,75}},{2,{24,24},{100,225}},{2,{24,24},{300,50}},{2,{24,24},{100,150}},{1,{24,24},{50,625}},{1,{24,24},{0,175}},{2,{24,24},{0,325}},{2,{24,24},{350,0}},{2,{24,24},{50,275}},{1,{24,24},{0,225}},{1,{24,24},{400,275}},{1,{24,24},{475,100}},{2,{24,24},{50,250}},{1,{24,24},{600,575}},{1,{24,24},{100,275}},{1,{24,24},{0,925}},{1,{24,24},{400,825}},{2,{24,24},{175,150}},{2,{24,24},{200,125}},{2,{24,24},{100,100}},{1,{24,24},{400,725}},{1,{24,24},{150,775}},{2,{24,24},{325,0}},{1,{24,24},{50,275}},{2,{24,24},{0,300}},{2,{24,24},{25,275}},{2,{24,24},{125,175}},{1,{24,24},{275,625}},{1,{24,24},{575,775}},{2,{24,24},{150,150}},{1,{24,24},{425,400}},{1,{24,24},{575,975}},{1,{24,24},{475,900}},{1,{24,24},{700,775}},{2,{24,24},{25,300}},{1,{24,24},{700,600}},{1,{24,24},{200,900}},{2,{24,24},{250,50}},{1,{24,24},{175,75}},{1,{24,24},{825,600}},{1,{24,24},{50,800}},{1,{24,24},{225,850}},{2,{24,24},{50,125}},{1,{24,24},{925,650}},{1,{24,24},{425,375}},{1,{24,24},{625,200}},{1,{24,24},{175,50}},{1,{24,24},{600,750}},{1,{24,24},{450,525}},{2,{24,24},{275,25}},{1,{24,24},{850,675}},{2,{24,24},{300,0}},{1,{24,24},{800,850}},{1,{24,24},{850,225}},{2,{24,24},{0,275}},{1,{24,24},{425,925}},{2,{24,24},{50,225}},{1,{24,24},{525,100}},{2,{24,24},{75,200}},{2,{24,24},{100,175}},{1,{24,24},{25,725}},{2,{24,24},{125,300}},{2,{24,24},{200,75}},{1,{24,24},{775,275}},{2,{24,24},{150,125}},{1,{24,24},{325,350}},{2,{24,24},{225,50}},{1,{24,24},{300,350}},{1,{24,24},{825,825}},{1,{24,24},{800,225}},{1,{24,24},{150,450}},{2,{24,24},{275,0}},{1,{24,24},{700,975}},{2,{24,24},{25,225}},{1,{24,24},{0,0}},{1,{24,24},{175,350}},{1,{24,24},{950,750}},{1,{24,24},{675,250}},{1,{24,24},{575,300}},{1,{24,24},{225,675}},{2,{24,24},{150,100}},{2,{24,24},{175,75}},{2,{24,24},{200,50}},{1,{24,24},{950,75}},{1,{24,24},{275,100}},{1,{24,24},{925,725}},{1,{24,24},{550,325}},{2,{24,24},{250,0}},{1,{24,24},{375,50}},{1,{24,24},{900,475}},{1,{24,24},{25,850}},{1,{24,24},{500,425}},{1,{24,24},{850,775}},{2,{24,24},{75,150}},{1,{24,24},{50,950}},{1,{24,24},{475,25}},{2,{24,24},{0,225}},{1,{24,24},{500,975}},{2,{24,24},{100,125}},{1,{24,24},{750,0}},{2,{24,24},{25,25}},{1,{24,24},{625,975}},{2,{24,24},{0,200}},{1,{24,24},{925,275}},{1,{24,24},{0,275}},{1,{24,24},{100,475}},{2,{24,24},{50,150}},{1,{24,24},{325,800}},{1,{24,24},{575,75}},{2,{24,24},{75,125}},{1,{24,24},{100,525}},{2,{24,24},{175,25}},{1,{24,24},{775,375}},{1,{24,24},{200,650}},{2,{24,24},{0,175}},{1,{24,24},{625,950}},{1,{24,24},{525,325}},{1,{24,24},{75,50}},{1,{24,24},{125,900}},{1,{24,24},{75,750}},{1,{24,24},{175,925}},{1,{24,24},{450,125}},{2,{24,24},{25,150}},{2,{24,24},{75,100}},{1,{24,24},{250,575}},{1,{24,24},{750,575}},{2,{24,24},{150,25}},{1,{24,24},{500,950}},{1,{24,24},{225,450}},{2,{24,24},{375,0}},{1,{24,24},{725,300}},{2,{24,24},{175,0}},{2,{24,24},{0,150}},{2,{24,24},{50,100}},{1,{24,24},{550,500}},{1,{24,24},{150,725}},{1,{24,24},{125,525}},{1,{24,24},{50,0}},{2,{24,24},{75,75}},{1,{24,24},{875,725}},{1,{24,24},{100,100}},{1,{24,24},{625,750}},{1,{24,24},{950,875}},{2,{24,24},{125,25}},{2,{24,24},{0,125}},{1,{24,24},{700,575}},{2,{24,24},{150,0}},{1,{24,24},{975,475}},{1,{24,24},{175,475}},{2,{24,24},{50,75}},{2,{24,24},{0,100}},{1,{24,24},{425,675}},{1,{24,24},{700,75}},{1,{24,24},{650,50}},{1,{24,24},{975,625}},{1,{24,24},{175,875}},{1,{24,24},{400,975}},{1,{24,24},{575,575}},{1,{24,24},{650,275}},{1,{24,24},{325,150}},{1,{24,24},{400,650}},{2,{24,24},{0,50}},{1,{24,24},{100,350}},{2,{24,24},{200,25}},{1,{24,24},{850,475}},{2,{24,24},{75,0}},{2,{24,24},{50,0}},{1,{24,24},{50,925}},{2,{24,24},{0,0}},{1,{24,24},{375,825}},{1,{24,24},{975,950}},{1,{24,24},{350,550}},{1,{24,24},{950,975}},{1,{24,24},{50,875}},{1,{24,24},{975,675}},{1,{24,24},{425,500}},{1,{24,24},{275,725}},{2,{24,24},{150,300}},{1,{24,24},{975,925}},{1,{24,24},{900,975}},{1,{24,24},{25,275}},{1,{24,24},{625,275}},{1,{24,24},{925,950}},{1,{24,24},{975,900}},{1,{24,24},{400,125}},{1,{24,24},{175,750}},{1,{24,24},{300,250}},{1,{24,24},{200,500}},{1,{24,24},{850,825}},{1,{24,24},{850,900}},{1,{24,24},{900,950}},{1,{24,24},{975,50}},{1,{24,24},{275,800}},{1,{24,24},{500,0}},{1,{24,24},{950,900}},{1,{24,24},{425,600}},{1,{24,24},{425,450}},{1,{24,24},{25,975}},{1,{24,24},{750,275}},{1,{24,24},{150,200}},{1,{24,24},{450,0}},{1,{24,24},{50,150}},{1,{24,24},{850,975}},{1,{24,24},{525,900}},{1,{24,24},{200,850}},{1,{24,24},{925,900}},{1,{24,24},{50,500}},{1,{24,24},{850,550}},{1,{24,24},{425,775}},{1,{24,24},{25,350}},{1,{24,24},{450,950}},{1,{24,24},{600,825}},{1,{24,24},{850,950}},{1,{24,24},{925,875}},{1,{24,24},{975,825}},{2,{24,24},{100,50}},{1,{24,24},{850,925}},{1,{24,24},{375,475}},{1,{24,24},{375,200}},{1,{24,24},{875,900}},{1,{24,24},{900,875}},{1,{24,24},{950,825}},{1,{24,24},{975,800}},{1,{24,24},{800,975}},{1,{24,24},{700,275}},{1,{24,24},{775,975}},{1,{24,24},{125,275}},{1,{24,24},{150,600}},{1,{24,24},{925,925}},{1,{24,24},{875,875}},{1,{24,24},{575,750}},{1,{24,24},{675,825}},{1,{24,24},{950,800}},{1,{24,24},{825,900}},{1,{24,24},{300,150}},{1,{24,24},{850,875}},{1,{24,24},{175,225}},{1,{24,24},{750,50}},{1,{24,24},{600,800}},{1,{24,24},{850,25}},{1,{24,24},{625,300}},{1,{24,24},{900,825}},{1,{24,24},{950,775}},{1,{24,24},{800,725}},{1,{24,24},{975,750}},{1,{24,24},{325,25}},{1,{24,24},{150,975}},{1,{24,24},{750,950}},{1,{24,24},{400,50}},{1,{24,24},{400,600}},{1,{24,24},{825,875}},{1,{24,24},{275,325}},{1,{24,24},{500,850}},{1,{24,24},{500,350}},{1,{24,24},{125,950}},{1,{24,24},{525,425}},{1,{24,24},{925,775}},{1,{24,24},{800,900}},{1,{24,24},{975,725}},{1,{24,24},{400,300}},{1,{24,24},{75,425}},{1,{24,24},{100,0}},{1,{24,24},{725,950}},{1,{24,24},{625,450}},{1,{24,24},{825,850}},{1,{24,24},{775,775}},{1,{24,24},{600,775}},{1,{24,24},{375,0}},{1,{24,24},{325,175}},{1,{24,24},{750,925}},{2,{24,24},{0,425}},{1,{24,24},{950,725}},{1,{24,24},{25,0}},{1,{24,24},{600,125}},{1,{24,24},{575,325}},{1,{24,24},{975,700}},{2,{24,24},{25,325}},{1,{24,24},{625,225}},{2,{24,24},{275,175}},{1,{24,24},{775,875}},{1,{24,24},{0,850}},{1,{24,24},{850,800}},{1,{24,24},{200,400}},{1,{24,24},{900,750}},{1,{24,24},{425,725}},{1,{24,24},{525,75}},{1,{24,24},{225,175}},{1,{24,24},{650,975}},{1,{24,24},{700,925}},{1,{24,24},{975,525}},{1,{24,24},{750,875}},{1,{24,24},{275,275}},{1,{24,24},{300,725}},{1,{24,24},{675,225}},{1,{24,24},{775,850}},{1,{24,24},{550,525}},{1,{24,24},{75,375}},{1,{24,24},{400,400}},{1,{24,24},{75,800}},{1,{24,24},{550,150}},{1,{24,24},{325,100}},{1,{24,24},{650,400}},{1,{24,24},{800,825}},{1,{24,24},{825,800}},{1,{24,24},{900,150}},{1,{24,24},{425,25}},{1,{24,24},{575,600}},{1,{24,24},{900,725}},{1,{24,24},{775,50}},{1,{24,24},{925,700}},{1,{24,24},{725,325}},{1,{24,24},{950,675}},{1,{24,24},{975,650}},{1,{24,24},{450,700}},{1,{24,24},{275,225}},{1,{24,24},{500,475}},{1,{24,24},{675,925}},{1,{24,24},{725,675}},{1,{24,24},{625,500}},{1,{24,24},{775,250}},{1,{24,24},{700,900}},{1,{24,24},{500,800}},{1,{24,24},{425,100}},{1,{24,24},{850,750}},{1,{24,24},{900,700}},{1,{24,24},{0,400}},{1,{24,24},{575,450}},{1,{24,24},{225,475}},{1,{24,24},{950,650}},{2,{24,24},{50,50}},{1,{24,24},{200,100}},{1,{24,24},{250,175}},{1,{24,24},{600,975}},{1,{24,24},{950,50}},{1,{24,24},{100,375}},{1,{24,24},{425,800}},{1,{24,24},{175,850}},{1,{24,24},{550,950}},{1,{24,24},{875,650}},{1,{24,24},{625,675}},{1,{24,24},{775,800}},{1,{24,24},{475,75}},{1,{24,24},{825,750}},{1,{24,24},{75,250}},{1,{24,24},{550,75}},{1,{24,24},{225,650}},{1,{24,24},{850,725}},{1,{24,24},{500,200}},{1,{24,24},{775,475}},{1,{24,24},{250,500}},{1,{24,24},{900,675}},{1,{24,24},{525,500}},{1,{24,24},{700,650}},{1,{24,24},{300,550}},{1,{24,24},{150,250}},{1,{24,24},{950,150}},{1,{24,24},{25,225}},{1,{24,24},{250,275}},{1,{24,24},{375,75}},{1,{24,24},{650,675}},{1,{24,24},{525,0}},{1,{24,24},{950,450}},{1,{24,24},{450,775}},{1,{24,24},{875,225}},{1,{24,24},{725,850}},{2,{24,24},{175,125}},{1,{24,24},{400,675}},{1,{24,24},{600,950}},{1,{24,24},{625,650}},{1,{24,24},{975,100}},{1,{24,24},{300,25}},{1,{24,24},{650,900}},{1,{24,24},{100,600}},{1,{24,24},{675,875}},{1,{24,24},{375,975}},{1,{24,24},{125,25}},{1,{24,24},{725,825}},{1,{24,24},{25,175}},{1,{24,24},{150,950}},{1,{24,24},{825,575}},{1,{24,24},{850,575}},{1,{24,24},{950,625}},{1,{24,24},{750,250}},{1,{24,24},{800,750}},{1,{24,24},{675,425}},{1,{24,24},{375,575}},{1,{24,24},{900,50}},{1,{24,24},{825,725}},{1,{24,24},{575,400}},{2,{24,24},{250,200}},{2,{24,24},{300,125}},{1,{24,24},{425,750}},{1,{24,24},{525,200}},{1,{24,24},{475,400}},{1,{24,24},{500,450}},{1,{24,24},{100,625}},{1,{24,24},{75,75}},{1,{24,24},{925,625}},{1,{24,24},{875,125}},{1,{24,24},{550,975}},{1,{24,24},{575,0}},{1,{24,24},{550,400}},{1,{24,24},{125,150}},{1,{24,24},{300,100}},{1,{24,24},{950,250}},{2,{24,24},{25,250}},{1,{24,24},{625,900}},{1,{24,24},{650,875}},{1,{24,24},{75,825}},{1,{24,24},{700,825}},{1,{24,24},{200,275}},{1,{24,24},{675,675}},{1,{24,24},{825,325}},{1,{24,24},{725,775}},{1,{24,24},{875,75}},{1,{24,24},{625,825}},{1,{24,24},{325,600}},{1,{24,24},{700,875}},{1,{24,24},{600,500}},{1,{24,24},{400,775}},{1,{24,24},{900,625}},{1,{24,24},{800,125}},{1,{24,24},{925,600}},{1,{24,24},{950,575}},{1,{24,24},{975,550}},{1,{24,24},{150,150}},{1,{24,24},{50,825}},{1,{24,24},{675,900}},{1,{24,24},{575,925}},{1,{24,24},{625,875}},{1,{24,24},{650,850}},{1,{24,24},{900,850}},{1,{24,24},{900,425}},{1,{24,24},{725,800}},{1,{24,24},{125,775}},{1,{24,24},{450,475}},{1,{24,24},{500,250}},{1,{24,24},{150,225}},{1,{24,24},{250,875}},{1,{24,24},{900,325}},{1,{24,24},{650,0}},{1,{24,24},{75,150}},{1,{24,24},{700,800}},{1,{24,24},{775,725}},{1,{24,24},{550,0}},{1,{24,24},{150,525}},{1,{24,24},{800,700}},{1,{24,24},{375,175}},{1,{24,24},{150,575}},{1,{24,24},{250,350}},{1,{24,24},{275,400}},{2,{24,24},{450,0}},{1,{24,24},{875,625}},{1,{24,24},{950,550}},{1,{24,24},{525,950}},{1,{24,24},{525,375}},{1,{24,24},{600,875}},{1,{24,24},{625,850}},{1,{24,24},{125,300}},{1,{24,24},{500,525}},{1,{24,24},{675,800}},{1,{24,24},{250,925}},{1,{24,24},{350,250}},{2,{24,24},{200,100}},{1,{24,24},{650,650}},{1,{24,24},{225,600}},{1,{24,24},{550,725}},{2,{24,24},{75,325}},{1,{24,24},{0,575}},{1,{24,24},{950,600}},{1,{24,24},{875,0}},{1,{24,24},{25,625}},{1,{24,24},{375,800}},{1,{24,24},{325,900}},{1,{24,24},{925,550}},{1,{24,24},{825,275}},{1,{24,24},{725,925}},{1,{24,24},{575,875}},{1,{24,24},{600,850}},{1,{24,24},{750,775}},{1,{24,24},{775,300}},{1,{24,24},{650,800}},{1,{24,24},{250,675}},{1,{24,24},{425,550}},{1,{24,24},{0,75}},{1,{24,24},{700,300}},{1,{24,24},{50,775}},{1,{24,24},{150,325}},{1,{24,24},{700,750}},{1,{24,24},{175,275}},{1,{24,24},{400,950}},{1,{24,24},{600,25}},{1,{24,24},{250,325}},{1,{24,24},{750,175}},{1,{24,24},{725,725}},{1,{24,24},{350,750}},{1,{24,24},{750,700}},{1,{24,24},{825,625}},{1,{24,24},{800,650}},{1,{24,24},{275,575}},{1,{24,24},{850,600}},{1,{24,24},{925,300}},{1,{24,24},{200,750}},{1,{24,24},{875,575}},{1,{24,24},{175,775}},{1,{24,24},{850,425}},{1,{24,24},{525,925}},{1,{24,24},{200,575}},{1,{24,24},{200,525}},{1,{24,24},{450,175}},{1,{24,24},{25,25}},{1,{24,24},{350,0}},{1,{24,24},{575,700}},{1,{24,24},{925,525}},{1,{24,24},{175,550}},{1,{24,24},{950,500}},{1,{24,24},{300,400}},{1,{24,24},{0,750}},{1,{24,24},{325,525}},{1,{24,24},{450,850}},{1,{24,24},{175,425}},{1,{24,24},{450,975}},{1,{24,24},{25,500}},{1,{24,24},{100,75}},{1,{24,24},{500,925}},{2,{24,24},{250,150}},{1,{24,24},{875,950}},{1,{24,24},{650,775}},{1,{24,24},{675,750}},{1,{24,24},{575,850}},{1,{24,24},{0,650}},{1,{24,24},{800,625}},{1,{24,24},{875,550}},{1,{24,24},{900,525}},{1,{24,24},{525,525}},{1,{24,24},{925,500}},{1,{24,24},{50,675}},{2,{24,24},{200,175}},{1,{24,24},{275,125}},{1,{24,24},{675,700}},{1,{24,24},{750,800}},{1,{24,24},{375,150}},{1,{24,24},{275,650}},{1,{24,24},{425,975}},{1,{24,24},{525,25}},{1,{24,24},{500,900}},{1,{24,24},{475,925}},{1,{24,24},{950,125}},{1,{24,24},{875,925}},{1,{24,24},{425,50}},{1,{24,24},{325,725}},{1,{24,24},{175,150}},{1,{24,24},{225,200}},{1,{24,24},{75,925}},{1,{24,24},{500,225}},{1,{24,24},{500,325}},{1,{24,24},{275,50}},{1,{24,24},{750,975}},{1,{24,24},{700,700}},{1,{24,24},{600,700}},{1,{24,24},{650,225}},{1,{24,24},{300,850}},{1,{24,24},{800,600}},{1,{24,24},{575,825}},{1,{24,24},{875,525}},{1,{24,24},{625,775}},{1,{24,24},{925,400}},{2,{24,24},{0,75}},{1,{24,24},{450,300}},{1,{24,24},{750,550}},{1,{24,24},{450,925}},{1,{24,24},{875,300}},{1,{24,24},{325,775}},{1,{24,24},{900,375}},{1,{24,24},{425,875}},{1,{24,24},{250,650}},{1,{24,24},{425,575}},{1,{24,24},{750,900}},{1,{24,24},{525,850}},{1,{24,24},{575,800}},{1,{24,24},{550,475}},{1,{24,24},{875,800}},{1,{24,24},{450,825}},{1,{24,24},{675,75}},{1,{24,24},{675,575}},{1,{24,24},{800,300}},{1,{24,24},{450,75}},{1,{24,24},{950,850}},{1,{24,24},{650,725}},{1,{24,24},{975,300}},{2,{24,24},{25,175}},{1,{24,24},{300,175}},{1,{24,24},{125,850}},{2,{24,24},{200,0}},{1,{24,24},{550,50}},{1,{24,24},{525,150}},{1,{24,24},{775,600}},{1,{24,24},{325,450}},{1,{24,24},{800,575}},{1,{24,24},{825,550}},{1,{24,24},{375,25}},{1,{24,24},{850,525}},{1,{24,24},{875,500}},{1,{24,24},{425,0}},{1,{24,24},{550,775}},{1,{24,24},{125,675}},{1,{24,24},{950,25}},{1,{24,24},{975,400}},{1,{24,24},{875,375}},{1,{24,24},{125,725}},{1,{24,24},{450,900}},{1,{24,24},{475,875}},{1,{24,24},{300,500}},{1,{24,24},{525,825}},{1,{24,24},{250,200}},{1,{24,24},{650,550}},{2,{24,24},{375,75}},{1,{24,24},{975,600}},{1,{24,24},{300,750}},{1,{24,24},{725,625}},{1,{24,24},{800,550}},{1,{24,24},{225,800}},{1,{24,24},{775,575}},{1,{24,24},{850,500}},{1,{24,24},{650,450}},{1,{24,24},{875,475}},{1,{24,24},{475,150}},{1,{24,24},{450,675}},{1,{24,24},{900,450}},{1,{24,24},{225,375}},{1,{24,24},{825,525}},{1,{24,24},{50,200}},{1,{24,24},{925,425}},{1,{24,24},{950,400}},{1,{24,24},{475,700}},{1,{24,24},{250,625}},{1,{24,24},{975,375}},{1,{24,24},{375,950}},{1,{24,24},{175,600}},{1,{24,24},{350,975}},{1,{24,24},{800,500}},{1,{24,24},{825,925}},{1,{24,24},{350,950}},{1,{24,24},{450,875}},{1,{24,24},{350,475}},{1,{24,24},{825,675}},{1,{24,24},{375,425}},{1,{24,24},{725,425}},{1,{24,24},{750,425}},{1,{24,24},{225,550}},{1,{24,24},{125,550}},{1,{24,24},{75,600}},{1,{24,24},{950,425}},{1,{24,24},{125,200}},{1,{24,24},{975,250}},{1,{24,24},{25,375}},{1,{24,24},{600,725}},{1,{24,24},{625,50}},{1,{24,24},{775,100}},{1,{24,24},{550,425}},{1,{24,24},{925,200}},{1,{24,24},{850,75}},{1,{24,24},{600,525}},{1,{24,24},{725,250}},{2,{24,24},{100,75}},{1,{24,24},{775,550}},{1,{24,24},{250,0}},{1,{24,24},{225,425}},{1,{24,24},{450,375}},{1,{24,24},{825,500}},{1,{24,24},{875,450}},{1,{24,24},{375,875}},{1,{24,24},{925,475}},{1,{24,24},{975,350}},{1,{24,24},{400,500}},{1,{24,24},{375,850}},{1,{24,24},{550,675}},{1,{24,24},{400,900}},{1,{24,24},{700,500}},{1,{24,24},{500,825}},{1,{24,24},{475,825}},{1,{24,24},{825,775}},{1,{24,24},{550,750}},{1,{24,24},{375,775}},{1,{24,24},{200,825}},{1,{24,24},{750,650}},{1,{24,24},{125,575}},{1,{24,24},{700,850}},{1,{24,24},{125,350}},{1,{24,24},{375,500}},{1,{24,24},{675,625}},{1,{24,24},{425,625}},{1,{24,24},{425,950}},{1,{24,24},{200,75}},{1,{24,24},{825,475}},{1,{24,24},{400,925}},{2,{24,24},{100,250}},{1,{24,24},{250,300}},{1,{24,24},{875,425}},{1,{24,24},{775,750}},{1,{24,24},{0,375}},{1,{24,24},{300,650}},{1,{24,24},{350,700}},{1,{24,24},{150,500}},{1,{24,24},{325,950}},{1,{24,24},{350,925}},{1,{24,24},{425,850}},{1,{24,24},{525,750}},{1,{24,24},{500,775}},{1,{24,24},{600,675}},{2,{24,24},{25,100}},{1,{24,24},{200,50}},{1,{24,24},{675,600}},{1,{24,24},{725,550}},{1,{24,24},{550,575}},{1,{24,24},{275,75}},{1,{24,24},{825,450}},{1,{24,24},{925,350}},{1,{24,24},{950,325}},{1,{24,24},{400,250}},{1,{24,24},{950,200}},{1,{24,24},{250,25}},{1,{24,24},{325,925}},{1,{24,24},{675,650}},{2,{24,24},{200,225}},{1,{24,24},{275,975}},{1,{24,24},{425,475}},{1,{24,24},{475,775}},{1,{24,24},{525,725}},{1,{24,24},{150,850}},{1,{24,24},{550,700}},{1,{24,24},{650,600}},{1,{24,24},{75,700}},{1,{24,24},{750,500}},{1,{24,24},{875,700}},{1,{24,24},{925,175}},{1,{24,24},{75,900}},{1,{24,24},{0,450}},{1,{24,24},{800,450}},{1,{24,24},{200,950}},{1,{24,24},{950,300}},{1,{24,24},{975,275}},{1,{24,24},{975,850}},{1,{24,24},{150,50}},{1,{24,24},{0,50}},{1,{24,24},{875,600}},{1,{24,24},{50,125}},{1,{24,24},{350,875}},{1,{24,24},{25,75}},{1,{24,24},{500,725}},{1,{24,24},{675,200}},{1,{24,24},{25,675}},{1,{24,24},{525,450}},{1,{24,24},{400,325}},{1,{24,24},{275,175}},{1,{24,24},{150,825}},{1,{24,24},{375,925}},{1,{24,24},{700,375}},{1,{24,24},{550,275}},{1,{24,24},{600,625}},{1,{24,24},{700,150}},{1,{24,24},{625,600}},{1,{24,24},{650,575}},{1,{24,24},{125,250}},{1,{24,24},{0,950}},{1,{24,24},{475,650}},{1,{24,24},{600,275}},{1,{24,24},{575,100}},{1,{24,24},{575,275}},{1,{24,24},{775,450}},{1,{24,24},{700,525}},{1,{24,24},{800,425}},{1,{24,24},{975,975}},{1,{24,24},{0,300}},{1,{24,24},{875,350}},{1,{24,24},{675,375}},{1,{24,24},{525,600}},{1,{24,24},{150,700}},{1,{24,24},{525,225}},{1,{24,24},{225,975}},{1,{24,24},{250,950}},{1,{24,24},{700,450}},{1,{24,24},{275,925}},{1,{24,24},{375,375}},{1,{24,24},{300,450}},{1,{24,24},{350,850}},{1,{24,24},{700,175}},{1,{24,24},{950,275}},{1,{24,24},{825,400}},{1,{24,24},{350,50}},{1,{24,24},{925,25}},{1,{24,24},{400,800}},{1,{24,24},{500,275}},{1,{24,24},{450,750}},{2,{24,24},{50,25}},{1,{24,24},{975,150}},{1,{24,24},{625,350}},{1,{24,24},{525,675}},{1,{24,24},{200,775}},{1,{24,24},{650,100}},{1,{24,24},{550,650}},{1,{24,24},{525,625}},{1,{24,24},{625,575}},{1,{24,24},{600,600}},{1,{24,24},{0,875}},{1,{24,24},{675,525}},{1,{24,24},{675,350}},{1,{24,24},{475,0}},{1,{24,24},{150,75}},{1,{24,24},{550,800}},{1,{24,24},{125,375}},{1,{24,24},{150,900}},{1,{24,24},{900,250}},{1,{24,24},{850,350}},{1,{24,24},{275,375}},{1,{24,24},{875,325}},{1,{24,24},{450,100}},{1,{24,24},{0,250}},{1,{24,24},{600,925}},{1,{24,24},{900,300}},{1,{24,24},{450,200}},{1,{24,24},{275,900}},{1,{24,24},{650,475}},{1,{24,24},{250,400}},{1,{24,24},{150,425}},{1,{24,24},{600,250}},{1,{24,24},{175,725}},{1,{24,24},{850,625}},{1,{24,24},{325,225}},{1,{24,24},{225,500}},{1,{24,24},{900,650}},{1,{24,24},{450,725}},{1,{24,24},{550,175}},{1,{24,24},{550,125}},{1,{24,24},{125,600}},{1,{24,24},{0,200}},{1,{24,24},{150,100}},{1,{24,24},{525,650}},{1,{24,24},{550,625}},{1,{24,24},{625,550}},{1,{24,24},{250,850}},{1,{24,24},{700,475}},{1,{24,24},{825,350}},{1,{24,24},{25,600}},{1,{24,24},{375,325}},{1,{24,24},{700,0}},{1,{24,24},{125,925}},{1,{24,24},{450,625}},{1,{24,24},{600,75}},{1,{24,24},{550,100}},{1,{24,24},{100,225}},{1,{24,24},{350,775}},{1,{24,24},{675,100}},{1,{24,24},{450,275}},{1,{24,24},{875,850}},{1,{24,24},{400,625}},{1,{24,24},{975,200}},{1,{24,24},{825,425}},{1,{24,24},{175,650}},{1,{24,24},{100,850}},{1,{24,24},{950,700}},{1,{24,24},{175,125}},{1,{24,24},{100,50}},{1,{24,24},{775,625}},{1,{24,24},{125,50}},{1,{24,24},{850,150}},{1,{24,24},{50,25}},{1,{24,24},{325,825}},{1,{24,24},{350,800}},{1,{24,24},{400,750}},{1,{24,24},{275,875}},{1,{24,24},{300,125}},{1,{24,24},{800,0}},{1,{24,24},{650,950}},{1,{24,24},{550,550}},{1,{24,24},{500,650}},{1,{24,24},{325,475}},{1,{24,24},{475,725}},{2,{24,24},{125,0}},{1,{24,24},{475,600}},{1,{24,24},{425,650}},{2,{24,24},{150,50}},{1,{24,24},{200,300}},{1,{24,24},{850,300}},{1,{24,24},{0,100}},{1,{24,24},{925,225}},{1,{24,24},{325,275}},{1,{24,24},{775,25}},{1,{24,24},{500,75}},{1,{24,24},{100,825}},{1,{24,24},{725,975}},{1,{24,24},{375,275}},{1,{24,24},{775,425}},{1,{24,24},{300,525}},{1,{24,24},{575,25}},{1,{24,24},{275,850}},{1,{24,24},{575,200}},{1,{24,24},{300,825}},{1,{24,24},{725,650}},{2,{24,24},{225,100}},{1,{24,24},{675,550}},{1,{24,24},{500,625}},{1,{24,24},{800,475}},{2,{24,24},{275,50}},{1,{24,24},{800,325}},{1,{24,24},{850,275}},{1,{24,24},{975,125}},{1,{24,24},{875,250}},{1,{24,24},{950,175}},{1,{24,24},{275,825}},{1,{24,24},{800,375}},{1,{24,24},{600,225}},{1,{24,24},{850,650}},{1,{24,24},{375,400}},{1,{24,24},{225,0}},{1,{24,24},{275,25}},{1,{24,24},{750,300}},{2,{24,24},{150,200}},{1,{24,24},{475,200}},{1,{24,24},{475,625}},{1,{24,24},{400,225}},{2,{24,24},{25,0}},{1,{24,24},{225,50}},{1,{24,24},{475,675}},{1,{24,24},{600,200}},{1,{24,24},{375,250}},{1,{24,24},{475,375}},{1,{24,24},{450,650}},{1,{24,24},{350,500}},{1,{24,24},{650,825}},{1,{24,24},{925,100}},{1,{24,24},{300,600}},{1,{24,24},{200,225}},{1,{24,24},{125,875}},{1,{24,24},{25,125}},{1,{24,24},{150,925}},{1,{24,24},{225,325}},{1,{24,24},{700,100}},{1,{24,24},{525,300}},{1,{24,24},{175,900}},{1,{24,24},{150,375}},{1,{24,24},{200,875}},{1,{24,24},{800,250}},{1,{24,24},{300,575}},{1,{24,24},{850,250}},{1,{24,24},{75,25}},{1,{24,24},{675,0}},{2,{24,24},{225,75}},{1,{24,24},{325,675}},{1,{24,24},{800,525}},{1,{24,24},{300,775}},{1,{24,24},{350,725}},{1,{24,24},{225,775}},{1,{24,24},{650,525}},{1,{24,24},{675,475}},{1,{24,24},{375,700}},{1,{24,24},{350,200}},{1,{24,24},{25,900}},{1,{24,24},{525,550}},{1,{24,24},{375,125}},{1,{24,24},{625,525}},{1,{24,24},{575,500}},{1,{24,24},{600,475}},{1,{24,24},{250,525}},{1,{24,24},{925,75}},{1,{24,24},{200,125}},{1,{24,24},{675,400}},{1,{24,24},{500,700}},{1,{24,24},{275,750}},{1,{24,24},{450,600}},{1,{24,24},{25,50}},{1,{24,24},{675,300}},{1,{24,24},{900,175}},{1,{24,24},{350,75}},{1,{24,24},{525,875}},{1,{24,24},{725,875}},{1,{24,24},{725,475}},{1,{24,24},{250,50}},{2,{24,24},{100,0}},{1,{24,24},{900,925}},{2,{24,24},{50,400}},{1,{24,24},{250,800}},{1,{24,24},{750,75}},{1,{24,24},{550,350}},{1,{24,24},{800,175}},{1,{24,24},{825,75}},{1,{24,24},{275,775}},{1,{24,24},{300,975}},{1,{24,24},{350,125}},{1,{24,24},{475,125}},{1,{24,24},{125,450}},{1,{24,24},{725,0}},{1,{24,24},{750,600}},{1,{24,24},{250,475}},{1,{24,24},{350,350}},{1,{24,24},{375,675}},{1,{24,24},{725,350}},{1,{24,24},{725,575}},{1,{24,24},{550,25}},{1,{24,24},{750,325}},{1,{24,24},{500,550}},{1,{24,24},{0,25}},{1,{24,24},{575,475}},{1,{24,24},{700,350}},{1,{24,24},{400,700}},{1,{24,24},{825,225}},{1,{24,24},{850,200}},{1,{24,24},{875,175}},{1,{24,24},{50,725}},{1,{24,24},{300,0}},{1,{24,24},{475,425}},{1,{24,24},{875,750}},{1,{24,24},{150,875}},{1,{24,24},{225,300}},{1,{24,24},{350,100}},{1,{24,24},{325,700}},{1,{24,24},{175,250}},{1,{24,24},{375,650}},{1,{24,24},{475,550}},{1,{24,24},{350,675}},{1,{24,24},{300,625}},{1,{24,24},{900,200}},{1,{24,24},{600,425}},{1,{24,24},{450,425}},{1,{24,24},{650,375}},{1,{24,24},{625,25}},{1,{24,24},{50,550}},{1,{24,24},{625,250}},{1,{24,24},{500,100}},{1,{24,24},{500,175}},{1,{24,24},{250,450}},{2,{24,24},{175,100}},{1,{24,24},{975,875}},{1,{24,24},{100,950}},{1,{24,24},{825,200}},{1,{24,24},{650,175}},{1,{24,24},{850,175}},{1,{24,24},{325,75}},{1,{24,24},{300,800}},{1,{24,24},{175,575}},{1,{24,24},{900,125}},{1,{24,24},{300,275}},{1,{24,24},{100,900}},{1,{24,24},{375,100}},{1,{24,24},{175,825}},{1,{24,24},{175,300}},{1,{24,24},{250,750}},{1,{24,24},{275,250}},{1,{24,24},{400,175}},{1,{24,24},{925,975}},{1,{24,24},{300,700}},{1,{24,24},{550,450}},{2,{24,24},{350,50}},{1,{24,24},{775,925}},{1,{24,24},{675,150}},{1,{24,24},{500,875}},{1,{24,24},{475,525}},{1,{24,24},{500,500}},{1,{24,24},{575,425}},{1,{24,24},{625,375}},{1,{24,24},{725,275}},{1,{24,24},{600,300}},{1,{24,24},{275,200}},{1,{24,24},{350,425}},{1,{24,24},{775,225}},{1,{24,24},{800,200}},{1,{24,24},{675,325}},{1,{24,24},{800,675}},{1,{24,24},{725,500}},{1,{24,24},{975,25}},{1,{24,24},{0,975}},{1,{24,24},{450,325}},{1,{24,24},{175,200}},{1,{24,24},{575,525}},{1,{24,24},{225,275}},{1,{24,24},{350,25}},{1,{24,24},{700,550}},{1,{24,24},{100,875}},{1,{24,24},{325,250}},{1,{24,24},{175,800}},{1,{24,24},{250,725}},{1,{24,24},{850,100}},{1,{24,24},{300,675}},{1,{24,24},{325,650}},{1,{24,24},{800,50}},{1,{24,24},{375,600}},{1,{24,24},{675,775}},{1,{24,24},{425,250}},{1,{24,24},{575,225}},{1,{24,24},{325,500}},{1,{24,24},{475,175}},{1,{24,24},{400,575}},{1,{24,24},{125,650}},{1,{24,24},{75,275}},{1,{24,24},{600,375}},{1,{24,24},{725,600}},{1,{24,24},{750,150}},{1,{24,24},{925,50}},{1,{24,24},{850,125}},{1,{24,24},{75,875}},{1,{24,24},{525,350}},{1,{24,24},{175,625}},{1,{24,24},{250,700}},{1,{24,24},{100,150}},{1,{24,24},{175,400}},{1,{24,24},{275,675}},{1,{24,24},{275,475}},{1,{24,24},{450,800}},{1,{24,24},{250,100}},{1,{24,24},{400,550}},{1,{24,24},{575,350}},{1,{24,24},{275,500}},{1,{24,24},{475,475}},{1,{24,24},{75,550}},{1,{24,24},{900,800}},{1,{24,24},{575,950}},{1,{24,24},{475,950}},{1,{24,24},{575,375}},{1,{24,24},{650,300}},{1,{24,24},{675,275}},{1,{24,24},{725,225}},{1,{24,24},{775,175}},{1,{24,24},{825,125}},{1,{24,24},{250,375}},{1,{24,24},{800,150}},{1,{24,24},{325,200}},{1,{24,24},{125,800}},{1,{24,24},{725,400}},{1,{24,24},{375,550}},{2,{24,24},{25,200}},{1,{24,24},{50,850}},{1,{24,24},{525,400}},{1,{24,24},{175,975}},{2,{24,24},{0,250}},{2,{24,24},{50,350}},{1,{24,24},{400,350}},{1,{24,24},{150,0}},{1,{24,24},{925,0}},{1,{24,24},{25,875}},{1,{24,24},{950,350}},{2,{24,24},{125,125}},{1,{24,24},{350,225}},{1,{24,24},{325,575}},{1,{24,24},{375,525}},{1,{24,24},{225,725}},{1,{24,24},{125,325}},{1,{24,24},{325,0}},{1,{24,24},{675,975}},{1,{24,24},{150,550}},{1,{24,24},{25,325}},{1,{24,24},{650,200}},{1,{24,24},{650,250}},{1,{24,24},{725,175}},{1,{24,24},{900,75}},{1,{24,24},{775,125}},{1,{24,24},{25,475}},{1,{24,24},{875,25}},{1,{24,24},{275,425}},{1,{24,24},{725,150}},{1,{24,24},{850,50}},{1,{24,24},{525,975}},{1,{24,24},{100,775}},{1,{24,24},{200,675}},{1,{24,24},{325,550}},{1,{24,24},{550,225}},{1,{24,24},{75,625}},{2,{24,24},{75,375}},{1,{24,24},{625,400}},{1,{24,24},{900,100}},{2,{24,24},{50,200}},{1,{24,24},{825,50}},{1,{24,24},{75,775}},{1,{24,24},{750,625}},{1,{24,24},{225,625}},{1,{24,24},{150,175}},{1,{24,24},{750,350}},{1,{24,24},{875,825}},{1,{24,24},{200,975}},{1,{24,24},{350,625}},{1,{24,24},{825,25}},{1,{24,24},{0,675}},{1,{24,24},{50,700}},{1,{24,24},{0,825}},{1,{24,24},{125,700}},{1,{24,24},{750,725}},{1,{24,24},{375,450}},{1,{24,24},{575,250}},{1,{24,24},{950,475}},{1,{24,24},{575,125}},{1,{24,24},{550,200}},{1,{24,24},{50,750}},{1,{24,24},{150,650}},{1,{24,24},{100,25}},{1,{24,24},{250,550}},{1,{24,24},{275,525}},{1,{24,24},{525,275}},{1,{24,24},{325,400}},{1,{24,24},{950,225}},{1,{24,24},{550,250}},{1,{24,24},{700,400}},{1,{24,24},{325,875}},{1,{24,24},{150,475}},{1,{24,24},{575,675}},{1,{24,24},{150,625}},{1,{24,24},{650,425}},{1,{24,24},{300,475}},{1,{24,24},{50,525}},{1,{24,24},{525,250}},{1,{24,24},{600,175}},{1,{24,24},{675,50}},{1,{24,24},{725,50}},{1,{24,24},{750,25}},{1,{24,24},{125,225}},{1,{24,24},{0,500}},{1,{24,24},{475,850}},{1,{24,24},{200,550}},{1,{24,24},{0,150}},{1,{24,24},{125,475}},{1,{24,24},{400,475}},{1,{24,24},{350,600}},{1,{24,24},{350,400}},{1,{24,24},{625,175}},{1,{24,24},{275,150}},{1,{24,24},{875,50}},{1,{24,24},{575,175}},{1,{24,24},{700,50}},{1,{24,24},{50,100}},{1,{24,24},{800,25}},{1,{24,24},{350,375}},{1,{24,24},{450,350}},{1,{24,24},{225,225}},{1,{24,24},{650,75}},{1,{24,24},{0,700}},{1,{24,24},{0,475}},{1,{24,24},{625,325}},{1,{24,24},{600,100}},{1,{24,24},{525,800}},{1,{24,24},{900,275}},{1,{24,24},{250,825}},{1,{24,24},{325,325}},{1,{24,24},{150,350}},{1,{24,24},{300,950}},{1,{24,24},{750,750}},{1,{24,24},{0,625}},{2,{24,24},{125,75}},{1,{24,24},{325,300}},{1,{24,24},{350,275}},{1,{24,24},{850,850}},{1,{24,24},{625,0}},{1,{24,24},{0,600}},{1,{24,24},{25,575}},{1,{24,24},{575,50}},{1,{24,24},{175,950}},{1,{24,24},{600,0}},{1,{24,24},{75,175}},{1,{24,24},{425,350}},{1,{24,24},{275,300}},{1,{24,24},{50,225}},{1,{24,24},{475,575}},{1,{24,24},{275,950}},{1,{24,24},{400,25}},{1,{24,24},{500,575}},{1,{24,24},{0,525}},{1,{24,24},{950,925}},{1,{24,24},{350,175}},{1,{24,24},{125,625}},{1,{24,24},{175,325}},{1,{24,24},{425,75}},{1,{24,24},{25,450}},{1,{24,24},{250,775}},{1,{24,24},{100,975}},{1,{24,24},{925,675}},{1,{24,24},{200,175}},{2,{24,24},{225,125}},{1,{24,24},{225,75}},{1,{24,24},{125,100}}}}}
		local iconIndices: { string } = icons[1]
		local idIndices: { string } = icons[2]
		local iconRegistry: { [number]: { number | { number } } } = icons[3]
		
		Lucide.Icons = iconIndices
		function Lucide.GetAsset(name: string)
			local size = 48
		
			local iconIndex = table.find(iconIndices, name)
		
			if not iconIndex then
				return nil
			end
		
			local currentDifference = math.huge
			local currentSize = size
		
			for registrySize, _ in iconRegistry do
				local diff = math.abs(size - registrySize)
		
				if diff < currentDifference then
					currentDifference = diff
					currentSize = registrySize
				end
			end
		
			local icon = iconRegistry[currentSize][iconIndex]
			if icon then
				return {
					IconName = name,
					Url = idIndices[icon[1]],
					ImageRectSize = Vector2.new(icon[2][1], icon[2][2]),
					ImageRectOffset = Vector2.new(icon[3][1], icon[3][2]),
				}
			end
		
			return nil
		end
		
		return Lucide
		
	end,
	[30] = function()
		local aa, ab, ac, ad, ae = b(30)
		local af = {
			SingleMotor = ac(ab.SingleMotor),
			GroupMotor = ac(ab.GroupMotor),
			Instant = ac(ab.Instant),
			Linear = ac(ab.Linear),
			Spring = ac(ab.Spring),
			isMotor = ac(ab.isMotor),
		}
		return af
	end,
	[31] = function()
		local aa, ab, ac, ad, ae = b(31)
		local af, ag, ah, ai = game:GetService("RunService"), ac(ab.Parent.Signal), function() end, {}
		ai.__index = ai
		function ai.new()
			return setmetatable({ _onStep = ag.new(), _onStart = ag.new(), _onComplete = ag.new() }, ai)
		end
		function ai.onStep(aj, c)
			return aj._onStep:connect(c)
		end
		function ai.onStart(aj, c)
			return aj._onStart:connect(c)
		end
		function ai.onComplete(aj, c)
			return aj._onComplete:connect(c)
		end
		function ai.start(aj)
			if not aj._connection then
				aj._connection = af.RenderStepped:Connect(function(c)
					aj:step(c)
				end)
			end
		end
		function ai.stop(aj)
			if aj._connection then
				aj._connection:Disconnect()
				aj._connection = nil
			end
		end
		ai.destroy = ai.stop
		ai.step = ah
		ai.getValue = ah
		ai.setGoal = ah
		function ai.__tostring(aj)
			return "Motor"
		end
		return ai
	end,
	[32] = function()
		local aa, ab, ac, ad, ae = b(32)
		return function()
			local af, ag = game:GetService("RunService"), ac(ab.Parent.BaseMotor)
			describe("connection management", function()
				local ah = ag.new()
				it("should hook up connections on :start()", function()
					ah:start()
					expect(typeof(ah._connection)).to.equal("RBXScriptConnection")
				end)
				it("should remove connections on :stop() or :destroy()", function()
					ah:stop()
					expect(ah._connection).to.equal(nil)
				end)
			end)
			it("should call :step() with deltaTime", function()
				local ah, ai = (ag.new())
				function ah.step(aj, ...)
					ai = { ... }
					ah:stop()
				end
				ah:start()
				local aj = af.RenderStepped:Wait()
				af.RenderStepped:Wait()
				expect(ai).to.be.ok()
				expect(ai[1]).to.equal(aj)
			end)
		end
	end,
	[33] = function()
		local aa, ab, ac, ad, ae = b(33)
		local af, ag, ah = ac(ab.Parent.BaseMotor), ac(ab.Parent.SingleMotor), ac(ab.Parent.isMotor)
		local ai = setmetatable({}, af)
		ai.__index = ai
		local aj = function(aj)
			if ah(aj) then
				return aj
			end
			local c = typeof(aj)
			if c == "number" then
				return ag.new(aj, false)
			elseif c == "table" then
				return ai.new(aj, false)
			end
			error(("Unable to convert %q to motor; type %s is unsupported"):format(aj, c), 2)
		end
		function ai.new(c, d)
			assert(c, "Missing argument #1: initialValues")
			assert(typeof(c) == "table", "initialValues must be a table!")
			assert(
				not c.step,
				[[initialValues contains disallowed property "step". Did you mean to put a table of values here?]]
			)
			local e = setmetatable(af.new(), ai)
			if d ~= nil then
				e._useImplicitConnections = d
			else
				e._useImplicitConnections = true
			end
			e._complete = true
			e._motors = {}
			for f, g in pairs(c) do
				e._motors[f] = aj(g)
			end
			return e
		end
		function ai.step(c, d)
			if c._complete then
				return true
			end
			local e = true
			for f, g in pairs(c._motors) do
				local h = g:step(d)
				if not h then
					e = false
				end
			end
			c._onStep:fire(c:getValue())
			if e then
				if c._useImplicitConnections then
					c:stop()
				end
				c._complete = true
				c._onComplete:fire()
			end
			return e
		end
		function ai.setGoal(c, d)
			assert(
				not d.step,
				[[goals contains disallowed property "step". Did you mean to put a table of goals here?]]
			)
			c._complete = false
			c._onStart:fire()
			for e, f in pairs(d) do
				local g = assert(c._motors[e], ("Unknown motor for key %s"):format(e))
				g:setGoal(f)
			end
			if c._useImplicitConnections then
				c:start()
			end
		end
		function ai.getValue(c)
			local d = {}
			for e, f in pairs(c._motors) do
				d[e] = f:getValue()
			end
			return d
		end
		function ai.__tostring(c)
			return "Motor(Group)"
		end
		return ai
	end,
	[34] = function()
		local aa, ab, ac, ad, ae = b(34)
		return function()
			local af, ag, ah = ac(ab.Parent.GroupMotor), ac(ab.Parent.Instant), ac(ab.Parent.Spring)
			it("should complete when all child motors are complete", function()
				local ai = af.new({ A = 1, B = 2 }, false)
				expect(ai._complete).to.equal(true)
				ai:setGoal({ A = ag.new(3), B = ah.new(4, { frequency = 7.5, dampingRatio = 1 }) })
				expect(ai._complete).to.equal(false)
				ai:step(1.6666666666666665E-2)
				expect(ai._complete).to.equal(false)
				for aj = 1, 30 do
					ai:step(1.6666666666666665E-2)
				end
				expect(ai._complete).to.equal(true)
			end)
			it("should start when the goal is set", function()
				local ai, aj = af.new({ A = 0 }, false), false
				ai:onStart(function()
					aj = not aj
				end)
				ai:setGoal({ A = ag.new(1) })
				expect(aj).to.equal(true)
				ai:setGoal({ A = ag.new(1) })
				expect(aj).to.equal(false)
			end)
			it("should properly return all values", function()
				local ai = af.new({ A = 1, B = 2 }, false)
				local aj = ai:getValue()
				expect(aj.A).to.equal(1)
				expect(aj.B).to.equal(2)
			end)
			it("should error when a goal is given to GroupMotor.new", function()
				local ai = pcall(function()
					af.new(ag.new(0))
				end)
				expect(ai).to.equal(false)
			end)
			it([[should error when a single goal is provided to GroupMotor:step]], function()
				local ai = pcall(function()
					af.new({ a = 1 }):setGoal(ag.new(0))
				end)
				expect(ai).to.equal(false)
			end)
		end
	end,
	[35] = function()
		local aa, ab, ac, ad, ae = b(35)
		local af = {}
		af.__index = af
		function af.new(ag)
			return setmetatable({ _targetValue = ag }, af)
		end
		function af.step(ag)
			return { complete = true, value = ag._targetValue }
		end
		return af
	end,
	[36] = function()
		local aa, ab, ac, ad, ae = b(36)
		return function()
			local af = ac(ab.Parent.Instant)
			it("should return a completed state with the provided value", function()
				local ag = af.new(1.23)
				local ah = ag:step(0.1, { value = 0, complete = false })
				expect(ah.complete).to.equal(true)
				expect(ah.value).to.equal(1.23)
			end)
		end
	end,
	[37] = function()
		local aa, ab, ac, ad, ae = b(37)
		local af = {}
		af.__index = af
		function af.new(ag, ah)
			assert(ag, "Missing argument #1: targetValue")
			ah = ah or {}
			return setmetatable({ _targetValue = ag, _velocity = ah.velocity or 1 }, af)
		end
		function af.step(ag, ah, ai)
			local aj, c, d = ah.value, ag._velocity, ag._targetValue
			local e = ai * c
			local f = e >= math.abs(d - aj)
			aj = aj + e * (d > aj and 1 or -1)
			if f then
				aj = ag._targetValue
				c = 0
			end
			return { complete = f, value = aj, velocity = c }
		end
		return af
	end,
	[38] = function()
		local aa, ab, ac, ad, ae = b(38)
		return function()
			local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Linear)
			describe("completed state", function()
				local ah, ai = af.new(0, false), ag.new(1, { velocity = 1 })
				ah:setGoal(ai)
				for aj = 1, 60 do
					ah:step(1.6666666666666665E-2)
				end
				it("should complete", function()
					expect(ah._state.complete).to.equal(true)
				end)
				it("should be exactly the goal value when completed", function()
					expect(ah._state.value).to.equal(1)
				end)
			end)
			describe("uncompleted state", function()
				local ah, ai = af.new(0, false), ag.new(1, { velocity = 1 })
				ah:setGoal(ai)
				for aj = 1, 59 do
					ah:step(1.6666666666666665E-2)
				end
				it("should be uncomplete", function()
					expect(ah._state.complete).to.equal(false)
				end)
			end)
			describe("negative velocity", function()
				local ah, ai = af.new(1, false), ag.new(0, { velocity = 1 })
				ah:setGoal(ai)
				for aj = 1, 60 do
					ah:step(1.6666666666666665E-2)
				end
				it("should complete", function()
					expect(ah._state.complete).to.equal(true)
				end)
				it("should be exactly the goal value when completed", function()
					expect(ah._state.value).to.equal(0)
				end)
			end)
		end
	end,
	[39] = function()
		local aa, ab, ac, ad, ae = b(39)
		local af = {}
		af.__index = af
		function af.new(ag, ah)
			return setmetatable({ signal = ag, connected = true, _handler = ah }, af)
		end
		function af.disconnect(ag)
			if ag.connected then
				ag.connected = false
				for ah, ai in pairs(ag.signal._connections) do
					if ai == ag then
						table.remove(ag.signal._connections, ah)
						return
					end
				end
			end
		end
		local ag = {}
		ag.__index = ag
		function ag.new()
			return setmetatable({ _connections = {}, _threads = {} }, ag)
		end
		function ag.fire(ah, ...)
			for ai, aj in pairs(ah._connections) do
				aj._handler(...)
			end
			for c, d in pairs(ah._threads) do
				coroutine.resume(d, ...)
			end
			ah._threads = {}
		end
		function ag.connect(ah, aj)
			local c = af.new(ah, aj)
			table.insert(ah._connections, c)
			return c
		end
		function ag.wait(ah)
			table.insert(ah._threads, coroutine.running())
			return coroutine.yield()
		end
		return ag
	end,
	[40] = function()
		local aa, ab, ac, ad, ae = b(40)
		return function()
			local af = ac(ab.Parent.Signal)
			it("should invoke all connections, instantly", function()
				local ag, ah, aj = (af.new())
				ag:connect(function(c)
					ah = c
				end)
				ag:connect(function(c)
					aj = c
				end)
				ag:fire("hello")
				expect(ah).to.equal("hello")
				expect(aj).to.equal("hello")
			end)
			it("should return values when :wait() is called", function()
				local ag = af.new()
				spawn(function()
					ag:fire(123, "hello")
				end)
				local ah, aj = ag:wait()
				expect(ah).to.equal(123)
				expect(aj).to.equal("hello")
			end)
			it("should properly handle disconnections", function()
				local ag, ah = af.new(), false
				local aj = ag:connect(function()
					ah = true
				end)
				aj:disconnect()
				ag:fire()
				expect(ah).to.equal(false)
			end)
		end
	end,
	[41] = function()
		local aa, ab, ac, ad, ae = b(41)
		local af = ac(ab.Parent.BaseMotor)
		local ag = setmetatable({}, af)
		ag.__index = ag
		function ag.new(ah, aj)
			assert(ah, "Missing argument #1: initialValue")
			assert(typeof(ah) == "number", "initialValue must be a number!")
			local c = setmetatable(af.new(), ag)
			if aj ~= nil then
				c._useImplicitConnections = aj
			else
				c._useImplicitConnections = true
			end
			c._goal = nil
			c._state = { complete = true, value = ah }
			return c
		end
		function ag.step(ah, aj)
			if ah._state.complete then
				return true
			end
			local c = ah._goal:step(ah._state, aj)
			ah._state = c
			ah._onStep:fire(c.value)
			if c.complete then
				if ah._useImplicitConnections then
					ah:stop()
				end
				ah._onComplete:fire()
			end
			return c.complete
		end
		function ag.getValue(ah)
			return ah._state.value
		end
		function ag.setGoal(ah, aj)
			ah._state.complete = false
			ah._goal = aj
			ah._onStart:fire()
			if ah._useImplicitConnections then
				ah:start()
			end
		end
		function ag.__tostring(ah)
			return "Motor(Single)"
		end
		return ag
	end,
	[42] = function()
		local aa, ab, ac, ad, ae = b(42)
		return function()
			local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Instant)
			it("should assign new state on step", function()
				local ah = af.new(0, false)
				ah:setGoal(ag.new(5))
				ah:step(1.6666666666666665E-2)
				expect(ah._state.complete).to.equal(true)
				expect(ah._state.value).to.equal(5)
			end)
			it([[should invoke onComplete listeners when the goal is completed]], function()
				local ah, aj = af.new(0, false), false
				ah:onComplete(function()
					aj = true
				end)
				ah:setGoal(ag.new(5))
				ah:step(1.6666666666666665E-2)
				expect(aj).to.equal(true)
			end)
			it("should start when the goal is set", function()
				local ah, aj = af.new(0, false), false
				ah:onStart(function()
					aj = not aj
				end)
				ah:setGoal(ag.new(5))
				expect(aj).to.equal(true)
				ah:setGoal(ag.new(5))
				expect(aj).to.equal(false)
			end)
		end
	end,
	[43] = function()
		local aa, ab, ac, ad, ae = b(43)
		local af, ag, ah, aj = 0.001, 0.001, 0.0001, {}
		aj.__index = aj
		function aj.new(c, d)
			assert(c, "Missing argument #1: targetValue")
			d = d or {}
			return setmetatable(
				{ _targetValue = c, _frequency = d.frequency or 4, _dampingRatio = d.dampingRatio or 1 },
				aj
			)
		end
		function aj.step(c, d, e)
			local f, g, h, i, j = c._dampingRatio, c._frequency * 2 * math.pi, c._targetValue, d.value, d.velocity or 0
			local k, l, m, n = i - h, (math.exp(-f * g * e))
			if f == 1 then
				m = (k * (1 + g * e) + j * e) * l + h
				n = (j * (1 - g * e) - k * (g * g * e)) * l
			elseif f < 1 then
				local o = math.sqrt(1 - f * f)
				local p, s, t = math.cos(g * o * e), (math.sin(g * o * e))
				if o > ah then
					t = s / o
				else
					local u = e * g
					t = u + ((u * u) * (o * o) * (o * o) / 20 - o * o) * (u * u * u) / 6
				end
				local u
				if g * o > ah then
					u = s / (g * o)
				else
					local v = g * o
					u = e + ((e * e) * (v * v) * (v * v) / 20 - v * v) * (e * e * e) / 6
				end
				m = (k * (p + f * t) + j * u) * l + h
				n = (j * (p - t * f) - k * (t * g)) * l
			else
				local o = math.sqrt(f * f - 1)
				local p, s = -g * (f - o), -g * (f + o)
				local t = (j - k * p) / (2 * g * o)
				local u = k - t
				local v, w = u * math.exp(p * e), t * math.exp(s * e)
				m = v + w + h
				n = v * p + w * s
			end
			local o = math.abs(n) < af and math.abs(m - h) < ag
			return { complete = o, value = o and h or m, velocity = n }
		end
		return aj
	end,
	[44] = function()
		local aa, ab, ac, ad, ae = b(44)
		return function()
			local af, ag = ac(ab.Parent.SingleMotor), ac(ab.Parent.Spring)
			describe("completed state", function()
				local ah, aj = af.new(0, false), ag.new(1, { frequency = 2, dampingRatio = 0.75 })
				ah:setGoal(aj)
				for c = 1, 100 do
					ah:step(1.6666666666666665E-2)
				end
				it("should complete", function()
					expect(ah._state.complete).to.equal(true)
				end)
				it("should be exactly the goal value when completed", function()
					expect(ah._state.value).to.equal(1)
				end)
			end)
			it("should inherit velocity", function()
				local ah = af.new(0, false)
				ah._state = { complete = false, value = 0, velocity = -5 }
				local aj = ag.new(1, { frequency = 2, dampingRatio = 1 })
				ah:setGoal(aj)
				ah:step(1.6666666666666665E-2)
				expect(ah._state.velocity < 0).to.equal(true)
			end)
		end
	end,
	[45] = function()
		local aa, ab, ac, ad, ae = b(45)
		local af = function(af)
			local ag = tostring(af):match("^Motor%((.+)%)$")
			if ag then
				return true, ag
			else
				return false
			end
		end
		return af
	end,
	[46] = function()
		local aa, ab, ac, ad, ae = b(46)
		return function()
			local af, ag, ah = ac(ab.Parent.isMotor), ac(ab.Parent.SingleMotor), ac(ab.Parent.GroupMotor)
			local aj, c = ag.new(0), ah.new({})
			it("should properly detect motors", function()
				expect(af(aj)).to.equal(true)
				expect(af(c)).to.equal(true)
			end)
			it("shouldn't detect things that aren't motors", function()
				expect(af({})).to.equal(false)
			end)
			it("should return the proper motor type", function()
				local d, e = af(aj)
				local f, g = af(c)
				expect(e).to.equal("Single")
				expect(g).to.equal("Group")
			end)
		end
	end,
	[47] = function()
		local aa, ab, ac, ad, ae = b(47)
		local af = { Names = { "Dark", "Darker", "Light", "Aqua", "Amethyst", "Rose" } }
		for ag, ah in next, ab:GetChildren() do
			local aj = ac(ah)
			af[aj.Name] = aj
		end
		return af
	end,
	[48] = function()
		local aa, ab, ac, ad, ae = b(48)
		return {
			Name = "Amethyst",
			Accent = Color3.fromRGB(97, 62, 167),
			AcrylicMain = Color3.fromRGB(20, 20, 20),
			AcrylicBorder = Color3.fromRGB(110, 90, 130),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(85, 57, 139), Color3.fromRGB(40, 25, 65)),
			AcrylicNoise = 0.92,
			TitleBarLine = Color3.fromRGB(95, 75, 110),
			Tab = Color3.fromRGB(160, 140, 180),
			Element = Color3.fromRGB(140, 120, 160),
			ElementBorder = Color3.fromRGB(60, 50, 70),
			InElementBorder = Color3.fromRGB(100, 90, 110),
			ElementTransparency = 0.87,
			ToggleSlider = Color3.fromRGB(140, 120, 160),
			ToggleToggled = Color3.fromRGB(0, 0, 0),
			SliderRail = Color3.fromRGB(140, 120, 160),
			DropdownFrame = Color3.fromRGB(170, 160, 200),
			DropdownHolder = Color3.fromRGB(60, 45, 80),
			DropdownBorder = Color3.fromRGB(50, 40, 65),
			DropdownOption = Color3.fromRGB(140, 120, 160),
			Keybind = Color3.fromRGB(140, 120, 160),
			Input = Color3.fromRGB(140, 120, 160),
			InputFocused = Color3.fromRGB(20, 10, 30),
			InputIndicator = Color3.fromRGB(170, 150, 190),
			Dialog = Color3.fromRGB(60, 45, 80),
			DialogHolder = Color3.fromRGB(45, 30, 65),
			DialogHolderLine = Color3.fromRGB(40, 25, 60),
			DialogButton = Color3.fromRGB(60, 45, 80),
			DialogButtonBorder = Color3.fromRGB(95, 80, 110),
			DialogBorder = Color3.fromRGB(85, 70, 100),
			DialogInput = Color3.fromRGB(70, 55, 85),
			DialogInputLine = Color3.fromRGB(175, 160, 190),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(170, 170, 170),
			Hover = Color3.fromRGB(140, 120, 160),
			HoverChange = 0.04,
		}
	end,
	[49] = function()
		local aa, ab, ac, ad, ae = b(49)
		return {
			Name = "Aqua",
			Accent = Color3.fromRGB(60, 165, 165),
			AcrylicMain = Color3.fromRGB(20, 20, 20),
			AcrylicBorder = Color3.fromRGB(50, 100, 100),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(60, 140, 140), Color3.fromRGB(40, 80, 80)),
			AcrylicNoise = 0.92,
			TitleBarLine = Color3.fromRGB(60, 120, 120),
			Tab = Color3.fromRGB(140, 180, 180),
			Element = Color3.fromRGB(110, 160, 160),
			ElementBorder = Color3.fromRGB(40, 70, 70),
			InElementBorder = Color3.fromRGB(80, 110, 110),
			ElementTransparency = 0.84,
			ToggleSlider = Color3.fromRGB(110, 160, 160),
			ToggleToggled = Color3.fromRGB(0, 0, 0),
			SliderRail = Color3.fromRGB(110, 160, 160),
			DropdownFrame = Color3.fromRGB(160, 200, 200),
			DropdownHolder = Color3.fromRGB(40, 80, 80),
			DropdownBorder = Color3.fromRGB(40, 65, 65),
			DropdownOption = Color3.fromRGB(110, 160, 160),
			Keybind = Color3.fromRGB(110, 160, 160),
			Input = Color3.fromRGB(110, 160, 160),
			InputFocused = Color3.fromRGB(20, 10, 30),
			InputIndicator = Color3.fromRGB(130, 170, 170),
			Dialog = Color3.fromRGB(40, 80, 80),
			DialogHolder = Color3.fromRGB(30, 60, 60),
			DialogHolderLine = Color3.fromRGB(25, 50, 50),
			DialogButton = Color3.fromRGB(40, 80, 80),
			DialogButtonBorder = Color3.fromRGB(80, 110, 110),
			DialogBorder = Color3.fromRGB(50, 100, 100),
			DialogInput = Color3.fromRGB(45, 90, 90),
			DialogInputLine = Color3.fromRGB(130, 170, 170),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(170, 170, 170),
			Hover = Color3.fromRGB(110, 160, 160),
			HoverChange = 0.04,
		}
	end,
	[50] = function()
		local aa, ab, ac, ad, ae = b(50)
		return {
			Name = "Dark",
			Accent = Color3.fromRGB(96, 205, 255),
			AcrylicMain = Color3.fromRGB(60, 60, 60),
			AcrylicBorder = Color3.fromRGB(90, 90, 90),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(40, 40, 40)),
			AcrylicNoise = 0.9,
			TitleBarLine = Color3.fromRGB(75, 75, 75),
			Tab = Color3.fromRGB(120, 120, 120),
			Element = Color3.fromRGB(120, 120, 120),
			ElementBorder = Color3.fromRGB(35, 35, 35),
			InElementBorder = Color3.fromRGB(90, 90, 90),
			ElementTransparency = 0.87,
			ToggleSlider = Color3.fromRGB(120, 120, 120),
			ToggleToggled = Color3.fromRGB(0, 0, 0),
			SliderRail = Color3.fromRGB(120, 120, 120),
			DropdownFrame = Color3.fromRGB(160, 160, 160),
			DropdownHolder = Color3.fromRGB(45, 45, 45),
			DropdownBorder = Color3.fromRGB(35, 35, 35),
			DropdownOption = Color3.fromRGB(120, 120, 120),
			Keybind = Color3.fromRGB(120, 120, 120),
			Input = Color3.fromRGB(160, 160, 160),
			InputFocused = Color3.fromRGB(10, 10, 10),
			InputIndicator = Color3.fromRGB(150, 150, 150),
			Dialog = Color3.fromRGB(45, 45, 45),
			DialogHolder = Color3.fromRGB(35, 35, 35),
			DialogHolderLine = Color3.fromRGB(30, 30, 30),
			DialogButton = Color3.fromRGB(45, 45, 45),
			DialogButtonBorder = Color3.fromRGB(80, 80, 80),
			DialogBorder = Color3.fromRGB(70, 70, 70),
			DialogInput = Color3.fromRGB(55, 55, 55),
			DialogInputLine = Color3.fromRGB(160, 160, 160),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(170, 170, 170),
			Hover = Color3.fromRGB(120, 120, 120),
			HoverChange = 0.07,
		}
	end,
	[51] = function()
		local aa, ab, ac, ad, ae = b(51)
		return {
			Name = "Darker",
			Accent = Color3.fromRGB(72, 138, 182),
			AcrylicMain = Color3.fromRGB(30, 30, 30),
			AcrylicBorder = Color3.fromRGB(60, 60, 60),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(15, 15, 15)),
			AcrylicNoise = 0.94,
			TitleBarLine = Color3.fromRGB(65, 65, 65),
			Tab = Color3.fromRGB(100, 100, 100),
			Element = Color3.fromRGB(70, 70, 70),
			ElementBorder = Color3.fromRGB(25, 25, 25),
			InElementBorder = Color3.fromRGB(55, 55, 55),
			ElementTransparency = 0.82,
			DropdownFrame = Color3.fromRGB(120, 120, 120),
			DropdownHolder = Color3.fromRGB(35, 35, 35),
			DropdownBorder = Color3.fromRGB(25, 25, 25),
			Dialog = Color3.fromRGB(35, 35, 35),
			DialogHolder = Color3.fromRGB(25, 25, 25),
			DialogHolderLine = Color3.fromRGB(20, 20, 20),
			DialogButton = Color3.fromRGB(35, 35, 35),
			DialogButtonBorder = Color3.fromRGB(55, 55, 55),
			DialogBorder = Color3.fromRGB(50, 50, 50),
			DialogInput = Color3.fromRGB(45, 45, 45),
			DialogInputLine = Color3.fromRGB(120, 120, 120),
		}
	end,
	[52] = function()
		local aa, ab, ac, ad, ae = b(52)
		return {
			Name = "Light",
			Accent = Color3.fromRGB(0, 103, 192),
			AcrylicMain = Color3.fromRGB(200, 200, 200),
			AcrylicBorder = Color3.fromRGB(120, 120, 120),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 255, 255)),
			AcrylicNoise = 0.96,
			TitleBarLine = Color3.fromRGB(160, 160, 160),
			Tab = Color3.fromRGB(90, 90, 90),
			Element = Color3.fromRGB(255, 255, 255),
			ElementBorder = Color3.fromRGB(180, 180, 180),
			InElementBorder = Color3.fromRGB(150, 150, 150),
			ElementTransparency = 0.65,
			ToggleSlider = Color3.fromRGB(40, 40, 40),
			ToggleToggled = Color3.fromRGB(255, 255, 255),
			SliderRail = Color3.fromRGB(40, 40, 40),
			DropdownFrame = Color3.fromRGB(200, 200, 200),
			DropdownHolder = Color3.fromRGB(240, 240, 240),
			DropdownBorder = Color3.fromRGB(200, 200, 200),
			DropdownOption = Color3.fromRGB(150, 150, 150),
			Keybind = Color3.fromRGB(120, 120, 120),
			Input = Color3.fromRGB(200, 200, 200),
			InputFocused = Color3.fromRGB(100, 100, 100),
			InputIndicator = Color3.fromRGB(80, 80, 80),
			Dialog = Color3.fromRGB(255, 255, 255),
			DialogHolder = Color3.fromRGB(240, 240, 240),
			DialogHolderLine = Color3.fromRGB(228, 228, 228),
			DialogButton = Color3.fromRGB(255, 255, 255),
			DialogButtonBorder = Color3.fromRGB(190, 190, 190),
			DialogBorder = Color3.fromRGB(140, 140, 140),
			DialogInput = Color3.fromRGB(250, 250, 250),
			DialogInputLine = Color3.fromRGB(160, 160, 160),
			Text = Color3.fromRGB(0, 0, 0),
			SubText = Color3.fromRGB(40, 40, 40),
			Hover = Color3.fromRGB(50, 50, 50),
			HoverChange = 0.16,
		}
	end,
	[53] = function()
		local aa, ab, ac, ad, ae = b(53)
		return {
			Name = "Rose",
			Accent = Color3.fromRGB(180, 55, 90),
			AcrylicMain = Color3.fromRGB(40, 40, 40),
			AcrylicBorder = Color3.fromRGB(130, 90, 110),
			AcrylicGradient = ColorSequence.new(Color3.fromRGB(190, 60, 135), Color3.fromRGB(165, 50, 70)),
			AcrylicNoise = 0.92,
			TitleBarLine = Color3.fromRGB(140, 85, 105),
			Tab = Color3.fromRGB(180, 140, 160),
			Element = Color3.fromRGB(200, 120, 170),
			ElementBorder = Color3.fromRGB(110, 70, 85),
			InElementBorder = Color3.fromRGB(120, 90, 90),
			ElementTransparency = 0.86,
			ToggleSlider = Color3.fromRGB(200, 120, 170),
			ToggleToggled = Color3.fromRGB(0, 0, 0),
			SliderRail = Color3.fromRGB(200, 120, 170),
			DropdownFrame = Color3.fromRGB(200, 160, 180),
			DropdownHolder = Color3.fromRGB(120, 50, 75),
			DropdownBorder = Color3.fromRGB(90, 40, 55),
			DropdownOption = Color3.fromRGB(200, 120, 170),
			Keybind = Color3.fromRGB(200, 120, 170),
			Input = Color3.fromRGB(200, 120, 170),
			InputFocused = Color3.fromRGB(20, 10, 30),
			InputIndicator = Color3.fromRGB(170, 150, 190),
			Dialog = Color3.fromRGB(120, 50, 75),
			DialogHolder = Color3.fromRGB(95, 40, 60),
			DialogHolderLine = Color3.fromRGB(90, 35, 55),
			DialogButton = Color3.fromRGB(120, 50, 75),
			DialogButtonBorder = Color3.fromRGB(155, 90, 115),
			DialogBorder = Color3.fromRGB(100, 70, 90),
			DialogInput = Color3.fromRGB(135, 55, 80),
			DialogInputLine = Color3.fromRGB(190, 160, 180),
			Text = Color3.fromRGB(240, 240, 240),
			SubText = Color3.fromRGB(170, 170, 170),
			Hover = Color3.fromRGB(200, 120, 170),
			HoverChange = 0.04,
		}
	end,
}
local Fluent
do
	local ab, ac, ad, ae, af, ag, ah, aj, c, e, f, g, h, i, j, k =
		task,
		setmetatable,
		error,
		newproxy,
		getmetatable,
		next,
		table,
		unpack,
		coroutine,
		script,
		type,
		require,
		pcall,
		getfenv,
		setfenv,
		rawget
	local l, m, n, o, p, s, t, u, v, w, x =
		ah.insert, ah.remove, ah.freeze or function(l)
			return l
		end, ab and ab.defer or function(l, ...)
			local m = c.create(l)
			c.resume(m, ...)
			return m
		end, "0.0.0-venv", {}, {}, {}, {}, {}, {}
	local y, z =
		{
			GetChildren = function(y)
				local z, A = x[y], {}
				for B in ag, z do
					l(A, B)
				end
				return A
			end,
			FindFirstChild = function(y, z)
				if not z then
					ad("Argument 1 missing or nil", 2)
				end
				for A in ag, x[y] do
					if A.Name == z then
						return A
					end
				end
				return
			end,
			GetFullName = function(y)
				local z, A = y.Name, y.Parent
				while A do
					z = A.Name .. "." .. z
					A = A.Parent
				end
				return "VirtualEnv." .. z
			end,
		}, {}
	for A, B in ag, y do
		z[A] = function(C, ...)
			if not x[C] then
				ad("Expected ':' not '.' calling member function " .. A, 1)
			end
			return B(C, ...)
		end
	end
	local C = function(C, D, E)
		local F, G, H, I, J =
			ac({}, { __mode = "k" }), function(F)
				ad(F .. " is not a valid (virtual) member of " .. C .. ' "' .. D .. '"', 1)
			end, function(F)
				ad("Unable to assign (virtual) property " .. F .. ". Property is read only", 1)
			end, (ae(true))
		local K = af(I)
		K.__index = function(L, M)
			if M == "ClassName" then
				return C
			elseif M == "Name" then
				return D
			elseif M == "Parent" then
				return E
			elseif C == "StringValue" and M == "Value" then
				return J
			else
				local N = z[M]
				if N then
					return N
				end
			end
			for N in ag, F do
				if N.Name == M then
					return N
				end
			end
			G(M)
		end
		K.__newindex = function(L, M, N)
			if M == "ClassName" then
				H(M)
			elseif M == "Name" then
				D = N
			elseif M == "Parent" then
				if N == I then
					return
				end
				if E ~= nil then
					x[E][I] = nil
				end
				E = N
				if N ~= nil then
					x[N][I] = true
				end
			elseif C == "StringValue" and M == "Value" then
				J = N
			else
				G(M)
			end
		end
		K.__tostring = function()
			return D
		end
		x[I] = F
		if E ~= nil then
			x[E][I] = true
		end
		return I
	end
	local function D(E, F)
		local G, H, I, J = E[1], E[2], E[3], E[4]
		local K = m(I, 1)
		local L = C(H, K, F)
		s[G] = L
		if I then
			for M, N in ag, I do
				L[M] = N
			end
		end
		if J then
			for M, N in ag, J do
				D(N, L)
			end
		end
		return L
	end
	local E = {}
	for F, G in ag, a do
		l(E, D(G))
	end
	for H, I in ag, aa do
		local J = s[H]
		t[J] = I
		local K = J.ClassName
		if K == "LocalScript" or K == "Script" then
			l(v, J)
		end
	end
	local J = function(J)
		local K, L = J.ClassName, u[J]
		if L and K == "ModuleScript" then
			return aj(L)
		end
		local M = t[J]
		if not M then
			return
		end
		if K == "LocalScript" or K == "Script" then
			M()
			return
		else
			local N = { M() }
			u[J] = N
			return aj(N)
		end
	end
	function b(K)
		local L = s[K]
		local M = t[L]
		if not M then
			return
		end
		local N, O, P, Q, R, S, T =
			false, n({
				Version = p,
				Script = e,
				Shared = w,
				GetScript = function()
					return e
				end,
				GetShared = function()
					return w
				end,
			}), L, function(N, ...)
				if x[N] and N.ClassName == "ModuleScript" and t[N] then
					return J(N)
				end
				return g(N, ...)
			end
		local U, V =
			function(U, ...)
				if not N then
					T()
				end
				if f(U) == "number" and U >= 0 then
					if U == 0 then
						return S
					else
						U = U + 1
						local V, W = h(i, U)
						if V and W == R then
							return S
						end
					end
				end
				return i(U, ...)
			end, function(U, V, ...)
				if not N then
					T()
				end
				if f(U) == "number" and U >= 0 then
					if U == 0 then
						return j(S, V)
					else
						U = U + 1
						local W, X = h(i, U)
						if W and X == R then
							return j(S, V)
						end
					end
				end
				return j(U, V, ...)
			end
		function T()
			R = i(0)
			local W = { maui = O, script = P, require = Q, getfenv = U, setfenv = V }
			S = ac({}, {
				__index = function(X, Y)
					local Z = k(S, Y)
					if Z ~= nil then
						return Z
					end
					local _ = W[Y]
					if _ ~= nil then
						return _
					end
					return R[Y]
				end,
			})
			j(M, S)
			N = true
		end
		return O, P, Q, U, V
	end
	for K, L in ag, v do
		o(J, L)
	end
	do
		local M
		for N, O in ag, E do
			if O.ClassName == "ModuleScript" and O.Name == "MainModule" then
				M = O
				break
			end
		end
		if M then
			Fluent = J(M)
		end
	end
end

return Fluent

