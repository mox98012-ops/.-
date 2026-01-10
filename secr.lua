--!nocheck
--!optimize 2
game:GetService("Players").LocalPlayer:WaitForChild("DataLoadedClient");
game:GetService("Players").LocalPlayer:WaitForChild("DataLoaded");
game:GetService("Players").LocalPlayer:WaitForChild("CharacterLoaded");
if not game:IsLoaded() then
	game.Loaded:Wait()
end

if getgenv().serenium_LOADED then
	return
end

getgenv().serenium_LOADED = true

if not LPH_OBFUSCATED then
	LPH_JIT_MAX = function(...)
		return ...
	end

	LPH_NO_UPVALUES = function(...)
		return ...
	end

	LPH_NO_VIRTUALIZE = function(...)
		return ...
	end

	LPH_CRASH = function(...)
		return ...
	end
end

local request = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request
local setthreadidentity = setthreadidentity or set_thread_identity or setthreadcontext or setidentity
local getthreadidentity = getthreadidentity or get_thread_identity or getthreadcontext or getidentity
local hookfunction = hookfunction or hookfunc
local get = function(URL)
	return request({ Url = URL, Method = "GET" }).Body
end

local Data = Data
if not Data then
	Data = {
		InviteToDiscord = false,
		Intro = true,
		KillSayStuff = {
			Normal = {
				"bro, respawn faster, I need more %XP% XP",
				"can someone hvh me?? im guessing nobody can 🤣",
				"你的WiFi是土豆吗, %Died%?",
				"你打游戏好像老奶奶一样",
				"Atleast u died to SERENIUM, %Died%",
				"你是NPC吗, %Died%?",
				"你的技能和样老",
				"fix ur aim %Died%",
				"damn is 😂",
				"听说你用Internet Explorer在玩游戏",
				"お前の反応はカタツムリより遅いぞ",
				"你在玩手机上吗, %Died%?",
				"你刚才是睡着了吗?",
				"🤖 你是一台机器人吗, %Died%?",
				"Internet says ‘how to dodge in Combat Warriors’",
				"turn off 'get beaten by skids' in cw settings",
				"左, 右, 晚安 :skull:",
				"お前はもう死んでいる",
				"ты был удалён с сервера",
				"איפה הכבוד שלך, %Died%?",
				"あなたはゲームをやめるべきです",
				"your kd is negative btw %Died%",
				"你的存活率比0%还低",
				"parrying 💔💔",
				"Internet says 'how to recover from public humiliation'",

				"get this script at /SERENIUM !",
				"tired of cheaters? become one yourself and combat them! /SERENIUM",

				"Outplayed by SERENIUM.",
			},
			Assist = {
				"你没死于我, 是死于团队合作",
				"split my %XP% XP and %Credits% credits with a random, ty for the donation %Died%",
				"お前は味方にやられた",
				"ты просто статистика",
				"你被团队协作打败了",
				"didnt need an assist to kill u %Died%",
				"谁帮我补刀的? 这次算你赚到",
				"yo %Died%, we both know I didn't need the assist",
			},
			Finish = {
				"你的账号已被暂停, %Died%",
				"bro got sent to the shadow realm by a %Weapon%",
				"%Died%, should’ve dodged, oh wait… too late 💀",
				"yo %Died%, your Roblox career ended faster than a limited item stock",
				"Ты уничтожен",
				"ur name should be ‘free kill’, %Died%",
				"%Died% died so fast that Roblox lagged 💀",
				"お前の敗北は確定していた",
				"お前の人生はチェックメイト",
				"fatality.",
				"bro went out like a YouTube tutorial dummy",
				"bro got cooked, fried, and served",
				"bro’s internet provider officially disowned him",
				"Mustache Man once said: 'The greatest defeat comes when one refuses to accept their fate.'",
				"Napoleon once declared: 'The war is won in the mind before the battlefield.'",
				"Sun Tzu once wrote: 'The battlefield is not just a place, it is a state of mind.'",
				"Genghis Khan once proclaimed: 'A warrior’s life ends when they fail to adapt to the changing tides.'",
				"Einstein once said: 'In the end, only the smart survive.'",
			},
			Glory = {
				"你的死亡动画很美, %Died%",
				"someone clip that dawg, %Died% just got packed",
				"%Died%, wanna see my recoil script? (it's called skill)",
				"yo %Died%, ur gameplay lookin like a speedrun to the death screen",
				"bro's last words: ‘I got this’ 💀",
				"удар был смертельным",
				"ur name should be ‘free kill’, %Died%",
				"%Died% died so fast that Roblox lagged 💀",
				"お前の存在が消えた",
				"я сохранил этот момент",
				"bro thought he was the protagonist, I made sure he wasn't",
				"Google says ‘how to recover from a humiliation kill’",
				"%Died%, that was a fatality, not a kill",
				"bro got deleted so hard, he's gonna respawn in another server",
				"I'm screenshotting this kill for my collection %Died%",
				"你只是我今天的另一个XP点数 ",
				"お前は何だったの？",
				"left right goodnight :skull:",
				"clip that, I need it for my mixtape",
				"bro got an express ticket to spectate mode",
				"100% uninstall speedrun, new record %Died%",
				"bro thought he had a chance, but the script said no",
				"Mustache Man once said: 'Victory is a sweet taste for those who dare to fight without hesitation.'",
				"Sun Tzu once wrote: 'The only true defeat is one suffered without a fight.'",
				"Einstein once said: 'It’s not about how fast you run, but how you use your momentum.'",
				"Genghis Khan once declared: 'A battle is not won by strength alone, but by will and intellect.'",
				"Napoleon said: 'The best way to predict the future is to make it.'",
			},
		},
	}
end

local Changelogs = [[Greetings, serenium.hvh User.
%NEWBULLET%
New things:
[~] fps fully fixed
[~] game now properly waits to load
%NEWBULLET%
]]

game:GetService("ScriptContext"):SetTimeout(5)

local f = "serenium.hvh/assets/"
if not isfolder(f) then
	makefolder(f)
end

local p = f .. "surge.wav"
if not isfile(p) then
	writefile(
		p,
		game:HttpGet(
			"https://github.com/anarchy-solutions/serenium.hvh/raw/refs/heads/main/assets/surge%20on%20top%202.wav"
		)
	)
end

local s = Instance.new("Sound", workspace)
s.SoundId = getcustomasset(p)
s:Play()
s.Ended:Connect(function()
	s:Destroy()
end)

--// VARIABLES (from old script) dont mind this shitty ahh habit from my old
local ReGui = loadstring(get("https://raw.githubusercontent.com/hookop/regui/refs/heads/main/Main.luau"))()
local EffectHolder = game:GetObjects("rbxassetid://17192721766")[1]
local Prefabs = game:GetObjects("rbxassetid://" .. ReGui.PrefabsId)[1]

local executor = identifyexecutor and identifyexecutor() or "No Name"

if Data.InviteToDiscord then
	pcall(function()
		request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", ["Origin"] = "https://discord.com" },
			Body = game:GetService("HttpService"):JSONEncode({
				cmd = "INVITE_BROWSER",
				args = {
					code = "SCFH9cDYWV",
				},
				nonce = game:GetService("HttpService"):GenerateGUID(false),
			}),
		})
	end)
end

local GetService = function(Name)
	return cloneref(game:GetService(Name))
end

local KeyframeSequenceProvider = GetService("KeyframeSequenceProvider")
local PathfindingService = GetService("PathfindingService")
local CollectionService = GetService("CollectionService")
local ReplicatedStorage = GetService("ReplicatedStorage")
local UserInputService = GetService("UserInputService")
local TextChatService = GetService("TextChatService")
local TeleportService = GetService("TeleportService")
local TweenService = GetService("TweenService")
local HttpService = GetService("HttpService")
local RunService = GetService("RunService")
local Workspace = GetService("Workspace")
local Lighting = GetService("Lighting")
local Players = GetService("Players")
local CoreGui = GetService("CoreGui")
local Debris = GetService("Debris")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

local Debug = true
local OnTp = false
local GrenadeNear = false
local ClaimingAirdrop = false
local KADebounce = false
local CanFireStartFallDamage = true

local PlayerCharacters = Workspace:FindFirstChild("PlayerCharacters")
local EffectsJunk = Workspace:FindFirstChild("EffectsJunk")
local Map = Workspace:FindFirstChild("Map")

local Colors = {}
local Classes = {}
local Labels = {}
local Objects = {}
local WireFrameDraw = {}
local ParryingCharacters = {}
local Ignored = {}

local CWGroupID = 5192826

local LockedTarget

local R6BodyParts = {
	"Head",
	"Torso",
	"Left Arm",
	"Right Arm",
	"Left Leg",
	"Right Leg",
}

local PlayerDrawings = {}
local UtilityDrawings = {}
local ESPSettings = {
	Line = {
		Thickness = 1,
		Color = Color3.fromRGB(0, 255, 0),
	},
	Text = {
		Size = 13,
		Center = true,
		Outline = true,
		Font = Drawing.Fonts.Plex,
		Color = Color3.fromRGB(255, 255, 255),
	},
	Square = {
		Thickness = 1,
		Color = Colors.ESP or Color3.new(1, 1, 1),
		Filled = false,
	},
	Triangle = {
		Color = Color3.fromRGB(255, 255, 255),
		Filled = true,
		Visible = false,
		Thickness = 1,
	},
	Image = {
		Color = Color3.fromRGB(255, 255, 255),
		Visible = false,
	},
}

local AimbotHighlight = Instance.new("Highlight", workspace.Terrain)
local RagebotHighlight = Instance.new("Highlight", workspace.Terrain)
local SilentAimHighlight = Instance.new("Highlight", workspace.Terrain)

AimbotHighlight.FillColor = Color3.new(1, 1, 1)
RagebotHighlight.FillColor = Color3.new(1, 1, 1)
SilentAimHighlight.FillColor = Color3.new(1, 1, 1)

--// TELEPORTS N THING (from old script)
local Skyboxes = {
	["None"] = {},
	["Nebula"] = {
		SkyboxLf = "rbxassetid://159454286",
		SkyboxBk = "rbxassetid://159454299",
		SkyboxDn = "rbxassetid://159454296",
		SkyboxFt = "rbxassetid://159454293",
		SkyboxRt = "rbxassetid://159454300",
		SkyboxUp = "rbxassetid://159454288",
	},
	["Vaporwave"] = {
		SkyboxLf = "rbxassetid://1417494402",
		SkyboxBk = "rbxassetid://1417494030",
		SkyboxDn = "rbxassetid://1417494146",
		SkyboxFt = "rbxassetid://1417494253",
		SkyboxRt = "rbxassetid://1417494499",
		SkyboxUp = "rbxassetid://1417494643",
	},
	["Clouds"] = {
		SkyboxLf = "rbxassetid://570557620",
		SkyboxBk = "rbxassetid://570557514",
		SkyboxDn = "rbxassetid://570557775",
		SkyboxFt = "rbxassetid://570557559",
		SkyboxRt = "rbxassetid://570557672",
		SkyboxUp = "rbxassetid://570557727",
	},
	["Twilight"] = {
		SkyboxLf = "rbxassetid://264909758",
		SkyboxBk = "rbxassetid://264908339",
		SkyboxDn = "rbxassetid://264907909",
		SkyboxFt = "rbxassetid://264909420",
		SkyboxRt = "rbxassetid://264908886",
		SkyboxUp = "rbxassetid://264907379",
	},
}

local SoundTables = {
	Defaults = {
		NukeAlarm = "rbxassetid://3237286675",
		Heal = "rbxassetid://577886343",
		Explosion = "rbxassetid://3521555808",
		Kill = "rbxassetid://2868331684",
		Parry = "rbxassetid://211059855",
	},
	Customs = {
		Default = "",
		TF2 = "rbxassetid://5650646664",
		CSGO = "rbxassetid://8679627751",
		FART = "rbxassetid://6999993863",
		BOINK = "rbxassetid://5451260445",
		RAGE = "rbxassetid://6911556519",
		RUST = "rbxassetid://5043539486",
	},
	Variables = {
		NUKE = ReplicatedStorage.Shared.Assets.Sounds.NukeAlarm.SoundId,
		HEAL = ReplicatedStorage.Shared.Assets.Sounds.Heal.SoundId,
		EXPOSION = ReplicatedStorage.Shared.Assets.Sounds.ExplosionHit.SoundId,
		KILLSOUND = ReplicatedStorage.Shared.Assets.Sounds.Kill.SoundId,
		PARRY = ReplicatedStorage.Shared.Assets.Sounds.Parry.SoundId,
	},
	GetNames = function(Tbl, Name)
		local tb = {}
		for i, v in pairs(Tbl[Name]) do
			table.insert(tb, i)
		end
		return tb
	end,
}

-- // Morphs

local MorphsData = {
	Table = {
		None = 0,
		AmongUs = 75123740895551,
		Peter = 99502447592511,
		Spongebob = 92287030149072,
		ChickenTuff = 129324432399737,
		Capybara = 0,
		BloxyCola = 72465121900470,
		Carl = 104064510144699,
	},
	Names = {},
	Materials = {
		"SmoothPlastic",
		"ForceField",
		"Neon",
	},
	State = {
		Name = "None",
		Instance = nil,
		Material = "SmoothPlastic",
		SpinEnabled = false,
		SpinConnection = nil,
		OffsetX = 0,
		OffsetY = 0,
		OffsetZ = 0,
		RotationX = 0,
		RotationY = 0,
		RotationZ = 0,
	},
}

for name, _ in pairs(MorphsData.Table) do
	table.insert(MorphsData.Names, name)
end
table.sort(MorphsData.Names)

local function applyMorphMaterial(morphInstance, materialName)
	local materialEnum = Enum.Material[materialName]
	if not materialEnum then
		return
	end

	if morphInstance:IsA("Model") then
		for _, part in ipairs(morphInstance:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Material = materialEnum
			end
		end
	elseif morphInstance:IsA("BasePart") then
		morphInstance.Material = materialEnum
	end
end

local function updateMorph()
	local char = Players.LocalPlayer.Character
	if not char then
		return
	end

	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then
		return
	end

	if MorphsData.State.Instance then
		MorphsData.State.Instance:Destroy()
		MorphsData.State.Instance = nil
	end

	if MorphsData.State.SpinConnection then
		MorphsData.State.SpinConnection:Disconnect()
		MorphsData.State.SpinConnection = nil
	end

	if MorphsData.State.Name == "None" then
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.Transparency = 0
			end
		end
		return
	end

	local id = MorphsData.Table[MorphsData.State.Name]
	if id and id ~= 0 then
		local success, morph = pcall(function()
			return game:GetObjects("rbxassetid://" .. id)[1]
		end)

		if success and morph then
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then
					part.Transparency = 1
				end
			end

			morph.Parent = workspace

			if morph:IsA("Model") then
				morph.PrimaryPart = morph:FindFirstChildWhichIsA("BasePart") or morph:GetChildren()[1]

				for _, part in ipairs(morph:GetDescendants()) do
					if part:IsA("BasePart") then
						part.Transparency = 0
						part.Anchored = false
						part.CanCollide = false
						part.Massless = true
					end
				end

				if morph.PrimaryPart then
					local baseOffset = CFrame.new(0, -root.Size.Y / 2, 0)
					local customOffset =
						CFrame.new(MorphsData.State.OffsetX, MorphsData.State.OffsetY, MorphsData.State.OffsetZ)
					local customRotation = CFrame.Angles(
						math.rad(MorphsData.State.RotationX),
						math.rad(MorphsData.State.RotationY),
						math.rad(MorphsData.State.RotationZ)
					)

					morph:SetPrimaryPartCFrame(root.CFrame * customOffset * baseOffset * customRotation)
					morph.Parent = char
					local weld = Instance.new("WeldConstraint")
					weld.Part0 = root
					weld.Part1 = morph.PrimaryPart
					weld.Parent = morph.PrimaryPart
				end
			else
				morph.Transparency = 0
				morph.Anchored = false
				morph.CanCollide = false
				morph.Massless = true

				local customOffset =
					CFrame.new(MorphsData.State.OffsetX, MorphsData.State.OffsetY, MorphsData.State.OffsetZ)
				local customRotation = CFrame.Angles(
					math.rad(MorphsData.State.RotationX),
					math.rad(MorphsData.State.RotationY),
					math.rad(MorphsData.State.RotationZ)
				)
				morph.CFrame = root.CFrame * customOffset * CFrame.new(0, 1, 0) * customRotation

				morph.Parent = char
				local weld = Instance.new("WeldConstraint")
				weld.Part0 = root
				weld.Part1 = morph
				weld.Parent = morph
			end

			MorphsData.State.Instance = morph
			applyMorphMaterial(MorphsData.State.Instance, MorphsData.State.Material)

			if
				MorphsData.State.SpinEnabled
				and MorphsData.State.Instance
				and MorphsData.State.Instance:IsA("Model")
				and MorphsData.State.Instance.PrimaryPart
			then
				MorphsData.State.SpinConnection = RunService.RenderStepped:Connect(function(dt)
					MorphsData.State.Instance.PrimaryPart.CFrame = MorphsData.State.Instance.PrimaryPart.CFrame
						* CFrame.Angles(0, math.rad(5) * dt, 0)
				end)
			elseif
				MorphsData.State.SpinEnabled
				and MorphsData.State.Instance
				and MorphsData.State.Instance:IsA("BasePart")
			then
				MorphsData.State.SpinConnection = RunService.RenderStepped:Connect(function(dt)
					MorphsData.State.Instance.CFrame = MorphsData.State.Instance.CFrame
						* CFrame.Angles(0, math.rad(5) * dt, 0)
				end)
			end
		end
	end
end

Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
	newCharacter:WaitForChild("Humanoid").HealthChanged:Wait()
	newCharacter:WaitForChild("HumanoidRootPart")

	if MorphsData.State.Name ~= "None" then
		updateMorph()
		if Classes and Classes.MorphDropdown and Classes.MorphDropdown.SetValue then
			Classes.MorphDropdown:SetValue(MorphsData.State.Name)
		end
		if Classes and Classes.MorphMaterialDropdown and Classes.MorphMaterialDropdown.SetValue then
			Classes.MorphMaterialDropdown:SetValue(MorphsData.State.Material)
		end
		if Classes and Classes.MorphSpinCheckbox and Classes.MorphSpinCheckbox.SetValue then
			Classes.MorphSpinCheckbox:SetValue(MorphsData.State.SpinEnabled)
		end
		if Classes and Classes.MorphOffsetXSlider and Classes.MorphOffsetXSlider.SetValue then
			Classes.MorphOffsetXSlider:SetValue(MorphsData.State.OffsetX)
		end
		if Classes and Classes.MorphOffsetYSlider and Classes.MorphOffsetYSlider.SetValue then
			Classes.MorphOffsetYSlider:SetValue(MorphsData.State.OffsetY)
		end
		if Classes and Classes.MorphOffsetZSlider and Classes.MorphOffsetZSlider.SetValue then
			Classes.MorphOffsetZSlider:SetValue(MorphsData.State.OffsetZ)
		end
		if Classes and Classes.MorphRotationXSlider and Classes.MorphRotationXSlider.SetValue then
			Classes.MorphRotationXSlider:SetValue(MorphsData.State.RotationX)
		end
		if Classes and Classes.MorphRotationYSlider and Classes.MorphRotationYSlider.SetValue then
			Classes.MorphRotationYSlider:SetValue(MorphsData.State.RotationY)
		end
		if Classes and Classes.MorphRotationZSlider and Classes.MorphRotationZSlider.SetValue then
			Classes.MorphRotationZSlider:SetValue(MorphsData.State.RotationZ)
		end
	end
end)

local Teleports = {
	Crossroads = {
		Teleports = {
			["Black Mountain"] = CFrame.new(-167, 91, 246),
			["Black Mountain (Back)"] = CFrame.new(-187, 25, 319),
			["Brown Mountain"] = CFrame.new(143, 101, 251),
			["Brown Mountain (Back)"] = CFrame.new(147, 26, 326),
			["Green Mountain"] = CFrame.new(159, 86, -131),
			["Green Mountain (Back)"] = CFrame.new(273, 25, -207),

			["Front Beach"] = CFrame.new(-255, 28, -6),
			["Left Beach"] = CFrame.new(-46, 22, -231),
			["Right Beach"] = CFrame.new(-41, 25, 328),
			["Back Beach"] = CFrame.new(271, 23, 13),

			["Center"] = CFrame.new(0, 22, 0),
			["Grey Tower"] = CFrame.new(-48, 60, 55),
			["Blue Tower"] = CFrame.new(-86, 67, -76),
			["Red Tower"] = CFrame.new(150, 69, 159),
			["Basement"] = CFrame.new(157, 26, -80),
			["Bridge"] = CFrame.new(-174, 45, -47),
		},
		GetNames = function(self)
			local tb = {}
			for i, v in self.Teleports do
				table.insert(tb, i)
			end
			return tb
		end,
	},
}

local Skybox = Lighting:FindFirstChildOfClass("Sky")
if Skybox then
	Skyboxes.None.SkyboxLf = Skybox.SkyboxLf
	Skyboxes.None.SkyboxBk = Skybox.SkyboxBk
	Skyboxes.None.SkyboxDn = Skybox.SkyboxDn
	Skyboxes.None.SkyboxFt = Skybox.SkyboxFt
	Skyboxes.None.SkyboxLf = Skybox.SkyboxLf
	Skyboxes.None.SkyboxRt = Skybox.SkyboxRt
	Skyboxes.None.SkyboxUp = Skybox.SkyboxUp
end

function DbgWarn(...)
	if Debug then
		local args = { ... }
		local timestamp = os.date("%Y-%m-%d %H:%M:%S")
		warn(string.format("[%s] DEBUG:", timestamp), unpack(args))
	end
end

local function map(N, OldMin, OldMax, Min, Max)
	return (N - OldMin) / (OldMax - OldMin) * (Max - Min) + Min
end

local NotifLogs = {}
local CreateNotification
do
	local notes = {}
	local function DrawingObject(t, col)
		local d = Drawing.new(t)

		d.Visible = true
		d.Transparency = 1
		d.Color = col

		return d
	end

	local function Rectangle(sizex, sizey, fill, col)
		local s = DrawingObject("Square", col)

		s.Filled = fill
		s.Thickness = 1
		s.Position = Vector2.new()
		s.Size = Vector2.new(sizex, sizey)

		return s
	end

	local function Text(text)
		local s = DrawingObject("Text", Color3.new(1, 1, 1))

		s.Text = text
		s.Size = 13
		s.Center = false
		s.Outline = true
		s.Position = Vector2.new()
		s.Font = 2

		return s
	end

	CreateNotification = function(t, customcolor)
		table.insert(NotifLogs, string.format("[%s]: %s", os.date("%X"), t))
		local gap = 25
		local width = 18

		local alpha = 255
		local time = 0
		local estep = 0
		local eestep = 0.02

		local insety = 0

		local Note = {

			enabled = true,

			targetPos = Vector2.new(0, 110),

			size = Vector2.new(200, width),

			drawings = {
				outline = Rectangle(202, width + 2, false, Color3.new(0, 0, 0)),
				fade = Rectangle(202, width + 2, false, Color3.new(0, 0, 0)),
			},

			Remove = function(self, d)
				if d.Position.x < d.Size.x then
					for k, drawing in pairs(self.drawings) do
						drawing:Remove()
						drawing = false
					end
					self.enabled = false
				end
			end,

			Update = function(self, num, listLength, dt)
				local pos = self.targetPos

				local indexOffset = (listLength - num) * gap
				if insety < indexOffset then
					insety -= (insety - indexOffset) * 0.2
				else
					insety = indexOffset
				end
				local size = self.size

				local tpos = Vector2.new(pos.x - size.x / time - map(alpha, 0, 255, size.x, 0), pos.y + insety)
				self.pos = tpos

				local locRect = {
					x = math.ceil(tpos.x),
					y = math.ceil(tpos.y),
					w = math.floor(size.x - map(255 - alpha, 0, 255, 0, 70)),
					h = size.y,
				}

				local fade = math.min(time * 12, alpha)
				fade = fade > 255 and 255 or fade < 0 and 0 or fade

				if self.enabled then
					local linenum = 1
					for i, drawing in pairs(self.drawings) do
						drawing.Transparency = fade / 255

						if type(i) == "number" then
							drawing.Position = Vector2.new(locRect.x + 1, locRect.y + i)
							drawing.Size = Vector2.new(locRect.w - 2, 1)
						elseif i == "text" then
							drawing.Position = tpos + Vector2.new(6, 2)
						elseif i == "outline" then
							drawing.Position = Vector2.new(locRect.x, locRect.y)
							drawing.Size = Vector2.new(locRect.w, locRect.h)
						elseif i == "fade" then
							drawing.Position = Vector2.new(locRect.x - 1, locRect.y - 1)
							drawing.Size = Vector2.new(locRect.w + 2, locRect.h + 2)
							local t = (200 - fade) / 255 / 3
							drawing.Transparency = t < 0.4 and 0.4 or t
						elseif i:find("line") then
							drawing.Position = Vector2.new(locRect.x + linenum, locRect.y + 1)
							linenum += 1
						end
					end

					time += estep * dt * 128 --> TODO need to do the duration
					estep += eestep * dt * 64
				end
			end,

			Fade = function(self, num, len, dt)
				if self.pos.x > self.targetPos.x - 0.2 * len or self.fading then
					if not self.fading then
						estep = 0
					end
					self.fading = true
					alpha -= estep / 4 * len * dt * 50
					eestep += 0.01 * dt * 100
				end
				if alpha <= 0 then
					self:Remove(self.drawings[1])
				end
			end,
		}

		for i = 1, Note.size.y - 2 do
			local c = 0.28 - i / 80
			Note.drawings[i] = Rectangle(200, 1, true, Color3.new(c, c, c))
		end
		local color = customcolor

		Note.drawings.text = Text(t)
		if Note.drawings.text.TextBounds.x + 7 > Note.size.x then --> expand the note size to fit if it's less than the default size
			Note.size = Vector2.new(Note.drawings.text.TextBounds.x + 7, Note.size.y)
		end
		Note.drawings.line = Rectangle(1, Note.size.y - 2, true, color)
		Note.drawings.line1 = Rectangle(1, Note.size.y - 2, true, color)

		notes[#notes + 1] = Note
	end

	renderStepped = RunService.RenderStepped:Connect(function(dt)
		Camera = workspace.CurrentCamera
		local smallest = math.huge
		for k = 1, #notes do
			local v = notes[k]
			if v and v.enabled then
				smallest = k < smallest and k or smallest
			else
				table.remove(notes, k)
			end
		end
		local length = #notes
		for k = 1, #notes do
			local note = notes[k]
			note:Update(k, length, dt)
			if k <= math.ceil(length / 10) or note.fading then
				note:Fade(k, length, dt)
			end
		end
	end)
	--> CreateNotification("" , NotiColor)
end

local noclipConnection = nil
local noclipEnabled = false

local function noclip(enabled)
	noclipEnabled = enabled

	local character = LocalPlayer.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	local hrp = character and character:FindFirstChild("HumanoidRootPart")

	if not character or not humanoid or not hrp then
		return
	end

	if enabled then
		if noclipConnection then
			noclipConnection:Disconnect()
		end

		noclipConnection = RunService.Stepped:Connect(function()
			if LocalPlayer.Character and LocalPlayer.Character == character then
				for _, part in ipairs(character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = false
						part.Anchored = false
					end
				end
			end
		end)
	else
		if noclipConnection then
			noclipConnection:Disconnect()
			noclipConnection = nil
		end
	end
end

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
	newCharacter:WaitForChild("Humanoid")
	newCharacter:WaitForChild("HumanoidRootPart")

	if noclipEnabled then
		noclip(true)
		if Classes and Classes.NoclipToggle and Classes.NoclipToggle.SetValue then
			Classes.NoclipToggle:SetValue(true)
		end
	end
end)

--// UI START

if Debug then
	func = function()
		return CoreGui:FindFirstChild("RobloxGui")
	end
	getgenv().gethui = func
	getgenv().get_hidden_gui = func
end

local Modules = { Name = {}, Id = {} }
local UtilityIds = {}
local WeaponIds = {}

setthreadidentity(2)
for _, child in pairs(ReplicatedStorage:GetDescendants()) do
	if child:IsA("ModuleScript") then
		local success, module = pcall(require, child)
		if success then
			Modules.Name[child.Name] = module
		end
	end
end
setthreadidentity(8)

for i, v in Modules.Name["UtilityIds"] do
	UtilityIds[i:lower()] = v
end
for i, v in Modules.Name["WeaponIds"] do
	WeaponIds[i:lower()] = v
end
local Network = Modules.Name["Network"]
local EventHandler

local Remotes
if EventHandler then
	Remotes = getupvalue(EventHandler, 1)
end

ReGui:Init({
	Prefabs = Prefabs,
})

ReGui:DefineTheme("Monochrome", Data.Theme or {
	TitleAlign = Enum.TextXAlignment.Center,

	Text = Color3.fromRGB(245, 245, 245),
	TextDisabled = Color3.fromRGB(160, 160, 160),

	FrameBg = Color3.fromRGB(28, 28, 28),
	FrameBgTransparency = 0.25,
	FrameBgActive = Color3.fromRGB(60, 60, 60),
	FrameBgTransparencyActive = 0.2,

	CheckMark = Color3.fromRGB(230, 230, 230),
	SliderGrab = Color3.fromRGB(85, 85, 85),
	ButtonsBg = Color3.fromRGB(75, 75, 75),
	RadioButtonHoveredBg = Color3.fromRGB(95, 95, 95),

	CollapsingHeaderBg = Color3.fromRGB(45, 45, 45),
	CollapsingHeaderText = Color3.fromRGB(245, 245, 245),

	WindowBg = Color3.fromRGB(22, 22, 22),
	TitleBarBg = Color3.fromRGB(30, 30, 30),
	TitleBarBgActive = Color3.fromRGB(45, 45, 45),

	Border = Color3.fromRGB(90, 90, 90),
	ResizeGrab = Color3.fromRGB(95, 95, 95),

	RegionBgTransparency = 1,
})

ReGui:DefineTheme("Loader", Data.LoaderTheme or {
	TitleAlign = Enum.TextXAlignment.Center,
	TextDisabled = Color3.fromRGB(225, 225, 225),
	Text = Color3.fromRGB(255, 255, 255),

	FrameBg = Color3.fromRGB(25, 25, 25),
	FrameBgTransparency = 0.4,
	FrameBgActive = Color3.fromRGB(225, 225, 225),
	FrameBgTransparencyActive = 0.4,

	CheckMark = Color3.fromRGB(150, 150, 150),
	SliderGrab = Color3.fromRGB(100, 83, 255),
	ButtonsBg = Color3.fromRGB(150, 150, 150),
	CollapsingHeaderBg = Color3.fromRGB(150, 150, 150),
	CollapsingHeaderText = Color3.fromRGB(200, 200, 200),
	RadioButtonHoveredBg = Color3.fromRGB(150, 150, 150),

	WindowBg = Color3.fromRGB(35, 35, 35),
	TitleBarBg = Color3.fromRGB(35, 35, 35),
	TitleBarBgActive = Color3.fromRGB(50, 50, 50),

	Border = Color3.fromRGB(50, 50, 50),
	ResizeGrab = Color3.fromRGB(50, 50, 50),
	RegionBgTransparency = 1,
})

local Loader = ReGui:Window({
	Title = "serenium.hvh",
	Theme = "Loader",
	NoClose = true,
	NoCollapse = true,
	NoScrolling = true,
	NoScrollBar = true,
	NoResize = true,
	Size = UDim2.new(0, 0, 0, 0),
}):Center()

local LoaderList, LoaderListObject = Loader:List()
LoaderList:Image({
	Image = Data.UIIcon or 120348119180361,
	Ratio = 1.25,
	RatioAxis = Enum.DominantAxis.Width,
	Size = UDim2.fromOffset(300, 300),
})

LoaderListObject.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
LoaderListObject.UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local LoaderProgress = LoaderList:SliderProgress({
	Value = 0,

	Label = "",
	Format = "Loading",

	Minimum = 0,
	Maximum = 100,

	ReadOnly = true,
	Border = false,

	Ratio = 20,
})

-- very fancy for no reason lol!

LoaderProgress:SetValueText("")
if not EventHandler then
	task.wait(1)
	LoaderProgress:SetValueText("Unable to get GetEventHandler, some features may be disabled for you")
end

for i = 100, 100 do
	LoaderProgress:SetValue(i)
	LoaderProgress:SetValueText(i .. "%")
	task.wait(math.random() / 8)
end

LoaderProgress:SetValueText("")

Loader:Close()

-- [[ FRAMEWORK ]]

local Framework = {}

local Hooks = {}
local Modify = {}

local Signal = Modules.Name["Signal"]

local OnFireServer = Network.FireServer

function Handle(_, Name, ...)
	local Args = { ... }
	if Modify[Name] then
		local shouldHook = Modify[Name].Check(Name, unpack(Args))
		if shouldHook then
			if typeof(shouldHook) == "table" then
				table.foreach(shouldHook, function(i, v)
					Args[i] = v
				end)
			else
				if shouldHook == "Blocked" then
					return
				end

				for i, v in Modify[Name].Args do
					Args[i] = v
				end
			end
		end
	end
	if Hooks[Name] then
		return pcall(Hooks[Name], OnFireServer, _, Name, ...)
	end
	return OnFireServer(_, Name, unpack(Args))
end

Network.FireServer = function(_, Name, ...)
	return Handle(_, Name, ...)
end

function Framework:AddHook(Name, Function)
	Hooks[Name] = Function
end

function Framework:ArgModify(Name, ToModify, Check)
	Modify[Name] = { Args = { ToModify }, Check = Check }
end

function Framework:RemoveHook(Name)
	table.remove(Hooks, table.find(Hooks, Name))
end

function Framework:RemoveArgModifier(Name, ToModify)
	table.remove(Modify, table.find(Modify, Name))
end

function Framework:FireServer(Name, ...)
	Network:FireServer(Name, ...)
end

function Framework:InvokeServer(Name, ...)
	Network:InvokeServer(Name, ...)
end

function Framework.HookClient(Table, Name, NewFunction)
	if not Remotes then
		return
	end

	local ToHook
	for i, v in pairs(getconnections(Remotes[Name].Remote.OnClientEvent)) do
		ToHook = v.Function
		break
	end

	local OldHook
	OldHook = hookfunction(
		ToHook,
		LPH_NO_UPVALUES(function(...)
			return NewFunction(...)
		end)
	)

	return OldHook
end

function Framework:GetMetadata(ItemName, ItemId)
	if not WeaponIds[ItemName:lower():gsub(" ", "")] then
		return
	end

	return ItemName and Modules.Name["WeaponMetadata"][WeaponIds[ItemName:lower():gsub(" ", "")]]
		or Modules.Name["WeaponMetadata"][ItemId]
end

function Framework:GetUtility(ItemName, ItemId)
	if not UtilityIds[ItemName:lower():gsub(" ", "")] then
		return
	end

	return ItemName and Modules.Name["UtilityMetadata"][UtilityIds[ItemName:lower():gsub(" ", "")]]
		or Modules.Name["UtilityMetadata"][ItemId]
end

function Framework:GetWeapon(Player)
	local Player = Player or LocalPlayer
	local Character = Player.Character or Player.CharacterAdded:Wait()

	for i, v in Character:GetChildren() do
		if not v:IsA("Tool") then
			continue
		end
		if
			v:GetAttribute("ItemType") == "weapon"
			and Modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")].class:lower():match("melee")
		then
			return v, Modules.Name["MeleeWeaponClient"].getObj(v)
		end
	end
	return
end

function Framework:GetRanged(Player)
	local Player = Player or LocalPlayer
	local Character = Player.Character or Player.CharacterAdded:Wait()

	for i, v in Character:GetChildren() do
		if not v:IsA("Tool") then
			continue
		end
		if
			v:GetAttribute("ItemType") == "weapon"
			and Modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")].class:lower():match("ranged")
		then
			return v, Modules.Name["RangedWeaponClient"].getObj(v)
		end
	end
	return
end

function Framework:GetState()
	return Modules.Name["RoduxStore"].store:getState()
end

function Framework:GetSessionData(Player)
	return Modules.Name["DataHandler"].getSessionDataRoduxStoreForPlayer(Player or LocalPlayer)
end

function Framework:GetClosest(Distance, Priority, CheckFunction)
	local function n(Player)
		if
			Player.Character
			and Player.Character:FindFirstChild("HumanoidRootPart")
			and Player.Character:FindFirstChild("Humanoid")
			and Player.Character.Humanoid.Health ~= 0
		then
			return true
		end
		return
	end

	local Distance = Distance or math.huge
	local CheckFunction = CheckFunction or n
	local Player = {}

	for i, v in Players:GetPlayers() do
		if v == LocalPlayer then
			continue
		end
		if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(v.UserId) then
			continue
		end
		if table.find(Ignored, v.Name) then
			continue
		end
		if not CheckFunction(v) then
			continue
		end
		if Framework:InMenu(v) then
			continue
		end

		local HRP = v.Character.HumanoidRootPart
		local Magnitude = (HRP.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

		if Magnitude < Distance then
			Distance = Magnitude
			Player[v.Name] = v.Character.Humanoid.Health
		end
	end

	if Priority then
		table.sort(Player)
	end

	return Player
end

function Framework:GetClosest2(Distance, CheckFunction)
	local function n(Player)
		if
			Player.Character
			and Player.Character:FindFirstChild("HumanoidRootPart")
			and Player.Character:FindFirstChild("Humanoid")
			and Player.Character.Humanoid.Health ~= 0
			and not Player.Character:FindFirstChildOfClass("ForceField")
		then
			return true
		end
		return
	end

	local Distance = Distance or math.huge
	local CheckFunction = CheckFunction or n
	local Player

	for i, v in Players:GetPlayers() do
		if v == LocalPlayer then
			continue
		end
		if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(v.UserId) then
			continue
		end
		if table.find(Ignored, v.Name) then
			continue
		end
		if not CheckFunction(v) then
			continue
		end
		if Framework:InMenu(v) then
			continue
		end

		local HRP = v.Character.HumanoidRootPart
		local Magnitude = (HRP.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude

		if Magnitude < Distance then
			Distance = Magnitude
			Player = v.Name
		end
	end

	return Player and { [Player] = true } or nil
end

function Framework:GetClosestToMouse(Distance, Priority, CheckFunction)
	local function n(Player)
		if
			Player.Character
			and Player.Character:FindFirstChild("HumanoidRootPart")
			and Player.Character:FindFirstChild("Humanoid")
			and Player.Character.Humanoid.Health ~= 0
		then
			return true
		end
		return
	end

	local Distance = Distance or math.huge
	local CheckFunction = CheckFunction or n
	local Player = nil

	local MousePosition = UserInputService:GetMouseLocation()

	for i, v in Players:GetPlayers() do
		if v == LocalPlayer then
			continue
		end
		if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(v.UserId) then
			continue
		end
		if table.find(Ignored, v.Name) then
			continue
		end
		if not CheckFunction(v) then
			continue
		end
		if Framework:InMenu(v) then
			continue
		end

		local HRP = v.Character.HumanoidRootPart

		local vector, onScreen = Camera:WorldToScreenPoint(HRP.Position)
		if onScreen then
			local Magnitude = (MousePosition - Vector2.new(vector.X, vector.Y)).Magnitude

			if Magnitude < Distance then
				Distance = Magnitude
				Player = v
			end
		end
	end

	return Player
end

function Framework:AntiFling()
    local localplayer = game.Players.LocalPlayer

    if Classes.AntiFling.Value then
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= localplayer then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    for _, part in ipairs(character:GetChildren()) do
                        if part:IsA("BasePart") and part.Name ~= "FakeHitbox" then
                            part.CanCollide = false
                        end
                    end
                end
            end
        end
    else
        for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
            if player ~= localplayer then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    for _, part in ipairs(character:GetChildren()) do
                        if part:IsA("BasePart") and part.Name ~= "FakeHitbox" then
                            part.CanCollide = true
                        end
                    end
                end
            end
        end
    end
end




local spinAnim = Instance.new("Animation")
spinAnim.AnimationId = "rbxassetid://188632011"

local Loaded = {}
function Framework:SpinLoop()
	if Classes.Spin.Value and not Loaded[LocalPlayer.Character.Humanoid] then
		Loaded[LocalPlayer.Character.Humanoid] = LocalPlayer.Character.Humanoid:LoadAnimation(spinAnim)
	elseif Classes.Spin.Value and Loaded[LocalPlayer.Character.Humanoid] then
		Loaded[LocalPlayer.Character.Humanoid].Priority = Enum.AnimationPriority.Action4
		Loaded[LocalPlayer.Character.Humanoid].Looped = true
		Loaded[LocalPlayer.Character.Humanoid]:AdjustSpeed(Classes.SpinSpeed.Value)
		if not Loaded[LocalPlayer.Character.Humanoid].IsPlaying then
			Loaded[LocalPlayer.Character.Humanoid]:Play()
		end
	end
	if not Classes.Spin.Value and Loaded[LocalPlayer.Character.Humanoid] then
		Loaded[LocalPlayer.Character.Humanoid]:Stop()
	end
end

function Framework.IsParrying(self, Player)
	local State = self:GetSessionData():getState()
	return State.parry.isParrying
end

function Framework:GetCurrentGameMode()
	local CurrentMap = Map:FindFirstChildOfClass("Model")
	if CurrentMap then
		local Gamemodes = CurrentMap.MapConfiguration.Gamemodes
		for i, v in Gamemodes:GetDescendants() do
			if v:IsA("ObjectValue") then
				return v:FindFirstAncestorOfClass("Folder")
			end
		end
	end
	return
end

function Framework:GetPointEnemyPoint(Gamemode)
	for i, v in Gamemode:GetDescendants() do
		if v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("Inner") then
			if v.Value.Inner.BrickColor ~= LocalPlayer.Team.TeamColor then
				return v.Parent
			end
		end
	end
	return
end

function Framework:GetPointTeamPoint(Gamemode)
	for i, v in Gamemode:GetDescendants() do
		if v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("Inner") then
			if v.Value.Inner.BrickColor == LocalPlayer.Team.TeamColor then
				return v.Parent
			end
		end
	end
	return
end

function Framework:GetClosestCharacterToOrigin(Origin, dist)
	local dis = math.huge
	local target
	for i, v in PlayerCharacters.GetChildren(PlayerCharacters) do
		local Player = Players:GetPlayerFromCharacter(v)
		if Player then
			if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(Player.UserId) then
				continue
			end
			if table.find(Ignored, v.Name) then
				continue
			end
		end

		if v ~= LocalPlayer.Character and v.FindFirstChild(v, "HumanoidRootPart") then
			if (v.HumanoidRootPart.Position - Origin).Magnitude < dist then
				dis = dis
				target = v
			end
		end
	end

	return target, dis
end

function Framework:GetClosestCharactersToOrigin(Origin, Dist)
	local dis = math.huge
	local closests = {}
	for i, v in PlayerCharacters:GetChildren() do
		local Player = Players:GetPlayerFromCharacter(v)
		if Player then
			if Classes.WhitelistFriends.Value and LocalPlayer:IsFriendsWith(Player.UserId) then
				continue
			end
			if table.find(Ignored, v.Name) then
				continue
			end
		end

		if v ~= LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") then
			if (v.HumanoidRootPart.Position - Origin).Magnitude < Dist then
				dis = dis
				table.insert(closests, v)
			end
		end
	end
	return closests
end

function Framework:Chance(number)
	return (math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100) <= math.floor(number) / 100
end

function Framework:IsPartClose(Part, Distance)
	local Character = LocalPlayer.Character
	local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart then
		return
	end
	if Part and Part:IsA("BasePart") then
		local Mag = (Part.Position - HumanoidRootPart.Position).Magnitude
		return Mag <= Distance
	end
	return
end

function Framework.GetMeleeFuncs(Table)
	local tool = Table:GetWeapon()
	if not tool then
		return { parry = function() end }
	end
	for i, v in getconnections(tool.Equipped) do
		if v.Function then
			local uv = getupvalues(v.Function)
			if #uv == 1 and uv[1].singleWeaponMetadata then
				return uv[1]
			end
		end
	end
	return
end

function Framework:Teleport(CF)
	LocalPlayer.Character.HumanoidRootPart.CFrame = CF
	task.wait()
	LocalPlayer.Character.HumanoidRootPart.CFrame = CF
	task.wait(1)
	repeat
		LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:GetChildren()[1])
		task.wait()
		LocalPlayer.Character.Humanoid:UnequipTools()
	until LocalPlayer.Character.HumanoidRootPart.ReceiveAge == 0
	task.wait()
	LocalPlayer.Character.HumanoidRootPart.CFrame = CF
end

function Framework:BindToRenderStep(toBind, delayTime, priority: Enum.RenderPriority)
	local isDelayed = false
	RunService:BindToRenderStep(
		HttpService:GenerateGUID(true),
		(priority and priority or Enum.RenderPriority.First).Value,
		delayTime
				and function()
					if isDelayed then
						return
					end

					isDelayed = true
					task.spawn(toBind)
					task.wait(delayTime)
					isDelayed = false
				end
			or toBind
	)
end

function Framework:InMenu(Player)
	local IsMenu = true
	if not Player.Character then
		return IsMenu
	end
	for i, v in Player.Character:GetChildren() do
		if v:GetAttribute("ParryShieldId") then
			IsMenu = false
		end
	end
	return IsMenu
end

function Framework:Check(Character)
	if not Character or table.find(ParryingCharacters, Character) then
		return
	end

	local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

	local Player = Players:GetPlayerFromCharacter(Character)
	if Player then
		local Rodux = Framework:GetSessionData(Player)
		if Rodux and Rodux:getState().parry.isParrying then
			return
		end
	end

	if Humanoid then
		local Animator = Humanoid.Animator
		local PlayingAnimations = Animator:GetPlayingAnimationTracks()
		for i, v in PlayingAnimations do
			local Name = v.Animation.Name:match("Parry")
			if Name then
				return
			end
		end
	end

	for i, v in Character:GetChildren() do
		if v:GetAttribute("ParryShieldId") and #v:GetChildren() == 1 then
			return v:GetChildren()[1].Transparency == 1
		end
	end

	return
end

function Framework:WaitForDescendant(Root, Name, Condition, Timeout)
	local Descendant = nil
	local Timedout = false

	task.delay(Timeout or 9e9, function()
		Timedout = true
	end)

	repeat
		local Instance: boolean = Root:FindFirstChild(Name, true)
		if Instance and Condition(Instance) then
			Descendant = Instance
			break
		end
		RunService.RenderStepped:Wait()
	until Descendant or Timedout

	return Descendant
end

local KalmanFilter = {}
KalmanFilter.__index = KalmanFilter

function KalmanFilter.new()
	return setmetatable({
		x = Vector3.zero, -- Estimated position
		v = Vector3.zero, -- Estimated velocity
		a = Vector3.zero, -- Estimated acceleration
		p = 1, -- Estimate uncertainty
		r = 0.01, -- Measurement noise
		q = 0.001, -- Process noise
	}, KalmanFilter)
end

function KalmanFilter:update(measured_pos, measured_vel, dt)
	local predicted_x = self.x + self.v * dt + 0.5 * self.a * dt * dt
	local predicted_v = self.v + self.a * dt

	local p_pred = self.p + self.q
	local k = p_pred / (p_pred + self.r) -- Kalman gain

	self.x = predicted_x + k * (measured_pos - predicted_x)
	self.v = predicted_v + k * (measured_vel - predicted_v)
	self.p = (1 - k) * p_pred

	return self.x, self.v
end

function PredictTargetPosition(origin, destination, weapon_speed, ping, gravity)
	local filter = destination.KalmanFilter or KalmanFilter.new()
	destination.KalmanFilter = filter

	local measured_pos = destination.Position
	local measured_vel = destination.Velocity or Vector3.zero
	local dt = RunService.Heartbeat:Wait()

	local estimated_pos, estimated_vel = filter:update(measured_pos, measured_vel, dt)
	local network_delay = ping / 1000

	local future_pos = estimated_pos + estimated_vel * network_delay

	local travel_time = (future_pos - origin).magnitude / weapon_speed
	if measured_vel.Y <= -15 or measured_vel.Y >= 15 then
		measured_vel = Vector3.new(measured_vel.X, measured_vel.Y * travel_time, measured_vel.Z)
	end

	future_pos = future_pos + estimated_vel * travel_time
	future_pos = future_pos + Vector3.new(0, -0.5 * gravity * travel_time ^ 2, 0)

	return future_pos
end

local function waitUntilTimeout(event, timeout)
	local signal = Signal.new()
	local conn = nil
	local fired = false

	conn = event:Connect(function(...)
		if not fired then
			fired = true
			conn:Disconnect()
			conn = nil
			signal:Fire(...)
		end
	end)

	delay(timeout, function()
		if not fired and conn ~= nil then
			fired = true
			conn:Disconnect()
			conn = nil
			signal:Fire("Timed out")
		end
	end)

	return signal:Wait()
end

local rangedOg = {}
local weaponOrder = {}
local ranged = {}

for i, v in Modules.Name["WeaponsInOrder"] do
	weaponOrder[v.id] = v
end

for i, v in Modules.Name["WeaponIds"] do
	if weaponOrder[v] and weaponOrder[v].class == "ranged" then
		table.insert(ranged, i)
	end
end

for i, v in ranged do
	local m = Framework:GetMetadata(v) or Framework:GetUtility(v)
	if m then
		table.insert(rangedOg, { Name = v, OG = table.clone(m) })
	end
end

function modifyRanged(name, val)
	for i, v in rangedOg do
		local m = Framework:GetMetadata(v.Name) or Framework:GetUtility(v.Name)
		if m[name] then
			m[name] = val
		end
	end
end

function revertRanged(name)
	for i, v in rangedOg do
		local m = Framework:GetMetadata(v.Name) or Framework:GetUtility(v.Name)
		if m[name] then
			m[name] = v.OG[name]
		end
	end
end

--// Tabs
local Active = true
local Window = ReGui:Window({
	Title = "",
	Theme = "Monochrome",
	NoClose = true,
	NoCollapse = true,
	NoScrolling = true,
	NoScrollBar = true,
	NoResize = false,
	Size = UDim2.new(0, 610, 0, 720),
	CloseCallback = function()
		Active = false
		if cleardrawcache then
			cleardrawcache()
		end
	end,
}):Center()

local typeshit = "serenium.hvh"
local delay = 0.02

task.spawn(function()
	while true do
		for i = 1, #typeshit do
			Window:SetTitle(typeshit:sub(1, i))
			task.wait(delay + math.sin(i / #typeshit * math.pi) * 0.03)
		end
		task.wait(0.7)
		for i = #typeshit, 0, -1 do
			Window:SetTitle(typeshit:sub(1, i))
			task.wait(delay + math.sin(i / #typeshit * math.pi) * 0.03)
		end
		task.wait(0.5)
	end
end)

-- // Background

--[[
return nil
]]

local KeybindList = ReGui:Window({
	Title = "Keybinds",
	Theme = "Monochrome",
	NoCollapse = true,
	NoScrolling = false,
	NoScrollBar = true,
	NoResize = true,
	NoMove = false,
	NoClose = true,
	Size = UDim2.new(0, 300, 0, 300),
	AutomaticSize = Enum.AutomaticSize.Y,
})

KeybindList:SetVisible(false)

local Size = KeybindList:GetWindowSize() / 2
KeybindList:SetPosition(UDim2.new(0.1, -Size.X, 0.5, -Size.Y))

local TitleCanvas = Window:MakeTitleBarCanvas()

TitleCanvas:Image({
	LayoutOrder = 1,
	Image = Data.UIIcon or 116367688425247,
	Ratio = 1.25,
	RatioAxis = Enum.DominantAxis.Width,
	Size = UDim2.fromOffset(40, 40),
})

function ViewChangelogs()
	local J = false
	local ModalWindow
	ModalWindow = Window:PopupModal({
		Title = "Changelogs",
		AutoSize = "Y",
		NoClose = true,
		NoScroll = false,
		CloseCallback = function()
			if J then
				return
			end
			J = true
			ModalWindow:ClosePopup()
		end,
	})

	local changelogs = string.split(Changelogs, "\n")
	local bullets = { {} }
	for i, v in changelogs do
		if v ~= "%NEWBULLET%" then
			local currentIndex = #bullets[#bullets]
			if (currentIndex + 1) == 1 then
				table.insert(bullets[#bullets], "%HEADER%" .. v)
				continue
			end
			table.insert(bullets[#bullets], v)
		else
			bullets[#bullets + 1] = {}
		end
	end

	for i, v in bullets do
		if v[1]:match("%%HEADER%%") then
			ModalWindow:Label({
				Text = v[1]:gsub("%%HEADER%%", ""),
				Bold = true,
			})
			table.remove(v, 1)
			if #v ~= 0 then
				ModalWindow:Separator()
			end
		end
		if #v ~= 0 then
			ModalWindow:BulletText({
				Padding = 25,
				Rows = v,
			})
		end
	end

	ModalWindow:Button({
		Text = "Okay",
		Callback = function()
			ModalWindow:ClosePopup()
		end,
	})
end

local ActiveKeybinds = {}
function UpdateKeybinds()
	local Keybind = {}
	for i, v in Classes do
		if Classes[i .. "Keybind"] then
			if Classes[i .. "Keybind"].Value then
				Keybind[i] = `{Labels[i]} (%s) [%s]`
			else
				if ActiveKeybinds[i] then
					ActiveKeybinds[i][1]:Remove()
					ActiveKeybinds[i] = nil
				end
			end
		end
	end

	for Index, Text in Keybind do
		local Value = Classes[Index .. "Keybind"].Value
		if typeof(Value) == "EnumItem" then
			Value = Value.Name
		else
			Value = string.gsub(Value, "Enum.KeyCode.", "")
			Value = string.gsub(Value, "Enum.UserInputType.", "")
		end

		if ActiveKeybinds[Index] then
			ActiveKeybinds[Index][2].Text =
				string.format(`{Labels[Index]} (%s) [%s]`, Classes[Index].Value and "ON" or "OFF", Value)
			continue
		end

		local Object = KeybindList:Bullet({ Padding = 25 })
		local Class = Object:Label({
			Text = string.format(Text, Classes[Index].Value and "ON" or "OFF", Value),
			LayoutOrder = 2,
			Size = UDim2.fromOffset(0, 14),
		})
		ActiveKeybinds[Index] = { Object, Class }
	end

	local Size = KeybindList:GetWindowSize() / 2
	KeybindList:SetPosition(UDim2.new(0.1, -Size.X, 0.5, -Size.Y))
end

ViewChangelogs()

local Group = Window:List({
	UiPadding = 2,
	HorizontalFlex = Enum.UIFlexAlignment.Fill,
})

local TabsBar = Group:List({
	Border = false,
	UiPadding = 5,
	BorderColor = Window:GetThemeKey("Border"),
	BorderThickness = 1,
	HorizontalFlex = Enum.UIFlexAlignment.Fill,
	HorizontalAlignment = Enum.HorizontalAlignment.Center,
	AutomaticSize = Enum.AutomaticSize.None,
	FlexMode = Enum.UIFlexMode.None,
	Size = UDim2.new(1, 0, 0, 40),
	CornerRadius = UDim.new(0, 5),
})
local TabSelector, SelectorObject = Group:TabSelector({
	NoTabsBar = true,
	Size = UDim2.fromScale(0.5, 1),
})
SelectorObject.Body.ScrollBarThickness = 4

-- INFORMATION WINDOW
local Green = Color3.fromRGB(198, 255, 198)
local Red = Color3.fromRGB(255, 85, 85)

local InformationWindow, Object = ReGui:Window({
	Title = "Target Information",
	Theme = "Monochrome",
	NoCollapse = true,
	NoScrolling = true,
	NoScrollBar = true,
	NoResize = true,
	NoMove = true,
	NoClose = true,
	NoTitleBar = false,
	Size = UDim2.new(0, 400, 0, 160),
})

Object.AnchorPoint = Vector2.new(0, 0.5)
InformationWindow:SetPosition(UDim2.new(0.005, 0, 0.93, 0))

local Row = InformationWindow:Row({
	Spacing = 7,
})
local Image = Row:Image({
	Image = 5205790785,
	Border = true,
	BorderColor = InformationWindow:GetThemeKey("Border"),
	BorderThickness = 1,
	CornerRadius = UDim.new(0, 2),
})
local List, ListObj = Row:List({
	Ratio = 3.2,
})
local User = List:Label({ Text = "Username: Unknown (@DisplayName)", Bold = true, Italic = true })
local UserID = List:Label({ Text = "User ID: 1", Italic = true })
local UserLevel = List:Label({ Text = "Level: 1", Italic = true })
local UserScore = List:Label({ Text = "Score: 1", Italic = true })
local UserDistance = List:Label({ Text = "Distance: 0m", Italic = true })
local UserTool = List:Label({ Text = "Equipped Tool: Tool Name", Italic = true })
ListObj.UIListLayout.Padding = UDim.new(0, 5)
ListObj.UIListLayout.FillDirection = Enum.FillDirection.Vertical
ListObj.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

local UserHealth, SliderObj = InformationWindow:SliderProgress({
	Value = 115,
	Label = "",
	Format = "",
	Minimum = 0,
	Maximum = 115,
	ReadOnly = true,
	NoAnimation = true,
	Ratio = 20,
})

SliderObj.Track.Grab.BackgroundColor3 = Green
InformationWindow:SetVisible(false)

local ShowingInfo
local function ShowInformation(Player)
	if Player == nil then
		ShowingInfo = nil
		return
	end
	if ShowingInfo == Player then
		return
	end

	InformationWindow:SetVisible(true)

	local userId = Player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size180x180
	local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

	if executor ~= "Velocity" then
		if Classes.StreamerMode.Value and Classes.HidePlayerNames.Value then
			userId = 0
		end
	end

	User.Text = "Username: " .. Player.Name .. " (@" .. Player.DisplayName .. ")"
	UserID.Text = "User ID: " .. Player.UserId

	if executor ~= "Velocity" then
		if Classes.StreamerMode.Value and Classes.HidePlayerNames.Value then
			Image.Image = "rbxassetid:/5205790785"
		else
			Image.Image = (isReady and content) or "rbxassetid://0"
		end
	else
		Image.Image = (isReady and content) or "rbxassetid://0"
	end

	ShowingInfo = Player
	task.spawn(function()
		while ShowingInfo == Player do
			local Leaderstats = Player:FindFirstChild("leaderstats")
			if Leaderstats then
				UserLevel.Text = "Level: " .. Leaderstats.Level.Value
				UserScore.Text = "Score: " .. Leaderstats.Score.Value
			else
				break
			end

			local Character = Player.Character
			local PlayerCharacter = LocalPlayer.Character
			if Character then
				local Tool = Character:FindFirstChildOfClass("Tool")
				local Humanoid = Character:FindFirstChildOfClass("Humanoid")
				local OurHumanoid = PlayerCharacter:FindFirstChildOfClass("Humanoid")
				if Humanoid then
					if Humanoid.Health == 0 then
						break
					end
					local Root = Humanoid.RootPart
					if OurHumanoid and Root then
						local OurRoot = OurHumanoid.RootPart
						local Distance = (Root.Position - OurRoot.Position).Magnitude

						UserDistance.Text = "Distance: " .. math.round(tonumber(Distance)) .. "m"
					end

					local ratio = math.clamp(Humanoid.Health / 115, 0, 1)

					UserHealth:SetValue(Humanoid.Health)
					SliderObj.Track.Grab.BackgroundColor3 = Green:lerp(Red, 1 - ratio)
				else
					break
				end
				if Tool then
					UserTool.Text = "Equipped Tool: " .. Tool.Name
				else
					UserTool.Text = "Equipped Tool: None"
				end
			else
				break
			end
			RunService.RenderStepped:Wait()
		end
		if ShowingInfo == nil then
			UserTool.Text = "Equipped Tool: None"
			UserDistance.Text = "Distance: 0m"
			UserHealth:SetValue(0)
			InformationWindow:SetVisible(false)
		end
		if ShowingInfo == Player then
			UserTool.Text = "Equipped Tool: None"
			UserDistance.Text = "Distance: 0m"
			UserHealth:SetValue(0)
			task.wait(2)
			ShowingInfo = nil
			InformationWindow:SetVisible(false)
		end
	end)
end

-- END

local lol = false
local TabButton = {}
local function CreateTab(Name, Icon, CanvasSize)
	local Tab = TabSelector:CreateTab({
		Name = Name,
	})

	local List = Tab:List({
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		VerticalFlex = Enum.UIFlexAlignment.Fill,
		UiPadding = 1,
		Spacing = 10,
	})

	local Button, Obj = TabsBar:Image({
		Image = Icon,
		Ratio = 1,
		RatioAxis = Enum.DominantAxis.Width,
		Size = UDim2.fromScale(2, 2),
		Callback = function(self)
			for i, v in TabButton do
				local color = i == Name and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150)
				local tween = TweenService:Create(
					v,
					TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
					{ ImageColor3 = color }
				)
				tween:Play()
			end
			TabSelector:SetActiveTab(Tab)
			SelectorObject.Body.CanvasSize = CanvasSize
		end,
	})
	TabButton[Name] = Obj
	if lol then
		Obj.ImageColor3 = Color3.fromRGB(150, 150, 150)
	end

	Button.Parent:FindFirstChild("UIListLayout").Padding = UDim.new(0, 25)

	ReGui:SetItemTooltip(Button, function(Canvas)
		Canvas:Label({
			Text = Name,
		})
	end)

	lol = true
	return List
end

local function CreateRegion(Parent, Title, Scroll)
	local Region = Parent:Region({
		Border = true,
		BorderColor = Window:GetThemeKey("Border"),
		BorderThickness = 1,
		CornerRadius = UDim.new(0, 5),
		Scroll = Scroll or false,
	})

	if Title ~= "" then
		Region:Label({
			Text = Title,
		})
	end

	return Region
end

local CopiedColor = Color3.new(1, 1, 1)
local function Create(Parent, Name, Props, InstName, Tooltip, Keybind, Colorpicker, KeybindNoToggle, OgColor)
	Parent = (Keybind or Colorpicker) and Parent:Row() or Parent
	if Classes[InstName] then
		warn("!! DUPLICATE !!", Name, InstName)
	end
	if Name == "Checkbox" then
		Labels[InstName] = Props.Label

		local OriginalCallback = Props.Callback or function() end
		Props.Callback = function(...)
			UpdateKeybinds()
			return OriginalCallback(...)
		end
	end
	local Class, Object = Parent[Name](Parent, Props)
	if InstName then
		Classes[InstName] = Class
		Objects[InstName] = Object
	end
	if Tooltip then
		ReGui:SetItemTooltip(Class, function(Canvas)
			Canvas:Label({
				Text = Tooltip,
			})
		end)
	end
	if Keybind then
		local KeybindClass, _ = Parent:Keybind({
			Size = UDim2.fromOffset(55, 19),
			Label = "",
			IgnoreGameProcessed = false,
			Callback = function()
				UpdateKeybinds()
				if not KeybindNoToggle then
					Class:Toggle()
					print(`Toggled {Labels[InstName] or "Unknown"} to {Classes[InstName].Value and "ON" or "OFF"}`)
				end
			end,
			OnKeybindSet = UpdateKeybinds,
		})
		Classes[InstName .. "Keybind"] = KeybindClass
	end
	if Colorpicker then
		Colors[InstName] = (OgColor and OgColor or Color3.new(1, 1, 1))
		local _, Obj
		Obj = Parent:Button({
			Size = UDim2.fromOffset(19, 19),
			BackgroundTransparency = 0,
			Ratio = 1,
			RatioAxis = Enum.DominantAxis.Width,
			UiPadding = 0,
			ColorTag = "",
			ElementStyle = "",
			Text = "",
			BackgroundColor3 = Colors[InstName],
			Border = true,
			BorderThickness = 1,
			BorderColor = Color3.new(0, 0, 0),
			Callback = function()
				local Color = Colors[InstName] and Colors[InstName] or (OgColor and OgColor or Color3.new(1, 1, 1))
				Obj.BackgroundColor3 = Color
				local ModalWindow = Window:PopupModal({
					Title = "Colorpicker",
					AutoSize = "Y",
				})
				local Slider = ModalWindow:SliderColor3({
					Value = Color,
					Label = "Color",
					Callback = function(_, color)
						Obj.BackgroundColor3 = color
						Colors[InstName] = color
					end,
				})
				local Row = ModalWindow:Row({
					Spacing = 5,
				})
				local _, ColorButton
				Row:Button({
					Text = "Copy Color",
					Callback = function()
						ColorButton.BackgroundColor3 = Colors[InstName]
						CopiedColor = Colors[InstName]
					end,
				})
				Row:Button({
					Text = "Paste Color",
					Callback = function()
						Slider:SetValue(CopiedColor)
					end,
				})
				_, ColorButton = Row:Button({
					Size = UDim2.fromOffset(19, 19),
					BackgroundTransparency = 0,
					Ratio = 1,
					RatioAxis = Enum.DominantAxis.Width,
					UiPadding = 0,
					ColorTag = "",
					ElementStyle = "",
					Text = "",
					BackgroundColor3 = CopiedColor,
					Border = true,
					BorderThickness = 1,
					BorderColor = Color3.new(0, 0, 0),
				})
				ModalWindow:Button({
					Text = "Done",
					Size = UDim2.fromScale(1, 0),
					Callback = function()
						ModalWindow:ClosePopup()
					end,
				})
			end,
		})

		local Color = Colors[InstName] and Colors[InstName] or (OgColor and OgColor or Color3.new(1, 1, 1))
		Obj.BackgroundColor3 = Color
	end

	return Class, Object
end

local CloseRange = CreateTab("Close-Range", "rbxassetid://124159074947754", UDim2.new(0, 0, 1.175, 0))
local Ranged = CreateTab("Ranged", "rbxassetid://92157041036177", UDim2.new(0, 0, 1.05, 0))
local Character = CreateTab("Character", "rbxassetid://81489458260315", UDim2.new(0, 0, 1.075, 0))
local Visuals = CreateTab("Visuals", "rbxassetid://7300480952", UDim2.new(0, 0, 0, 0))
local Misc = CreateTab("Misc", "rbxassetid://7734042071", UDim2.new(0, 0, 1.3, 0))
local Sniper = CreateTab("Sniper", "rbxassetid://92157041036177", UDim2.new(0, 0, 1.05, 0))
local MorphsTab = CreateTab("Morphs", "rbxassetid://4344974639", UDim2.new(0, 0, 1.05, 0))
local Settings = CreateTab("Settings", "rbxassetid://7300486042", UDim2.new(0, 0, 0, 0))

SelectorObject.Body.CanvasSize = UDim2.new(0, 0, 1.175, 0)

--// Melee Tab
local CombatSection = CreateRegion(CloseRange, "Kill Aura")
do --// Kill Aura
	Create(
		CombatSection,
		"Checkbox",
		{ Label = "Kill Aura", Value = false },
		"KillAura",
		"Automatically hits people for you",
		true
	)
	Create(
		CombatSection,
		"Checkbox",
		{ Label = "Play Animation", Value = false },
		"PlayAnimation",
		"Plays animation on slash",
		true
	)
	Create(
		CombatSection,
		"Checkbox",
		{ Label = "Teleport To Enemy", Value = false },
		"TPEnemy",
		"Teleports to enemy, making you harder to hit",
		true
	)
	Create(
		CombatSection,
		"Combo",
		{ Label = "Kill Aura Type", Selected = 1, Items = { "Single Person", "Multiple People" } },
		"KillAuraType",
		"Self explantory... I think?"
	)

	Create(
		CombatSection,
		"SliderProgress",
		{ Label = "Range", Value = 15, Minimum = 5, Maximum = 12, Format = "%.f studs" },
		"KillAuraRange",
		"The range for Kill Aura"
	)
	Create(
		CombatSection,
		"Combo",
		{ Label = "Teleport Type", Selected = 1, Items = { "Behind", "Orbit", "Above", "Below", "Random" } },
		"TPType",
		"Teleport type"
	)
	Create(
		CombatSection,
		"SliderProgress",
		{ Label = "TP Range", Value = 10, Minimum = 0, Maximum = 15, Format = "%.f studs" },
		"TPRange",
		"The range for TP To Enemy"
	)

	Create(
		CombatSection,
		"Checkbox",
		{ Label = "Range Indicator", Value = false },
		"RangeIndicator",
		"Shows your detection range",
		true,
		true
	)
end

local Modifications = CreateRegion(CloseRange, "Modifications")
do --// Modificationss
	Create(
		Modifications,
		"Checkbox",
		{ Label = "Always Hit", Value = false },
		"AlwaysHit",
		"Always hit your target if they're in your range",
		true
	)
	Create(
		Modifications,
		"Combo",
		{ Label = "Hit Part", Selected = 1, Items = { "Head", "Torso" } },
		"AlwaysHitPart",
		"What to hit"
	)
	Create(
		Modifications,
		"SliderProgress",
		{ Label = "Range", Value = 15, Minimum = 5, Maximum = 15, Format = "%.f studs" },
		"AlwaysHitRange",
		"The range for Always Hit"
	)

	Modifications:Separator({ Text = "Others" })

	Create(
		Modifications,
		"Checkbox",
		{ Label = "Anti Parry", Value = false },
		"AntiParry",
		"Prevents you from getting parried most of the time",
		true
	)
	Create(
		Modifications,
		"Checkbox",
		{ Label = "Auto Equip", Value = false },
		"AutoEquip",
		"Automatically equips your weapon",
		true
	)
	Create(
		Modifications,
		"Checkbox",
		{ Label = "Fake Swing", Value = false },
		"FakeSwing",
		"Plays swing animation to bait shitty Auto Parry",
		true
	)
	Create(
		Modifications,
		"Checkbox",
		{ Label = "Play Swing Sound", Value = false },
		"SwingSound",
		"Plays swing sound to bait decent Auto Parry",
		true,
		false,
		true
	)

	UserInputService.InputBegan:Connect(function(i, gp)
		if gp then
			return
		end
		if
			Classes.SwingSound.Value
			and (i.KeyCode == Classes.SwingSoundKeybind.Value or i.UserInputType == Classes.SwingSoundKeybind.Value)
		then
			local Weapon = Framework:GetWeapon()
			if Weapon then
				Network:FireServer("MeleeSwing", Weapon, math.random(1, 3))
			end
		end
	end)
end

CloseRange:Separator({ Text = "Parry" })

local ParrySection = CreateRegion(CloseRange, "")
do --// Auto Parry
	Create(
		ParrySection,
		"Checkbox",
		{ Label = "Auto Parry", Value = false },
		"AutoParry",
		"Automatically parries incoming attacks",
		true
	)
	Create(
		ParrySection,
		"Checkbox",
		{ Label = "Random Chance", Value = false },
		"RandomChance",
		"Randomize auto parry chance",
		true
	)
	Create(
		ParrySection,
		"Checkbox",
		{ Label = "SmartCheck", Value = false },
		"SmartCheck",
		"Predicts hitbox creation time by anim (if hitbox method doesnt work)",
		true
	)
	Create(
		ParrySection,
		"Checkbox",
		{ Label = "Check If Looking", Value = false },
		"LookCheck",
		"Checks if enemy is looking at you",
		true
	)
	Create(
		ParrySection,
		"Combo",
		{ Label = "Check Method", Selected = 1, Items = { "Sounds", "Animations" } },
		"APCheck",
		"What to check"
	)
	Create(
		ParrySection,
		"Combo",
		{ Label = "Auto Parry Type", Selected = 1, Items = { "Remote", "Keypress", "Double Parry (OP)" } },
		"APType",
		"Remote means no animation/shield and Keypress plays animation/shows the shield"
	)

	Create(
		ParrySection,
		"SliderProgress",
		{ Label = "Delay", Value = 0, Minimum = 0, Maximum = 1, Format = "%.1f seconds" },
		"APDelay",
		"How many seconds to wait before parrying"
	)
	Create(
		ParrySection,
		"SliderProgress",
		{ Label = "Range", Value = 15, Minimum = 1, Maximum = 15, Format = "%.f studs" },
		"APRange",
		"How far does it detect the enemies"
	)
	Create(
		ParrySection,
		"SliderProgress",
		{ Label = "Chance", Value = 100, Minimum = 1, Maximum = 100, Format = "%.f%%" },
		"APChance",
		"Chance to parry"
	)
	Create(
		ParrySection,
		"SliderProgress",
		{ Label = "Look Angle", Value = 45, Minimum = 1, Maximum = 180, Format = "%.f degrees" },
		"APAngle",
		"The angle for Check If Looking"
	)
	Create(
		ParrySection,
		"SliderProgress",
		{ Label = "Marker Threshold", Value = 0.3, Minimum = 0, Maximum = 1, Format = "%.1f seconds" },
		"Threshold",
		"Threshold for animation"
	)

	Create(
		ParrySection,
		"Checkbox",
		{ Label = "Range Indicator", Value = false },
		"APRangIndicator",
		"Shows your parry range",
		true,
		true
	)
	Create(
		ParrySection,
		"Checkbox",
		{ Label = "Player Look Angle Indicator", Value = false },
		"LookIndicator",
		"Visualizes Look Angle on enemies",
		true,
		true
	)
end

--// Character Tab
local CharModifications = CreateRegion(Character, "Character Modifications")
do --// Mods
	Create(
		CharModifications,
		"Checkbox",
		{ Label = "Walkspeed", Value = false },
		"TPWalk",
		"Your custom walkspeed",
		true
	)
	Create(
		CharModifications,
		"SliderProgress",
		{ Label = "Speed", Value = 16, Minimum = 16, Maximum = 200, Format = "%.f walkspeed" },
		"TPWalkValue",
		"Walkspeed"
	)

	Create(CharModifications, "Checkbox", {
		Label = "Jump Power",
		Value = false,
		Callback = function(self, bool)
			if not bool then
				if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
					local Container = Modules.Name["JumpHandlerClient"].getJumpPowerValueContainer()
					if Container then
						Container:setBaseValue(50)
					end
				end
			end
		end,
	}, "JP", "Custom jump power", true)
	Create(
		CharModifications,
		"SliderProgress",
		{ Label = "Power", Value = 50, Minimum = 50, Maximum = 200, Format = "%.f power" },
		"JPValue",
		"Your custom jump power"
	)

	CharModifications:Separator({ Text = "Others" })

	Create(CharModifications, "Checkbox", {
		Label = "Fly",
		Value = false,
	}, "Fly", "Be able to fly", true)
	Create(
		CharModifications,
		"Checkbox",
		{ Label = "Void Hide", Value = false },
		"VoidHide",
		"Hides your character by voiding position",
		true
	)
	Create(
		CharModifications,
		"Checkbox",
		{ Label = "B-Hop", Value = false },
		"Bhop",
		"Automatically jumps for you",
		true
	)
	Create(
		CharModifications,
		"Checkbox",
		{ Label = "Spin", Value = false },
		"Spin",
		"You spin me right round, baby, right round",
		true
	)
	Create(
		CharModifications,
		"Checkbox",
		{ Label = "No Animations", Value = false },
		"NoAnimations",
		"Stops any playing animation",
		true
	)
	Create(
		CharModifications,
		"Checkbox",
		{ Label = "Infinite Jump", Value = false },
		"InfiniteJump",
		"Be able to jump in the air",
		true
	)
	Create(CharModifications, "SliderProgress", {
		Label = "Fly Speed",
		Value = 50,
		Minimum = 50,
		Maximum = 200,
		Format = "%.f stud/s",
	}, "FlySpeed", "Fly speed")
	Create(
		CharModifications,
		"SliderProgress",
		{ Label = "Spin Speed", Value = 100, Minimum = 1, Maximum = 100, Format = "%.f" },
		"SpinSpeed",
		"Spin speed"
	)

	CharModifications:Separator({ Text = "Revive" })

	Create(
		CharModifications,
		"Checkbox",
		{ Label = "Auto Revive", Value = false },
		"AR",
		"Automatically revives you",
		true
	)

	CharModifications:Separator({ Text = "Hitbox" })

	local parts = table.clone(R6BodyParts)
	table.insert(parts, "Random")
	Create(
		CharModifications,
		"Checkbox",
		{ Label = "Hitbox Expander", Value = false },
		"HitboxExpand",
		"Expands people hitbox",
		true,
		true,
		false,
		Color3.fromRGB(100, 83, 255)
	)
	Create(
		CharModifications,
		"Checkbox",
		{ Label = "Show Expanded Hitbox", Value = false },
		"ShowHitbox",
		"Shows expanded hitbox",
		true
	)
	Create(
		CharModifications,
		"Combo",
		{ Label = "Hitpart", Selected = 1, Items = parts },
		"HBEPart",
		"What part to hit"
	)
	Create(
		CharModifications,
		"SliderProgress",
		{ Label = "Hitbox Size", Value = 20, Minimum = 1, Maximum = 20, Format = "%.f stud" },
		"HitboxSize",
		"Hitbox size"
	)

	local FakeHitboxes = {}
	function ApplyHitbox(Character)
		task.wait()

		local FakeHitbox = Instance.new("Part")
		FakeHitbox.Size = Vector3.new(Classes.HitboxSize.Value, Classes.HitboxSize.Value, Classes.HitboxSize.Value)
		FakeHitbox.CanCollide = false
		if Classes.ShowHitbox.Value then
			FakeHitbox.Transparency = 0.7
		else
			FakeHitbox.Transparency = 1
		end
		FakeHitbox.Name = "FakeHitbox"
		FakeHitbox.Color = Colors.HitboxExpand or Color3.fromRGB(100, 83, 255)
		FakeHitbox:SetAttribute("IsCharacterHitbox", Classes.HitboxExpand.Value)
		FakeHitbox.Massless = true
		FakeHitbox.CastShadow = false
		FakeHitbox.Parent = Character

		FakeHitbox:AddTag("RANGED_CASTER_IGNORE_LIST")

		local Weld = Instance.new("Weld")
		Weld.Part0 = Character:WaitForChild("HumanoidRootPart")
		Weld.Part1 = FakeHitbox
		Weld.Parent = FakeHitbox

		table.insert(FakeHitboxes, FakeHitbox)
	end

	for i, v in PlayerCharacters:GetChildren() do
		if v ~= LocalPlayer.Character then
			ApplyHitbox(v)
		end
	end

	for i, v in Players:GetPlayers() do
		if v ~= LocalPlayer then
			v.CharacterAdded:Connect(ApplyHitbox)
		end
	end

	Players.PlayerAdded:Connect(function(Player)
		Player.CharacterAdded:Connect(ApplyHitbox)
	end)

	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			for i, v in FakeHitboxes do
				if not v:IsDescendantOf(game) then
					table.remove(FakeHitboxes, i)
					continue
				end

				local toExpand = v.Parent:FindFirstChild(Classes.HBEPart.Value)
				if toExpand and v.Weld.Part0 ~= toExpand then
					v.Weld.Part0 = toExpand
				end

				v.Transparency = (Classes.HitboxExpand.Value and Classes.ShowHitbox.Value) and 0.7 or 1
				v.Color = Colors.HitboxExpand or Color3.fromRGB(223, 120, 255)
				v.Size = Vector3.new(Classes.HitboxSize.Value, Classes.HitboxSize.Value, Classes.HitboxSize.Value)

				v:SetAttribute("IsCharacterHitbox", Classes.HitboxExpand.Value)
				if not Classes.HitboxExpand.Value then
					if not v:HasTag("RANGED_CASTER_IGNORE_LIST") then
						v:AddTag("RANGED_CASTER_IGNORE_LIST")
					end
				else
					if v:HasTag("RANGED_CASTER_IGNORE_LIST") then
						v:RemoveTag("RANGED_CASTER_IGNORE_LIST")
					end
				end
			end
		end),
		nil,
		Enum.RenderPriority.Last
	)

	task.spawn(function()
		local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local Humanoid = Character:WaitForChild("Humanoid")
		local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
		local ClientCFrame = HumanoidRootPart.CFrame

		local original_index
		original_index = hookmetamethod(
			game,
			"__index",
			newcclosure(function(self, property)
				if
					not checkcaller()
					and Classes.VoidHide.Value
					and self == HumanoidRootPart
					and property == "CFrame"
				then
					return ClientCFrame
				end
				return original_index(self, property)
			end)
		)

		local function getTargetCFrame()
			if not HumanoidRootPart then
				return ClientCFrame
			end
			local basePos = HumanoidRootPart.Position
			local Y = math.random(-1000, 0)
			local X = basePos.X
			local Z = basePos.Z
			return CFrame.new(X, Y, Z)
		end

		LocalPlayer.CharacterAdded:Connect(function(newchar)
			Character = newchar
			HumanoidRootPart = newchar:WaitForChild("HumanoidRootPart")
			Humanoid = newchar:WaitForChild("Humanoid")
			ClientCFrame = HumanoidRootPart.CFrame
		end)

		RunService.Heartbeat:Connect(function()
			if not (HumanoidRootPart and HumanoidRootPart.Parent) then
				return
			end
			ClientCFrame = HumanoidRootPart.CFrame
			if Classes.VoidHide.Value and isnetworkowner(HumanoidRootPart) then
				local target = getTargetCFrame()
				HumanoidRootPart.CFrame = target
				Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
			else
				HumanoidRootPart.CFrame = ClientCFrame
			end
			RunService.RenderStepped:Wait()
			HumanoidRootPart.CFrame = ClientCFrame
		end)

		local boostmultiplier = 2
		local updown = true
		local keys = { w = false, a = false, s = false, d = false, space = false, ctrl = false, lshift = false }
		local driver = nil

		UserInputService.InputBegan:Connect(function(input, gpe)
			if gpe then
				return
			end
			local name = input.KeyCode.Name:lower()
			if keys[name] ~= nil then
				keys[name] = true
			end
		end)

		UserInputService.InputEnded:Connect(function(input, gpe)
			if gpe then
				return
			end
			local name = input.KeyCode.Name:lower()
			if keys[name] ~= nil then
				keys[name] = false
			end
		end)

		local function enablefly()
			if driver then
				return
			end
			HumanoidRootPart.Anchored = true
			task.wait()
			HumanoidRootPart.Anchored = false
			driver = Instance.new("Part")
			driver.Size = Vector3.new(1, 1, 1)
			driver.Transparency = 1
			driver.Anchored = true
			driver.CanCollide = false
			driver.Parent = workspace
			driver.CFrame = HumanoidRootPart.CFrame
		end

		local function disablefly()
			if driver then
				driver:Destroy()
				driver = nil
			end
			local old = HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
			if old then
				old:Destroy()
			end
		end

		local AntiCheatHandler = Modules.Name["AntiCheatHandler"]
		RunService.Heartbeat:Connect(function(dt)
			if Classes.Fly.Value then
				if not driver then
					enablefly()
				end
				local bv = HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
				if not bv then
					bv = AntiCheatHandler.createBodyMover("BodyVelocity")
					bv.Parent = HumanoidRootPart
					bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
				end
				local move = Vector3.zero
				if keys.w then
					move += Camera.CFrame.LookVector
				end
				if keys.s then
					move -= Camera.CFrame.LookVector
				end
				if keys.a then
					move -= Camera.CFrame.RightVector
				end
				if keys.d then
					move += Camera.CFrame.RightVector
				end
				if updown then
					if keys.space then
						move += Vector3.yAxis
					end
					if keys.ctrl then
						move -= Vector3.yAxis
					end
				end
				if move.Magnitude > 0 then
					move = move.Unit
				end
				local speed = Classes.FlySpeed.Value * (keys.lshift and boostmultiplier or 1)
				driver.CFrame = driver.CFrame + move * speed * dt
				driver.CFrame = CFrame.new(driver.Position, driver.Position + Camera.CFrame.LookVector)
				bv.Velocity = move * speed
				HumanoidRootPart.CFrame = driver.CFrame
			else
				if driver then
					disablefly()
				end
			end
		end)
	end)
end

local CharModifications2 = CreateRegion(Character, "Character Modifications 2")
do --// Others
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "Infinite Stamina", Value = false },
		"IS",
		"Never run out of stamina",
		true
	)
	Create(CharModifications2, "Checkbox", {
		Label = "Infinite Air",
		Value = false,
		Callback = function(self, bool)
			if bool then
				Modules.Name["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 0
			else
				Modules.Name["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = -15
			end
		end,
	}, "IA", "Never run out of air", true)

	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "Can Always Jump", Value = false },
		"CAJ",
		"Be able to jump even when downed",
		true
	)

	Create(CharModifications2, "Checkbox", {
		Label = "No Jump Cooldown",
		Value = false,
		Callback = function(self, bool)
			if bool then
				Modules.Name["JumpConstants"].JUMP_DELAY_ADD = 0
			else
				Modules.Name["JumpConstants"].JUMP_DELAY_ADD = 1
			end
		end,
	}, "NJCD", "No jump cooldown", true)
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "Anti Fling", Value = false },
		"AntiFling",
		"Prevents others from flinging you",
		true
	)
	Create(CharModifications2, "Checkbox", { Label = "No Swim", Value = false }, "antiswim", "disables swimming", true)
	Create(CharModifications2, "Checkbox", {
		Label = "No Dash Cooldown",
		Value = false,
		Callback = function(self, bool)
			if bool then
				Modules.Name["DashConstants"].DASH_COOLDOWN = 0
			else
				Modules.Name["DashConstants"].DASH_COOLDOWN = 3
			end
		end,
	}, "NDCD", "No dash cooldown", true)
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "No Name Tag", Value = false },
		"NT",
		"No name tag above your head",
		true
	)
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "No Utilities Trigger", Value = false },
		"NUD",
		"Disables beartrap and claymore",
		true
	)
	Create(CharModifications2, "Checkbox", {
		Label = "Instant Use Utilities",
		Value = false,
		Callback = function(self, bool)
			if bool then
				for i, v in Modules.Name["UtilityMetadata"] do
					if v.displayName ~= "Medkit" then
						v.cacheDur = v.preThrowDuration or 0.001
						v.cacheTime = v.useTime or 0

						v.preThrowDuration = 0.001
						v.useTime = 0
					end
				end
			else
				for i, v in Modules.Name["UtilityMetadata"] do
					if v.displayName ~= "Medkit" then
						v.preThrowDuration = v.cacheDur or v.preThrowDuration
						v.useTime = v.cacheTime or v.useTime
					end
				end
			end
		end,
	}, "IUU", "Disables beartrap and claymore", true)
	Create(CharModifications2, "Checkbox", { Label = "No Knockback", Value = false }, "NKB", "Disables knockback", true)
	Create(CharModifications2, "Checkbox", {
		Label = "No Fall Damage",
		Value = false,
		Callback = function(self, bool)
			Framework:GetSessionData():getState().fallDamageClient.isDisabled = bool
		end,
	}, "NFD", "Disables fall damage", true)
	Create(CharModifications2, "Checkbox", { Label = "No Ragdoll", Value = false }, "NR", "Disables ragdoll", true)
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "No Parry Stun", Value = false },
		"NPS",
		"Disables parry stun",
		true
	)
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "No Parry Slowdown", Value = false },
		"NPS2",
		"Disables slowdown on parry",
		true
	)
	if Remotes then
		Create(
			CharModifications2,
			"Checkbox",
			{ Label = "No Flash Effect", Value = false },
			"NoFlash",
			"Disables every flashbang/bomb effects",
			true
		)
	else
	end
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "No Low Health Effect", Value = false },
		"NoHealth",
		"Disables low health effects",
		true
	)
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "No Ghost Potion Effect", Value = false },
		"NoGhostPotEffect",
		"Disables ghost potion effects",
		true
	)
	Create(CharModifications2, "Checkbox", {
		Label = "Walk On Water",
		Value = false,
		Callback = function(self, bool)
			for i, v in Map:GetDescendants() do
				if v:IsA("BasePart") and v.Name == "WaterArea" then
					v.CanCollide = bool
				end
			end
		end,
	}, "WOW", "Be able to walk on maps with water", true)
	local conn
	Create(CharModifications2, "Checkbox", {
	Label = "Upside Down",
	Value = false,
	Callback = function(self, bool)
		if renderConn then
			renderConn:Disconnect()
			renderConn = nil
		end
		if charAddedConn then
			charAddedConn:Disconnect()
			charAddedConn = nil
		end

		if bool then
			local function apply(char)
				local hrp = char:WaitForChild("HumanoidRootPart")
				originalCFrame = hrp.CFrame
				renderConn = RunService.RenderStepped:Connect(function()
					hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(math.rad(180), 0, 0)
				end)
			end

			if LocalPlayer.Character then
				apply(LocalPlayer.Character)
			end
			charAddedConn = LocalPlayer.CharacterAdded:Connect(apply)
		else
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local hrp = LocalPlayer.Character.HumanoidRootPart
				if originalCFrame then
					hrp.CFrame = originalCFrame
				else
					hrp.CFrame = CFrame.new(hrp.Position)
				end
			end
		end
	end,
}, "UpsideDown", "Flips your character")




	Create(CharModifications2, "Checkbox", {
		Label = "Noclip",
		Value = false,
		Callback = function(self, bool)
			noclip(bool)
		end,
	}, "NoclipToggle", "Enables noclip bro", true)

	Create(CharModifications2, "Checkbox", {
		Label = "Ragdoll",
		Value = false,
		Callback = function(self, bool)
			local character = LocalPlayer.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid and humanoid:FindFirstChild("RagdollRemoteEvent") then
				humanoid.RagdollRemoteEvent:FireServer(bool)
			end
		end,
	}, "RagdollTuff", "Ragdolls you (use with keybind)", true)

	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "Anti-Noclip Bypass", Value = false },
		"NCBypass",
		"Lets you noclip without AC rectifying",
		true
	)

  Create(CharModifications2, "Checkbox", {
    Label = "Speed Animations Up",
    Value = false,
    Callback = function(self, bool)
        if animConn then
            animConn:Disconnect()
            animConn = nil
        end
        if charConn then
            charConn:Disconnect()
            charConn = nil
        end

        local function apply(char)
            local humanoid = char:WaitForChild("Humanoid")
            local animator = humanoid:FindFirstChildOfClass("Animator")
            if not animator then
                animator = Instance.new("Animator")
                animator.Parent = humanoid
            end

            animConn = RunService.RenderStepped:Connect(function()
                for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                    track:AdjustSpeed(15)
                end
            end)
        end

        if bool then
            if LocalPlayer.Character then
                apply(LocalPlayer.Character)
            end
            charConn = LocalPlayer.CharacterAdded:Connect(apply)
        else
            if animConn then
                animConn:Disconnect()
                animConn = nil
            end
            if charConn then
                charConn:Disconnect()
                charConn = nil
            end
            if LocalPlayer.Character then
                local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                        track:AdjustSpeed(1)
                    end
                end
            end
        end
    end,
}, "SpeedAnimationsUp", "Speeds up all character animations")



  CharModifications2:Separator({ Text = "Others" })
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "Fake Position", Value = false },
		"fakeposition",
		"fakes your position",
		true
	)
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "Desync", Value = false },
		"Desync",
		"Turn this on if you want to disrupt Silent Aim calculations",
		true
	)
	Create(
		CharModifications2,
		"Checkbox",
		{ Label = "TP To Death Pos", Value = false },
		"DTP",
		"Teleports you to where you last died",
		true
	)
	Create(CharModifications2, "Checkbox", {
		Label = "Hide Weapon On Back",
		Value = false,
		Callback = function(self, bool)
			if bool then
				local Character = LocalPlayer.Character
				local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
				if Humanoid then
					Humanoid:EquipTool(LocalPlayer.Backpack:GetChildren()[1])
					task.wait()
					Humanoid:UnequipTools()
				end
			end
		end,
	}, "HideWeaponOnBack", "Disables tweapon on your back", true)

	local Conn
	Conn = Map.DescendantAdded:Connect(function(Part)
		if not Active then
			Conn:Disconnect()
			return
		end
		if Part:IsA("BasePart") and Part.Name == "WaterArea" then
			Part.CanCollide = Classes.WOW.Value
		end
	end)
end
task.spawn(function()
	if Classes.fakeposition.Value then
		setfflag("NextGenReplicatorEnabledWrite4", "true")
	else
		setfflag("NextGenReplicatorEnabledWrite4", "false")
	end
end)
--// Ranged Tab
local AimbotSection = CreateRegion(Ranged, "Aimbot")
do --// Aimbot
	Create(
		AimbotSection,
		"Checkbox",
		{ Label = "Aimbot", Value = false },
		"Aimbot",
		"Automatically aims for you",
		true,
		false,
		true
	)
	Create(
		AimbotSection,
		"Checkbox",
		{ Label = "Smooth Out", Value = false },
		"Smooth",
		"Smooths out camera",
		true,
		false
	)
	Create(
		AimbotSection,
		"Checkbox",
		{ Label = "Prediction", Value = false },
		"Prediction",
		"Whether to predict the target next position or not",
		true
	)
	Create(
		AimbotSection,
		"Checkbox",
		{ Label = "Hold Keybind", Value = false },
		"Hold",
		"Whether to hold keybind to activate or not",
		true
	)
	Create(
		AimbotSection,
		"Checkbox",
		{ Label = "Show FOV", Value = false },
		"ShowFOVAimbot",
		"Shows the FOV of the Aimbot",
		true,
		true
	)
	Create(AimbotSection, "Checkbox", {
		Label = "Show Target",
		Value = false,
		Callback = function(self, bool)
			if not bool then
				AimbotHighlight.Adornee = nil
				ShowInformation(nil)
			end
		end,
	}, "ShowTargetAB", "Shows aimbot target", true, true)
	Create(
		AimbotSection,
		"SliderProgress",
		{ Label = "FOV Size", Value = 500, Minimum = 10, Maximum = 500, Format = "%.f" },
		"FOVSizeAimbot",
		"Change how big the FOV is"
	)
	Create(
		AimbotSection,
		"Combo",
		{ Label = "Hit Part", Selected = 1, Items = { "Head", "Torso" } },
		"AimbotHitPart",
		"What to aim to & hit"
	)
end
local SilentAimSection = CreateRegion(Ranged, "Silent Aim")
do --// Silent Aim
	Create(
		SilentAimSection,
		"Checkbox",
		{ Label = "Silent Aim", Value = false },
		"SilentAim",
		"Manipulates arrow to always hit",
		true
	)
	Create(SilentAimSection, "Combo", {
		Label = "Check Type",
		Selected = 1,
		Items = { "Closest To Mouse", "Closest To Arrow", "Only Redirect To Target" },
	}, "ClosestType", "Explantory")
	Create(
		SilentAimSection,
		"Combo",
		{ Label = "Hit Part", Selected = 1, Items = { "Head", "Torso", "Random" } },
		"SilentHitPart",
		"What to aim to & hit"
	)
	Create(
		SilentAimSection,
		"SliderProgress",
		{ Label = "Range", Value = 19, Minimum = 1, Maximum = 19, Format = "%.f studs" },
		"SilentAimRange",
		"How to far detect"
	)
	Create(
		SilentAimSection,
		"SliderProgress",
		{ Label = "Hit Chance", Value = 100, Minimum = 1, Maximum = 100, Format = "%.f%%" },
		"HitChance",
		"Chance to hit"
	)

	Create(
		SilentAimSection,
		"Checkbox",
		{ Label = "Show FOV", Value = false },
		"ShowFOV",
		"Shows the FOV of the Silent Aim",
		true,
		true
	)
	Create(
		SilentAimSection,
		"SliderProgress",
		{ Label = "FOV Size", Value = 500, Minimum = 10, Maximum = 500, Format = "%.f" },
		"FOVSize",
		"Change how big the FOV is"
	)
	Create(
		SilentAimSection,
		"Checkbox",
		{ Label = "Resolver", Value = false },
		"Resolver",
		"Resolves the target and get their real position",
		true
	)
	Create(SilentAimSection, "Checkbox", {
		Label = "Show Target",
		Value = false,
		Callback = function(self, bool)
			if not bool then
				SilentAimHighlight.Adornee = nil
				ShowInformation(nil)
			end
		end,
	}, "ShowTargetSA", "Shows silent aim target", true, true)
end
Ranged:Separator({ Text = "Modifications" })
local ModificationsSection = CreateRegion(Ranged, "")
do --// Mods
	Create(ModificationsSection, "Checkbox", {
		Label = "No Spread",
		Value = false,
		Callback = function(_, bool)
			if bool then
				modifyRanged("minSpread", 0)
				modifyRanged("maxSpread", 0)
			else
				revertRanged("minSpread")
				revertRanged("maxSpread")
			end
		end,
	}, "NoSpread", "No projectile spread", true)
	Create(ModificationsSection, "Checkbox", {
		Label = "No Recoil",
		Value = false,
		Callback = function(_, bool)
			if bool then
				modifyRanged("recoilAmount", 0)
			else
				revertRanged("recoilAmount")
			end
		end,
	}, "NoRecoil", "No projectile recoil", true)
	Create(ModificationsSection, "Checkbox", {
		Label = "No Gravity",
		Value = false,
		Callback = function(_, bool)
			if bool then
				modifyRanged("gravity", Vector3.new(0, 0, 0))
			else
				revertRanged("gravity")
			end
		end,
	}, "NoGravity", "No projectile gravity", true)
	Create(
		ModificationsSection,
		"Checkbox",
		{ Label = "No Reload Cancel", Value = false },
		"NoReloadCancel",
		"No ranged reload cancel",
		true
	)
	Create(ModificationsSection, "Checkbox", {
		Label = "No Reload Slowdown",
		Value = false,
		Callback = function(_, bool)
			if bool then
				modifyRanged("reloadWalkSpeedMultiplier", 1)
			else
				revertRanged("reloadWalkSpeedMultiplier")
			end
		end,
	}, "NoReloadSlow", "No slowdown on reload", true)
	Create(ModificationsSection, "Checkbox", {
		Label = "Instant Charge",
		Value = false,
		Callback = function(_, bool)
			if bool then
				modifyRanged("chargeOnDuration", 0.01)
				modifyRanged("chargeOffDuration", 0.01)
			else
				revertRanged("chargeOnDuration")
				revertRanged("chargeOffDuration")
			end
		end,
	}, "InstantCharge", "No charge time", true)
	Create(ModificationsSection, "Checkbox", {
		Label = "Infinite Range",
		Value = false,
		Callback = function(_, bool)
			if bool then
				modifyRanged("maxDistance", 10000)
			else
				revertRanged("maxDistance")
			end
		end,
	}, "InfiniteRange", "Shoot very fair", true)
	Create(
		ModificationsSection,
		"Checkbox",
		{ Label = "Wallbang", Value = false },
		"Wallbang",
		"Ignore walls and only hit players",
		true
	)
	Create(
		ModificationsSection,
		"Checkbox",
		{ Label = "Always Head", Value = false },
		"AlwaysHead",
		"Always hit head even if you hit other parts",
		true
	)
	Create(ModificationsSection, "Combo", {
		Label = "Hit Hit Effect",
		Selected = 1,
		Items = {
			"None",
			"Blackhole",
			"Bubble",
			"Flame",
			"Glow",
			"Ground Spiral",
			"Impact",
			"KO",
			"MLG",
			"Shock Bubble",
			"Shockwave",
			"Shockwave Explosion",
			"Slash",
			"Soul Slash",
			"Sparkles",
			"Sparks",
			"Spiral",
			"Spiral Slash",
			"Shine",
			"Summon",
			"Supernova",
			"Tornado",
			"Zzz",
		},
	}, "HitEffect", "When arrow lands, show an effect", false, true, false, Color3.fromRGB(87, 112, 255))
end

--// Visuals Tab
--// Visuals Tab
local ESPSection = CreateRegion(Visuals, "ESP")
do
	Create(ESPSection, "Checkbox", { Label = "Enabled", Value = false }, "ESP", "Show enemies locations", true)
	Create(
		ESPSection,
		"SliderProgress",
		{ Label = "Max Distance", Value = 5000, Minimum = 250, Maximum = 5000, Format = "%.f studs" },
		"ESPMaxDistance",
		"How far does the ESP goes"
	)
	ESPSection:Separator({ Text = "Configuration" })
	Create(
		ESPSection,
		"Checkbox",
		{ Label = "Box", Value = false },
		"Boxes",
		"Show enemies location as boxes",
		true,
		true
	)
	Create(ESPSection, "Checkbox", { Label = "Name", Value = false }, "Names", "Show enemies names", true, true)
  Create(ESPSection, "Checkbox",
    { Label = "Tracer", Value = false },
    "Tracer",
    "Show enemy tracers",
    true,
    true
)

Create(ESPSection, "SliderProgress",
    {
        Label = "Tracer Length",
        Value = 500,
        Minimum = 100,
        Maximum = 500,
        Format = "%.f studs"
    },
    "TracerMaxDist",
    "Maximum distance to show tracer"
)


	Create(
		ESPSection,
		"Checkbox",
		{ Label = "Health", Value = false },
		"Health",
		"Show enemies health",
		true,
		true,
		false,
		Color3.fromRGB(0, 255, 0)
	)
	Create(ESPSection, "Checkbox", { Label = "Indicators", Value = false }, "Indicators", "Show indicators", true, true)
	Create(
		ESPSection,
		"Checkbox",
		{ Label = "Swing Cooldown", Value = false },
		"SwingCooldown",
		"Show swing cooldown",
		true,
		true
	)
	Create(
		ESPSection,
		"Checkbox",
		{ Label = "Parry Cooldown", Value = false },
		"ParryCooldown",
		"Show parry cooldown",
		true,
		true
	)
	Create(
		ESPSection,
		"Combo",
		{ Label = "Indicators Types", Selected = 1, Items = { "None", "Tool", "Distance", "Both" } },
		"ESPTypes",
		"Type of Indicator"
	)
	ESPSection:Separator({ Text = "Out Of FOV" })
	Create(
		ESPSection,
		"Checkbox",
		{ Label = "Enabled", Value = false },
		"OutOfFOV",
		"Show enemies that are out of your field of view",
		true,
		true
	)
	Create(
		ESPSection,
		"SliderProgress",
		{ Label = "Size", Value = 15, Minimum = 10, Maximum = 15, Format = "%.f" },
		"OutFOVSize",
		"How big the indicator is"
	)
	Create(
		ESPSection,
		"SliderProgress",
		{ Label = "Offset", Value = 400, Minimum = 100, Maximum = 700, Format = "%.f" },
		"OutFOVOffset",
		"The offset of the indicator"
	)
	Create(
		ESPSection,
		"Combo",
		{ Label = "Settings", Selected = 1, Items = { "None", "Outline", "Blinking", "Both" } },
		"OFFSettings",
		"Type of indicator"
	)
	ESPSection:Separator({ Text = "Utility ESP" })
	Create(ESPSection, "Checkbox", { Label = "Enabled", Value = false }, "UtilityESP", "Show utilities locations", true)
	Create(
		ESPSection,
		"SliderProgress",
		{ Label = "Max Distance", Value = 5000, Minimum = 250, Maximum = 5000, Format = "%.f studs" },
		"UtilityESPMaxDistance",
		"How far does the ESP goes"
	)
	ESPSection:Separator({ Text = "Configuration" })
	Create(ESPSection, "Checkbox", { Label = "C4", Value = false }, "C4", "Show C4", true, true)
	Create(ESPSection, "Checkbox", { Label = "Grenade", Value = false }, "Grenade", "Show grenades", true, true)
	Create(ESPSection, "Checkbox", { Label = "Claymore", Value = false }, "Claymore", "Show claymore", true, true)
	Create(ESPSection, "Checkbox", { Label = "Bear Trap", Value = false }, "Beartrap", "Show Bear Trap", true, true)

	--// ESP

	local animations = {}
	local blacklist = {
		"rbxassetid://106649093705106",
		"rbxassetid://6423003415",
		"rbxassetid://101463478179793",
	}

	for i, v in Modules.Name["WeaponMetadata"] do
		if v.slashMetadata then
			for _, data in v.slashMetadata do
				if not table.find(blacklist, data.animation.AnimationId) then
					table.insert(animations, data.animation.AnimationId)
				end
			end
		end
	end

	local base64 = base64 or crypt and crypt.base64

	local SwingImage =
		"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"
	local ParryImage =
		"iVBORw0KGgoAAAANSUhEUgAAAaQAAAGkCAYAAAB+TFE1AAAgAElEQVR4Ae2dB7gsRdW1QXLOGUmSM0iWnAUEQYIEAZEokkSyEgxIEBMGUD8BlaAiiCAiSI4iQZGgSJQcJKgYv/9fXy3OnjtzzpmZ012dqqpXP8997pyZDtVvVVd11d577ckm0yYCIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACItBWAgDmBrAagFUBrAxgRQArAFgOwDIAlgKwJIDFASwGYFEACwNYCMCCAOYHMC+AeQDMBWBOALMDmBXALABmAjAjgOkBTAtgGgBTAZgCwDvayl33LQIiIAIiMIYAgM0AXAfg1wDucH/fDuBWALcAuAnADQB+Zfv8EsA1AK52g9hVAK4EcAWAy91AdhmAS91A9mM3kP3QDWQXu4HsIgAXAvi+G8guAHC+G8i+6way7wD4NoBzAZxgg98UY4qmP0VABERABNpEAMD2AF5Ac9vfAdwJ4KOcNbWJve5VBERABESghwCAHQC82Nx49PaV/z+Af9vMaysAM2s5r6eS9FEEREAE2kAAwAcAvNTwgNR7+VecPeqbbrlwQwAztKEOdI8iIAIiIAKTTTYZgB3dctnLvSNCAJ//nxsofw/gk3SqUEWJgAiIgAi0gACAnQBwVhLi9jdzptiT3nstqA7dogiIgAi0lwCAnQG8GuJoZGXibOk18+LbAMDU7a0t3bkIiIAIJEwAwAcB/CXgAam3aG+5GKevWnzU9AlXi25NBERABNpHAMCuAF7v7fUD//y/AO4FcCSApQFM2b5a0x2LgAiIQIIEAOwG4I3AB6F+xeMgej2AD1MRIsGq0S2JgAiIQLsIANgdwJv9evxIvmNQ7/dcDNMa7ao53a0IiIAIJEYAwB4A/hrJ4DOomFzGe9rFLZ1p2nvTJFZNuh0REAERSJ8AALpU0706le0BtwR5uAnAyr6UfhPWHYqACKRCAMBeAKgnl9L2LxN6pUv77KnUle5DBERABJImAGBvAHSnTm3rLONRUXyDpCtRNycCIiACKRAwL7V/pjYa9dwPZ0vPAjjacjdNnkK96R5EQAREIDkCAPYBwE479Y2KDw8B+IglFlRywORas25IBEQgagJu9rCvpX5IfUDq3B9d3JlUkGku5oi68lR4ERABEUiJAID9APyn01u36P8nnGDr11wG3LWYWj2lOtW9iIAIiECUBADs79KI/7dFA1HvrXKp8n5LczFXlBWoQouACIhAKgRc+vIDANC+0taN2Wrp1PFrALsAmFGp1FNp3boPERCBqAi49OUHAmCnrA34hxNsvcTsS7MBkEdeVK1ZhRUBEYiagGWMDSmFeQgD41NupvQF2peirlwVXgREQARiIgBgLhNY/WXLl+7GDoS0L/3GpXf/KICFYqpTlVUEREAEoiXAnEIWm3OcsylRPVvbCAEuZTJbLQfr7QAoKWC0rVwFFwERiIoAbSYAFgFwjnMHf855n1F+R9uIjY2u8ZcBWI2OD1FVrAorAiIgArESsBnTpgB+AuBVjUijCDwJ4GTHZgXFL8XawlVuERCB6AgAmBvAQQBubYm80KiRZ8gfFKO9zaV+P4xpLqKrWBVYBERABGIkAGAqAMs6NYfjnYv4i0M66Tb+xNnjtQC25KwyxvpVmUVABEQgOgJcnrKB6fuWrqLNwbS9gy85PA+AaS5WAjB1dJWrAouACIhAjARsxvQ+AFe7JavXFVTbOzaB9qXPWRp1DUwxNnCVWQREID4CABZwLtGHArhlVJesP0jgBkvrsUB8NasSi4AIiECEBMxNfEUAZ7rMs1Q30DZCgPFLVL/4AQDOJqeLsHpVZBEQARGIjwCAmd1MaWMAl7rMrNSD0zZCgLFLz1iai8Xjq1mVWAREQAQiJGCzpakBbGMpHf6uUWkSAQYYM9D4SLqJyyMvwgauIouACMRJAACVsj8F4HeW2mFSz9zyD0xzcSOAD9IGF2ftqtQiIAIiEBkBANMAWNMt533RGfj/3PKBaOzt0750kS1zzhRZ1aq4IiACIhAnAZstbQDgyrG9csv/ZvzSwwDOcjmYlgbwjjhrWKUWAREQgcgIOMHWeQHsBeCBFqdM7zcGcxmPadQPpzeeBqbIGraKKwIiEC8Bp2gwn1MR/6RLF/6I1MTHjU/XWcLEOTUwxdvGVXIREIHICDgNuHUAXADg2XHdcru/eAXAtwBsTjtcZNWq4oqACIhAnATMvkSPsytMH6/dQ1H37v9r9qWTACwTZ+2q1CIgAiIQGQHLvfROF6ezH4Anun2yPrm4pb9ZmosPA5gjsqpVcUVABEQgTgI2MM0P4MuW5oKzBG0j2Wrp+ED7EtNcyE08ziauUouACMRGwNTE3wPgQkvroEGpS+BNN1M6G8DKGphia9kqrwiIQLQEzL60G4DrpY/XHZHMZf4+9/8Jlp9KiQGjbeUquAiIQDQETB+PQaMfB/CnUd2y/njD7Eu0vUlNPJpWrYKKgAhETcCy1XKZ6mumjcf0DtpGCPzFJQS8GMBail2Kupmr8CIgArERALCuyRCxI9bA1B2WGb/0dcfm3ZoxxdaqVV4REIFoCQCY3SXAO8iUs//V7ZP1yaSZmObiXZoxRdvEVXAREIGYCACYwoz6THPxqIaiUQSYi+qnjgudQhS/FFPDVllFQATiJQBgeueJtx6A8wHQLVrbCIFOUkDKM60fbw2r5KER4EuOSX9t5nKebQ/gQy528EBLQMkXxNMBfMlCFM4B8B17PhnKcYlllqY6y9UAfmkxdoyz6/zjdz83BZefOLWSH1q6lu8B+K5Ja33Dzs/rnOpsy8fYqglfwt5r5VseAIPuFbsXWiNKuTzmjTcDgC0A3A5A2Wq7wzIDjOmRd7It402VclvQvWUjYPF+fJmbxTkLUcx3lmxHTjaZG1DY0V9rL4BUE+Hz9pY5HHEJ/d8A/mP/2P74jy9I/Me0K/xH++8wG3Dn987+neP5f+ecnWvwegweZxlYlr9am38NwKsAaF99HsBD1j8wFc657hGhNNf+ALZ1A+DqTJrp7LBzmUlgVgAz2gsvc7tNkZWP9hOBSQT4NuQa4cfMlsIGqm2EAB9kZvDlA7io7EuTmkzSH8xDdW4XaL4EgFWd3ZW5yaj4cQgAzjIY5/cMZxtZQdgAxpkKB4uUNj4jLzvF/QfdqsINNivjDOw4J2u2pxvMOCNk0lEOyHyGyJUvwpNnZaf9WkjA7Eur2NIB7UtsaNpGCLxuyyE78E2whc0j2Vu2t/lFbLmK9UvHn88AOM8GHqZ84bL22JkJZxi7ZgVjzxdf+jgDadNGTsx+fY8tN9JMcJrFSTLX2/vcsiNVZpa0wH4l3czaqNqwn0ufPrOlCeca9tiHsE0PUr97fcqtr/+PxS9pGS+yB4KpSWzWQ3sJZzvMPEz7DO0wv7W0LlzGyrL9kVmL8yCw54rHaRt54eXgzGeKqxA3AbgcwDcBHOuWCndy9jC+IM+ah7H2TZCA2ZdohOWUm5I72roE+MbHdXWupWu2FHj7d84BC3Im496+vwLgVvMufQ4AZ72sS9+NTgNz5rl9K8ttvhdsyXFcmaGN7UXLZMClQNreKCC9t9mtZs7DXfsmRMDWvo8w+1KRBzi154mzx4ftIaFRV/p4DbV7U73nCxSX3tZwg81hNvN50oz5HWN/WW2QjgG8Ru5kkM4O+WlzJiirLG05T6cO+T/7occB0JvwEzbz5JIfHSzocKJnsaFnsbbLAlgRAN1ROcXW1iVAJxC+Lb/f1sBlrK2hVZphnE4HNJrT7kPbxO9rsn1y2W09n9sEsJ3NzrotSJ+KEqCjyAsW9P9Vaw/b2MvJwnRS8akrHRM4AesEdrQ3k7YZZ4c9NHxr40DNZYX3BF6N0RbP3n6pP8ilmy86W9415u1Wt+faLxgO4APSlu1kRxr2NBX/je2Bruv3W1wWn8vDAWwlb1mfVhvwMeYtxMA5dgq/kePDqKeHBvEHrPEvGHA1RlM0agzamy6XZhj4SZsC3YwZV9PExpgheolN7wORoQOWt6yJsrf1mnxhZJwVl/nuNP70eFxbAcA+rTjAYyxIkMGBnzNX1qY6iBAfMgYaMth4Zy3jZW+85kwzpbli0yZAfcFf2QDEpVF2LE1vz7Jes9/V+D0trq3p+2jz9ek4wWeUsyjOVn/gPCz3dSs/K5iXMV+CZIca33TD/8ZmTFTLZtwGH9a6l09CfrD4Nk19PBra5b46oDnbrGE+86A62NkrLzPVgBDrlvE0yw24lUxf01084PsLkXldZeqscFA6jO2QQdF0lGEojOKjMrXuQHaymcAHLJaAbx/augQecx5Zn7c0FzKwWps1myRzdjG8gJptDMgOeabNsvFteoYij53dN12ZtYVLgC/WtAtzmfgLJrrMAYpKE5JEKvIA1HmsvVHQgEiDorYuAS453e1Syx/thC7nr7NOQruW6Z7R24wSM1zTZ56uGDbaIQ4sytMJm05tS90x3LPKOLJU/JIToP21hRPwGaaDxGJF24KOr4GAaYHxbYKR8PLGG/1IU7T1Rmqj1VAVQV3CXla4FML7Z3BqVlWE0QSb+4vOFKsVhWpLlFSL0LPRXF36XpkzJ0pJUcuQDkwMuN64aJvQ8RUTMAM18y9xYLrUHj7Zl0YeAxrnOTBx+Yc6XjNWXB2NnN7si7MB2NyW5BgrwmWvEJwTfDokpngoJc7MtNuk2uBTC2Edw5eKwxp5wHRRPwI2Y6KbONWAueyhrUvgCXMjpodPEp49NhAxap7LclS4TiXn1rF+T8D4oyw/EtM5xDo4d1twuz9RguqQ8TWsb4ImYJ0UXXlPcAq/97a7DY+7e3ZKN7tlrP0YOBl0RU5QOKfmMS+A3QFcnJjXJeto3QluP/PPFjZxgLztxj0LsX3BGdJBmSteO4ZFwGJMuIxHGSLGAWgbIcAOjzYKLm9yZhGVN5698VPFg4ncUnT/pyxRqWK6zEpsgb56BuIlwD5s/7B6WZUmNwGTgdnUcs7EZtyu8vGhjYWNnGkuqNUW9DKeKSkwgd1V5i2Xqp3w6z5iqsMeDLecuZCLUWNKcm3xEmBm3Y8Mq2f9FhEBCzrbw9JcKH5p9IPJFNLH2MA0dUjVagMRB0zaQVL3FqO69C5lB0faMvanTDVgdM3rr1gIcFVj75CeTZWlBAJOMXsZNxv4rOUaory/thEC/7DkZR8Owb5knehizvbBWLO7WlJJdO8tpM4w6BGx5Vm6wGuLkwDjkz40qH71fcQEzL60iYuG/kZCnlllPWZs+LQv0YXaS9izaNOwjKt0WODyHL2L2rLRPX/eovz6He9c/xe3jKltYZnafTKR4G796lbfJUDAggYp2rqDZfhMrQEXuR/aZ/5kwXi1R4kzXgoAbSltsvnRpsfI/EqWTM3bjvbCVG1vRdp7DMcytm6XBLpe3cIwAj0D06Eu+d1vAVCoVNsIAXaS1H073jL6TjWMZVm/WbDzTM7ety0ABnUy1XTqG9WgNymLYb/zmJYf61RbfAS43Lpjv3rVd4kSsKh26p4psdn4B5YinVxGY/xPbYrEdj2+LNAdOuUZE5MALlrlo2XLdqk7hoxvuWl8wxCH7atsHzp3gATMvrSFZaulPUVblwBdT7nsQ320SpaWBjUJS3J2JoAnE1QdoHcds41OM+j+y/jeVgOY90lbfASoabdtGe1A54iMgC0ZMVst0xVQ2YAdhrYRAvRM5DLeqU4lYak6q9Ziyqh+TON/SkurtA98sA6Wrm2fooYcJYE/u8zZW9fRRnSNQAmYfD+DCo8wbTwZhLvPMt3E72OwnqknlCIGOlFTsLf8OQAwpux3iRjpH2Y4wkT3XsbvLg0HZ/+sO21xEXi6jcr9ZbT5JM/B+BAA37R0BjIMdx9mDtK3Ot3A93FgqrPyzdGCDheM34k1poxSTj+qi5sLMGbGXKa91xYXAS5Vb1pXO9F1IiBgag/Uf/thRMne6nrsmPyOrtpru/xUM9VVnba8ytT2VHLgW2RsGwfS2iRhrA2znrTFRYBq/RvV9VzpOhERcIZ92pcOdMGjd8TVpisvLWeOXEb7jHvrX5ZqC3VVKwdB54nH1PY/jUzZmp6DS9bIaUrnGLKX0rNU/iyUfYHHKZJbVzvRdSIjYPallS3HEA2O2roEmIuKadSZ5qJOF3EmauTLAu1asdiXmCKlVmFbAGvaMme3xvQpdAKPMclmZN2kilsnAVsumsYe8PNM5oY2AW0jCeEoYnsF174BzEBeddQPO3iLXzrJllZDti+dWAeT3mvYoE15KLXVeJ5UKqes1VuP+iwCAwmY99fOAG5sgSp13seY8VzUDWQa9dryL1mdrGXZZBnH8b95C17x/gwnqH0ZhnXgWHwSwFsV359OXx4BBuuvPrAD0g8iMJaAdYBUqKYmGRWqFb80+oGk2sJRTHMxll2VfzPhHWVXTDQ2JLUHLivO73PvNjv3Dk4GsI2Ls6OhXFscBP7gVhtW8WkrOqblBEztYRX3/xnO+YEqvdq6BGhfYrK4D5WdGXWiZgdgYTd77WgWdkvU3Kev0ettonL3+91smCv1+y3Ld5aGpS1pPZqr4fKu/AgA7/rO0ia0T+IETFlgM2dj+kWAy0XlPSr5z8SlM8oQXVL3uriltljJ1Q01C1mGJjd6u3l5Ipr79qG+j5ANaOdEHL/VZL01cW0GT1eSK8u3Dem4SAlY58ElIwYkcoagrUuAgbWcSTJxYm32JTYlAKuaDBFTuddt4Gcwr7dNwGZ7dBjxVmC3WWqb8k11W118nx5yL3BLR9oFqtghEgBA+xKVBWhLkX2p2ykwful+5xF3iCmu1+0qTjdxOqO80S1S5Z8uKpKMzwYTMlvet60DWNGlxX6q8jvVBcogwD7jXb51reNEoC8BS5S2sakaUFRTW5cA39aZ5mIXLnf2BVjBl5YufUmX3uIYJ2D5mxr08SgMSy+3IrMbCsyy/ezui8RsnczKqy18Anz5qCSbsG/70XGJEDBvPGar5TLeZeE/C7WXkC7a3+OSFlnVVe0WK7WC0+Q7u+LU6ZyVbOd7X6ZKQW0zzixPLziwHVt77eqCPgT4ouTlAOPbznRcywhYAOcs5vlFF2At43UfVXa2dEv+vIsjouJ6bWoGlkJ9fXNGYaxO2falm3hPvs3dSVZt7hTo3zRUnOF4J/YDsK4cbrqNLuBPlCmr7RnwbZs6LgECFlOyqL3t0psmtADOpp/TBwHsC2DBOh9K85JkltxbSkyjzrr9nyLN1s3kmKiw8/LCQds79blrc9PZMmXTdazrDybAF6LrirQZHSsCuQnYkhHfzC92HTBTFmvrEuBM5Ue2zFmbfYmVaKm/KUNEwzJnbkU2phD/UO7GYQe4zLKzmgNGpwyURTrId9nO3L+l/t2hGeb/HJB+4ttmdJwIFCLA6H0Au/KtSPIuo3oIuojT/kIZorULQc55sMntbGj2JbqJ+24U4l0k5+Un7W5LbIza792YVt4rF5XZMxmkHJKCRe+96TPAdn/+pEagDyJQNwHzxlvcxS193JIC6sHsEqCXGrW9jqzT88g6b8oQUXbnV93i5Pp0vW8wLNugucaPjR0q5BJs7t+Mc9EWJgEu83617j5I1xOBcQSsE+TARGUBipSGrFxd9+PMB5UBpnzDn28cvIq+MJvf9M7t+gBLs5EnJfhHfYtly3Xn94HMJZ2tC5x3Xhf/xbgobWES4DLxZ3zrV8eJQOkEbMloa+s4qI9XtudXmI9itlLRvnS5s61sAGC20uEPOSGDFV3dnGb2pYlKywF08SGnG/qTSz7I/Ft3DrjIF33Te1jboiAwZ57awiPAl9CjhjYO/SgCTRAw+xIT39G+pG00AeaMOcuJt65Bzbq66sc81eiMcqEFq44uVfcvLot5yyO52eAOQ1Kb0BPRO2bLyVpRc5FJ4LSFR4AelQfW1Z51HRHIRcA8o6j9xhgd2lK0dQlw+ey3JtE0ey6wBXfmsqGpTNC+1M9J4Au+buumqnBi9zbHfeKyTpF4JLYnyidpC48AB6TdCjZPHS4C1RKwTorpqL8LoAmB0PAe3W6JmK2WYrbvsyUp79lDnlrkgANgHgAfNWeUjps4PaWYOdcray6ABSxtR/cOx3/aP09Ze/c19QcqVHTim8afXd80RYBLqdv01pc+i0CwBGzGxOj9Gyxld1MPTojX/ZvFdW1Spz4eGwtnLM6m9RVzVb/HlWMp30YEYLUMckY/852BWXkZBKz8XeG1Ys62a88s7NtWdZwIvE3AUhIcYYZvzhC0dQk8bgoHdAzwmqX4NDObxW4J4MMFYoUmpw2heysDP/EevRWhAbwbwNgYp4EX0w+1EeAy9Mo+7U/HiECjBMzAzmy1n3VK0DTya+sSoJcbZYCobLBgnRVlA5OXFpmpkdOLcKLtZdqwfO/Llu14HS4vaguHAL1IF/OtVx0nAo0TMB02ukGzg+nYMcJ5xJorCd3l/+JmA1dagGtt3ni+jcKWZLMkdqT958tFZoAAPiE7UnONc8CVudoxl2/70XEiEAQBdkwWTMn8QlSYZqem+KWRp56zABqLGRDKlBPTBVFpfQoBgEt+WTd6+C3c5zSZvnL5qNZRVuOsqGvbj3bQ4F+cMjUw7SQCJGD2pUPNJVoBkKP7EurjMZPvspyNhNZiLJnj6BIP/utRpqfwvQdbtmPuHW3hEHjZtz51nAgES8BkiJj/hurOSl09usPhOn3HvjR/KJXIpGyW3n10aQf/xfugxl+RbLT0DNQWDoHHQmmPKocIlErAlvHmclI3H7B0DuzAtHUJ0DGASe+oXND4bAnAeh6pSBiX5m1zYBBmF4c+BUDgvlI7AZ1MBEIjYAGccwD4iAmU0gNN2wgB2peYJoIzySWKqHMXrXdbSszrwn837WK+12Z6DDcocelPWxgEbvStSx0nAtERcBlM30k1Yecy/Ig8rMb1QFzaZHI+MvJeBvNpFGbP+em4Ek38BW2EO/pq25kjzA8mvoz2qInA5T7tR8eIQLQELE6GAqHnAXiypgctpstc4+xuezP/UhG36jwNxERi7/eEdDrrNM/1OvvSo8vycElGyBN+yYdd0Kkb/S8CrSJgOmzvB8AO+M2SH6zYT0f70gXMPVTHbMmWU8cm48vKkA4avllkGS6wkcszReUHbc0TOLtVnZBuVgR6CZg33pIADjcpGcUudTsl5qbhMt4ZRWR6enn3++xkjmYAQHVwX/Z0Vnl3v3Nn+c5sZ9d2b1ufGiRwcpY60z4ikCwB88abCsByZl96TdlqR3VJHJho+P8YZYjKdnygEKuJ5Y66aM4/DvVtoKb0QdUHObvkhF7B7gf51qOOE4EkCZhawPctAZ06qW6vQ1km5hHaDsDcZVS+vQzQ7ZwSR0U2uq9P4VsmADt5uJwXKa+O7U9ge9861HEikCQB6yRp0N/X8vLI4D2683jFJeg719Koz1ikEZh2HVXbi25MJfFO37IAWB3AfUULoeMLE1jHtw51nAgkTcA8sLicdLJ7g2ZKbm1dAlzGYyrx08wG45UU0OVQmg3AFd3Ten+iHen9vg0SwJwALtGynTf/Mg7kasSSvnWo40SgFQTM6M6kcVQF4OxAW5cABwKmUWfQce7cS2aToqBm0Y0D5Fm+DdKcWyhDlEVpvGhZdXx/ArTdeovl+ta9jhOBKAnYjImpuZmttKjNo/8jGe+3fLulpxrTqM+eNVC1ZOmee4t0aLYE+Vy8VRB9yZkwMRhtxSg7KRW6fQSc/WQ+N1M6GABlaxS/NLoffMEF1J5jsT0T6uNZSozRZ/D/6wmXQXgL3xZpy3a3+19eRxYkQPbz+NafjhOB1hJgsKilwT7FbCnyxhvdG9G+dOwwm4ApZjw9+rBCf3G5jdf0ylbLxmw2sUKF0MHeBLjy4BXg3NqOSDcuAr0ELIZlQ5Mhoh1DW5cAB4jrAexJzbhebvzsYo8o35RXTLV79vGfGFhLxwTvt2wA248/rb6picD5fJ7GthP9LQIikIOAGcSZy2d3i9P5RwHVgZqe/douQzVxOi0wjTrTzE/bQesy11KDruxBnMuoq3Wukfd/0+9T/qzamseoC1Gto1AYQd761v4ikDQBGmUBHOaCa+8CwIFJW5cAeXAQYhp15qm6o/tTaZ/oqbWHb5Asj7NZVmkF0okyE+By66QXlqQ7Ct2cCNRFoMe+9FWJdo7rjDgjojccByY6IVSxMQvsuCXCLPVvs92PA+DMTlu9BPYrYv/LUr/aRwRaS8C8tmiT+DEAvrlr6xKgsjdzGVWx0f18Id+GB2BtF1f1TBUF0zkHEuALADM7545l861nHScCrSNg2WrnAfBhW8Yb+ETqh9IIMHiZ6dC9OjdLUPjL0kqjE2UhQDvjlq3rIHTDItAEAdPHm9tkiKicXdXsIMvD34Z9TihgR5rJ3L/lyl9fS+GMdP0mnk1dUwRaS8DUHtYF8G2zochWUU2nR68+rzTsZkfaAYBUG6qpm35npVbkGq3tGHTjItAkAaZvcOrS25oMkW+m1H4Ptr4bIcCMt0XsSKtoibXWpnQnvS+bfCZ1bRFoNQF7E1/cstVSoFSzpXL7wB19G5jFI12kOim3QoacjTa7JXzrS8eJgAiURICxFwBWNLsFteBkuxjSc+X4iVlgfR0b3uEEdA+Rd2QO2sV2/RGV30t6pHQaERCBMgg4xex13JvihZatlhlatfkToJ6edydnArF/8r+8jsxBgDbV2ct4hnQOERCBEgmYfWkfy1ar/Dw5erUxu74E4L2+VeMcTxYwLT5q5GmrlsBZFNv1rSsdJwIiUCEB88Zbxmm9HW/KBtV2B2menbEtx/hWk8WQfR6AUthX2z444J9Em6pvXRJa8WoAACAASURBVOk4ERCBGghQbNK03/4HAN/4tWUnQCcRpjSY27eqXGqRHUtWJM9e+vbs+U+XqffjvnWk40RABGomYGnUNwdwudKo5+qpfw9gXd/qMtWGx3NdUTvnJcDsy/v41pGOEwERaIiAuSPvBeAeZavN1O9RRoiinVP4VhkA5ul5Vd6PmXj77MQkjdv71o+OEwERaJiAZas92QlScgYgG8fgbpAu9Eyp7p2J1HTxDrDzMOEgZ0yKGRvMPO8v9IZcr+FHSpcXARHwJWDaeLMA2NTlYPqWZktD+8AbXI6jpX1Z8zjLkzQHz8MlQPcScJxLz87A2d85xwnaQLT5E6BKwzJF6kfHioAIBEDAOspZAezi4mZutgysclMe3Tn+GcAmvkGy/arZgplnc6nrFwawtdPN+5wTB+XAR8ki5nxScPPoOhj2F1Ua5urHWd+JgAhESoCBhT3Zav8+rAdo4W+frTrOxRIzLgVgV3etM0wLj+nQmQtLA1T/RseXJ8405fIdab+jYovAQAIApnauzqs6r7wzXcf4x/59QCu/pfu3tx1pIPAhP5iHHpdUP+pmUue55dXbAHCAUmr7bhNkGpYvDsGon0RABGInAIDLSVsBuNSWkbpdQDs/0ZNrxabq1epjBRfk/D6zP11snpIM3m3zxvs/qql60XVFQARqImD2pXcCoJs4385p22jrxiWzj9SEfuBlzBllOgDzmYMEA2+/4BwlfmWu5W2z/zEGabeBwPSDCIhAWgRMAmcht1R0tC0ZtTVbLeOJvNS/q2oRloJkGtq3bIDa0w1W55pcFGOfOINIWWSX6vZy+a6qgem8IhAqAfMM299il9o4U6JNzVtGqK56tVkUXcw3cg4Rh5r6+/1OzYDegm8BSGkWRZvaInWx1XVEQAQaJGBv4IuY59dnANzRYqM6Z4ZbNVgdXpcGMBOAlQEwrfqJZhdkQkd678W+MY5rOi8wOkgERCAOAuaCvB2Ab1p8zItSF3h76evEOGqwfyltlku74BoAPkgPNQDXAHg20pHpyv53qm9FQASiJWDLPFMy4t2M5PeZOnibHRnG9tFc6ro2lSBMc1rh7GleJ7q7kmW4/Z4Lkn4EAGeDlDcKfXnvG9E+dCq4CIhAl4DFHC1o6c8/aRprYzth/T2aAN2/ObMgNypceIuudmsirE9u1jQzgLXpTm3Le38AwBky7U+hbUeHRU+lEQERyEXAadfNz0yozgPrSHvjb3ssS55Olh5rHJQ4UzobwB5uyWstAItyOSxXRUSwM+0zblBaHsBObhZ9it03BXmpgh6CesSuEWBUEUVABHoJWKI+Rv1/yt56Y7UZ5Bk86tiXcTB0ELjKzThPZUyMKanP1ss/hc89Di7rWWzaly3+iQN0U0u7a6XAVvcgAq0gAIDaaCeYcOpjUpaudIyiajfjYpgOgVJDXAbdljaa1Bpbjyjvuyy9xiGW94leb3Wl1virc7qZJzW2uh8RSIKABbDSSM3lo4OdQvWtFr2v9AaVjkN9T85OmY4B7DSfcC8GlPrhEunq1MSzDL5TptDwzCFmKrsnCvQyMzEHYw7KzxgD5twq20GCzhfTpMBQ9yACSRCwZZS5bZlobwA/1iyo7wARypdUUWeQKtUUWF8coBZnrFASDbLnJmwWxRkUnUA68kYMLi7L/sS0E1P1XFIfRUAEmiBgNiF2ZgfaUsmjiUvEhDKglFkOzhqYPfY6NyCdZfYnJu+jG3ZS6RRs9r6Ai2lbn5qAzkvxOwButPv3zVj8XZ63iedP1xSB1hOwpZElXXzQQW5Z7gKpPZc5NjR+Li5nMTnfA27W9HPnsXeazSwWS21w4oNsubeWBbCxy1Z8BADGP3HmmMfjk8ohybndt76jE4CwCVhcCI3jfGj/pIRtjQ8edRSAdr+XLEiVtpjjnSffamG3VL/S0Q4EYE5bumT2XA40XI57cwLQB6Q4WPtR1FEiUAEBswnRMYHq2nw4OQjRc6tsg/AEz7p+DowA65+OEnQS+JGT+tnX1BW4DDZjSh2zrQRMTtFUADub/elOu/c3zMWcziIMYwhKfb2CLkGnFIH6CZhqwnImgMn01ffU6D4bWN+r4mQkwM75JjfD+LyJ376HChL1t97qr2gzKNqf6F5O2xHjvpao/sq6ggi0hIDNhih0SRVmpgy/2T1wDLTUJgJ5CTCt+cMAfuJmDVRUYIAuM8wm5xZtM0K+vM3Qkq5CtykC1RGwgYixGox0v93y1IQgw5K3E9T+YRJgW3reBeVSIPdqU+eg996M1bVqnVkERCBKArZGvqvJ/nPZhQZs2YjC7NxjLhXbFINz6RzBFPTM+LtiCq7S9lIn+1GUPaAKHSQBG5jo1vsx8ypi0CCNtdpEoAgBpi6nisEvbHa0ZgpODzYIMQicy3VLp7gcGWRHpUK1j4AlxOOyCt9iL7F4lLo0wYp0fjq2eQJcouMsiMu/5zmvTLpDMwFf9Et09lzQzsp07J34OzpybNO+XkJ3LAI1E7BZ01wuep8eU5w5UQNNytzNd/ohloCBtJwFneSCSpndl0n2kpAgsrCHXQDQ45R2MM74OpqMVFdfu+ZHU5cTgXYTMLmVeQCsDGA/p1d3ZYi9ospUKwEuxzFQ9nA3GHEpjrOH6WN/UuxFjLF31PejCgkHHcbf0QY2dvsVgCVjv2eVXwSiJWDr51RU5kNL/To+lAySzCO1MvbB1t9hE2CGVs6CKKlD7TcGiVJNm+0gWq07G3yYlZaJItdxg86xFvLAGRATIA5bqqajBges5PJNRds5qeAiYJ0SPaY+Ycs2DwWaYjrsLj+s0rEjft2Wp/jCwaU4qnXMFXuL75ntvxvA9m5A+YrLWvxr136pfp5n4/7HxTwgx16XKr8IDCRgb5t8a2YUOwenC11abSbi0xYPAQZD322zIM5+KTg6/8BKj+gHmwVt4V6WjnJadT8AcG/BWT3jq5S2PKI2oKK2lIC9hTJ1Ab31aGO41N644+ma21PS1yz9AtNOvN8cEigwGu1SHB87e0FaEMBOpj7C1BoUBM47ExrUEphmZf2WPuK6bRGIj4B1ClObvWF5pw5+qGmeUV7mPwrCHdTXVfY93bKZ84dv90wt8SlLqEhvymiFUa2dTelSZUzrRIAZT0eHBM7QnzJFejoklB3wzRnWIvE9lSqxCIjAJAJmc2JAIQen6y2tthwiqhmD2AmTLd31f+eEQb/mZgm7W2r5qNUFzLlmNgDMBMuZOHXzqMFIxZGqN3Klp6myxE56svVBBCInYG/lGzqPphPMhZgOEfRu0laMAPP3kCXdsumQwKW4pRJZhuNsbi33IrMngLMB3NqAEDBn95+P/PFT8UVABPoRMJsT8+ls4IIOj3F2jMsVhJt7ROLM4C5LI0+FBLKka/7U/ZjH9B2A+Zwn3HvNIeEicz+nF2BTG5ec94yJocoqAiLgQYC6YMylYwoR9IiiAoAUyPt3vdQbpFgp1dqZOoRp5amxFv1SEl3MzS37dBtonzZ9xWGxQf0plf8tua/u0bx1iAiIQIwEegzV05lCBIMWb7EATQZqtn3jshETxDGok44jUXrFWT2zjucwoVLqxNEr80mT6AlxCfcVADPH+FypzCIgAiURMJsTI+oZkMgkcG3eXnRxXnuUhLbW09ggRIcEKmUzNujTNhOmRE/Z3nBVtJHbawWmi4mACIRLwDqya6voaSI6JzXWVgq3lsaXzJbh6BG3lwsF+KrFP3FgjW07Z/zd6RsREIHWETBvsbaLu9Kmdi6A6UJvABaDtplzPz/SLb3+FMDvbdk1xKW4rAPj/qFzV/lEQAQqJGDLPFzi4WAUc2eWtdMbth8DPXerELfXqS02aAoX70Slh22cneWLlhuJS3F0BAjBIWEY1yy/cUlxRS9AOkgERCB+AtbRUQyTQp/aAMrWLNB0zdpLwgzmWMEcSJSJYlLHJxL2jPwDPRmbZq/ri4AINEQAwCqWWl2D0QiBcxuqircv69zMZwWwgimAn2hLcfSKa8P2QwCzNMlf1xYBEWiIgDkwUBhT2wgB5uqpfbmOnXCPQsI5ppDA2CBq47Vpo4fnNA09DrqsCIhAUwQALAPgqkRsD2V12kySt2gddWKDEFPYM0D5J5YfiV5xjIFq48bBd1suVdbBX9cQAREIgIDZjJgu/ZcJ2yJ8OnQa1L9RdlCm2YKY/ZWK30wbwpQNTEdxp+nEcVaWgkOCD/PeY/4ohYYAOggVQQTqImCD0epOOkjLdL1d4chnphFn+vApy6gPANMzhYItxVEh4TwAD0YSnDqeTvXf0MNTKSfKaHw6hwjEQIAutZaWovruJb4rUNl6uSL1aLMgpv9gSnI6JFAR/BEAFAzVNpzAl9zMcaYi/HWsCIhAJATY2bq39WuG9wmt/ZV2m69T8823Oi2omEt+t5trtgah7M2J+omHyH7k2/p0nAhERADAsgCuVtDrwB7yOXrXcUnTt1oBHNxCr7iBQHP+wOyz2/qy13EiIAIREADAyP41Ldtnzj6iNbvTmeEOp4K9vG+VWloPeixq8yPAWeWyvvx1nAiIQAQE3KxoDdmMJuwhKRVEMdIZfKuU3mEAXprwStqhHwG+EDAlhuxHvg1Qx4lA6ATMZnRTvx5A340i8Cq964rUp9k/6L6tLT8BcjutCH8dKwIiEDABk56hAwPfPrUNJ0CF7MV8q9PETpkWXrFEwzkP+pUvBB/y5a/jREAEAiVgcUarmlCqUpMP6gJHf0/V7CLODBsCYFCnNj8CFIuV/SjQPkXFEgEvAjYYrQ1Ay3TZO0a6e7/XC/hkk00GgAoMn3BK3G9kv6T2HEPgFl/+Ok4ERCBQAk6XbrWEvemodl2FjeYBZlr1rVKnvrCwyyyr5boxI0zOP0/15a/jREAEAiTgUhRQm+76nB1BLLtT6eCDAJhWvOzt7CJSQW5plCnDKQekzZ/AFgE+UiqSCIiADwGTA7o2UaFUJmzb0pSxmZahzI1ZVj/gqw7AFOeWOpwqA9r8CJDdjD7tXseIgAgERMCCXtex3DmpedPRIeM3zh5Gh4HJ7V6ppFBmaoYbioh5WiZXLtdp8yfALMVKNxFQv6KiiIAXAafYzVw6N/v3BcEeycH1bgCb9oIxG9nDJZX6v06N+4wi2UlNxbstmVxLwj7uNCdrQOpt5fosAhEScIb0lUzEc9wTnsAXtMlsOLZaALzTIvrLuMVnbbluirHXyfK3eTQeq9ijQlVBJ5VRLx1Z2GsfERCBgAi4lAaMM0o1nxEdGDbvhxvA1G4A+FRJy3acWXqnmqAjhJML+nmh7lgHc7a7eL+61nciIAKBE7C3cmqm0faRWtArl+momLAZ7UWDqgLADgCeKdiXU7uOuXe8jekAVnGpx+XMUKwiLnEZeuceVNf6XgREIFACZtRfL9FlOg6uv3b2sI0mwg9gabfMc1uxfhB/BrDdRNca9rsbjI4qWIa2H04bHgOKpxnGWb+JgAgESAAAFRiKdsShdoL3ZLUlmKv1+QVmiJyJMdVEEe26WZXosHBTog1vywAfNRVJBERgGAHzLrulcBcQ5gkYZzThzKiXD4CPFZDqodv4Fyj503vOPJ8BbACACf20+RNg/qOV8nDXviIgAg0TAPBusxmlqCRNBwYGveYSNrWEg752pL8D2KZItQI4AgCDarX5E7ioiGRTkfrTsSIgAjkJmM2IsjR8k0xtMKLN6F7OjPIORsRozh2+y5eUH5o1Z3VM2t2061KVaPIfXvIdSSHaQxV/NKlZ6YMIhEvAlAm4LMTBKLWNg+u4oNe8teEYneIJplAiOPMCVKoJT/h22KMANs5b59pfBESgAQKWDvuuYs98sEdTXTuXzahfFbhlzPU97pBu2pv1O1+W78yh4ninX/c3j2vrkBECdCrhDHPeLMy1jwiIQIMEAKyRcD4j2oy8B4TeagEwE4AXcvbydxbpCG257qc5r6ndRxP4t0k25bIb9ta9PouACFRMwJbp1nSzByoIpBj0+hAVGIYFveZBbHakH4/u6yb863TXGU6f5zq9+5p2Hb0CtfkTeLNoDFhvneizCIhAyQTMgYEGftpWUts4uPK+xmnTFcFoA/heALgElGV73gZEL2VpW67ztVtlKV9b9qEYrXdCxCJtRseKgAhkIGD2kFRtRkwhUYmAJrXoALycsSf/ZRHdNABzuOXUqzNeS7sNJnBehkdCu4iACDRBwJaBUh2MuLy1QVVcASzgYpJ+Mbjvm/QL7RanFtSuo1LGK5POqA++BPauqj3ovCIgAgUI2GBEm1FqcUbsrDpBr15LZFmwApjB2ZI+naFnfBrA9lzmy3Lefvs4hXF612krRoAD+iL9+Oo7ERCBhgiYzYhuy/T6Sm0w4v3c57LYbuIT9JqnSsyOxIHm1SH9JG1MVEf3TnNAmaGEPR+HoCv9pyvpHZmnjrWvCIhAhQTMO4yddYoODByMqNq9SYUIR50awMomljqo9/yHLddNOerAHH+YjY/n0eZPgG3jaOa0yoFeu4qACFRJwNKOU906xY2yPLVG4DMFuYsPOm8ITMYqbV2kTgEcV1JSwCHFTP6nl9g2iiybFqlDHSsCIjCGgA1GKcoBsTelzagSb7oxGMf9aXl1Bqkn0GHEOwkcA2lNWSCre3nyI4vnDRZaNh1X6fpCBETAn0BPPqPUgl47g9EWZQW95qVs+nKPDego6V1XxJmBGWwZO6OtGIGzi4ja5m0T2l8ERKAPAQBTcubgotPvL/Y8B3l0J+i1MtfuPkjHfQVgdudefmOfIFnmPlpj3AEZvzBnhpPcDIwpK7T5E2Ayvu0zYtduIiACVRGwwShVm1Fh1e6yuLu37y/3sfPQ28/biE7PPADX+vfDOtIIMLRh6bLqWucRARHwIGA2I+b9SXGjzajRmVFvlQDYoY8K92klLNf9KcXKq/Ge/unixc4EMG1vfemzCIhAjQScIXw9Z9ugA0OKxnAORlvUiHPCS9myXa+SwutF9PMs6JbLdVR50OZPgMt1hbwcJ6x87SACItCfQI9QKuNxUgx6pWs3bWJT9CeQ/1uLzWKg8AcKzmgYeNnZrgOwYP7SjBwBYCFp13VQFvqf3nXeGXp960/HiUDrCdhgxBQLtF2ktnWCXkuPM+JMBsCDAL4PYB7fhuTyIx1g0P/rZqYncpbjcy4OipZePW++pdTqvOj9sM0c4lMHOkYERKAgAevEUvSmY8f0thxQQUTjDndOA+sA4KyLG5XBVx63U8YvACzr1ACoqPAUlxR9Z1vmXfdZK5P+8yfwmnvJeFfG6tNuIiACZRGggT9ROSB2R7QZlS4HZJI8t/XY2RjcymU7r2yiAGazOmCqiSV869bsR7f498M60ghc6VsHOk4ERMCTgDkwpCiUyn6FKSS29B0kBiE1pfNbAXB5rXf7XIGltuncsuln7F8Rd2/O2ugdpq0YgQMG1b++FwERKJmABb2ys36g2HMb5NEMeuUSGmd+3koHY5GbAwPPyWW6fh6IHKTmHXtclr/N9sOkfVtl2b/fPnaOLCktgqy0gArFpeuF+zHWdyIgAhUQcMrW7+2xfwTUFxQuCgeKSoJezWb0uyEl/CuAVXyri+kNAMxf4Hhmhr1jSPn008QE6MzwRfdvZt960HEiIAI5CJj94/cTP5tR7vFQkRieQRgtUDhLZ3/4oHNU/b0tT/bGM0VZgQ0X+nknlbVd2cu8Vde9zi8CURIwb7pU047TgWHzsivGBiNKyGQRl/1Z2dfPcj5z2+dynXIfFRvRrimSEDFLXWkfEWg9AeuwmFyP2nQpBr3SFkZ167KDXtcy1YosgxG7wjcAzFV3g6OLsnvZ4KDZz7ZVrItuz9H0lPxEmW2o7nag64lA8ARsMNrKuSWnuEzXUe3eqOyKMA/EvIHClOvZueyyDDufOTO832KY2jN8lH+nXO59zzDW+k0ERKAgAS5jJToYsUuiAGzpyfUArG7nztvtcYD8esEqy3U4gBkt1bncvfPWVnd/1tvFzOKbC752FgERyE6AQaGJ5jNiV0KbURUzI8by9MtR1O2+hn8qlOk1e+2O7MlAWpdEkQG12vwJvOmSGe6Vl732FwERyEgAwMYWj5OazYjdTlVBr5wZUVRzbNBrnq7u6SqcK/pVuy3XcQb85zwF1L7jCLA9LdCPsb4TAREoQMCCXjs2o9SM3FxaoWPGRmW65lrQ67oWw1SUGbO0fqrM8g1qDrZcd4acGcYNMHm/oKBtaUHUg+pL34tAqwjYG/M2pkCd96EMfX8OFEyNUYXNiMt0eR0YhvG6rA5vO77Vu2VZKkRo8yfwKoAVWtVR6GZFoA4CZjOibSXFjV6CVdmMqOdX5sbBba2q69wcVqgQoc2fwPnKClt1S9X5W0fAOqeU045vVnalAuAyXdag1zxdHrO+7lZ2eceeDwCX67T5E+DsiMvbXirtY+tDf4tA6wmY/aOTXC81BwYu0zEBHu+vzKBXJrJb252XckBFHBgGdYUs91lVaqJZqolh2nqDyqbvuwSukpBq67tQASiLgDkwbGteZ93HLI1PnaDXDcvi1TmPZXqtOlCYth3v3Eadsg763wRy/5NGVTdyF1TVOIhJDQcx1vciIAI5CDiPMzowpGozYgqJKhwYODPirKvq7S828JXuvWXqG2cmKANVdZ30np+zY+8svzkeU+0qAukTsFTXdXSsvQ9xXZ8ZF1LVzCiLandZ93l0FW/gXGZy6t6piuSWxX7Yed4CcLpvQsX0exfdoQjkIGCDET25isbMDHtom/qNMz4mDyx1ZmHadFXZjAaxoo1i+hxVm2lXl8uK2nXPDbqovp+QwBNMw5IJtnYSARHoT8BsRu8DQCHI1AYj2ow4yFJhojSvJ3P62BAAHQDqdvqggvTc/WvT71v3Zs90518C8K8Ju13t0I8A2xmXO0tzkvGrSR0lAhETsI6Vb8Z/7PeURf4dBwoGvW5SdhWZqkOTdrbdy7wnAEx1rmBY/wb/AoAVy6wTnUsEWkfAvKoe9X8Ogz6Ss5eNy65UcypgrqQmt++WdV/2UrIjgGebvKHIr31OWfWh84hAKwlY8F7THWtV/RBnL1V4021qs666l+nGcuL9zVpGw2V6BAuGrSJ2amy5U/ybA/maZdSFziECrSNg2nQ08Ddh/6ijQ2JnvUWZ6/nGbH0TYaW9oOmN7t+lDLhMr22pMZq+p1iv/x3lPGpdN6obLoMA3YUB7ADgsVif/iHl7gS9blAGq845bDCiqkNIzJg479ROGX3/t+W67QFIu25IwxryE5e71/Hlr+NEoNUE3KyInc+fhjxgMf90d1mzht5GYjajxwMDQ2/Ia4q+mVMAFMDZgd1bLMVhavmvA5izt73oswiIwAQE7C1/ayfOmaoDA4NeS48BMb273wbaQ9JNf90Jqn7oz3QfTzgVfdXVxhe7LYcC1o8iIAKjCdhgxDgjOjCkFmfEToc2o9I7BgCbAaDSeQg2o36d62sADhhd2/n+knZdP6yZvmO81jec2O1M+YhrbxFoMQGzGXGZjp12055hmZ70HDvxfjh72aRMB4ZOcwFwGADKwYS68eXiHN9lO3tR+VqoNxd4uZjeXbajzsOi/0VgIgKmwLAzgNDsH2X0NZUFvXa4AljM7DQhD+S3+WYmtcywKQZEl9G+JjpHYYeSTjvT/yKQPIEe7ynqa6W43V+FAsPYhuEULHYFQBfrULdXAGw9ttxZ/nZSUTsBYLoEbfkIPA1g2SyMtY8ItJ6ADUZ07eYyXYob76t0OaB+DYc2AgCXBAyRy3bH5k2XDWAas4Eo91H+yj2Nqw/92ou+EwER6CFgg9F2lpsn5KWm/N3AyBH0pmNQb20ilgBW9S1sTcddkVdsFcAypjhRUxGTuQxtlivT/tbz2OmjCIjAWAIWU7IbgKeSefy7N0JPNybXKzXodSzDfn9z8HPFOKmitOTdO/T/xGW75fqVvd935sywJ4AX/S/ZyiMZjHxcFak/+tWTvhOBaAlYp7k7gCcT7Cq4LFVJ0GvWCjd5HQ6IoW775LiX2QB8M+ABNkTGfCH6hVu+XTorZ+0nAq0kYN50H0h0ZsTO6eEqMr3maSyWL+hgAK+G2FvSzpX1fpgmwcVY3R7ofYRaLM4m96kiU2/WetN+IhA8gR7XbnbaKW50YNgihIqwWdK1gULmst1UE3GymfQugXsOhoaYs6MLAcw+EV/9LgKtJWCeUh80OaDUHBh4P1QjZ7qH2hwYhjUm68zpBh5i3iB2mhPa15iywmmvMRg2RcWOqgYyKmKULks1rK3pNxGIioA5MOwFgDERqW3sXJnptfTkekUr2XIHfTdA+wsHmDMmuj/3pr+ESUil1maquh+2RQXBTtSw9Ht7CZgcEB0YKF+S4kb9uFrijHxaEYCVAhUkZQryGYfdEwDOqKlSrS0bAc7SFQQ7rFHpt/YScG9rU7slOrp2h5SbJ9ujnW0v2oyCmxmNbXFu2W5fAH/Ldku17UUPy7XHlrX3bwDn1Vaa+C/0unONP5DPXC9DfRYBEZhssslsZkQbBoNDU7QB8L6Y6fUdoVe4y4MzF4DvB9bnUgbo0EHsANDd+/nAyhxycX4GYNFBPPW9CLSWAIAZzO2Uy3SpDUZcp7/HEuFFEwHPYFRX5psCU1G/eFDgppOSonddas4vVQxofL6YqmVjKTK0tsvVjQ8iYMt0+wF4poqnr+Fz8uGnA8Omg+4/1O8DteXdRWmbscysDV3QcF3Hcnmmcz8+rz7gWOb6WwSSI2Cu3XsAeC6WpzlnOR8EsFGsFcf01c6V+ssB5U1iAOfOY3madl2qYrs5m9yEu18NYKGxDPW3CLSagA1GdO1mquQUN3aQm8deyRYwe3MgFcTlz1OoLNHL1al47B2wykQg6N4uxpsxONX01q0+i0DlBEyqhp0Ik+ulZjPi/XBmtHkoQa9FKtTESrd2yzyhpHKgMX7hzj0BmNklG/xewKnYQxmQaF/7krzqa9Xq0wAAEORJREFUOi1H/4vAiDfdjOZumuIyXSfoNdplun6N1AYlzkz+EUDvSk+6Sem1AawBgLFd2gYT4GB0DYAF+9WvvhOBxgiYe+xsTRTAFBj2T9hmRG+66BwYsrQFSwnO3ET/Hdzv1fYLnWCmtH/8HHLW29qgDLkQVyKYQVcxR1kau/apj4AFPZ7Kgam+q74dZzRdj2v3kGcn2p8YZ7RhnUzrvJZ1/tTeuy+AGvqBhQowXuo7CS77lomYAbAnUuevzvaia4nAhAQovWLLG3T9PJkprCc8qIQdbGb0EVNgSM1mxM7jbdXu1OM6erwim3bR5/XnALC8xXiV2YGndC4uIV/K2W0Jj7FOIQLlEgDATJp/tyeORupPV/3mxEEPwEdNRTq1wYgPPO0XDDIMXoGhjNZkM6UDGl4mYzuiowVfckJYQgx1EKM48btTf1Eqo13rHDUTMNsRbQBjo9m5fDdDFcVhVD3lXgC8EOoTW6Bc5Mig12CFUquo0845HTemPWfa66Y2LtVx6U5bfwJMK7FHp770vwgERcDJhewwRA3hhLKX72wwogPDS/2fl+i/pVJy8EKpVTVCs+Gc36D9hnmbml46DLUR/8staZ49SGapqjah84pAJgIWcf/tIbEkpdqUbDCikvBToT6xBctFm1GS3nSZGtSI+/7kppBAd2JtYRG4wdKIRKOdmLXdab8ECDAjpJNcmSgNONMNfHKinDMT4bDBiDYGDkap2Yx4P+RI1e4gMr1OVB9V/m5ZZteTY0FQo9FvLRPxlFXWvc4tAl4ELAso9ciybp/zdXSwa33cOTG8nPViEe1HB4a7U3bt9mpgI7MlqlJM9MITUVVHW1TWwWa+9ajjRKByAgBW8egsaLAemp1zbMHNpnB4wjaj37R9mW5snff+bdlaU3wRiWV0eospOHrrRJ9FICgCdEU2qfmxnnUTPWRs3MdldXSw+KaDE/WmIysGvW4QVOUGWBgAbAOvTNS49HslBM5sS+hBgE1fRcpCwAYK36UUdixHTzRTsmt8LFGbEXsOOjBsmYV32/cx0Vy6+dPlWFt9BOjtOF/b25/uP3ACJtWTd3bU+xhRI4yD0iz9btVsRkdY6ujUHBjI7X7GGcmBoV/t9//OkuVxUNJMqfdJquYzg4KZ34jZfeVR179J6tsQCNAxwS0z3VjCc/CGC4A8ZuxMyWT/OVil2PG0Oui1jPYL4LCG1RxKaPpBn4JONtdRiaGM+tI5RKBSAgB2LTFpGWdKtA+8rX1nckB0YHg16EfWv3B0nW2lAkOZjdLJVH2iYTUH/xYQ/pG3A1izzPrSuUSgEgIAqIJ8cck6X392b7yHWBoCLtOlmM+I3RBtRhqMSmiZAKZybZAqIP8Ov3+PqoQPuNnRe0qoIp1CBKonQCN8BanBaSOiWCPXrCnZkprNiD0SvenIrvVBr2W1UguUZnI/LjFpK06AbXQzedSV1UJ1nkoJmCw/hSe1ZSfQCXpdv9LKafHJTQXkzexVoj3HEKBdk7moks251eLHI81bt1TT69qy05j2rD+HEKACQ6u16ep4IgAcmfBS75DmVfgnrkbQ43OrOupJ1xCBUgj0LI8oR0z2PoA2IwW9ltICJz4JgL2c8jxtINqyE3hIds2J25b2CIwAg+P0sGd/ym0muUVg1Zh0cczRgbFdN+eqqfbu/HvN3pN+JNK9OQB0xZbxeOLOi+vxzGe0qRwY6n8eTCV8WQDXDkmJMnEtpr0Hn+O7AFBNXU429TdTXbEIAQuEZfyMtuEE+KAz02trk+sVaWdlHgtgdtduqUTPODdtXQJccmfQ6xpl8ta5RKA2AgA+BICZIrUNJ0BPJcUZ1dYyh1/I9O+o+MGQAm0jBH4BYLXh5PSrCARKwAJhrwLApShtgwnQgUEzo8DasQn07gfgscFV15pffgZghcCqSMURgewEnEvodhas2pqn1uNGO0Gv78hOVnvWRcA8RHc0R5MUg64narK85x8AWFJCqXW1Ol2ndAIA5rSGrNlR/0eeNiMm19tQD3rpza/UE1oc3bsAfMuJs76eqBrI2FbKgehFd68n+mZqLrUSdDIR8CVgDzBlRP44tpXr77cJ8GFX0KtvA2voOLMrUcz3Hpf+5B+Jt+UnLE3MlA3h1mVFoBwClo/oNIlXDuyyHpTUSjltre6zAJiWatYAznHhDEyBkuLG0AOlHa+7cel61RAAsLTF06T4sBa9JzowbF4NeZ21LgJuQJoXwAEmfFu0TYRyPDX9qMa/EQOF62Kp64hAZQQATOlmRseVnGIilAe2SDm4TMfodi5lKqCwshZY34ktC+0KzvvsJ5ZfiXUc40Y7L9O2HGgxWGqf9TUjXalKAgDmAfBwjE9lhWXuBL1uVCV7nbsZAgBmcx063cNpW2Jdx7S95lKN/xjAKs3Q01VFoEICAPaP6WmsqazsqKTaXWG7C+HUZlu6BMCzNbWrIpf5DwDaMo8FMHcI/FQGESiVgOU8uqXIU5LgsYwz0syo1JYW7slMSHhXN+O4wlzEQ2zSHIy+x2BsBv+GS1MlE4ECBNwbFwMIpf/V7YLowMBMrwp6LdCuYjvUlMMXdLJDH3YOLHd0m0MQnx63/E90ylC7jK1xqbzZCNjsiGvRsa2hV9FLkMG95q2khz5bE0puL1MPn97FLFETjw4tjF1qwvGBTgu0FV1kHrCKLUqutemGRhFwaYy3dUnOnqyid4/snHz4FfQ6qnW0+w/ORAAs42KYGJvHGJ86E1VS2PhWS0A4e7trQnffCgLmZfQVBcK+PXQy66hsRq1o+fluEsAMANZ1dqZza3h5+7clxfwCgJXylVR7i0DEBJgfRRlh3x6MaDPaLOKqVNFrIGA6j1ubY8FLJa8AcIb+qIuROtUGv5lruCVdQgTCIGBvfafUvAxR8jNc+HS0CzxEBQYFvYbRLkMvhdmXGL9Ecd1vAHirYJoW2i05uHFGtLylzpg8dA4qnwiUSsBJjSxlnXHhXj3SE7AjoM1ow1LB6mStIuCCU5dzqS7OsJWGv+ZwfqD6OO1SPJaSXXKiaVXL0c2OIuDe7I6KdCApq9hMIaGg11GtQn/4ELBZEwcmeuVdD4DacoM2pobgPofSRkQZI59r6hgRSIaAOTMw9XZbNwa9bpBMhepGgiFgsx1qy105JsCWA9EFLovtHkyaF0yBVRARaJoAJeqd9AjdStu40W70OS2RNN0K072+CRUvZCEVjCE6HcBaphcpAdR0q153lpcAs0ja21sTgX6hDIAvmyODAg3zNiDtn5mAxTExwHaazAdpRxFoEwHnyLCTywfzQigjQ4Pl6KSU0Bp+mx4A3asIiEAYBEwm6NsKhH17GGTU/Y3OwLwel1jCqCGVQgREQARaQsA02pTzqDstox2Nxmcma1PsR0ueA92mCIhAwwQAzGIxD5Sw19YlQKkWZg6do+Eq0uVFQAREIH0CfPsHsJol9up2xfrUS+BySsOk3xp0hyIgAiLQIAEG37kI8hMLSpz0dt4pfqZN6ZsAFmiwqnRpERABEUibAID5Adyf4ihS8j0xwv4sZg9Nu0Xo7kRABESgIQIA9gEg21G20YsaY59hvFZD1aXLioAIiECaBJwjAwPzqJ2lLTsBZgg9yUXYT5dmq9BdiYAIiEADBFyOld0mEHvM3k23a0963x3CdAANVJsuKQIiIAJpEbBA2ItbnvOoyDD6jC13alBK69HQ3YiACNRNAMB7ATxepEdu+bHM4kmJoZ0BTFt3/el6IiACIpAEAUsxwYyWcmYoNqoykR9zJ22srLJJPBq6CREQgToJWCDs+i3PCFtsGBp9NAel25gdtM561LVEQAREIHoCNMQ7wdDPanY0elTx+OstlzvqEQCXATgSwBrRNw7dgAiIgAjUSYAZKQHc69EB6xCAeaKeBfBzl8TwWBOknUcJ/epswbqWCIhAMgRc6uTDWpwR1ndQ5bLczRYUuwWAxZRYLZlHQjciAiLQBAGXnnsqAHf79sotOo7adQyA/YMTVf2aeSTOyWBYzYaaaLm6pgiIQHIEAOzhhFTbnJ582JjKQegV58bNnFBfB7CD+3+u5BqBbkgEREAEmiZggbBXDOuRW/rbPwHcB+B8APsDWFUJ+Zpurbq+CIhA0gScovd2AF5o6aDT77aptPBjAIcCWJP5jjQQJf0I6OZEQARCIABgdgDnydX77XHpOmcfOhrA2kwlwXxQIdSRyiACIiACyROwQNjNzUDfb6aQ8nf/AvAygLsch1MArEXvOKoqaDaUfNPXDYqACIRGgLl7AJzZIldvasy96Dzjfg3gS86rcCulHw+tVao8IiACrSQAYOWWBMJyILrdPOToTbicXLRb2eR10yIgAiESsOWpowDQkyzV7WnzkPsIgOVtRjh5iPWhMomACIhAawmYq/edCY1EjKFivBAHWMr37AdgWRuEpmxtRevGRUAERCB0Ai7Q8+BEBiNmaH0SwA1uMDoGwApajgu99al8IiACImAEzNX7pogHJM6GngfwK3PKYM6h2VXBIiACIiACkREw6Zu/Rjog3eiysJ5m97CEkt9F1vhUXBEQARHoELCMsBeavSWWMek5AN8CsCOAdzFvU+d+9L8IiIAIiECEBCwQdmsATwQ8EnE57u8WL0R9PQqZUjVhWtmGImx0KrIIiIAI9CNgs6OzAw2EpYfcgwCuAnAEgGW0HNevFvWdCIiACCRAwDTafhfY7IiirpwJMXX6Ohw0E0CtWxABERABERhEgHYXAJ+y5HIhjEm3OUHX4wEwy+oibkBSrNCgytP3IiACIpASAQCLArijoZGIdiGm+uZsiAnu6Ka9ILOspsRY9yICIiACIjABAXNmOLbmwYiD0BsA/gjgMhuEZpigqPpZBERABEQgZQImE3R3jQPSAwAutgR3S8k5IeXWpXsTAREQgRwEAOxUQ9wRcwv9EMBxTkFhXQAz5yiidhUBERABEUidgMv7M4tTur60wtnRvaaLRw+5BeSckHqL0v2JgAiIgCcBANua7lsZYxLzCtEu9CiAsyyf0mwApvIsng4TAREQARFoAwFLvfBtt4xGRWzfjc4JrwO4x5bktpR3XBtaj+5RBERABEokAGAjAA/7jkROtofOCecC+BiAJeWcUGLl6FQiIAIi0BYCZjv6vEcg7F8AUHz1QFN2kJBpWxqN7lMEREAEqiBgKbvzZIR9xNma9gewnAtenUuzoSpqRecUAREQgZYRoI0HwIlOKohOCP02fv+i2YVOB7AYlbQZQNsyVLpdERABERCBKgmYNly/2RE95G5xv58P4P0ApqmyHDq3CIiACIhAywkA2AfAP3umRlyOo5v2vuacICHTlrcR3b4IiIAIVE4AwAwArnE5hd4EcAmA3V2OodWUZbVy9LqACIiACIhALwEAm7jA1d1cyu/5zdNuit7f9VkEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAERKA2Av8HNUDh8/6XipQAAAAASUVORK5CYII="
	SwingImage = base64.decode(SwingImage)
	ParryImage = base64.decode(ParryImage)

	function New(Type, Outline, Name)
		local drawing = Drawing.new(Type)
		for i, v in pairs(ESPSettings[Type]) do
			drawing[i] = v
		end
		if Outline then
			drawing.Color = Color3.new(0, 0, 0)
			drawing.Thickness = 3
		end
		return drawing
	end

	local PlrConnections = {}
	function Add(Player)
		if not PlayerDrawings[Player] then
			if not PlrConnections[Player] then
				PlrConnections[Player] = {}
			end

			local function check(char)
				if not char or char:GetAttribute("AlreadyFoundParry") then
					return
				end
				for i, v in char:GetChildren() do
					if v:GetAttribute("ParryShieldId") then
						local thing = v:GetChildren()[1]
						if thing then
							char:SetAttribute("AlreadyFoundParry", true)
							table.insert(
								PlrConnections[Player],
								thing:GetPropertyChangedSignal("Transparency"):Connect(function()
									if thing.Transparency ~= 1 then
										Player:SetAttribute("LastParry", tick())
									end
								end)
							)
						end
					end
				end
			end

			local function OnNewTool(Tool)
				check(Player.Character)
				if not Tool:IsA("Tool") then
					return
				end

				local Configuration = Modules.Name["WeaponMetadata"][Tool:GetAttribute("ItemId")]
				if Configuration then
					Player:SetAttribute("SwingCooldown", Configuration.cooldown or 1)
				end
			end

			table.insert(
				PlrConnections[Player],
				Player.CharacterAdded:Connect(function(Character)
					local PlayerDrawing = PlayerDrawings[Player]
					local Root = Character:WaitForChild("HumanoidRootPart")
					local Hum = Character:WaitForChild("Humanoid")
					if PlayerDrawing then
						PlayerDrawing.RootPart = Root
						PlayerDrawing.Humanoid = Hum
					end

					check(Character)
					table.insert(PlrConnections[Player], Character.ChildAdded:Connect(OnNewTool))
					table.insert(
						PlrConnections[Player],
						Hum:FindFirstChildOfClass("Animator").AnimationPlayed:Connect(function(track)
							if table.find(animations, track.Animation.AnimationId) then
								Player:SetAttribute("LastSwing", tick())
							end
						end)
					)
				end)
			)

			local Character = Player.Character

			local LastSwing = New("Image", nil, "LastSwing")
			local LastParry = New("Image", nil, "LastParry")

			LastSwing.Data = SwingImage
			LastParry.Data = ParryImage

			local Root = Character and Character:FindFirstChild("HumanoidRootPart")
			local Hum = Root and Character:FindFirstChild("Humanoid")

			if Character then
				for i, v in Character:GetChildren() do
					OnNewTool(v)
				end

				check(Character)
				table.insert(PlrConnections[Player], Character.ChildAdded:Connect(OnNewTool))
				if Hum then
					table.insert(
						PlrConnections[Player],
						Hum:FindFirstChildOfClass("Animator").AnimationPlayed:Connect(function(track)
							if table.find(animations, track.Animation.AnimationId) then
								Player:SetAttribute("LastSwing", tick())
							end
						end)
					)
				end
			end

			PlayerDrawings[Player] = {
				Offscreen = New("Triangle", nil, "Offscreen"),
				Name = New("Text", nil, "Name"),
				Tool = New("Text", nil, "Tool"),
				Distance = New("Text", nil, "Distance"),
				BoxOutline = New("Square", true, "BoxOutline"),
				Box = New("Square", nil, "Box"),
				HealthOutline = New("Line", true, "HealthOutline"),
				Health = New("Line", nil, "Health"),
				Swing = LastSwing,
				Parry = LastParry,

				RootPart = Root,
				Humanoid = Hum,
			}
		end
	end

	function AddUtility(Utility, Name)
		if not UtilityDrawings[Utility] then
			UtilityDrawings[Utility] = {
				Name = New("Text", nil, "Name"),
				Box = New("Square", nil, "Box"),
				BoxOutline = New("Square", true, "BoxOutline"),
				Distance = New("Text", nil, "Distance"),

				ObjectName = Name,
			}
		end
	end

	for _, Player in pairs(Players:GetPlayers()) do
		if Player ~= LocalPlayer then
			Add(Player)
		end
	end

	Players.PlayerAdded:Connect(Add)
	Players.PlayerRemoving:Connect(function(Player)
		if PlayerDrawings[Player] then
			for i, v in pairs(PlayerDrawings[Player]) do
				if v and i ~= "RootPart" and i ~= "Humanoid" then
					v:Remove()
				end
			end

			if PlrConnections[Player] and next(PlrConnections[Player]) then
				for i, v in PlrConnections[Player] do
					v:Disconnect()
				end
			end

			PlayerDrawings[Player] = nil
		end
	end)

	local function Check(Utility)
		if Utility.Name == "PlacedClaymore" then
			AddUtility(Utility, "Claymore")
		end

		if Utility.Name == "utility7Proxy" then
			AddUtility(Utility, "C4")
		end

		if Utility.Name == "utility5Proxy" then
			AddUtility(Utility, "Grenade")
		end

		if Utility.Name == "OpenBearTrap" then
			AddUtility(Utility, "Bear Trap")
		end
	end

	for i, v in pairs(Map:GetChildren()) do
		Check(v)
	end

	for i, v in pairs(EffectsJunk:GetChildren()) do
		Check(v)
	end

	Map.ChildAdded:Connect(function(Utility)
		Check(Utility)
	end)

	EffectsJunk.ChildAdded:Connect(function(Utility)
		Check(Utility)
	end)

	Map.ChildRemoved:Connect(function(Utility)
		if UtilityDrawings[Utility] then
			for i, v in pairs(UtilityDrawings[Utility]) do
				if i ~= "ObjectName" and v then
					v:Remove()
				end
			end

			UtilityDrawings[Utility] = nil
		end
	end)

	EffectsJunk.ChildRemoved:Connect(function(Utility)
		if UtilityDrawings[Utility] then
			for i, v in pairs(UtilityDrawings[Utility]) do
				if i ~= "ObjectName" and v then
					v:Remove()
				end
			end

			UtilityDrawings[Utility] = nil
		end
	end)

	local function Rotate(point, center, angle)
		angle = math.rad(angle)
		return Vector2.new(
			math.floor(math.cos(angle) * (point.X - center.X) - math.sin(angle) * (point.Y - center.Y) + center.X),
			math.floor(math.sin(angle) * (point.X - center.X) + math.cos(angle) * (point.Y - center.Y) + center.Y)
		)
	end

	local function Draw(Name, Box, BoxOutline, Distance, ObjectName, BoxSize, BoxPos, Dist, BottomOffset, ClassName)
		Name.Text = ObjectName
		Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
		Name.Color = Colors[ClassName] or Color3.new(1, 1, 1)
		Name.Font = 3
		Name.Visible = true
		Name.ZIndex = 1

		Box.Size = BoxSize
		Box.Position = BoxPos
		Box.Visible = true
		Box.Color = Colors[ClassName] or Color3.new(1, 1, 1)
		Box.ZIndex = 1

		BoxOutline.Size = BoxSize
		BoxOutline.Position = BoxPos
		BoxOutline.Visible = true
		BoxOutline.ZIndex = 0

		Distance.Text = math.floor(Dist) .. "m"
		Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
		Distance.Color = Colors[ClassName] or Color3.new(1, 1, 1)
		Distance.Font = 3
		Distance.Visible = true
		Distance.ZIndex = 1
	end

	RunService.RenderStepped:Connect(LPH_JIT_MAX(function()
		for i, v in pairs(UtilityDrawings) do
			if not v then
				continue
			end

			for i, drawing in pairs(v) do
				if i ~= "ObjectName" then
					drawing.Visible = false
				end
			end

			if not Classes.UtilityESP.Value then
				continue
			end

			local Root = i
			local Distance = (Camera.CFrame.Position - Root.Position).Magnitude

			if Classes.UtilityESPMaxDistance.Value < Distance then
				continue
			end

			local Pos, OnScreen = Camera:WorldToViewportPoint(Root.Position)
			if OnScreen then
				local Size = (
					Camera:WorldToViewportPoint(Root.Position - Vector3.new(0, 3, 0)).Y
					- Camera:WorldToViewportPoint(Root.Position + Vector3.new(0, 2.6, 0)).Y
				) / 2
				local BoxSize = Vector2.new(math.floor(Size), math.floor(Size))
				local BoxPos = Vector2.new(math.floor(Pos.X - Size / 2), math.floor(Pos.Y - Size / 2))

				local Name = v.Name
				local Box = v.Box
				local BoxOutline = v.BoxOutline
				local Dist = v.Distance

				local ObjectName = v.ObjectName

				local BottomOffset = BoxSize.Y + BoxPos.Y + 1

				if Classes.C4.Value and ObjectName == "C4" then
					Draw(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "C4")
				end

				if Classes.Grenade.Value and ObjectName == "Grenade" then
					Draw(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Grenade")
				end

				if Classes.Claymore.Value and ObjectName == "Claymore" then
					Draw(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Claymore")
				end

				if Classes.Beartrap.Value and ObjectName == "Bear Trap" then
					Draw(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Beartrap")
				end
			end
		end

		for _, Player in pairs(Players:GetPlayers()) do
			local PlayerDrawing = PlayerDrawings[Player]
			if not PlayerDrawing then
				continue
			end

			for Ind, Drawing in pairs(PlayerDrawing) do
				if Ind ~= "RootPart" and Ind ~= "Humanoid" and Ind ~= "SessionData" then
					Drawing.Visible = false
				end
			end

			if not Classes.ESP.Value then
				continue
			end

			local RootPart = PlayerDrawing.RootPart
			local Humanoid = PlayerDrawing.Humanoid
			if not Player.Character or not RootPart or not Humanoid then
				continue
			end

			local DistanceFromCharacter = (Camera.CFrame.Position - RootPart.Position).Magnitude
			if Classes.ESPMaxDistance.Value < DistanceFromCharacter then
				continue
			end

			local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)
			if not OnScreen then
				local RootPos = RootPart.Position
				local CameraVector = Camera.CFrame.Position
				local LookVector = Camera.CFrame.LookVector
				local Dot = LookVector:Dot(RootPos - CameraVector)

				if Dot <= 0 then
					RootPos = CameraVector + ((RootPos - CameraVector) - ((LookVector * Dot) * 1.01))
				end

				local ScreenPos, OnScreen = Camera:WorldToScreenPoint(RootPos)
				if not OnScreen then
					local Drawing = PlayerDrawing.Offscreen
					local FOV = 800 - Classes.OutFOVOffset.Value
					local Size = Classes.OutFOVSize.Value
					local Center = Camera.ViewportSize / 2
					local Direction = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Center).Unit
					local Radian = math.atan2(Direction.X, Direction.Y)
					local Angle = (((math.pi * 2) / FOV) * Radian)
					local ClampedPosition = Center
						+ (
							Direction
							* math.min(
								math.abs(((Center.Y - FOV) / math.sin(Angle)) * FOV),
								math.abs((Center.X - FOV) / (math.cos(Angle)) / 2)
							)
						)
					local Point = Vector2.new(
						math.floor(ClampedPosition.X - (Size / 2)),
						math.floor((ClampedPosition.Y - (Size / 2) - 15))
					)

					local OFFSettings = Classes.OFFSettings.Value
					local Rotation = math.floor(-math.deg(Radian)) - 47
					Drawing.PointA = Rotate(Point + Vector2.new(Size, Size), Point, Rotation)
					Drawing.PointB = Rotate(Point + Vector2.new(-Size, -Size), Point, Rotation)
					Drawing.PointC = Rotate(Point + Vector2.new(-Size, Size), Point, Rotation)
					Drawing.Color = Colors.OutOfFOV or Color3.new(1, 1, 1)
					Drawing.Filled = not ((OFFSettings == "Outline" or OFFSettings == "Both") or false)
					Drawing.Transparency = ((OFFSettings == "Blinking" or OFFSettings == "Both") or false)
							and (math.sin(tick() * 5) + 1) / 2
						or 1
					Drawing.Visible = Classes.OutOfFOV.Value
				end
			else
				local Size = (
					Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y
					- Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y
				) / 2
				local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
				local BoxPos = Vector2.new(math.floor(Pos.X - Size * 1.5 / 2), math.floor(Pos.Y - Size * 1.6 / 2))

				local Name = PlayerDrawing.Name
				local Tool = PlayerDrawing.Tool
				local Distance = PlayerDrawing.Distance
				local Box = PlayerDrawing.Box
				local BoxOutline = PlayerDrawing.BoxOutline
				local Health = PlayerDrawing.Health
				local HealthOutline = PlayerDrawing.HealthOutline
				local LastSwing = PlayerDrawing.Swing
				local LastParry = PlayerDrawing.Parry

				Name.ZIndex = 2
				Tool.ZIndex = 2
				Distance.ZIndex = 2
				Box.ZIndex = 2
				BoxOutline.ZIndex = 1
				Health.ZIndex = 2
				HealthOutline.ZIndex = 1

				local State = Framework:GetSessionData(Player)
				if State then
					State = State:getState()
				else
					State = { parry = {} }
				end

				if Classes.Boxes.Value then
					Box.Size = BoxSize
					Box.Position = BoxPos
					Box.Visible = true
					Box.Color = Colors.Boxes or Color3.new(1, 1, 1)
					BoxOutline.Size = BoxSize
					BoxOutline.Position = BoxPos
					BoxOutline.Visible = true
				end

				if Classes.SwingCooldown.Value then
					LastSwing.Visible = true
				end

				local SwingCooldown = Player:GetAttribute("SwingCooldown") or 1
				local Cooldown = Player:GetAttribute("LastSwing") and tick() - Player:GetAttribute("LastSwing") or false
				LastSwing.Position = Vector2.new((BoxSize.X + BoxPos.X + 5), BoxPos.Y)
				LastSwing.Transparency = (Cooldown or SwingCooldown / SwingCooldown)
				LastSwing.Size = Vector2.new(BoxSize.X * 0.2, BoxSize.Y * 0.1579)

				if Classes.ParryCooldown.Value then
					if Classes.SwingCooldown.Value then
						LastParry.Position = Vector2.new((BoxSize.X + BoxPos.X + 5), (BoxPos.Y + LastSwing.Size.Y + 5))
					else
						LastParry.Position = Vector2.new((BoxSize.X + BoxPos.X + 5), BoxPos.Y)
					end
					LastParry.Transparency = (tick() - (Player:GetAttribute("LastParry") or 1))
						/ (State.parry.lastParrySucceeded and 0.33 or 3)
					LastParry.Size = Vector2.new(BoxSize.X * 0.2, BoxSize.Y * 0.1579)
					LastParry.Visible = true
				end

				if Classes.Health.Value then
					Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
					Health.To =
						Vector2.new(Health.From.X, Health.From.Y - (Humanoid.Health / Humanoid.MaxHealth) * BoxSize.Y)
					Health.Color = Colors.Health or Color3.new(0, 1, 0)
					Health.Visible = true
					HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
					HealthOutline.To = Vector2.new(Health.From.X, Health.From.Y - BoxSize.Y - 1)
					HealthOutline.Visible = true
				end

				if Classes.Names.Value then
					Name.Text = Player.Name
					Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
					Name.Color = Colors.Names or Color3.new(1, 1, 1)
					Name.Font = 1
					Name.Visible = true
				end

				if Classes.Indicators.Value then
					local BottomOffset = BoxSize.Y + BoxPos.Y + 1
					local ESPType = Classes.ESPTypes.Value
					if ESPType == "Tool" or ESPType == "Both" then
						Tool.Text = (
							Character:FindFirstChildOfClass("Tool")
							and Character:FindFirstChildOfClass("Tool").Name
						) or "None"
						Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
						Tool.Color = Colors.Indicators or Color3.new(1, 1, 1)
						Tool.Font = 1
						Tool.Visible = true
						BottomOffset = BottomOffset + 15
					end
					if ESPType == "Distance" or ESPType == "Both" then
						Distance.Text = math.floor(DistanceFromCharacter) .. "m"
						Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
						Distance.Color = Colors.Indicators or Color3.new(1, 1, 1)
						Distance.Font = 1
						Distance.Visible = true
					end
				end
			end
		end
	end))
end

local LightingSection = CreateRegion(Visuals, "Lighting")
do
	if not Lighting:FindFirstChild("atmosphere") then
		Instance.new("Atmosphere", Lighting).Name = "atmosphere"
	end

	local originalAtmosphere = {
		Density = Lighting.atmosphere.Density,
		Decay = Lighting.atmosphere.Decay,
		Offset = Lighting.atmosphere.Offset,
		Glare = Lighting.atmosphere.Glare,
		Haze = Lighting.atmosphere.Haze,
	}

	Create(
		LightingSection,
		"Checkbox",
		{ Label = "World Ambience", Value = false },
		"Ambience",
		"Changes ambience",
		true,
		true
	)
	Create(
		LightingSection,
		"Checkbox",
		{ Label = "Color Correction", Value = false },
		"ColorCorrection",
		"Changes Color Correction",
		true,
		true
	)
	Create(
		LightingSection,
		"Combo",
		{ Label = "Skybox", Selected = 1, Items = { "None", "Nebula", "Vaporwave", "Clouds", "Twilight" } },
		"Skybox",
		"Changes Skybox"
	)
	Create(
		LightingSection,
		"Checkbox",
		{ Label = "Clock Time", Value = false },
		"ClockTime",
		"Changes Clock Time",
		true
	)
	Create(LightingSection, "Checkbox", { Label = "Max Zoom", Value = false }, "MaxZoom", "Changes Max Zoom", true)
	Create(LightingSection, "Checkbox", {
		Label = "Field Of View",
		Value = false,
		Callback = function(_, bool)
			if not bool then
				Camera.FieldOfView = 70
			end
		end,
	}, "FieldOfView", "Changes FOV", true)
	Create(LightingSection, "Checkbox", { -- haha i stole this form iy 😂😂😂
		Label = "Noclip Cam",
		Value = false,
		Callback = function(self, bool)
			local sc = (debug and debug.setconstant) or setconstant
			local gc = (debug and debug.getconstants) or getconstants
			local getgc = (debug and debug.getgc) or getgc
			local playerScripts = Players.LocalPlayer.PlayerScripts
			local popper = playerScripts.PlayerModule
				and playerScripts.PlayerModule.CameraModule
				and playerScripts.PlayerModule.CameraModule.ZoomController
				and playerScripts.PlayerModule.CameraModule.ZoomController.Popper
			local targetValueForNoclipCamOn = 0
			local targetValueForNoclipCamOff = 0.25

			local valueToSet = bool and targetValueForNoclipCamOn or targetValueForNoclipCamOff

			local modified = false
			for _, v in pairs(getgc()) do
				if type(v) == "function" and getfenv(v).script == popper then
					for i, v1 in pairs(gc(v)) do
						if tonumber(v1) == targetValueForNoclipCamOn or tonumber(v1) == targetValueForNoclipCamOff then
							if tonumber(v1) ~= valueToSet then
								sc(v, i, valueToSet)
								modified = true
								break
							end
						end
					end
				end
				if modified then
					break
				end
			end
		end,
	}, "NoclipCam", "Enables camera noclip", true)
	Create(
		LightingSection,
		"Checkbox",
		{ Label = "Brightness", Value = false },
		"Brightness",
		"Changes Brightness",
		true
	)
	Create(
		LightingSection,
		"Checkbox",
		{ Label = "Environmental", Value = false },
		"Environmental",
		"Changes Environmental Effects",
		true
	)
	Create(
		LightingSection,
		"Checkbox",
		{ Label = "Exposure Compensation", Value = false },
		"Exposure",
		"Changes Exposure Effects",
		true
	)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "Time", Value = 12, Minimum = 1, Maximum = 24, Format = "%.f" },
		"Time",
		"The time for Clock Time"
	)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "FOV Value", Value = 70, Minimum = 1, Maximum = 120, Format = "%.f" },
		"FOVLighting",
		"Your field of view"
	)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "Brightness", Value = 2, Minimum = 1, Maximum = 10, Format = "%.f" },
		"BrightnessValue",
		"How bright you want it to be"
	)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "Exposure", Value = 0, Minimum = 0, Maximum = 10, Format = "%.f" },
		"ExposureValue",
		"Exposure scale"
	)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "Diffuse % Specular", Value = 1, Minimum = 0, Maximum = 1, Format = "%.1f" },
		"EnvironmentValue",
		"Effect Scale"
	)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "Max Zoom Value", Value = 24, Minimum = 1, Maximum = 1000, Format = "%.f studs" },
		"MaxZoomVal",
		"How far you want to zoom out to"
	)

	LightingSection:Separator({ Text = "Fog" })

	Create(LightingSection, "Checkbox", { Label = "Fog", Value = false }, "Fog", "Enables Fog", true, true)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "Density", Value = 1, Minimum = 0, Maximum = 1, Format = "%.2f" },
		"Density",
		"Fog Density"
	)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "Glare", Value = 0, Minimum = 0, Maximum = 10, Format = "%.f" },
		"Glare",
		"Fog Glare"
	)
	Create(
		LightingSection,
		"SliderProgress",
		{ Label = "Haze", Value = 0, Minimum = 0, Maximum = 10, Format = "%.f" },
		"Haze",
		"Fog Haze"
	)

	LightingSection:Separator({ Text = "Character Visuals" })

	Create(LightingSection, "Checkbox", {
		Label = "Enabled",
		Value = false,
		Callback = function() end,
	}, "CharacterVisuals")

	Create(LightingSection, "Checkbox", {
		Label = "Color",
		Value = false,
		Callback = function()
			if not Classes.CharacterVisuals.Value then
				return
			end

			local char = LocalPlayer.Character
			if not char then
				return
			end

			local color = Colors.CharacterVisualsColor
			local parts = { "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }

			for _, name in ipairs(parts) do
				local part = char:FindFirstChild(name)
				if part then
					part.Color = color
				end
			end
		end,
	}, "CharacterVisualsColor", nil, nil, true, nil, Color3.fromRGB(255, 0, 0))

	Create(LightingSection, "Checkbox", {
		Label = "Rainbow",
		Value = false,
		Callback = function() end,
	}, "CharacterVisualsRainbow")

	Create(LightingSection, "Combo", {
		Label = "Material",
		Items = { "ForceField", "Plastic", "SmoothPlastic" },
		Value = "Plastic",
		Callback = function()
			if not Classes.CharacterVisuals.Value then
				return
			end

			local char = LocalPlayer.Character
			if not char then
				return
			end

			local material = Classes.CharacterVisualsMaterial.Value

			local parts = {
				"Head",
				"Torso",
				"Left Arm",
				"Right Arm",
				"Left Leg",
				"Right Leg",
			}

			for _, name in ipairs(parts) do
				local part = char:FindFirstChild(name)
				if part then
					part.Material = Enum.Material[material]
				end
			end

			local shirt = char:FindFirstChildOfClass("Shirt")
			if shirt then
				shirt:Destroy()
			end

			local pants = char:FindFirstChildOfClass("Pants")
			if pants then
				pants:Destroy()
			end
		end,
	}, "CharacterVisualsMaterial")

	Create(LightingSection, "SliderProgress", {
		Label = "Transparency",
		Minimum = 0,
		Maximum = 1,
		Value = 0,
		Callback = function()
			if not Classes.CharacterVisuals.Value then
				return
			end

			local char = LocalPlayer.Character
			if not char then
				return
			end

			local transparency = Classes.CharacterVisualsTransparency.Value
			local parts = { "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }

			for _, name in ipairs(parts) do
				local part = char:FindFirstChild(name)
				if part then
					part.Transparency = transparency
				end
			end
		end,
	}, "CharacterVisualsTransparency")

	task.spawn(function()
		while true do
			task.wait()

			if not Classes.CharacterVisuals.Value then
				continue
			end
			if not Classes.CharacterVisualsRainbow.Value then
				continue
			end

			local t = tick() % 5 / 5
			local rainbowColor = Color3.fromHSV(t, 1, 1)
			Colors.CharacterVisualsColor = rainbowColor

			local char = LocalPlayer.Character
			if char and Classes.CharacterVisualsColor.Value then
				for _, obj in char:GetDescendants() do
					if obj:IsA("BasePart") then
						obj.Color = rainbowColor
					end
				end
			end
		end
	end)

	local FOVConnection
	FOVConnection = Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
		if not Active then
			FOVConnection:Disconnect()
			return
		end
		if Classes.FieldOfView.Value then
			Camera.FieldOfView = Classes.FOVLighting.Value
		end
	end)

	local ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
		or Instance.new("ColorCorrectionEffect")
	local OldCorrection = ColorCorrection.TintColor
	local OldAmbience = Lighting.OutdoorAmbient
	local OldAmbience2 = Lighting.Ambient
	local OldDiffuse = Lighting.EnvironmentDiffuseScale
	local OldDiffuse2 = Lighting.EnvironmentSpecularScale
	local OldBrightness = Lighting.Brightness
	local OldExposure = Lighting.ExposureCompensation
	local OldClock = Lighting.ClockTime
	local OldZoom = LocalPlayer.CameraMaxZoomDistance

	Map.ChildAdded:Connect(function(map)
		task.wait(3)
		if map:GetAttribute("MapId") then
			ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
				or Instance.new("ColorCorrectionEffect")
			OldCorrection = ColorCorrection.TintColor
			OldAmbience = Lighting.OutdoorAmbient
			OldAmbience2 = Lighting.Ambient
			OldDiffuse = Lighting.EnvironmentDiffuseScale
			OldDiffuse2 = Lighting.EnvironmentSpecularScale
			OldBrightness = Lighting.Brightness
			OldExposure = Lighting.ExposureCompensation
			OldClock = Lighting.ClockTime
			OldZoom = LocalPlayer.CameraMaxZoomDistance
		end
	end)

	OldCorrection = ColorCorrection.TintColor

	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			if not Lighting:FindFirstChild("atmosphere") then
				Instance.new("Atmosphere", Lighting).Name = "atmosphere"
			end

			local Sky = Lighting:FindFirstChildOfClass("Sky")
			if not Sky then
				return
			end

			local Skybox = Skyboxes[Classes.Skybox.Value]

			for i, v in next, Skybox do
				Sky[i] = v
			end

			if Classes.FieldOfView.Value then
				Camera.FieldOfView = Classes.FOVLighting.Value
			end

			if Classes.Fog.Value then
				Lighting.atmosphere.Density = Classes.Density.Value
				Lighting.atmosphere.Decay = Colors["Fog"] or Color3.new(1, 1, 1)
				Lighting.atmosphere.Offset = 1
				Lighting.atmosphere.Glare = Classes.Glare.Value
				Lighting.atmosphere.Haze = Classes.Haze.Value
			else
				for i, v in pairs(originalAtmosphere) do
					Lighting.atmosphere[i] = v
				end
			end

			if Classes.Ambience.Value then
				Lighting.OutdoorAmbient = Colors["Ambience"] or Color3.new(1, 1, 1)
				Lighting.Ambient = Colors["Ambience"] or Color3.new(1, 1, 1)
			else
				Lighting.OutdoorAmbient = OldAmbience
				Lighting.Ambient = OldAmbience2
			end

			if Classes.MaxZoom.Value then
				LocalPlayer.CameraMaxZoomDistance = Classes.MaxZoomVal.Value
			else
				LocalPlayer.CameraMaxZoomDistance = OldZoom
			end

			if Classes.ClockTime.Value then
				Lighting.ClockTime = Classes.Time.Value
			else
				Lighting.ClockTime = OldClock
			end

			if Classes.ColorCorrection.Value then
				ColorCorrection.Enabled = true
				ColorCorrection.TintColor = Colors["ColorCorrection"] or Color3.new(1, 1, 1)
			else
				ColorCorrection.Enabled = false
				ColorCorrection.TintColor = OldCorrection
			end

			if Classes.Brightness.Value then
				Lighting.Brightness = Classes.BrightnessValue.Value
			else
				Lighting.Brightness = OldBrightness
			end

			if Classes.Environmental.Value then
				Lighting.EnvironmentDiffuseScale = Classes.EnvironmentValue.Value
				Lighting.EnvironmentSpecularScale = Classes.EnvironmentValue.Value
			else
				Lighting.EnvironmentDiffuseScale = OldDiffuse
				Lighting.EnvironmentSpecularScale = OldDiffuse2
			end

			if Classes.Exposure.Value then
				Lighting.ExposureCompensation = Classes.ExposureValue.Value
			else
				Lighting.ExposureCompensation = OldExposure
			end
		end),
		nil,
		Enum.RenderPriority.Last
	)
end

--// Misc
local Section = CreateRegion(Misc, "Main")
do
	local Crates = {
		["Skins"] = "skinsCase",
		["Enchants"] = "enchantsCase",
		["Kill Effects"] = "killEffectsCase",
		["Bundles"] = "case4",
		["Character Auras"] = "case5",
		["Parry Shields"] = "case6",
		["Emotes"] = "case7",
		["Emotes Icon"] = "case8",
		["Matatibi"] = "case9",
		["Christmas 2022"] = "case10",
		["Energy (Credits)"] = "case11",
		["Energy (Robux)"] = "case12",
		["Adoration"] = "case13",
		["Winter 2024 Event Energy"] = "case14",
	}

	local CrateNames = {}
	for name, id in pairs(Crates) do
		table.insert(CrateNames, name)
	end
	table.sort(CrateNames)

	local SelectedCrateName = CrateNames[1] or ""

	local Roles = {
		["Game Moderator"] = true,
		["Senior Moderator"] = true,
		["Developer"] = true,
		["Studio Developer"] = true,
		["Senior"] = true,
		["Lead"] = true,
	}

	local StaffKickMessage = "Staff Detected By Anti Mod\n%s (@%s) - %s"

	function CheckPlayer(Player: Player)
		local Success, Role = pcall(function()
			return Player:GetRoleInGroupAsync(CWGroupID)
		end)

		if Success and Roles[Role] then
			LocalPlayer:Kick(StaffKickMessage:format(Player.DisplayName, Player.Name, Role))
			return
		end
	end

	function RunModCheck(Player: Player | nil)
		if Player then
			CheckPlayer(Player)
		else
			for _, Player in Players:GetPlayers() do
				if Player ~= LocalPlayer then
					CheckPlayer(Player)
				end
			end
		end
	end

	Create(Section, "Checkbox", {
		Label = "Spoof VC Status",
		Value = false,
		Callback = function(self, bool)
			if bool then
				Network:FireServer("UpdateHasVc", true)
			end
		end,
	}, "VCJoin", "Tricks game into thinking you have VC (so you can join VC servers)", true)
	Create(
		Section,
		"Checkbox",
		{ Label = "Killsay", Value = false },
		"Killsay",
		"Cause annoyance and make people delulu trying to talk to you",
		true
	)
	Create(Section, "Checkbox", {
		Label = "Anti Mod",
		Value = false,
		Callback = function(self, bool)
			if bool then
				RunModCheck()
			end
		end,
	}, "AntiMod", "Automatically kicks you when Combat Warriors staff are detected in the server", true)
	Create(
		Section,
		"Checkbox",
		{ Label = "Ragebot", Value = false },
		"Ragebot",
		"Automatically shoots and reload for you",
		true
	)
	Create(Section, "Checkbox", {
		Label = "Show Target",
		Value = false,
		Callback = function(self, bool)
			if not bool then
				RagebotHighlight.Adornee = nil
				ShowInformation(nil)
			end
		end,
	}, "ShowRageBotTarget", "Show target of ragebot", true)
	Create(Section, "Checkbox", { Label = "Visualize Arrow Line", Value = false }, "ShowLine", "Show line", true, true)
	Create(
		Section,
		"Checkbox",
		{ Label = "Visualize Arrow Trajectory", Value = false },
		"ShowArrow",
		"Show arrows path",
		true
	)
	Create(
		Section,
		"SliderProgress",
		{ Label = "Ragebot Distance", Value = 1000, Minimum = 150, Maximum = 1000, Format = "%.f studs" },
		"RagebotDist",
		"How far to detect player"
	)
	Section:Separator({ Text = "Auto" })
	Create(
		Section,
		"Checkbox",
		{ Label = "Pathfind", Value = false },
		"Pathfind",
		"Pathfinds to people (enable kill aura)",
		true
	)
	Create(Section, "Checkbox", { Label = "Fast respawn", Value = false }, "FastRespawn", "Respawn faster", true)
	Create(
		Section,
		"Checkbox",
		{ Label = "Loop Spawn", Value = false },
		"LoopSpawn",
		"Automatically spawns you in",
		true
	)
	Create(
		Section,
		"SliderProgress",
		{ Label = "Pathfind Speed", Value = 45, Minimum = 1, Maximum = 45, Format = "%.f studs/s" },
		"PFSpeed",
		"How fast to walk in pathfind mode"
	)
	Section:Separator({ Text = "Teleports" })
	Create(
		Section,
		"Combo",
		{ Label = "Places", Selected = 1, Items = Teleports.Crossroads:GetNames() },
		"CRTeleports",
		"Places to teleport to in crossroads"
	)
	Create(Section, "Button", {
		Text = "Teleport To Selected",
		Callback = function()
			Framework:Teleport(Teleports.Crossroads.Teleports[Classes.CRTeleports.Value])
		end,
	}, "TTS", "Teleports to selected place (Crossroads)")
	Section:Separator({ Text = "Cosmetics" })
	Create(Section, "Button", {
		Text = "Get Cat",
		Callback = function()
			Network:FireServer("ExecuteCommand", "getCat", {})
		end,
	}, "GetCat", "Gets a...... CAT!")
	Create(Section, "Button", {
		Text = "Unlock All Emotes",
		Callback = function()
			local rodux = Framework:GetState()
			for i, v in Modules.Name["EmotesInOrder"] do
				if typeof(v) == "table" then
					rodux.OwnedEmotes[v.id] = 1
				end
			end
		end,
	}, "GetEmote", "Unlocks all emotes")
	Create(
		Section,
		"Checkbox",
		{ Label = "Squeeze Others Cat", Value = false },
		"SqueezeCat",
		"Squeeze other people's cat",
		true
	)
	Create(
		Section,
		"Checkbox",
		{ Label = "Regain Network On Anticheat", Value = false },
		"Network",
		"Attempts to regain network when you get rectified",
		true
	)
	local regainPositionConn
local deathConn
local charAddedConn

local positionHistory = {}
local maxHistorySize = 10
local hadOwnership = true
local hasTeleportedBack = false
local toolOnOwnershipLoss = nil
local ignoreUntilRespawn = false

Create(Section, "Checkbox", {
	Label = "Regain Position On Anticheat",
	Value = false,
	Callback = function(self, bool)
		local Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local LocalPlayer = Players.LocalPlayer

		local function setupCharacter(Character)
			ignoreUntilRespawn = true
			positionHistory = {}
			hadOwnership = true
			hasTeleportedBack = false
			toolOnOwnershipLoss = nil

			local Humanoid = Character:WaitForChild("Humanoid", 5)
			if Humanoid then
				if deathConn then
					deathConn:Disconnect()
				end
				deathConn = Humanoid.Died:Connect(function()
					ignoreUntilRespawn = true
				end)
			end

			task.delay(0.25, function()
				ignoreUntilRespawn = false
			end)
		end

		if bool then
			if charAddedConn then return end
			charAddedConn = LocalPlayer.CharacterAdded:Connect(setupCharacter)

			if LocalPlayer.Character then
				setupCharacter(LocalPlayer.Character)
			end

			if regainPositionConn then
				regainPositionConn:Disconnect()
			end
			regainPositionConn = RunService.Heartbeat:Connect(function()
				if ignoreUntilRespawn then return end

				local Character = LocalPlayer.Character
				if not Character then return end

				local HRP = Character:FindFirstChild("HumanoidRootPart")
				if not HRP or not HRP:IsDescendantOf(workspace) then return end

				local success, hasOwnership = pcall(function()
					return isnetworkowner(HRP)
				end)
				if not success then return end

				if hasOwnership then
					local currentPos = HRP.Position
					if #positionHistory == 0 or (currentPos - positionHistory[#positionHistory]).Magnitude > 0.001 then
						table.insert(positionHistory, currentPos)
						if #positionHistory > maxHistorySize then
							table.remove(positionHistory, 1)
						end
					end

					if not hadOwnership and not hasTeleportedBack then
						local teleportPos
						if #positionHistory >= 3 then
							teleportPos = positionHistory[#positionHistory - 2]
						elseif #positionHistory > 0 then
							teleportPos = positionHistory[1]
						else
							teleportPos = HRP.Position
						end

						HRP.CFrame = CFrame.new(teleportPos)
						task.wait()
						HRP.CFrame = CFrame.new(teleportPos)

						hasTeleportedBack = true
						task.delay(0.1, function()
							if toolOnOwnershipLoss and toolOnOwnershipLoss:IsDescendantOf(Character) and Character:FindFirstChild("Humanoid") then
								Character.Humanoid:EquipTool(toolOnOwnershipLoss)
							end
						end)
					end

					hadOwnership = true
				else
					hadOwnership = false
					hasTeleportedBack = false
					toolOnOwnershipLoss = nil
					for _, item in ipairs(Character:GetChildren()) do
						if item:IsA("Tool") then
							toolOnOwnershipLoss = item
							break
						end
					end
				end
			end)
		else
			if regainPositionConn then
				regainPositionConn:Disconnect()
				regainPositionConn = nil
			end
			if deathConn then
				deathConn:Disconnect()
				deathConn = nil
			end
			if charAddedConn then
				charAddedConn:Disconnect()
				charAddedConn = nil
			end
		end
	end,
}, "RegainPosition", "Attempts to regain position when you get rectified", true)




	Section:Separator({ Text = "Crates" })

	Create(Section, "Combo", {
		Label = "Select Case",
		Selected = 1,
		Items = CrateNames,
		Callback = function(self, value)
			SelectedCrateName = value
		end,
	}, "CaseSelector", "Choose a crate to open")

	Create(Section, "SliderProgress", {
		Label = "Amount",
		Value = selectedCrateAmount,
		Minimum = 1,
		Maximum = 10,
		Format = "%.f cases",
		Callback = function(self, value)
			selectedCrateAmount = math.floor(value)
		end,
	}, "CaseAmountSlider", "Select the amount of cases to open")

	Create(Section, "Button", {
		Text = "Open Case",
		Callback = function()
			local caseIdToOpen = Crates[SelectedCrateName]

			if caseIdToOpen then
				local success, response = Network:InvokeServer("PurchaseCase", caseIdToOpen, selectedCrateAmount) -- Use selectedCrateAmount

				if success then
					setthreadidentity(2)
					Modules.Name["ToastNotificationActionsClient"].add(
						"success",
						`Opened {tostring(selectedCrateAmount)} case(s) of {SelectedCrateName}`,
						2
					)(Modules.Name["RoduxStore"].store)
					Modules.Name["SoundHandler"].playSound({
						soundObject = ReplicatedStorage.Shared.Assets.Sounds.Success,
						parent = Workspace.Sounds,
					})
					setthreadidentity(7)
				else
					setthreadidentity(2)
					Modules.Name["ToastNotificationActionsClient"].add("error", response, 2, true)(
						Modules.Name["RoduxStore"].store
					)
					setthreadidentity(7)
				end
			else
				setthreadidentity(2)
				Modules.Name["ToastNotificationActionsClient"].add(
					"error",
					"Please select a valid case from the dropdown.",
					2,
					true
				)(Modules.Name["RoduxStore"].store)
				setthreadidentity(7)
			end
		end,
	}, "CrateOpen", "Opens the selected amount of the chosen crate")

	Players.PlayerAdded:Connect(function(Player)
		if Classes.AntiMod.Value then
			RunModCheck(Player)
		end
	end)

	EffectsJunk.ChildAdded:Connect(LPH_NO_VIRTUALIZE(function(Grenade)
		local Character = LocalPlayer.Character
		if not Character then
			return
		end
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		if not HumanoidRootPart then
			return
		end
		if (Grenade.Name == "utility5Proxy" or Grenade.Name == "utility7Proxy") and Classes.Pathfind.Value then
			local LastCF = HumanoidRootPart.CFrame
			while RunService.RenderStepped:Wait() do
				if Grenade:IsDescendantOf(game) then
					if Grenade.Name == "utility7Proxy" and Grenade:GetAttribute("HasBeepingVisuals") then
						continue
					end

					if not GrenadeNear then
						LastCF = HumanoidRootPart.CFrame
					else
						HumanoidRootPart.CFrame = CFrame.new(LastCF.X, 500, LastCF.Z)
					end

					if Framework:IsPartClose(Grenade, 15) then
						GrenadeNear = true
					end
				else
					break
				end
			end
			GrenadeNear = false
			HumanoidRootPart.CFrame = LastCF
		end
	end))

	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			if Classes.FastRespawn.Value then
				local Character = LocalPlayer.Character
				if Character then
					local Humanoid = Character:FindFirstChild("Humanoid")
					if Humanoid and Humanoid.Health == 0 then
						Network:FireServer("StartFastRespawn")
						Network:InvokeServer("CompleteFastRespawn")
					end
				end
			end
		end),
		nil,
		Enum.RenderPriority.Last
	)

	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			if Classes.LoopSpawn.Value and Framework:InMenu(LocalPlayer) then
				Network:InvokeServer("SpawnCharacter", true)
			end
			if Classes.SqueezeCat.Value then
				for i, v in pairs(Players:GetPlayers()) do
					if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Cat") then
						Network:FireServer("SqueezeCat", v.Character.Cat)
					end
				end
			end
		end),
		1,
		Enum.RenderPriority.Last
	)

	local KillSayStuff = Data.KillSayStuff
	local MockHandler = Modules.Name["MockPlayerHandler"]
	local KillStreak = Modules.Name["KillStreakConfigs"]

	task.spawn(function()
		if executor ~= "Velocity" then
			local realNames = {}
			local listNames = {}

			local PlayerScrollList = Framework:WaitForDescendant(CoreGui, "PlayerScrollList", function(inst)
				if inst:IsA("Frame") and inst:FindFirstChild("SizeOffsetFrame") then
					return true
				end
				return
			end)
			local ScrollerFrame = PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame

			Framework:BindToRenderStep(
				LPH_JIT_MAX(function()
					if Classes.HidePlayerNames.Value and Classes.StreamerMode.Value then
						for i, v in pairs(ScrollerFrame:GetChildren()) do
							if not listNames[v] then
								local text = v.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text
								listNames[v] = text
								v.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text =
									"serenium.hvh"
							else
								v.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text =
									"serenium.hvh"
							end
						end
					elseif not Classes.HidePlayerNames.Value or not Classes.StreamerMode.Value then
						for i, v in pairs(ScrollerFrame:GetChildren()) do
							if listNames[v] and v:FindFirstChild("ChildrenFrame") then
								v.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerName.PlayerName.Text = listNames[v]
							end
						end
					end
					for i, v in pairs(Players:GetPlayers()) do
						if v:GetAttribute("FakePlayer") then
							continue
						end
						if Classes.HidePlayerNames.Value and Classes.StreamerMode.Value then
							if not realNames[v] then
								realNames[v] = { v.Name, v.DisplayName }
								if v == LocalPlayer then
									v.Name = "serenium.hvh"
									v.DisplayName = "serenium.hvh"
								else
									v.Name = "non-serenium.hvh user"
									v.DisplayName = "non-serenium.hvh user"
								end
								if v.Character then
									local hum = v.Character:FindFirstChildOfClass("Humanoid")
									if hum then
										hum.DisplayName = "non-serenium.hvh user"
									end
								end
							else
								if v == LocalPlayer then
									v.Name = "serenium.hvh"
									v.DisplayName = "serenium.hvh"
								else
									v.Name = "non-serenium.hvh user"
									v.DisplayName = "non-serenium.hvh user"
								end
								if v.Character then
									local hum = v.Character:FindFirstChildOfClass("Humanoid")
									if hum then
										hum.DisplayName = "non-serenium.hvh user"
									end
								end
							end
						elseif not Classes.HidePlayerNames.Value or not Classes.StreamerMode.Value then
							if realNames[v] then
								v.Name = realNames[v][1]
								v.DisplayName = realNames[v][2] or ""
								if v.Character then
									local hum = v.Character:FindFirstChildOfClass("Humanoid")
									if hum then
										hum.DisplayName = v.DisplayName == "" and realNames[v][1] or v.DisplayName
									end
								end
								realNames[v] = nil
							end
						end
					end
				end),
				nil,
				Enum.RenderPriority.Last
			)

			local fakeCharacter = Instance.new("Model")
			fakeCharacter.Name = "non-serenium.hvh user"

			local ItemAdded = getupvalue(Modules.Name["DamageHandlerClient"]._startModule, 7)
			CurrentIdx = getupvalue(ItemAdded, 1)

			local getcallbackvalue = getcallbackvalue or function()
				return
			end
			local callback = getcallbackvalue(TextChatService, "OnIncomingMessage")

			if callback then
				TextChatService.OnIncomingMessage = function(obj)
					setthreadidentity(2)
					local iboughtaproperty = callback(obj)
					local source = obj.TextSource
					if source and Classes.StreamerMode.Value and Classes.HidePlayerNames.Value then
						iboughtaproperty.PrefixText = '<font color="rgb(255, 119, 119)">non-serenium.hvh user</font>'
						if source.UserId ~= LocalPlayer.UserId then
							iboughtaproperty.PrefixText =
								'<font color="rgb(255, 119, 119)">non-serenium.hvh user</font>'
						else
							iboughtaproperty.PrefixText = '<font color="rgb(100, 83, 255)">serenium.hvh:</font>'
						end
					end
					setthreadidentity(7)
					return iboughtaproperty
				end
			end
		end
	end)

	local old = Modules.Name["RoduxStore"].store.dispatch
	Modules.Name["RoduxStore"].store.dispatch = function(table, sigma)
		if typeof(sigma) == "table" then
			if sigma.type == "KILL_FEED_LIST_ADD" then
				if executor ~= "Velocity" then
					local payload = sigma.payload
					local playerThatKilled = payload.playerThatKilled
					local playerThatDied = payload.playerThatDied
					if Classes.StreamerMode.Value and Classes.HidePlayerNames then
						if playerThatKilled == LocalPlayer then
							payload.item.firstHalfStr = "serenium.hvh"
							payload.item.firstHalfStrColor = Color3.fromRGB(0, 255, 255)
						else
							payload.item.firstHalfStr = "non-serenium.hvh user"
						end
						if playerThatDied == LocalPlayer then
							payload.item.secondHalfStr = "serenium.hvh"
							payload.item.secondHalfStrColor = Color3.fromRGB(0, 255, 255)
						else
							payload.item.secondHalfStr = "non-serenium.hvh user"
						end
					end

					if Classes.CustomKillfeedName.Value ~= "" then
						if playerThatKilled == LocalPlayer then
							payload.item.firstHalfStr = Classes.CustomKillfeedName.Value
							payload.item.firstHalfStrColor = Colors.CustomKillfeedName or Color3.fromRGB(0, 255, 255)
						end
						if playerThatDied == LocalPlayer then
							payload.item.secondHalfStr = Classes.CustomKillfeedName.Value
							payload.item.secondHalfStrColor = Colors.CustomKillfeedName or Color3.fromRGB(1, 1, 1)
						end
					end
				end
			elseif sigma.type == "FALL_DAMAGE_DISABLED_COUNT_REMOVE" then
				if Classes.NFD.Value then
					return
				end
			elseif sigma.type == "PARRY_IS_PARRIED_CHANGE" or sigma.type == "PARRY_IS_KNEELED_CHANGE" then
				if Classes.NPS.Value then
					local JumpPower = Modules.Name["JumpHandlerClient"]
					local Walkspeed = Modules.Name["WalkSpeedHandlerClient"]
					local AutoRotate = Modules.Name["AutoRotateHandlerClient"]
					if JumpPower and Walkspeed and AutoRotate then
						local WSContainer = Walkspeed.getValueContainer()
						local JPContainer = JumpPower.getJumpPowerValueContainer()
						local ARContainer = AutoRotate.getAutoRotateToggleCounter()
						task.spawn(function()
							task.wait(0.1)

							DbgWarn("Removing parry effects")

							Modules.Name["CoreGuiHandlerClient"].toggleBackpack(true)
							Modules.Name["CoreGuiHandlerClient"].toggleResetButton(true)

							old(table, {
								type = "STUN_CLIENT_IS_STUNNED_COUNT_DECREMENT",
							})

							Modules.Name["ToolHandlerClient"].reEquipToolSet()
							Modules.Name["EnvironmentCommunication"]:Fire(
								"ToggleAnimationKind",
								"idle",
								"parried",
								false,
								{
									["playTransitionTime"] = 0.1,
									["stopTransitionTime"] = 0.1,
								}
							)

							WSContainer:removeFromZeroValueCount()
							JPContainer:removeFromZeroValueCount()
							ARContainer:add(1000)
						end)
					end
				end
			elseif sigma.type == "PARRY_CLIENT_IS_AFTER_PARRY_STUNNED_CHANGE" then
				if Classes.NPS2.Value then
					return
				end
			elseif sigma.type == "GLORY_KILL_GLORY_KILLING_CHANGE" then
				if Classes.AutoGlory.Value then
					return
				end
			end
		end

		return old(table, sigma)
	end

	local CanSend = true
	TextChatService.MessageReceived:Connect(function(message)
		if message.Text:match("You must wait before sending another message.") and CanSend then
			CanSend = false
			task.delay(4.5, function()
				CanSend = true
			end)
		end
	end)

	Network:BindEvents({
		CreateAntiCheatNotification = function(data)
			if
				data.punishType == "rectified"
				and Classes.Network.Value
				and LocalPlayer.Character
				and LocalPlayer.Character:FindFirstChild("Humanoid")
			then
				repeat
					LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack:GetChildren()[1])
					task.wait()
					LocalPlayer.Character.Humanoid:UnequipTools()
				until LocalPlayer.Character.HumanoidRootPart.ReceiveAge == 0
				Modules.Name["CoreGuiHandlerClient"].sendNotification({
					Title = "Regained Network",
					Text = "Attempt to regain network has been successful",
				})
			end
		end,
		KilledPlayer = function(statData)
			local diedPlayer = MockHandler.getPlayerOrMockFromPlayerOrMockUserId(statData.playerOrMockUserIdThatDied)
			local killType = statData.singleKillType
			local killStreak = statData.killStreak
			local headShot = statData.isHeadshot
			local collat = statData.isCollat
			local multiplier = statData.xpMult
			local baseXp = statData.baseXpToGive
			local baseCredits = statData.baseCreditsToGive

			if diedPlayer and Classes.Killsay.Value then
				local PickFrom = KillSayStuff.Normal
				local GotXp = baseXp
				local GotCredits = baseCredits

				if killType == "2" then
					PickFrom = KillSayStuff.Assist
				elseif killType == "3" then
					PickFrom = KillSayStuff.Finish
					GotXp = statData.finishXpToGive
					GotCredits = statData.finishCreditsToGive
				elseif killType == "4" then
					PickFrom = KillSayStuff.Glory
					GotXp = statData.gkXpToGive
					GotCredits = statData.gkCreditsToGive
				end

				if headShot then
					PickFrom = PickFrom.Headshot or PickFrom
					GotXp = statData.headshotXpToGive
					GotCredits = statData.headshotCreditsToGive
				end

				if collat then
					PickFrom = PickFrom.Collat or PickFrom
					GotXp = statData.collatXpToGive
					GotCredits = statData.collatCreditsToGive
				end

				local killStreakData = killStreak > 1 and (KillStreak[killStreak - 1] or KillStreak[#KillStreak])
				if killStreakData then
					GotXp = statData.killStreakXpToGive
					GotCredits = statData.killStreakCreditsToGive
				end

				local Message
				repeat
					Message = PickFrom[math.random(1, #PickFrom)]
					task.wait()
				until typeof(Message) == "string"
				Message = Message:gsub("%%Died%%", diedPlayer.DisplayName)
				Message = Message:gsub("%%XP%%", GotXp * multiplier)
				Message = Message:gsub("%%Credits%%", GotCredits)
				if killStreakData then
					Message = Message:gsub("%%KillstreakDisplayName%%", killStreakData.displayName)
				else
					Message = Message:gsub("%%KillstreakDisplayName%%", "Double Kill")
				end

				local Weapon = Framework:GetWeapon() or Framework:GetRanged()
				if Weapon then
					Message = Message:gsub("%%Weapon%%", Weapon.Name)
				end

				if CanSend then
					TextChatService.TextChannels.RBXGeneral:SendAsync(Message)
				end
			end
		end,
	})
end

local PlayersRegion = CreateRegion(Misc, "Main 2")
do
	local function m(str)
		return str:split(" ")[#str:split(" ")]:gsub("%(@", ""):gsub("%)", "")
	end
	local PlayerNames = {}
	for _, v in ipairs(Players:GetPlayers()) do
		table.insert(PlayerNames, v.DisplayName .. " (@" .. v.Name .. ")")
	end
	local npc = workspace:FindFirstChild("NPCs")
	if npc then
		local function addnpc(model)
			if not model:IsA("Model") then
				return
			end
			local root = model:WaitForChild("HumanoidRootPart", 2)
			if root then
				local name = model.Name
				table.insert(PlayerNames, name .. " (@" .. name .. ")")
			end
		end
		local function removenpc(model)
			for i, v in ipairs(PlayerNames) do
				if m(v) == model.Name then
					table.remove(PlayerNames, i)
					break
				end
			end
		end
		for _, npcModel in ipairs(npc:GetChildren()) do
			addnpc(npcModel)
		end
		npc.ChildAdded:Connect(addnpc)
		npc.ChildRemoved:Connect(removenpc)
	end
	Players.PlayerAdded:Connect(function(Player)
		table.insert(PlayerNames, Player.DisplayName .. " (@" .. Player.Name .. ")")
	end)
	Players.PlayerRemoving:Connect(function(Player)
		for i, v in ipairs(PlayerNames) do
			if m(v) == Player.Name then
				table.remove(PlayerNames, i)
				break
			end
		end
	end)
	local lastRefresh = 0
	local cachedItems = PlayerNames
	local refreshDelay = 0.5
	Create(
		PlayersRegion,
		"Label",
		{ Text = "Selected: " .. (PlayerNames[1] or "Unknown"), TextWrapped = true },
		"SelectedPlayer"
	)
	Create(PlayersRegion, "Combo", {
		Label = "",
		Selected = 1,
		Items = PlayerNames,
		GetItems = function()
			if os.clock() - lastRefresh >= refreshDelay then
				cachedItems = PlayerNames
				lastRefresh = os.clock()
			end
			return cachedItems
		end,
		Callback = function(_, Value)
			Classes.SelectedPlayer.Text = "Selected: " .. Value
		end,
	}, "PlayersTable", "Changes target player")
	Create(PlayersRegion, "Button", {
    Text = "Attempt Fling",
    Callback = function()
        local realName = m(Classes.PlayersTable.Value)
        local target = Players:FindFirstChild(realName)
        if not target or not target.Character then return end

        local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
        local localChar = LocalPlayer.Character
        local localRoot = localChar and localChar:FindFirstChild("HumanoidRootPart")
        if not targetRoot or not localRoot then return end

        local AttachRoot = targetRoot
        local walkFlingActive = true

        local heartbeatConn
        heartbeatConn = RunService.Heartbeat:Connect(function()
            if not walkFlingActive then
                heartbeatConn:Disconnect()
                return
            end
            if localChar and localChar.Parent and localRoot and localRoot.Parent then
                localRoot.CFrame = AttachRoot.CFrame
                sethiddenproperty(localRoot, "PhysicsRepRootPart", AttachRoot)
            end
        end)

        spawn(function()
            local movel = 0.1
            while walkFlingActive do
                if localChar and localChar.Parent and localRoot and localRoot.Parent then
                    local vel = localRoot.Velocity
                    localRoot.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                    RunService.RenderStepped:Wait()
                    localRoot.Velocity = vel + Vector3.new(0, movel, 0)
                    movel = movel * -1
                end
                RunService.Heartbeat:Wait()
            end
        end)
    end
})
Create(PlayersRegion, "Button", {
    Text = "Attempt Kill",
    Callback = function()
        local realname = m(Classes.PlayersTable.Value);
        local targetplayer = Players:FindFirstChild(realname);
        local isnpc = false;
        local target = nil;
        if not targetplayer then
            local npcmodel = workspace.NPCs:FindFirstChild(realname);
            if npcmodel then
                isnpc = true;
                target = {
                    Character = npcmodel,
                    Name = npcmodel.Name,
                };
            else
                return;
            end;
        else
            target = targetplayer;
        end;
        if Framework:InMenu(LocalPlayer) then
            repeat task.wait() until not Framework:InMenu(LocalPlayer);
        end;
        task.wait(0.1);
        if not getgenv().falldamage then
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
            if hrp then
                hrp.CFrame = hrp.CFrame + Vector3.new(0, 1000, 0);
                task.wait(0.2);
                Network:FireServer("StartFallDamage");
                hrp.CFrame = hrp.CFrame + Vector3.new(0, -1000, 0);
            end;
            getgenv().falldamage = true;
        end;
        local desync = false;
        local desyncthreadref = nil;
        local attachactive = true;
        local function startjitter(rootpart)
            if not rootpart or desyncthreadref then return end;
            desync = true;
            local verticaloffset = 0.1;
            desyncthreadref = task.spawn(function()
                while desync and rootpart and rootpart.Parent do
                    RunService.Heartbeat:Wait();
                    local previousvelocity = rootpart.AssemblyLinearVelocity;
                    rootpart.AssemblyLinearVelocity = Vector3.new(math.random(-1500, 1500), math.random(-300, 300), math.random(-1500, 1500));
                    RunService.RenderStepped:Wait();
                    if rootpart.Parent then
                        rootpart.AssemblyLinearVelocity = previousvelocity;
                    end;
                    RunService.Stepped:Wait();
                    if rootpart.Parent then
                        rootpart.AssemblyLinearVelocity =
                            previousvelocity + Vector3.new(0, verticaloffset, 0);
                        verticaloffset = -verticaloffset;
                    end;
                end;
                desyncthreadref = nil;
            end);
        end;
        local function stopjitter()
            desync = false;
        end;
        local function getmychar()
            local char = LocalPlayer.Character;
            if not char or not char.Parent then
                char = LocalPlayer.CharacterAdded:Wait();
            end;
            local root = char:FindFirstChild("HumanoidRootPart");
            local hum = char:FindFirstChild("Humanoid");
            return char, root, hum;
        end;
        local function gettargetchar()
            if isnpc then
                local char = target.Character;
                if char and char.Parent then
                    return char, char:FindFirstChild("HumanoidRootPart");
                end;
                return nil, nil;
            else
                local char = target.Character;
                if not char or not char.Parent then
                    char = target.CharacterAdded:Wait();
                end;
                return char, char:FindFirstChild("HumanoidRootPart");
            end;
        end;
        local heartbeatconn;
        heartbeatconn = RunService.Heartbeat:Connect(function()
            if not attachactive then
                heartbeatconn:Disconnect();
                return;
            end;
            local mychar, myroot, myhumanoid = getmychar();
            local targetchar, targetroot = gettargetchar();
            if myroot and myhumanoid and targetroot then
                myroot.CFrame = targetroot.CFrame;
                sethiddenproperty(myroot, "PhysicsRepRootPart", targetroot);
                local ragdollremote =
                    myhumanoid:FindFirstChild("RagdollRemoteEvent")
                    or myhumanoid:WaitForChild("RagdollRemoteEvent", 0.2);
                if ragdollremote then
                    ragdollremote:FireServer(true);
                end;

                startjitter(myroot);
            end;
        end);
        task.spawn(function()
            while attachactive do
                if Framework:InMenu(LocalPlayer) then
                    break;
                end;
                local _, _, myhumanoid = getmychar();
                local _, targetroot = gettargetchar();
                if not myhumanoid or myhumanoid.Health <= 0 then
                    task.wait(0.1);
                else
                    for i = 1, 50 do
                        if Framework:InMenu(LocalPlayer) then break end;
                        if targetroot and targetroot.Parent then
                            Network:FireServer("TakeFallDamage",math.huge,Vector3.new(0, -1, 0),targetroot.Position);
                        end;
                        task.wait();
                    end;
                end;
                task.wait(0.05);
            end;
            attachactive = false;
            stopjitter();
            if heartbeatconn then heartbeatconn:Disconnect() end;
        end);
    end,
}, "AttemptKill", "Attempts to kill the selected player or NPC");
	Create(PlayersRegion, "Button", {
		Text = "Teleport To Player",
		Callback = function()
			local realName = m(Classes.PlayersTable.Value)
			local target = Players:FindFirstChild(realName)

			if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
				Framework:Teleport(target.Character.HumanoidRootPart.CFrame)
			end
		end,
	}, "TPButton", "Teleports to selected player")

	Classes.SelectedPlayer.Text = "Selected: " .. PlayerNames[1]
	Create(PlayersRegion, "Button", {
		Text = "Add to ignorelist",
		Callback = function()
			local selected = m(Classes.PlayersTable.Value)
			if selected and not table.find(Ignored, selected) then
				table.insert(Ignored, selected)
				CreateNotification(selected .. " added to ignorelist", Color3.fromRGB(73, 67, 255))
			end
		end,
	}, "WhitelistButton", "Adds the selected player to ignorelist")

	Create(PlayersRegion, "Button", {
		Text = "Remove from whitelist",
		Callback = function()
			local selected = m(Classes.PlayersTable.Value)
			if selected then
				local idx = table.find(Ignored, selected)
				if idx then
					table.remove(Ignored, idx)
					CreateNotification(selected .. " removed from ignorelist", Color3.fromRGB(73, 67, 255))
				end
			end
		end,
	}, "UnwhitelistButton", "Removes the selected player from ignorelist")

	Create(
		PlayersRegion,
		"Checkbox",
		{ Label = "Alt + Key to Attempt Kill", Value = false },
		"AttemptKillKey",
		"Attempt kill but you can use mouse",
		true,
		false,
		true
	)
	PlayersRegion:Separator({ Text = "Performance" })

	Create(PlayersRegion, "Checkbox", {
		Label = "FastMode (Antilag)",
		Value = false,
		Callback = function(self, bool)
			local effectsJunkFolder = workspace:FindFirstChild("EffectsJunk")

			if bool then
				if effectsJunkFolder and effectsJunkFolder.Parent == workspace then
					effectsJunkFolder.Parent = ReplicatedStorage
				end
			else
				effectsJunkFolder = ReplicatedStorage:FindFirstChild("EffectsJunk")
				if effectsJunkFolder and effectsJunkFolder.Parent == ReplicatedStorage then
					effectsJunkFolder.Parent = workspace
				end
			end
		end,
	}, "FastMode", "Moves visual effects to ReplicatedStorage to reduce lag.", true)

	PlayersRegion:Separator({ Text = "Sounds" })
	local UpdateSounds = function() end
	Create(PlayersRegion, "Combo", {
		Label = "Nuke Alarm",
		Selected = 2,
		Items = SoundTables:GetNames("Customs"),
		Callback = function()
			UpdateSounds()
		end,
	}, "NukeAlarm", "Changes Nuke Alarm sound")
	Create(PlayersRegion, "Combo", {
		Label = "Heal",
		Selected = 2,
		Items = SoundTables:GetNames("Customs"),
		Callback = function()
			UpdateSounds()
		end,
	}, "Heal", "Changes Heal sound")
	Create(PlayersRegion, "Combo", {
		Label = "Explosion",
		Selected = 2,
		Items = SoundTables:GetNames("Customs"),
		Callback = function()
			UpdateSounds()
		end,
	}, "Explosion", "Changes Explosion sound")
	Create(PlayersRegion, "Combo", {
		Label = "Kill Sound",
		Selected = 2,
		Items = SoundTables:GetNames("Customs"),
		Callback = function()
			UpdateSounds()
		end,
	}, "KillSound", "Changes Kill sound")
	Create(PlayersRegion, "Combo", {
		Label = "Parry Sound",
		Selected = 2,
		Items = SoundTables:GetNames("Customs"),
		Callback = function()
			UpdateSounds()
		end,
	}, "ParrySound", "Changes Parry sound")

	UpdateSounds = function()
		local Nuke = SoundTables.Customs[Classes.NukeAlarm.Value]
		local Heal = SoundTables.Customs[Classes.Heal.Value]
		local Explosion = SoundTables.Customs[Classes.Explosion.Value]
		local KillSound = SoundTables.Customs[Classes.KillSound.Value]
		local ParrySound = SoundTables.Customs[Classes.ParrySound.Value]

		Nuke = Nuke == "" and SoundTables.Defaults.NukeAlarm or Nuke
		Heal = Heal == "" and SoundTables.Defaults.Heal or Heal
		Explosion = Nuke == "" and SoundTables.Defaults.Explosion or Explosion
		KillSound = KillSound == "" and SoundTables.Defaults.Kill or KillSound
		ParrySound = ParrySound == "" and SoundTables.Defaults.Parry or ParrySound

		ReplicatedStorage.Shared.Assets.Sounds.NukeAlarm.SoundId = NukeD
		ReplicatedStorage.Shared.Assets.Sounds.Heal.SoundId = Heal
		ReplicatedStorage.Shared.Assets.Sounds.ExplosionHit.SoundId = Explosion
		ReplicatedStorage.Shared.Assets.Sounds.Kill.SoundId = KillSound
		ReplicatedStorage.Shared.Assets.Damage.Sounds.CriticalKill.SoundId = KillSound
		ReplicatedStorage.Shared.Assets.Sounds.Parry.SoundId = ParrySound
	end

	PlayersRegion:Separator({ Text = "Others" })

	local CanKillAll = false
	Create(PlayersRegion, "Checkbox", {
		Label = "Loop Attempt Kill All",
		Value = false,
		Callback = function(self, bool)
			if bool then
				if Framework:InMenu(LocalPlayer) then
					repeat
						task.wait()
					until not Framework:InMenu(LocalPlayer)
				end

				task.wait(0.1)

				local Character = LocalPlayer.Character
				local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
				if not HumanoidRootPart then
					return
				end

				CanKillAll = false
				CanFireStartFallDamage = false
				HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, 1000, 0)

				task.wait(0.2)

				Network:FireServer("StartFallDamage")
				HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, -1000, 0)

				CanKillAll = true
			else
				CanFireStartFallDamage = true
				CanKillAll = false
			end
		end,
	}, "LoopKillAll", "Loop kill all using Attempt Kill", true)
	Create(
		PlayersRegion,
		"Checkbox",
		{ Label = "Beartrap Enemy", Value = false },
		"BeartrapEnemy",
		"Automatically beartraps people near you",
		true
	)
	Create(
		PlayersRegion,
		"Checkbox",
		{ Label = "Auto Attach C4", Value = false },
		"AutoAttachC4",
		"Automatically attaches C4 to people near you",
		true
	)
	Create(
		PlayersRegion,
		"Checkbox",
		{ Label = "Auto Detonate C4", Value = false },
		"AutoDetonateC4",
		"Automatically detonates C4",
		true
	)
	Create(
		PlayersRegion,
		"Checkbox",
		{ Label = "Whitelist Friends", Value = false },
		"WhitelistFriends",
		"Whitelist your friends from features that detect players",
		true
	)
	Create(PlayersRegion, "Checkbox", {
		Label = "Spam bio-repair pen sound",
		Value = false,
		Callback = function(self, bool)
			if bool then
				workspace.ChildAdded:Connect(function(child)
					if child:IsA("Sound") and child.Name == "jab" then
						child:Destroy()
					end
				end)

				task.spawn(function()
					local stomp = { Torso = workspace }
					while Classes.SpamBioRepairSound.Value do
						Modules.Name["VFXClient"].runAndReplicateEffect("HealthPen", {
							stomp,
						}, "jab")
						task.wait(0.5)
					end
				end)
			end
		end,
	}, "SpamBioRepairSound", "Spams the bio-repair pen sound effect", true)
	Create(PlayersRegion, "Button", {
		Text = "Load Invis-fling",
		Callback = function()
			loadstring(
				get(
					"https://gist.githubusercontent.com/t1ware/3f9284f9c8160ece251b05952c8812de/raw/bd584e4aca1a3b5eb1ee87769ca126919a954dc6/invisfling.luau"
				)
			)()
		end,
	}, "thisdoesnotneedaflag", "Loads up Invis-fling")

	PlayersRegion:Separator({ Text = "Glory & Stomp" })

	Create(
		PlayersRegion,
		"Checkbox",
		{ Label = "Auto Glory", Value = false },
		"AutoGlory",
		"Automatically glory kill someone near you",
		true
	)
	Create(
		PlayersRegion,
		"Checkbox",
		{ Label = "Auto Stomp/Shove", Value = false },
		"AutoStompShove",
		"Automatically stomps/shove people near you",
		true
	)
	Create(
		PlayersRegion,
		"SliderProgress",
		{ Label = "Glory Delay", Value = 0.5, Minimum = 0, Maximum = 1, Format = "%.1f seconds" },
		"GloryDelay",
		"The delay on the glory kill"
	)
	Create(
		PlayersRegion,
		"SliderProgress",
		{ Label = "Glory Range", Value = 10, Minimum = 1, Maximum = 10, Format = "%.f studs/s" },
		"GloryRange",
		"The range on glory kill"
	)
	Create(
		PlayersRegion,
		"SliderProgress",
		{ Label = "Stomp/Shove Range", Value = 10, Minimum = 1, Maximum = 10, Format = "%.f studs/s" },
		"StompShoveRange",
		"The range on stomp/shove"
	)

	PlayersRegion:Separator({ Text = "Servers" })

	Create(PlayersRegion, "Button", {
		Text = "Rejoin",
		Callback = function()
			if script_key then
				queue_on_teleport(([[
					script_key = "%s";
					loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/27c298c7ffc93c7c51701af33be4f84f.lua"))();
				]]):format(script_key))
			end

			TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer, "", "=")
		end,
	}, "Rejoin", "Rejoins game")
	Create(PlayersRegion, "Button", {
		Text = "Serverhop to Highest",
		Callback = function()
			local response = request({
				Url = "https://games.roblox.com/v1/games/"
					.. game.PlaceId
					.. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true",
				Method = "GET",
			})
			if response.StatusCode == 200 then
				local data = game:GetService("HttpService"):JSONDecode(response.Body)
				if data and data.data and #data.data > 0 then
					if script_key then
						queue_on_teleport(([[
							script_key = "%s";
							loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/27c298c7ffc93c7c51701af33be4f84f.lua"))();
						]]):format(script_key))
					end

					TeleportService:TeleportToPlaceInstance(game.PlaceId, data.data[1].id, LocalPlayer, "", "=")
				end
			end
		end,
	}, "ServerhopHighest", "Serverhop to highest player count")
	Create(PlayersRegion, "Button", {
		Text = "Serverhop to lowest",
		Callback = function()
			local response = request({
				Url = "https://games.roblox.com/v1/games/"
					.. game.PlaceId
					.. "/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true",
				Method = "GET",
			})
			if response.StatusCode == 200 then
				local data2 = game:GetService("HttpService"):JSONDecode(response.Body)
				if script_key then
					queue_on_teleport(([[
						script_key = "%s";
						loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/27c298c7ffc93c7c51701af33be4f84f.lua"))();
					]]):format(script_key))
				end

				TeleportService:TeleportToPlaceInstance(game.PlaceId, data2.data[1].id, LocalPlayer, "", "=")
			end
		end,
	}, "ServerhopLowest", "Serverhop to lowest player count")

	local Desync = false
	local PredictionInterval = 0.5

	local function PredictMovement(part)
		if not part then
			return nil
		end

		local vel = part.AssemblyLinearVelocity
		local predictedPos = part.Position + (vel * PredictionInterval)
		return CFrame.new(predictedPos, predictedPos + part.CFrame.LookVector)
	end

	local desyncThreadRef = nil
	local function Jitter(rootPart)
		if not rootPart or desyncThreadRef then
			return
		end

		Desync = true

		local verticalOffset = 0.1
		desyncThreadRef = task.spawn(function()
			while Desync and rootPart and rootPart.Parent do
				RunService.Heartbeat:Wait()
				local previousVelocity = rootPart.AssemblyLinearVelocity
				rootPart.AssemblyLinearVelocity =
					Vector3.new(math.random(-1500, 1500), math.random(-300, 300), math.random(-1500, 1500))
				RunService.RenderStepped:Wait()
				if rootPart.Parent then
					rootPart.AssemblyLinearVelocity = previousVelocity
				end
				RunService.Stepped:Wait()
				if rootPart.Parent then
					rootPart.AssemblyLinearVelocity = previousVelocity + Vector3.new(0, verticalOffset, 0)
					verticalOffset = -verticalOffset
				end
			end
			desyncThreadRef = nil
		end)
	end

	local function StopJitter()
		Desync = false
	end

	local function AttemptKillTarget(targetPlayer)
		if not targetPlayer then
			return
		end

		local myCharacter = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
		local myRoot = myCharacter:FindFirstChild("HumanoidRootPart")
		local myHumanoid = myCharacter:FindFirstChild("Humanoid")
		local targetCharacter = targetPlayer.Character or targetPlayer
		local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
		local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")

		if not myRoot or not myHumanoid or not targetRoot or not targetHumanoid then
			return
		end

		local ragdollRemoteEvent = myHumanoid:FindFirstChild("RagdollRemoteEvent")
			or myHumanoid:WaitForChild("RagdollRemoteEvent", 0.5)
		if ragdollRemoteEvent then
			ragdollRemoteEvent:FireServer(true)
		end

		Jitter(myRoot)

		if Framework:InMenu(LocalPlayer) then
			StopJitter()
			return
		end

		while myHumanoid.Health > 0 do
			if Framework:InMenu(LocalPlayer) then
				StopJitter()
				break
			end

			AttachRoot = targetRoot

			for loopIndex = 1, 50 do
				if Framework:InMenu(LocalPlayer) then
					AttachRoot = nil
					break
				end

				if targetRoot and targetRoot.Parent then
					Network:FireServer("TakeFallDamage", math.huge, Vector3.new(0, -1, 0), targetRoot.Position)
				end

				task.wait()
			end
		end

		AttachRoot = nil
		StopJitter()
	end

	local isAliveFlag = true
	local function StartKillLoop(character)
		local characterRoot = character:WaitForChild("HumanoidRootPart")
		local characterHumanoid = character:WaitForChild("Humanoid")

		isAliveFlag = true
		characterHumanoid.Died:Connect(function()
			isAliveFlag = false
		end)

		task.spawn(function()
			while isAliveFlag and characterHumanoid.Health > 0 do
				if not CanKillAll then
					AttachRoot = nil
					task.wait(0.1)
					continue
				end

				if not Classes.LoopKillAll.Value then
					AttachRoot = nil
					task.wait(0.1)
					continue
				end

				if Framework:InMenu(LocalPlayer) then
					AttachRoot = nil
					task.wait(0.2)
					continue
				end

				for _, targetPlayer in ipairs(Players:GetPlayers()) do
					if Framework:InMenu(LocalPlayer) then
						AttachRoot = nil
						break
					end

					if targetPlayer == LocalPlayer then
						continue
					end

					if Framework:InMenu(targetPlayer) then
						continue
					end

					if table.find(Ignored, targetPlayer.Name) then
						continue
					end

					local targetChar = targetPlayer.Character
					if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
						continue
					end

					if not targetChar:FindFirstChild("Humanoid") then
						continue
					end

					if targetChar.Humanoid.Health <= 0 then
						continue
					end

					if targetChar:FindFirstChildOfClass("ForceField") then
						continue
					end

					task.spawn(function()
						while
							isAliveFlag
							and Classes.LoopKillAll.Value
							and targetChar.Parent
							and targetChar.Humanoid.Health > 0
						do
							if Framework:InMenu(LocalPlayer) then
								break
							end

							AttachRoot = targetPlayer.Character.HumanoidRootPart
							AttemptKillTarget(targetPlayer)
							task.wait(0.05)
						end
					end)
					task.wait(0.1)
				end
				task.wait(0.2)
			end
		end)
	end

	if LocalPlayer.Character then
		StartKillLoop(LocalPlayer.Character)
	end
	LocalPlayer.CharacterAdded:Connect(StartKillLoop)

	RunService.Heartbeat:Connect(function(dt)
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
		if HumanoidRootPart then
			if AttachRoot then
				HumanoidRootPart.CFrame = AttachRoot.CFrame
				sethiddenproperty(HumanoidRootPart, "PhysicsRepRootPart", AttachRoot)
			end
		end
	end)
end

local OptionsSection = CreateRegion(Settings, "Options")
local ConfigSection = CreateRegion(Settings, "Configurations")

if not isfolder("serenium.hvh/logs/") then
	makefolder("serenium.hvh/logs/")
end

local aQf8N = math.random(1000, 9999)
local Fm0kU = os.date("%Y-%m-%d_%H-%M-%S")
local Uu7pB = "serenium.hvh/logs/" .. aQf8N .. "-" .. Fm0kU .. ".txt"

writefile(Uu7pB, "[session] " .. Fm0kU .. " | id: " .. aQf8N .. "\n")

local Kp2xL = {}

local rH1dS = function(Az5wP)
	return string.find(Az5wP:lower(), "failed to load animation") ~= nil
end

local vB9kC = function(mL3eT)
	table.insert(Kp2xL, "[" .. os.date("%H:%M:%S") .. "] " .. mL3eT)
end

task.spawn(function()
	while true do
		writefile(Uu7pB, table.concat(Kp2xL, "\n"))
		task.wait(0.1)
	end
end)

game:GetService("LogService").MessageOut:Connect(function(bX4qO, Yg8nM)
	if not rH1dS(bX4qO) then
		vB9kC("[" .. Yg8nM.Name .. "] " .. bX4qO)
	end
end)

do
	if not isfolder("serenium.hvh/settings/") then
		makefolder("serenium.hvh/settings/")
	end

	if not isfolder("serenium.hvh/themes/") then
		makefolder("serenium.hvh/themes/")
	end

	local autoFile = "serenium.hvh/settings/autoload.json"

	local function saveAuto(cfg)
		if cfg == "" then
			return
		end
		writefile(autoFile, HttpService:JSONEncode({ cfg }))
	end

	local function loadAuto()
		if isfile(autoFile) then
			local d = HttpService:JSONDecode(readfile(autoFile))
			if d and d[1] then
				Load(d[1])
				return d[1]
			end
		end
		return nil
	end

	function GetConfigs()
		local list = listfiles("serenium.hvh/settings")

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == ".json" then
				local pos = file:find(".json", 1, true)
				local start = pos

				local char = file:sub(pos, pos)
				while char ~= "/" and char ~= "\\" and char ~= "" do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == "/" or char == "\\" then
					table.insert(out, file:sub(pos + 1, start - 1))
				end
			end
		end

		return out
	end

	function GetThemes()
		local list = listfiles("serenium.hvh/themes")

		local out = {}
		for i = 1, #list do
			local file = list[i]
			if file:sub(-5) == ".json" then
				local pos = file:find(".json", 1, true)
				local start = pos

				local char = file:sub(pos, pos)
				while char ~= "/" and char ~= "\\" and char ~= "" do
					pos = pos - 1
					char = file:sub(pos, pos)
				end

				if char == "/" or char == "\\" then
					table.insert(out, file:sub(pos + 1, start - 1))
				end
			end
		end

		return out
	end

	function Save(name)
		if name == "" then
			return
		end

		local SaveData = {}
		local NewColors = {}
		local NewClasses = {}
		for i, v in Colors do
			NewColors[i] = tostring(v)
		end
		for i, v in Classes do
			if typeof(v) ~= "table" then
				continue
			end
			if typeof(v.Value) == "EnumItem" then
				NewClasses[i] = tostring(v.Value)
				continue
			end
			NewClasses[i] = v.Value or false
		end
		table.insert(SaveData, NewClasses)
		table.insert(SaveData, NewColors)

		local filename = "serenium.hvh/settings/" .. name .. ".json"
		DbgWarn(filename)
		writefile(filename, HttpService:JSONEncode(SaveData))
	end

	function SaveTheme(name)
		if name == "" then
			return
		end

		local Theme = ReGui.ThemeConfigs[Window.Theme].Values
		if Theme then
			for i, v in Theme do
				local Type = typeof(v)
				if Type == "TweenInfo" then
					local tweenData = {
						v.Time,
						tostring(v.EasingStyle):gsub("Enum.EasingStyle.", ""),
						tostring(v.EasingDirection):gsub("Enum.EasingDirection.", ""),
						v.RepeatCount,
						v.Reverses,
						v.DelayTime,
					}

					Theme[i] = tweenData
				elseif Type == "Color3" then
					local SplitColor = tostring(v):split(", ")
					Theme[i] = SplitColor
				elseif Type == "Font" then
					Theme[i] = v.Family
				elseif Type == "EnumItem" then
					Theme[i] = {
						tostring(v.EnumType),
						v.Name,
					}
				end
			end

			local filename = "serenium.hvh/themes/" .. name .. ".json"
			DbgWarn(filename)
			writefile(filename, HttpService:JSONEncode(Theme))
		end
	end

	function Load(name)
		if name == "" then
			return
		end
		if not isfile("serenium.hvh/settings/" .. name .. ".json") then
			return
		end

		local Decoded = HttpService:JSONDecode(readfile("serenium.hvh/settings/" .. name .. ".json"))
		if Decoded then
			local DecodedClasses = Decoded[1]
			local DecodedColors = Decoded[2]

			for i, v in DecodedClasses do
				if not Classes[i] then
					continue
				end

				local setValue = v
				if typeof(v) == "string" and v:match("Enum.KeyCode.") then
					setValue = Enum.KeyCode[v:gsub("Enum.KeyCode.", "")]
				end

				setthreadidentity(8)
				local class = Classes[i]
				local method = class.SetValue or class.SetTicked

				if method then
					local s, r = pcall(method, class, setValue)
					if not s then
						DbgWarn(i, r)
					end
				end
			end

			for i, v in DecodedColors do
				local decode = v:split(", ")
				local RealColor = Color3.new(decode[1], decode[2], decode[3])

				Colors[i] = RealColor
			end
		end
	end

	function LoadTheme(name)
		if name == "" then
			return
		end
		if ReGui.ThemeConfigs[name] then
			Window:SetTheme(name)
			return
		end
		if not isfile("serenium.hvh/themes/" .. name .. ".json") then
			return
		end

		local Decoded = HttpService:JSONDecode(readfile("serenium.hvh/themes/" .. name .. ".json"))
		if Decoded then
			for i, v in Decoded do
				if typeof(v) == "table" then
					if #v == 6 then
						v[2] = Enum.EasingStyle[v[2]]
						v[3] = Enum.EasingDirection[v[3]]
						Decoded[i] = TweenInfo.new(unpack(v))
					elseif #v == 3 then
						Decoded[i] = Color3.new(unpack(v))
					elseif #v == 2 then
						Decoded[i] = Enum[v[1]][v[2]]
					end
				elseif typeof(v) == "string" then
					Decoded[i] = Font.new(v)
				end
			end

			--table.foreach(Decoded, print)

			ReGui:DefineTheme(name, Decoded)
			Window:SetTheme(name)
		end
	end

	local NewRow = OptionsSection:Row()
	NewRow:Keybind({
		Label = "",
		Value = Enum.KeyCode.RightShift,
		Callback = function(_, NewKeybind)
			local IsVisible = Window.Visible
			Window:SetVisible(not IsVisible)
		end,
	})
	NewRow:Label({
		Text = "Show/Hide GUI",
	})

	OptionsSection:Separator()

	OptionsSection:Button({
		Text = "Unload Script",
		Callback = function()
			Window:Close()
		end,
	})

	OptionsSection:Button({
		Text = "View Changelogs",
		Callback = ViewChangelogs,
	})

	Create(OptionsSection, "Checkbox", {
		Label = "Keybind List",
		Value = false,
		Callback = function(self, bool)
			KeybindList:SetVisible(bool)
		end,
	}, "KeybindList", "Shows keybind list")

	if executor ~= "Velocity" then
		Create(
			OptionsSection,
			"InputText",
			{ Label = "", Placeholder = "Custom Killfeed Name", Value = "" },
			"CustomKillfeedName",
			"Your custom killfeed name",
			false,
			true
		)
		Create(
			OptionsSection,
			"Checkbox",
			{ Label = "Streamer Mode", Value = false },
			"StreamerMode",
			"Hide your information",
			true
		)
		Create(
			OptionsSection,
			"Checkbox",
			{ Label = "Hide Player Names", Value = false },
			"HidePlayerNames",
			"Hide player names",
			true
		)
		Create(OptionsSection, "Checkbox", {
			Label = "Enable background effect",
			Value = false,
			Callback = function(self, bool)
				print("")
			end,
		}, "Background", "Toggles the background snow (and watermark)")

		Create(OptionsSection, "Checkbox", {
			Label = "Hide Appearence",
			Value = false,
			Callback = function(_, State)
				if State then
					for i, v in pairs(PlayerCharacters:GetChildren()) do
						table.foreach(v:GetChildren(), function(_, child)
							if child:IsA("Shirt") then
								child:Destroy()
							end
							if child:IsA("Pants") then
								child:Destroy()
							end
							if child:IsA("Accessory") then
								child:Destroy()
							end
							if child:IsA("CharacterMesh") then
								child:Destroy()
							end
						end)
					end
				end
			end,
		}, "HideAppearence", "Hide appearences", true)
	else
		Create(OptionsSection, "Label", { Text = "Due to your executor this feature has been disabled" })
	end

	OptionsSection:Separator()

	OptionsSection:Label({ Text = "Credits:", Bold = true })
	OptionsSection:Label({ Text = "m6gh, len, vince - serenium.hvh Devs." })
	OptionsSection:Label({ Text = "depso/depthso - ReGui UI Library" })

	--// Configurations
	local ConfigCombo = ConfigSection:Combo({
		Label = "Config",
		Selected = 1,
		GetItems = function()
			return GetConfigs()
		end,
	})

	local ConfigName = ConfigSection:InputText({
		Placeholder = "Config name",
		Value = "",
		Label = "",
	})

	local ConfigRow = ConfigSection:Row()

	ConfigRow:Button({
		Text = "Load Config",
		Callback = function()
			Load(ConfigCombo.Value)
		end,
	})

	ConfigRow:Button({
		Text = "Save Config",
		Callback = function()
			Save(ConfigName.Value)
		end,
	})
	ConfigRow:Button({
		Text = "Delete Config",
		Callback = function()
			local file = "serenium.hvh/settings/" .. ConfigCombo.Value .. ".json"
			if isfile(file) then
				delfile(file)
			end
		end,
	})

	local autoLabel = ConfigSection:Label({
		Text = "Autoload: None",
		Bold = true,
	})

	ConfigSection:Row():Button({
		Text = "Set Autoload",
		Callback = function()
			saveAuto(ConfigCombo.Value)
			autoLabel.Text = "Autoload: " .. ConfigCombo.Value
		end,
	})

	ConfigSection:Row():Button({
		Text = "Remove Autoload",
		Callback = function()
			if isfile(autoFile) then
				delfile(autoFile)
			end
			autoLabel.Text = "Autoload: None"
		end,
	})

	ConfigSection:Separator({ Text = "Themes" })

	local ThemeCombo = ConfigSection:Combo({
		Label = "Theme",
		Selected = 1,
		GetItems = function()
			return GetThemes()
		end,
	})

	local ThemeName = ConfigSection:InputText({
		Placeholder = "Theme name",
		Value = "",
		Label = "",
	})

	local ThemeRow = ConfigSection:Row()

	ThemeRow:Button({
		Text = "Load Theme",
		Callback = function()
			LoadTheme(ThemeCombo.Value)
		end,
	})

	ThemeRow:Button({
		Text = "Save Theme",
		Callback = function()
			SaveTheme(ThemeName.Value)
		end,
	})
	ThemeRow:Button({
		Text = "Delete Theme",
		Callback = function()
			local file = "serenium.hvh/themes/" .. ThemeCombo.Value .. ".json"
			if isfile(file) then
				delfile(file)
			end
		end,
	})

	local autoLoaded = loadAuto()
	if autoLoaded then
		autoLabel.Text = "Autoload: " .. autoLoaded
	end

	if executor ~= "Velocity" then
		for i, v in pairs(Players:GetPlayers()) do
			v.CharacterAppearanceLoaded:Connect(function(plrChar)
				task.wait()
				if not Classes.HideAppearence.Value then
					return
				end
				repeat
					for i, v in pairs(plrChar:GetChildren()) do
						if v:IsA("Shirt") then
							v:Destroy()
						end
						if v:IsA("Pants") then
							v:Destroy()
						end
						if v:IsA("Accessory") then
							v:Destroy()
						end
						if v:IsA("CharacterMesh") then
							v:Destroy()
						end
					end
				until not plrChar:FindFirstChildOfClass("Shirt") or not plrChar:FindFirstChildOfClass("Pants")
			end)
		end
	end
end

--// Sniper 😂

local SniperStatusLabel = Create(
	Sniper,
	"Label",
	{ Text = "status: nil", TextColor = BrickColor.new(1, 1, 1) },
	"SniperStatus",
	"Shows status of sniper task"
)
Sniper:Separator({ Text = "Player Sniper" })
local PlayerSniperRegion = CreateRegion(Sniper, "")
local PlayerIdInput = Create(
	PlayerSniperRegion,
	"InputText",
	{ Label = "user", Placeholder = "Input user", Size = UDim2.new(0, 200, 0, 25) },
	"PlayerIdInput",
	"Enter the username of the player to snipe"
)
Create(PlayerSniperRegion, "Button", {
	Text = "Join player",
	Callback = function()
		local input = PlayerIdInput.Value
		local userId = tonumber(input)
		if not userId then
			local success, result = pcall(function()
				return game:GetService("Players"):GetUserIdFromNameAsync(input)
			end)
			if success then
				userId = result
			else
				SniperStatusLabel.Text = "status: invalid username (0x03)"
				return
			end
		end
		SniperStatusLabel.Text = "status: searching"
		task.spawn(function()
			local Success, InServer, _, PlaceId, JobId = Network:InvokeServer("GetPlayerPlaceInstanceInfo", userId)
			if JobId then
				local serverInfo
				local success, res = pcall(function()
					return HttpService:JSONDecode(
						HttpService:GetAsync(
							"https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
						)
					)
				end)
				if success and res and res.data then
					for _, v in pairs(res.data) do
						if v.id == JobId then
							serverInfo = v
							break
						end
					end
				end
				local msg = "status: user found, teleporting..."
				if serverInfo then
					local players = serverInfo.playing or "?"
					local maxPlayers = serverInfo.maxPlayers or "?"
					local region = serverInfo.region or "unknown"
					msg = "status: User found! Server: " .. players .. "/" .. maxPlayers .. " | Region: " .. region
				end
				SniperStatusLabel.Text = msg
				task.wait(1)
				game:GetService("TeleportService")
					:TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer, "", "=")
			else
				task.wait(0.8)
				SniperStatusLabel.Text = "status: target is not playing cw (0x01)"
			end
		end)
	end,
}, "JoinPlayerButton", "attempts to join target server")
SniperStatusLabel.Text = "status: nil"

do
	Create(MorphsTab, "Checkbox", {
		Label = "Enable spin",
		Value = MorphsData.State.SpinEnabled,
		Callback = function(self, bool)
			MorphsData.State.SpinEnabled = bool
		end,
	}, "MorphSpinCheckbox", "Spins the morph mesh")

	Create(MorphsTab, "Combo", {
		Label = "Morphs",
		Selected = MorphsData.State.Name,
		Items = MorphsData.Names,
		SizeX = 0.9,
		Callback = function(self, value)
			MorphsData.State.Name = value
		end,
	}, "MorphDropdown", "Choose a morph", false, false, false, Color3.fromRGB(87, 112, 255))

	Create(MorphsTab, "Combo", {
		Label = "Morph Material",
		Selected = MorphsData.State.Material,
		Items = MorphsData.Materials,
		SizeX = 0.9,
		Callback = function(self, value)
			MorphsData.State.Material = value
		end,
	}, "MorphMaterialDropdown", "Choose the material for the morph", false, false, false, Color3.fromRGB(87, 112, 255))

	Create(MorphsTab, "SliderProgress", {
		Label = "Morph Offset X",
		Value = MorphsData.State.OffsetX,
		Minimum = -5,
		Maximum = 5,
		Format = "%.2f",
		SizeX = 0.95,
		Callback = function(self, val)
			MorphsData.State.OffsetX = val
		end,
	}, "MorphOffsetXSlider", "Adjust morph X position")

	Create(MorphsTab, "SliderProgress", {
		Label = "Morph Offset Y",
		Value = MorphsData.State.OffsetY,
		Minimum = -5,
		Maximum = 5,
		Format = "%.2f",
		SizeX = 0.95,
		Callback = function(self, val)
			MorphsData.State.OffsetY = val
		end,
	}, "MorphOffsetYSlider", "Adjust morph Y position")

	Create(MorphsTab, "SliderProgress", {
		Label = "Morph Offset Z",
		Value = MorphsData.State.OffsetZ,
		Minimum = -5,
		Maximum = 5,
		Format = "%.2f",
		SizeX = 0.95,
		Callback = function(self, val)
			MorphsData.State.OffsetZ = val
		end,
	}, "MorphOffsetZSlider", "Adjust morph Z position")

	Create(MorphsTab, "SliderProgress", {
		Label = "Morph Rotation X",
		Value = MorphsData.State.RotationX,
		Minimum = -180,
		Maximum = 180,
		Format = "%.0f",
		SizeX = 0.95,
		Callback = function(self, val)
			MorphsData.State.RotationX = val
		end,
	}, "MorphRotationXSlider", "Adjust morph rotation X")

	Create(MorphsTab, "SliderProgress", {
		Label = "Morph Rotation Y",
		Value = MorphsData.State.RotationY,
		Minimum = -180,
		Maximum = 180,
		Format = "%.0f",
		SizeX = 0.95,
		Callback = function(self, val)
			MorphsData.State.RotationY = val
		end,
	}, "MorphRotationYSlider", "Adjust morph rotation Y")

	Create(MorphsTab, "SliderProgress", {
		Label = "Morph Rotation Z",
		Value = MorphsData.State.RotationZ,
		Minimum = -180,
		Maximum = 180,
		Format = "%.0f",
		SizeX = 0.95,
		Callback = function(self, val)
			MorphsData.State.RotationZ = val
		end,
	}, "MorphRotationZSlider", "Adjust morph rotation Z")
end

do --// Combat Section
	Framework:BindToRenderStep(
		LPH_JIT_MAX(function()
			if Classes.KillAura.Value and not KADebounce then
				local weapon, metadata = Framework:GetWeapon()
				if weapon and metadata then
					local closest = Framework:GetClosest(Classes.KillAuraRange.Value, true)
					if closest and next(closest) then
						local onCooldown = metadata._cooldownProgressTimer:getValue() < 0.75
						if not onCooldown then
							KADebounce = true

							if not Classes.PlayAnimation.Value then
								local slash = math.random(1, #metadata._itemConfig.slashMetadata)

								metadata._cooldownProgressTimer:setValue(0)
								metadata:setSlashCount(slash)
								Network:FireServer("MeleeSwing", weapon, slash)
								metadata._lastSlashTick = tick()
								weapon:SetAttribute("LastSlashTick", metadata._lastSlashTick)

								task.wait(0.1)

								for i, v in metadata.meleeHitboxes do
									for playerName, health in closest do
										local targetPlayer = Players:FindFirstChild(playerName)

										if
											targetPlayer
											and targetPlayer.Character
											and targetPlayer.Character:FindFirstChild("Head")
											and health ~= 0
											and Framework:Check(targetPlayer.Character)
										then
											local character = targetPlayer.Character
											local session = Framework:GetSessionData(targetPlayer)

											if session and not session:getState().parry.isParrying then
												local data = metadata._humanoidsAlreadyHit[character]
												if not data then
													metadata._humanoidsAlreadyHit[character] = {
														["hitDetectionStage"] = 0,
														["amountOfTimesHit"] = 0,
														["lastHitTick"] = 0,
													}
													data = metadata._humanoidsAlreadyHit[character]
												end

												Network:FireServer(
													"MeleeDamage",
													weapon,
													character.Head,
													i,
													character.Head.Position,
													character.Head.CFrame:ToObjectSpace(
														CFrame.new(character.Head.Position)
													),
													metadata._character.HumanoidRootPart.CFrame.LookVector,
													(character.Head.Position - character.Head.Position).Unit,
													Vector3.yAxis,
													tick() - metadata._lastSlashTick
												)

												data.hitDetectionStage = metadata.hitDetectionStage or 1
												data.amountOfTimesHit += 1
												data.lastHitTick = tick()

												if Classes.KillAuraType.Value == "Single Person" then
													break
												end
											end
										end
									end
									break
								end

								KADebounce = false
							else
								if metadata:getShouldSlash() then
									metadata._activateSignal:Fire()

									local anim = metadata.animations.slashes[metadata._currSlashCount]

									task.spawn(function()
										local success, response = pcall(function()
											return waitUntilTimeout(anim:GetMarkerReachedSignal("startHitDetection"), 2)
										end)

										if
											success
											and response ~= "Timed out"
											and response ~= "Wait failed"
											and response ~= "Signal creation failed"
										then
											for i, v in metadata.meleeHitboxes do
												v.HitboxStopTime = 1
												for playerName, health in closest do
													local targetPlayer = Players:FindFirstChild(playerName)

													if
														targetPlayer
														and targetPlayer.Character
														and targetPlayer.Character:FindFirstChild("Head")
														and health ~= 0
														and Framework:Check(targetPlayer.Character)
													then
														local character = targetPlayer.Character
														local data = Framework:GetSessionData(targetPlayer)

														if data and not data:getState().parry.isParrying then
															v.OnHit:Fire(character.Head, character.Humanoid, {
																Distance = 1,
																Instance = character.Head,
																Material = Enum.Material.SmoothPlastic,
																Position = character.Head.Position,
																Normal = Vector3.yAxis,
															}, character.Head.Position, character.Head.Position)

															if Classes.KillAuraType.Value == "Single Person" then
																break
															end
														end
													end
												end
											end
										end
									end)

									KADebounce = false
								else
									KADebounce = false
								end
							end
						end
					end
				end
			end
		end),
		nil,
		Enum.RenderPriority.First
	)

	local angle = 0
	local orbitCF = CFrame.new()
	local Connection
	Connection = RunService.Heartbeat:Connect(function(dt)
		if not Active then
			Connection:Disconnect()
			return
		end

		angle = (angle + dt * 10) % (2 * math.pi)
		orbitCF = CFrame.new(math.cos(angle) * Classes.TPRange.Value, 0, math.sin(angle) * Classes.TPRange.Value)
	end)

	RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
		local Type = Classes.TPType.Value
		local Character = LocalPlayer.Character
		if Character then
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")

			if HumanoidRootPart then
				local weapon = Framework:GetWeapon() or Framework:GetRanged()
				local CameraSubject
				if Character:GetAttribute("CameraSubject") then
					CameraSubject = Character:FindFirstChild(Character:GetAttribute("CameraSubject"))
				else
					CameraSubject = Character:FindFirstChildOfClass("Humanoid") or HumanoidRootPart
				end
				if weapon and (Classes.KillAura.Value or Classes.Ragebot.Value) then
					if not Classes.TPEnemy.Value then
						return
					end
					local closest = Framework:GetClosest(Classes.KillAuraRange.Value, true)
					if next(closest) then
						OnTp = false
						local targetPlayer = Players:FindFirstChild(next(closest))
						if
							targetPlayer
							and targetPlayer.Character
							and targetPlayer.Character:FindFirstChild("Head")
						then
							OnTp = true

							HumanoidRootPart.Velocity = Vector3.zero
							HumanoidRootPart.RotVelocity = Vector3.zero

							sethiddenproperty(
								HumanoidRootPart,
								"PhysicsRepRootPart",
								targetPlayer.Character.HumanoidRootPart
							)

							if Type == "Behind" then
								local lookVector = -targetPlayer.Character.HumanoidRootPart.CFrame.LookVector
								local offset = lookVector * 5 + Vector3.new(0, Classes.TPRange.Value, 0)

								HumanoidRootPart.CFrame = CFrame.new(
									targetPlayer.Character.HumanoidRootPart.Position + offset,
									targetPlayer.Character.HumanoidRootPart.Position
								)
							elseif Type == "Orbit" then
								HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position)
									* orbitCF
							elseif Type == "Above" then
								local offset = Vector3.new(0, Classes.TPRange.Value, 0)

								HumanoidRootPart.CFrame =
									CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + offset)
							elseif Type == "Below" then
								local offset = Vector3.new(0, -Classes.TPRange.Value, 0)

								HumanoidRootPart.CFrame =
									CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + offset)
							elseif Type == "Attach" then
								HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position)
							else
								local X, Y, Z = math.random(-6, 6), math.random(-3, 3), math.random(-6, 6)
								local XA, YA, ZA =
									math.random(-180, 180), math.random(-180, 180), math.random(-180, 180)
								HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position)
									* CFrame.new(X, Y, Z)
									* CFrame.Angles(math.rad(XA), math.rad(YA), math.rad(ZA))
								Camera.CameraSubject = targetPlayer.Character.HumanoidRootPart
							end

							if Type ~= "Random" then
								Camera.CameraSubject = CameraSubject
							end
						end
					else
						OnTp = false
						Camera.CameraSubject = CameraSubject
					end
				else
					OnTp = false
					Camera.CameraSubject = CameraSubject
				end

				if not weapon then
					if Classes.AutoEquip.Value then
						for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
							if v:IsA("Tool") and (v:FindFirstChild("Hitboxes") or v:GetAttribute("IsRangedWeapon")) then
								Character.Humanoid:EquipTool(v)
								break
							end
						end
					end
				end
			end
		end
	end))

	Framework:BindToRenderStep(
		LPH_JIT_MAX(function()
			if Classes.AutoStompShove.Value then
				local Character = LocalPlayer.Character
				local closest = Framework:GetClosest(Classes.StompShoveRange.Value, true)
				if Character and Character:FindFirstChild("Stomp") and closest and next(closest) then
					local metadata = Modules.Name["MeleeWeaponClient"].getObj(Character.Stomp)
					if metadata and metadata._cooldownProgressTimer:getValue() > 0.75 then
						local slashData = metadata._itemConfig.slashMetadata[metadata._currSlashCount]
						local hitbox = slashData.getHitboxInfo(metadata.tool)
						local hitboxes = metadata:getHitboxesToUseFromHitboxParts(hitbox.hitboxPartsToUse)
						for i, v in hitboxes do
							if not v.HitboxPendingRemoval then
								for playerName, health in closest do
									local targetPlayer = Players:FindFirstChild(playerName)
									local data = targetPlayer and Framework:GetSessionData(targetPlayer)
									local state = data and data:getState()

									if
										targetPlayer
										and targetPlayer.Character
										and targetPlayer.Character:FindFirstChild("Head")
										and targetPlayer.Character:FindFirstChild("Humanoid")
										and health ~= 0
										and (
											health <= 15
											or (state and state.parry.isParried)
											or targetPlayer.Character.Humanoid:GetAttribute("IsRagdolledServer")
										)
									then
										setthreadidentity(2)
										metadata:slash()
										setthreadidentity(8)

										local humanoid = targetPlayer.Character.Humanoid
										local head = targetPlayer.Character.Head

										v.OnHit:Fire(head, humanoid, {
											Distance = 1,
											Instance = head,
											Material = Enum.Material.SmoothPlastic,
											Position = head.Position,
											Normal = Vector3.yAxis,
										}, head.Position, head.Position)
									end
								end
								break
							end
						end
					end
				end
			end
		end),
		nil,
		Enum.RenderPriority.Character
	)

	task.spawn(LPH_NO_VIRTUALIZE(function()
		while RunService.RenderStepped:Wait() do
			if Classes.AutoGlory.Value then
				task.wait(Classes.GloryDelay.Value)

				local closest = Framework:GetClosest(Classes.GloryRange.Value, true)
				local tool = Framework:GetWeapon()

				if tool and closest and next(closest) then
					local targetPlayer = Players:FindFirstChild(next(closest))
					if
						targetPlayer
						and targetPlayer.Character
						and targetPlayer.Character:FindFirstChild("Humanoid")
						and targetPlayer.Character.Humanoid.Health <= 20
					then
						Network:FireServer("StartGloryKill", tool, targetPlayer.Character, CFrame.new(), Vector3.new())
					end
				end
			end
		end
	end))
end

do -- Aimbot
	local Holding = false
	local HoldingCTRL = false
	local CurrentTarget

	local Began
	Began = UserInputService.InputBegan:Connect(function(Key, Process)
		if not Active then
			Began:Disconnect()
			return
		end

		if Key.KeyCode == Enum.KeyCode.LeftAlt then
			HoldingCTRL = true
		end

		if
			Classes.AttemptKillKey.Value
			and HoldingCTRL
			and (
				Key.KeyCode == Classes.AttemptKillKeyKeybind.Value
				or Key.UserInputType == Classes.AttemptKillKeyKeybind.Value
			)
		then
			local HitPart = Mouse.Target
			local Character = HitPart and HitPart:FindFirstAncestorOfClass("Model")
			local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
			if HitPart and Character and Humanoid then
				local LocalCharacter = LocalPlayer.Character
				if not Character then
					return
				end
				local HumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
				if not HumanoidRootPart then
					return
				end

				if CanFireStartFallDamage then
					CanFireStartFallDamage = false
					HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, 1000, 0)

					task.wait(0.25)

					Network:FireServer("StartFallDamage")
					HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + Vector3.new(0, -1000, 0)
				end

				Framework:Teleport(Character.HumanoidRootPart.CFrame)

				task.wait(0.2)

				local Desync = true
				task.spawn(function()
					repeat
						RunService.Heartbeat:Wait()
						local vel, movel = nil, 0.1
						vel = HumanoidRootPart.Velocity
						HumanoidRootPart.Velocity = vel * 100000 + Vector3.new(0, 100000, 0)
						RunService.RenderStepped:Wait()
						HumanoidRootPart.Velocity = vel
						RunService.Stepped:Wait()
						HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
						movel = movel * -1
					until not Desync or not HumanoidRootPart.Parent
				end)

				task.wait(0.2)

				HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame

				task.wait(0.2)

				for i = 1, 10 do
					HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame
					Network:FireServer("TakeFallDamage", 75, Vector3.new(0, -1, 0), HumanoidRootPart.Position)
					task.wait()
				end

				task.wait(1)

				Desync = false
				CanFireStartFallDamage = true
			end
		end

		if
			Classes.Aimbot.Value
			and (Key.KeyCode == Classes.AimbotKeybind.Value or Key.UserInputType == Classes.AimbotKeybind.Value)
		then
			local Target = Framework:GetClosestToMouse(Classes.FOVSizeAimbot.Value)
			if Classes.Hold.Value then
				Holding = true
				CurrentTarget = Target
			else
				if CurrentTarget then
					CurrentTarget = nil
				else
					CurrentTarget = Target
				end
			end
		end
	end)

	local Ended
	Ended = UserInputService.InputEnded:Connect(function(Key, Process)
		if not Active then
			Ended:Disconnect()
			return
		end

		if Key.KeyCode == Enum.KeyCode.LeftAlt then
			HoldingCTRL = false
		end

		if
			Classes.Aimbot.Value
			and (Key.KeyCode == Classes.AimbotKeybind.Value or Key.UserInputType == Classes.AimbotKeybind.Value)
		then
			if Classes.Hold.Value then
				Holding = false
				CurrentTarget = nil
			end
		end
	end)

	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			if not Classes.Aimbot.Value then
				CurrentTarget = nil
			end
			if Classes.Hold.Value and not Holding then
				CurrentTarget = nil
			end

			if CurrentTarget and not Framework:InMenu(CurrentTarget) then
				local Character = CurrentTarget.Character
				if Character then
					local HitPart = Character:FindFirstChild(Classes.AimbotHitPart.Value)
					if HitPart then
						if Classes.ShowTargetAB.Value then
							ShowInformation(CurrentTarget)
							AimbotHighlight.Adornee = Character
						end

						local Ranged, Metadata = Framework:GetRanged()

						local FinalPos
						if not Classes.Prediction.Value then
							FinalPos = HitPart.Position
						else
							if Ranged and Metadata then
								local cheatedOrigin =
									Metadata:getCheatedBackOriginIfInObject(Metadata._mainCasterBehavior.RaycastParams)
								local projectileSpeed = Metadata._itemConfig.speed or 200
								local projectileGravity = Metadata._itemConfig.gravity or Vector3.new(0, 0, 0)

								if cheatedOrigin or projectileSpeed or projectileGravity then
									FinalPos = PredictTargetPosition(
										cheatedOrigin,
										{ Position = HitPart.Position, Velocity = HitPart.Velocity },
										projectileSpeed,
										LocalPlayer:GetNetworkPing() * 1000,
										projectileGravity
									)
								end
							end
						end
						Camera.CFrame = Camera.CFrame:lerp(
							CFrame.lookAt(Camera.CFrame.Position, FinalPos or HitPart.Position),
							Classes.Smooth.Value and 0.1 or 1
						)
					else
						ShowInformation(nil)
						CurrentTarget = nil
					end
				else
					ShowInformation(nil)
					CurrentTarget = nil
				end
			else
				ShowInformation(nil)
				CurrentTarget = nil
			end
		end),
		nil,
		Enum.RenderPriority.Camera
	)
end

do -- Silent Aim
	setthreadidentity(2)
	local ActiveCast = require(ReplicatedStorage.Shared.Vendor.FastCast.ActiveCast)
	setthreadidentity(7)

	local cache = {}
	local chanceCache = {}
	local currentSilentAimTarget = nil
	local OldSimulateCast = getupvalue(ActiveCast.new, 6)
	local OldCalculateFire = Modules.Name["RangedWeaponHandler"].calculateFireDirection
	function newSimulate(...)
		local args = { ... }
		local caster = args[1]

		pcall(LPH_JIT_MAX(function()
			local weapon, metadata = Framework:GetRanged()

			local Chance = Framework:Chance(Classes.HitChance.Value)
			if not Chance then
				table.insert(chanceCache, caster)
			end

			if
				not table.find(chanceCache, caster)
				and Chance
				and caster
				and caster.UserData
				and caster.StateInfo
				and caster.UserData.tool == weapon
				and (Classes.SilentAim.Value or Classes.Ragebot.Value)
				and weapon
				and metadata
			then
				local Player = Framework:GetClosestCharacterToOrigin(caster:GetPosition(), 19)
				if Classes.ClosestType.Value == "Only Redirect To Target" then
					Player = nil
					local Characters = Framework:GetClosestCharactersToOrigin(caster:GetPosition(), 19)
					if table.find(Characters, currentSilentAimTarget) then
						Player = currentSilentAimTarget
					end
				end
				local MouseClosest = Framework:GetClosestToMouse(Classes.FOVSize.Value)

				if Player then
					local Head = Player:FindFirstChild("Head")
					local Character = LocalPlayer.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
					if Classes.Ragebot.Value and Head and HumanoidRootPart then
						DbgWarn("Hitting guy", Player.Name, (Head.Position - caster:GetPosition()).Magnitude)
						DbgWarn("Attempting hit")

						if Classes.ShowLine.Value then
							local part = Instance.new("Part")
							part.Anchored = true
							part.CanCollide = false
							part.Material = Enum.Material.Neon
							part.Color = Colors.ShowLine
							part.Size = Vector3.new(0.1, 0.1, (Head.Position - HumanoidRootPart.Position).Magnitude)
							part.CFrame = CFrame.new(HumanoidRootPart.Position, Head.Position)
								* CFrame.new(0, 0, -part.Size.Z / 2)
							part.Transparency = 0
							part.Parent = workspace

							task.spawn(function()
								local fadeTime = 2
								local steps = 30
								for i = 1, steps do
									part.Transparency = i / steps
									task.wait(fadeTime / steps)
								end
								part:Destroy()
							end)
						end

						caster.Caster.RayHit:Fire(caster, {
							Distance = 1,
							Instance = Head,
							Material = Enum.Material.SmoothPlastic,
							Position = Head.Position,
							Normal = Vector3.yAxis,
						}, nil, caster.RayInfo.CosmeticBulletObject)

						caster:Terminate()
					end
				end

				if Classes.SilentAim.Value then
					if Classes.ClosestType.Value == "Closest To Mouse" then
						if MouseClosest then
							local PlayerChar = MouseClosest.Character
							if PlayerChar then
								local HitPart = PlayerChar:FindFirstChild(
									Classes.SilentHitPart.Value == "Random"
											and R6BodyParts[math.random(1, #R6BodyParts)]
										or Classes.SilentHitPart.Value
								)
								if
									HitPart
									and (HitPart.Position - caster:GetPosition()).Magnitude
										<= Classes.SilentAimRange.Value
								then
									local Vel = (HitPart.Position - caster:GetPosition()).Unit * 3000
									caster:SetVelocity(Vel)
								end
							end
						end
					elseif
						Classes.ClosestType.Value == "Closest To Arrow"
						or Classes.ClosestType.Value == "Only Redirect To Target"
					then
						if Player then
							local HitPart = Player:FindFirstChild(
								Classes.SilentHitPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)]
									or Classes.SilentHitPart.Value
							)
							if
								HitPart
								and (HitPart.Position - caster:GetPosition()).Magnitude
									<= Classes.SilentAimRange.Value
							then
								local Vel = (HitPart.Position - caster:GetPosition()).Unit * 3000
								caster:SetVelocity(Vel)
							end
						end
					end
				end

				if Classes.ShowArrow.Value and caster.SetStaticFastCastReference and not cache[caster] then
					table.insert(cache, caster)
					caster.SetStaticFastCastReference({
						DebugLogging = false,
						VisualizeCasts = true,
					})
				end
			end
		end))

		if caster and caster.UserData and caster.StateInfo then
			return OldSimulateCast(...)
		end

		return
	end

	function newCalculateFire(...)
		local args = { ... }
		local target = Framework:GetClosestToMouse(Classes.FOVSize.Value)
		local ranged, metadata = Framework:GetRanged()

		if
			Classes.SilentAim.Value
			and target
			and ranged
			and metadata
			and Framework:Chance(Classes.HitChance.Value)
			and not Framework:InMenu(target)
		then
			if Classes.ShowTargetSA.Value then
				setthreadidentity(7)
				ShowInformation(target)
				SilentAimHighlight.Adornee = target.Character
				setthreadidentity(2)
			end

			local hitPart = target.Character:FindFirstChild(Classes.SilentHitPart.Value)
			local humanoid = target.Character:FindFirstChildOfClass("Humanoid")
			if hitPart and humanoid then
				local cheatedOrigin =
					metadata:getCheatedBackOriginIfInObject(metadata._mainCasterBehavior.RaycastParams)
				local projectileSpeed = metadata._itemConfig.speed or 200
				local projectileGravity = metadata._itemConfig.gravity or Vector3.new(0, 0, 0)

				if cheatedOrigin and projectileSpeed and projectileGravity then
					currentSilentAimTarget = target.Character
					local predictedPos = PredictTargetPosition(cheatedOrigin, {
						Position = hitPart.Position,
						Velocity = (Classes.Resolver.Value and humanoid.MoveDirection or hitPart.Velocity),
					}, projectileSpeed, LocalPlayer:GetNetworkPing() * 1000, projectileGravity)
					args[1] = CFrame.lookAt(Vector3.new(), (predictedPos - cheatedOrigin).Unit)
				end
			end
		else
			ShowInformation(nil)
		end

		return OldCalculateFire(unpack(args))
	end

	setupvalue(ActiveCast.new, 6, function(...)
		return newSimulate(...)
	end)

	Modules.Name["RangedWeaponHandler"].calculateFireDirection = newCalculateFire

	local VisualizerFolder = Instance.new("Folder", Workspace.Terrain)
	VisualizerFolder.Name = "FastCastVisualizationObjects"
	VisualizerFolder.ChildAdded:Connect(function(child)
		task.wait()
		Debris:AddItem(child, 0.7)
	end)

	task.spawn(LPH_NO_VIRTUALIZE(function() -- Desync
		while true do
			RunService.Heartbeat:Wait()

			if not Active then
				RunService.Heartbeat:Wait()
				break
			end
			if not Classes.Desync.Value then
				RunService.Heartbeat:Wait()
				continue
			end
			local Character = LocalPlayer.Character
			if not Character then
				RunService.Heartbeat:Wait()
				continue
			end
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
			if not HumanoidRootPart then
				RunService.Heartbeat:Wait()
				continue
			end

			local vel, movel = nil, 0.1

			vel = HumanoidRootPart.Velocity
			HumanoidRootPart.Velocity =
				Vector3.new(math.random(-1500, 1500), math.random(-300, 300), math.random(-1500, 1500))

			RunService.RenderStepped:Wait()
			if Character and Character.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
				HumanoidRootPart.Velocity = vel
			end

			RunService.Stepped:Wait()
			if Character and Character.Parent and HumanoidRootPart and HumanoidRootPart.Parent then
				HumanoidRootPart.Velocity = vel + Vector3.new(0, movel, 0)
				movel = movel * -1
			end
		end
	end))

	task.spawn(LPH_JIT_MAX(function()
		while task.wait() do
			if not Active then
				break
			end

			if not Classes.Ragebot.Value then
				continue
			end

			local Character = LocalPlayer.Character
			if not Character then
				continue
			end

			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
			if not HumanoidRootPart then
				continue
			end

			local forcefield = Character:FindFirstChildOfClass("ForceField")
			if forcefield and forcefield.Name ~= "ff" then
				continue
			end

			local ranged, metadata = Framework:GetRanged()
			if not ranged or not metadata then
				continue
			end

			local player = LockedTarget or Framework:GetClosest2(Classes.RagebotDist.Value)

			if LockedTarget and not next(LockedTarget) then
				LockedTarget = nil
				DbgWarn("Deleted current target 3")
				continue
			end

			if not player or not next(player) then
				continue
			end

			if metadata.canShootBulletssss == nil then
				metadata.canShootBulletssss = true
			end

			if metadata._clientAmmoVO.Value <= 0 then -- auto reload heh
				Network:FireServer("StartRangedReload", ranged)
				task.wait(metadata._itemConfig.reloadTime - 0.2)
				if ranged then
					pcall(function()
						local reloaded, _ = Network:InvokeServer("FinishedRangedReload", ranged)
						if reloaded then
							metadata._clientAmmoVO.Value = metadata._itemConfig.maxAmmo
							metadata.canShootBulletssss = true
						end
					end)
				end
				continue
			end

			if not metadata.canShootBulletssss then
				if metadata._itemConfig.maxAmmo == 1 then
					metadata.canShootBulletssss = true
				else
					continue
				end
			end

			if not metadata._mainCasterBehavior or not metadata._mainCaster then
				continue
			end

			local targetPlayer = Players:FindFirstChild(next(player))
			if not targetPlayer or not targetPlayer.Character then
				continue
			end

			local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
			if not targetHumanoid or targetHumanoid.Health == 0 then
				LockedTarget = nil
				DbgWarn("Deleted current target 1")
				continue
			end

			if Framework:InMenu(targetPlayer) then
				LockedTarget = nil
				DbgWarn("Deleted current target 4")
				continue
			end

			local Head = targetPlayer.Character:FindFirstChild("Head")
			if not Head or targetPlayer.Character:FindFirstChildOfClass("ForceField") then
				LockedTarget = nil
				DbgWarn("Deleted current target 2")
				continue
			end

			DbgWarn(tostring(metadata.canShootBulletssss))
			DbgWarn("Firing!")

			metadata.canShootBulletssss = false

			if Classes.ShowRageBotTarget.Value then
				ShowInformation(targetPlayer)
				RagebotHighlight.Adornee = targetPlayer.Character
			end

			LockedTarget = player

			metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances = { -- this what caused the issues
				metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances,
				PlayerCharacters,
				Map,
				Workspace.Terrain,
			}

			local origin = metadata:getCheatedBackOriginIfInObject(metadata._mainCasterBehavior.RaycastParams)
			local projectileSpeed = metadata._itemConfig.speed or 200
			local projectileGravity = metadata._itemConfig.gravity or Vector3.new(0, 0, 0)

			local finalPos = PredictTargetPosition(
				origin,
				{ Position = Head.Position, Velocity = Head.Velocity },
				projectileSpeed,
				LocalPlayer:GetNetworkPing() * 1000,
				projectileGravity
			)

			local CF = CFrame.new(Vector3.new(), (finalPos - origin).Unit)
			local dir = OldCalculateFire(CF, 0, 0, 5000)

			local fakeBehavior = {
				RaycastParams = metadata._mainCasterBehavior.RaycastParams,
				Acceleration = Vector3.new(),
				MaxDistance = 5000,
				HighFidelityBehavior = 1,
				HighFidelitySegmentSize = 0.5,
				CosmeticBulletContainer = EffectsJunk,
				AutoIgnoreContainer = true,
			}

			local template = metadata._cosmeticProjectileTemplate
			if typeof(fakeBehavior) == "Instance" then
				fakeBehavior.CosmeticBulletProvider = nil
				fakeBehavior.CosmeticBulletTemplate = template
			else
				fakeBehavior.CosmeticBulletProvider = template
				fakeBehavior.CosmeticBulletTemplate = nil
			end

			local cast = metadata._mainCaster:Fire(origin, dir, projectileSpeed, fakeBehavior)
			metadata._cheatId = metadata._cheatId and metadata._cheatId + 1 or 1
			cast.UserData = {
				["player"] = LocalPlayer,
				["tool"] = ranged,
				["shotId"] = tostring(metadata._cheatId),
				["origin"] = origin,
			}

			Network:FireServer("RangedFire", ranged, origin, {
				[tostring(metadata._cheatId)] = dir.Unit,
			}, {
				[tostring(metadata._cheatId)] = dir,
			}, {
				[1] = tostring(metadata._cheatId),
			}, nil, Camera.CFrame, Workspace:GetServerTimeNow())

			metadata._clientAmmoVO.Value = metadata._clientAmmoVO.Value - 1

			local distance = (origin - Head.Position).Magnitude
			local timeToHit = distance / projectileSpeed

			DbgWarn("Takes:", timeToHit)

			if not (ranged.Name == "Longbow" or ranged.Name == "Crossbow" or ranged.Name == "Heavy Bow") then
				task.delay(timeToHit + 0.08, function()
					if cast.UserData and cast.StateInfo and cast.StateInfo.UpdateConnection then
						if Classes.ShowLine.Value then
							local part = Instance.new("Part")
							part.Anchored = true
							part.CanCollide = false
							part.Material = Enum.Material.Neon
							part.Color = Colors.ShowLine
							part.Size = Vector3.new(0.1, 0.1, (Head.Position - HumanoidRootPart.Position).Magnitude)
							part.CFrame = CFrame.new(HumanoidRootPart.Position, Head.Position)
								* CFrame.new(0, 0, -part.Size.Z / 2)
							part.Transparency = 0
							part.Parent = workspace

							task.spawn(function()
								local fadeTime = 2
								local steps = 30
								for i = 1, steps do
									part.Transparency = i / steps
									task.wait(fadeTime / steps)
								end
								part:Destroy()
							end)
						end

						metadata._mainCaster.RayHit:Fire(cast, {
							Distance = 1,
							Instance = Head,
							Material = Enum.Material.SmoothPlastic,
							Position = Head.Position,
							Normal = Vector3.yAxis,
						}, nil, cast.RayInfo.CosmeticBulletObject)

						cast:Terminate()
					end
				end)
			end

			DbgWarn("CD Takes:", metadata._itemConfig.cooldown)
			task.wait(metadata._itemConfig.cooldown)

			if metadata._clientAmmoVO.Value <= 0 then
				Network:FireServer("StartRangedReload", ranged)
				task.wait(metadata._itemConfig.reloadTime - 0.2)

				if ranged then
					pcall(function()
						local reloaded, _ = Network:InvokeServer("FinishedRangedReload", ranged)
						if reloaded then
							metadata._clientAmmoVO.Value = metadata._itemConfig.maxAmmo
						end
					end)
				end
			end

			metadata.canShootBulletssss = true
		end
	end))

	local Line = Drawing.new("Line")
	Line.Color = Colors.ShowTargetSA or Color3.new(1, 1, 1)
	Line.Thickness = 1
	Line.Visible = false
	Line.From = UserInputService:GetMouseLocation()

	local Line2 = Drawing.new("Line")
	Line2.Color = Colors.ShowTargetAB or Color3.new(1, 1, 1)
	Line2.Thickness = 1
	Line2.Visible = false
	Line2.From = UserInputService:GetMouseLocation()

	local Inset, _ = game:GetService("GuiService"):GetGuiInset()

	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			if Classes.ShowTargetSA.Value or Classes.ShowTargetAB.Value then
				local MouseLocation = UserInputService:GetMouseLocation()

				Line.Color = Colors.ShowTargetSA or Color3.new(1, 1, 1)
				Line2.Color = Colors.ShowTargetAB or Color3.new(1, 1, 1)

				Line.From = MouseLocation
				Line2.From = MouseLocation

				local target = Framework:GetClosestToMouse(Classes.FOVSize.Value)
				local target2 = Framework:GetClosestToMouse(Classes.FOVSizeAimbot.Value)

				if target and not Framework:InMenu(target) and Classes.ShowTargetSA.Value then
					local Root = target.Character:FindFirstChild("HumanoidRootPart")
					if Root then
						ShowInformation(target)

						Line.Visible = true

						local position, onScreen = Camera:WorldToScreenPoint(Root.Position)
						if onScreen then
							Line.To = Vector2.new(position.X, position.Y + Inset.Y)
						end
					else
						ShowInformation(nil)
						Line.Visible = false
					end
				else
					ShowInformation(nil)
					Line.Visible = false
				end

				if target2 and not Framework:InMenu(target2) and Classes.ShowTargetAB.Value then
					local Root = target2.Character:FindFirstChild("HumanoidRootPart")
					if Root then
						ShowInformation(target2)

						Line2.Visible = true

						local position, onScreen = Camera:WorldToScreenPoint(Root.Position)
						if onScreen then
							Line2.To = Vector2.new(position.X, position.Y + Inset.Y)
						end
					else
						ShowInformation(nil)
						Line2.Visible = false
					end
				else
					ShowInformation(nil)
					Line2.Visible = false
				end
			else
				Line.Visible = Classes.ShowTargetSA.Value
				Line2.Visible = Classes.ShowTargetAB.Value
			end
		end),
		nil,
		Enum.RenderPriority.Camera
	)
end

do --// Combat Modifications
	setthreadidentity(2)
	local Hitboxes = require(ReplicatedStorage.Shared.Vendor.RaycastHitbox.HitboxCaster)
	setthreadidentity(7)

	function getHitboxes()
		return getupvalue(Hitboxes._FindHitbox, 1)
	end

	local AlreadySet = {}
	local Cache = {}
	local Connections = {}

	local DeathPosition = CFrame.new()

	local function OnNewCharacter(Character)
		KADebounce = false
		LockedTarget = nil

		local Session = Framework:GetSessionData()
		local State = Session:getState()
		State.fallDamageClient.isDisabled = Classes.NFD.Value

		local Humanoid = Character:WaitForChild("Humanoid")
		local Animator = Humanoid:WaitForChild("Animator")

		table.insert(
			Connections,
			Humanoid.Died:Connect(function()
				DeathPosition = CFrame.new(Humanoid.RootPart.Position)
			end)
		)

		table.insert(
			Connections,
			Character.ChildAdded:Connect(function(ParryShield)
				if Classes.DTP.Value and ParryShield:GetAttribute("ParryShieldId") then
					task.wait()
					Framework:Teleport(DeathPosition or CFrame.new())
				end
			end)
		)

		table.insert(
			Connections,
			Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
				if Humanoid.JumpPower == 0 then
					Humanoid.JumpPower = 50
				end
			end)
		)

		table.insert(
			Connections,
			Character.ChildAdded:Connect(function(Tool)
				if Classes.HitEffect.Value ~= "None" and Tool:IsA("Tool") and not table.find(Cache, Tool) then
					local _, Metadata = Framework:GetRanged()
					if Metadata then
						table.insert(Cache, Tool)

						Metadata._mainCaster.RayHit:Connect(function(caster, raycast, _, cosmeticBullet)
							local Effects = EffectHolder:Clone()
							local EffectName = Classes.HitEffect.Value
							Effects.CFrame = CFrame.new(0, 0, 0)
								* CFrame.lookAt(raycast.Position, raycast.Position + raycast.Normal)
								* CFrame.Angles(math.rad(90), 0, 0)
							Effects.Parent = EffectsJunk
							Effects[EffectName].Parent = Effects.Attachment
							for i, v in ipairs(Effects.Attachment[EffectName]:GetChildren()) do
								v.Color = ColorSequence.new(Colors["HitEffect"] or Color3.new(1, 1, 1))
								v.Emit(v, 1)
							end
							Effects.Attachment[EffectName].Parent = Effects
							task.delay(3, function()
								Effects:Destroy()
							end)
						end)
					end
				end
			end)
		)

		OnNewCharacter(LocalPlayer.Character)
		LocalPlayer.CharacterAdded:Connect(OnNewCharacter)

		local Agent = PathfindingService:CreatePath({
			AgentRadius = 0,
			AgentHeight = 5,
			AgentCanJump = true,
		})

		Framework:BindToRenderStep(
			LPH_JIT_MAX(function()
				if LocalPlayer.Character then
					local hitboxes = getHitboxes()
					if hitboxes and next(hitboxes) and Classes.AlwaysHit.Value then
						for i, v in hitboxes do
							if not AlreadySet[v] then
								AlreadySet[v] = true

								table.insert(
									Connections,
									v.OnUpdate:Connect(function()
										v.HitboxStopTime = 1

										local closest = Framework:GetClosest(Classes.AlwaysHitRange.Value, true)
										if not closest or not next(closest) then
											return
										end

										for player, h in pairs(closest) do
											local target = Players:FindFirstChild(player)

											if
												target
												and target.Character
												and target.Character:FindFirstChildOfClass("Humanoid")
											then
												local char = target.Character
												local bodyPart = char:FindFirstChild(Classes.AlwaysHitPart.Value)

												if bodyPart then
													v.OnHit:Fire(bodyPart, char.Humanoid, {
														Distance = 1,
														Instance = bodyPart,
														Material = Enum.Material.SmoothPlastic,
														Position = bodyPart.Position,
														Normal = Vector3.yAxis,
													}, bodyPart.Position, bodyPart.Position)
												end
											end
										end
									end)
								)
							end
						end
					end
				else
					for i, v in Connections do
						v:Disconnect()
					end

					table.clear(Connections)

					if next(AlreadySet) then
						table.clear(AlreadySet)
					end
				end
			end),
			nil,
			Enum.RenderPriority.Character
		)

		RunService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
			if Classes.Pathfind.Value then
				local Character = LocalPlayer.Character
				if not Character then
					return
				end
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				if not HumanoidRootPart then
					return
				end
				local forcefield = Character:FindFirstChildOfClass("ForceField")
				if forcefield and forcefield.Name ~= "ff" then
					return
				end

				local closest = Framework:GetClosest(1000, true)

				if not closest or not next(closest) then
					return
				end

				HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
				HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
			end
		end))

		local Finished = true
		Framework:BindToRenderStep(
			LPH_JIT_MAX(function()
				if Classes.Pathfind.Value then
					if Finished and (not GrenadeNear or not OnTp or not ClaimingAirdrop) then
						local Character = LocalPlayer.Character
						local forcefield = Character and Character:FindFirstChildOfClass("ForceField")
						if Character and (not forcefield or not (forcefield and forcefield.Name ~= "ff")) then
							local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
							if HumanoidRootPart then
								local weapon = Framework:GetWeapon() or Framework:GetRanged()
								local closest = Framework:GetClosest(1000, false)
								if weapon and closest and next(closest) then
									Finished = false

									for player, h in pairs(closest) do
										local target = Players:FindFirstChild(player)
										if
											target
											and target.Character
											and target.Character:FindFirstChildOfClass("Humanoid")
											and target.Character.Humanoid.Health ~= 0
										then
											local twen
											local twen2
											repeat
												RunService.RenderStepped:Wait()
												local Success, _ = pcall(function()
													Agent:ComputeAsync(
														HumanoidRootPart.Position,
														target.Character.Humanoid.RootPart.Position
													)
												end)
												if Success and Agent.Status == Enum.PathStatus.Success then
													local Waypoints = Agent:GetWaypoints()
													if not next(Waypoints) then
														local speed = (
															HumanoidRootPart.Position
															- target.Character.Humanoid.RootPart.Position
														).Magnitude / Classes.PFSpeed.Value
														local tween = TweenService:Create(
															HumanoidRootPart,
															TweenInfo.new(
																speed,
																Enum.EasingStyle.Linear,
																Enum.EasingDirection.InOut
															),
															{
																Position = target.Character.Humanoid.RootPart.Position
																	+ Vector3.new(0, 6, 0),
															}
														)
														tween:Play()
													else
														for i, v in Waypoints do
															if Waypoints[i - 1] then
																if OnTp or GrenadeNear or ClaimingAirdrop then
																	break
																end
																if
																	not Character:IsDescendantOf(game)
																	or not target
																	or not target.Character
																	or not target.Character:IsDescendantOf(game)
																	or not target.Character:FindFirstChildOfClass(
																		"Humanoid"
																	)
																	or target.Character.Humanoid.Health == 0
																then
																	break
																end
																local speed = (Waypoints[i - 1].Position - v.Position).Magnitude
																	/ Classes.PFSpeed.Value
																local tween = TweenService:Create(
																	HumanoidRootPart,
																	TweenInfo.new(
																		speed,
																		Enum.EasingStyle.Linear,
																		Enum.EasingDirection.InOut
																	),
																	{ Position = v.Position + Vector3.new(0, 6, 0) }
																)
																twen = tween
																tween:Play()
																tween.Completed:Wait()
															end
														end
													end
												else
													local speed = (
														HumanoidRootPart.Position
														- target.Character.Humanoid.RootPart.Position
													).Magnitude / Classes.PFSpeed.Value
													local tween = TweenService:Create(
														HumanoidRootPart,
														TweenInfo.new(
															speed,
															Enum.EasingStyle.Linear,
															Enum.EasingDirection.InOut
														),
														{
															Position = target.Character.Humanoid.RootPart.Position
																+ Vector3.new(0, 6, 0),
														}
													)
													tween:Play()
													twen2 = tween
													if twen then
														twen:Pause()
													end
													break
												end
												RunService.RenderStepped:Wait()
											until not Character:IsDescendantOf(game)
												or not target
												or not target.Character
												or not target.Character:IsDescendantOf(game)
												or not target.Character:FindFirstChildOfClass("Humanoid")
												or target.Character.Humanoid.Health == 0
												or OnTp
												or ClaimingAirdrop
											if twen then
												twen:Pause()
											end
											if twen2 then
												twen2:Pause()
											end
											break
										end
									end

									Finished = true
								end
							end
						end
					end
				end
			end),
			nil,
			Enum.RenderPriority.Last
		)
	end
end

do --// Parry Things
	local blacklist = {
		"rbxassetid://106649093705106",
		"rbxassetid://6423003415",
		"rbxassetid://101463478179793",
	}

	function Parry(metadata)
		local apdelay = math.round(Classes.APDelay.Value)
		if apdelay > 0 then
			task.wait(apdelay)
		end

		if Classes.APType.Value == "Remote" then
			Network:FireServer("Parry")
		else
			keypress(0x46)
			keyrelease(0x46)
		end
	end

	local scraped = {}
	function getevent(animID)
		if scraped[animID] then
			return scraped[animID]
		end
		local markers = {}
		local ks
		local s, _ = pcall(function()
			ks = KeyframeSequenceProvider:GetKeyframeSequenceAsync(animID)
		end)
		if s and ks then
			local function recurse(parent)
				for _, child in pairs(parent:GetChildren()) do
					if child:IsA("KeyframeMarker") then
						local kf = child:FindFirstAncestor("Keyframe")
						if kf then
							markers[child.Name] = kf.Time
						end
					end
					if #child:GetChildren() > 0 then
						recurse(child)
					end
				end
			end
			recurse(ks)
			scraped[animID] = markers
			return markers
		end
		return
	end

	local HumanoidToParry = {}
	for i, v in pairs(PlayerCharacters:GetChildren()) do
		if v ~= LocalPlayer.Character and v:FindFirstChildOfClass("Humanoid") then
			local humanoid = v:FindFirstChildOfClass("Humanoid")

			table.insert(HumanoidToParry, humanoid)
		end
	end

	PlayerCharacters.ChildAdded:Connect(function(char)
		if char ~= LocalPlayer.Character and char:FindFirstChildOfClass("Humanoid") then
			local humanoid = char:FindFirstChildOfClass("Humanoid")

			table.insert(HumanoidToParry, humanoid)
		end
	end)

	local playSoundOld = Modules.Name["SoundHandler"].playSound
	Modules.Name["SoundHandler"].playSound = function(sound)
		if
			Classes.AutoParry.Value
			and Classes.APCheck.Value == "Sounds"
			and typeof(sound.parent) == "Instance"
			and sound.parent
			and sound.parent.Parent
			and sound.parent.Parent.Parent
			and sound.parent.Parent.Parent.Parent
			and sound.parent.Name:match("Hitbox")
			and sound.parent:FindFirstAncestorOfClass("Tool")
		then
			local Weapon, Metadata = Framework:GetWeapon()
			local Other = sound.parent.Parent.Parent.Parent
			local OtherRoot = Other and Other:FindFirstChild("HumanoidRootPart")
			if Weapon and Metadata and Other and OtherRoot then
				if
					Other ~= LocalPlayer.Character
					and Framework:IsPartClose(OtherRoot, Classes.APRange.Value)
					and Framework:Chance(Classes.RandomChance.Value and math.random(1, 100) or Classes.APChance.Value)
				then
					local CanParry = false
					if Classes.LookCheck.Value then
						local BadPlrPos = Other:GetPivot().Position
						local BadPlrDirection = (BadPlrPos - LocalPlayer.Character.Head.Position).Unit
						local ToCheck = LocalPlayer.Character.Head.CFrame.LookVector

						if math.deg(math.acos(BadPlrDirection:Dot(ToCheck))) <= Classes.APAngle.Value then
							CanParry = true
						end
					else
						CanParry = true
					end

					if CanParry then
						task.spawn(Parry, Metadata)
					end
				end
			end
		end

		if sound.soundObject and sound.soundObject.Name == "Parry" and typeof(sound.parent) == "Instance" then
			local parryShield = sound.parent:FindFirstAncestorOfClass("Model")
			local Character = parryShield.Parent

			if parryShield and parryShield:GetAttribute("ParryShieldId") and Character then
				table.insert(ParryingCharacters, Character)

				task.delay(Modules.Name["ParryConstants"].PARRY_DURATION_IN_SECONDS, function()
					table.remove(ParryingCharacters, table.find(ParryingCharacters, Character))
				end)
			end
		end

		return playSoundOld(sound)
	end

	Framework:BindToRenderStep(
		LPH_JIT_MAX(function() -- I took this from my Balthazar script lol
			if not Classes.AutoParry.Value then
				return
			end
			if Classes.APCheck.Value == "Sounds" then
				return
			end

			local Character = LocalPlayer.Character
			if Character then
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				if HumanoidRootPart then
					local tool, metadata = Framework:GetWeapon()

					if tool and metadata then
						for _, humanoid in pairs(HumanoidToParry) do
							local rootPart = humanoid.RootPart
							if rootPart then
								local Distance = (HumanoidRootPart.Position - rootPart.Position).Magnitude
								if Distance <= Classes.APRange.Value then
									local Animations = humanoid.Animator:GetPlayingAnimationTracks()
									for _, anim in pairs(Animations) do
										if table.find(blacklist, anim.Animation.AnimationId) then
											continue
										end
										if anim.Animation.Name:find("^Finish%w*") then
											continue
										end
										local markers = getevent(anim.Animation.AnimationId)
										if not markers then
											continue
										end

										for i, v in pairs(markers) do
											if i == "startHitDetection" then
												if
													(
														anim.TimePosition
															>= math.clamp(v - Classes.Threshold.Value, 0, math.huge)
														and not (anim.TimePosition > v)
													)
													and Framework:Chance(
														Classes.RandomChance.Value and math.random(1, 100)
															or Classes.APChance.Value
													)
												then
													local CanParry = false
													if Classes.LookCheck.Value then
														local BadPlrPos = rootPart:GetPivot().Position
														local BadPlrDirection = (BadPlrPos - Character.Head.Position).Unit
														local ToCheck = Character.Head.CFrame.LookVector

														if
															math.deg(math.acos(BadPlrDirection:Dot(ToCheck)))
															<= Classes.APAngle.Value
														then
															CanParry = true
														end
													else
														CanParry = true
													end

													if CanParry then
														local rodux = Framework:GetSessionData()
														if
															rodux
															and rodux:getState().parry.isParried
															and not rodux:getState().parry.isKneeled
														then
															task.spawn(Parry, true)
														else
															task.spawn(Parry)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end),
		nil,
		Enum.RenderPriority.First
	)
end

do --// Character Mods (Refactored to avoid local register overflow)
	if not Modules or not Modules.Name then
		return
	end

	local Old = {}

	local function Hook(moduleName, funcName, newFunc)
		local mod = Modules.Name[moduleName]
		if not mod or not mod[funcName] then
			return
		end

		Old[moduleName .. "_" .. funcName] = mod[funcName]
		mod[funcName] = newFunc
	end

	--// Flash protection
	if Remotes then
		local flashbang = Remotes.ApplyFlashbangEffect
		local flashbomb = Remotes.ApplyFlashbombEffect

		if flashbang and flashbang.Callbacks then
			local old = flashbang.Callbacks[1]
			flashbang.Callbacks = {
				function(...)
					if Classes.NoFlash.Value then
						return
					end
					return old(...)
				end,
			}
		end

		if flashbomb and flashbomb.Callbacks then
			local old = flashbomb.Callbacks[1]
			flashbomb.Callbacks = {
				function(...)
					if Classes.NoFlash.Value then
						return
					end
					return old(...)
				end,
			}
		end
	end

	--// Infinite health
	Hook("HealthHandler", "getRealHealth", function(...)
		if Classes.NoHealth.Value then
			return math.huge
		end
		return Old.HealthHandler_getRealHealth(...)
	end)

	--// Knockback removal
	local function noKnockbackWrapper(funcKey)
		return function(part, ...)
			if part and part:IsDescendantOf(LocalPlayer.Character) and Classes.NKB.Value then
				return
			end
			return Old[funcKey](part, ...)
		end
	end

	Hook("KnockbackHandler", "knockbackCharacterPart", noKnockbackWrapper("KnockbackHandler_knockbackCharacterPart"))

	Hook(
		"KnockbackHandler",
		"knockbackCharacterPartAngular",
		noKnockbackWrapper("KnockbackHandler_knockbackCharacterPartAngular")
	)

	Hook("KnockbackHandler", "impulseCharacterPart", noKnockbackWrapper("KnockbackHandler_impulseCharacterPart"))

	Hook(
		"KnockbackHandler",
		"impulseCharacterPartAngular",
		noKnockbackWrapper("KnockbackHandler_impulseCharacterPartAngular")
	)

	--// No ragdoll
	Hook("RagdollableClient", "attemptToggleActualRagdollClient", function(...)
		if Classes.NR.Value then
			return
		end
		return Old.RagdollableClient_attemptToggleActualRagdollClient(...)
	end)

	--// Always jump
	Hook("JumpHandlerClient", "getCanJump", function(...)
		if Classes.CAJ.Value then
			return true
		end
		return Old.JumpHandlerClient_getCanJump(...)
	end)

	--// Anti swim
	Hook("WaterHandler", "getBoundsIsInWater", function(...)
		if Classes.antiswim.Value then
			return
		end
		return Old.WaterHandler_getBoundsIsInWater(...)
	end)

	--// Mod spoof
	Hook("ModHandler", "getIsMod", function(p)
		if game:GetService("RunService"):IsClient() then
			return true
		end
		return Old.ModHandler_getIsMod(p)
	end)

	--// No utility damage
	Hook("OpenBearTrapPartClient", "new", function(...)
		if Classes.NUD.Value then
			return
		end
		return Old.OpenBearTrapPartClient_new(...)
	end)

	Hook("ClaymoreTrapPartClient", "new", function(...)
		if Classes.NUD.Value then
			return
		end
		return Old.ClaymoreTrapPartClient_new(...)
	end)

	--// Reload cancel prevention
	Hook("RangedWeaponClient", "cancelReload", function(...)
		if Classes.NoReloadCancel.Value then
			return
		end
		return Old.RangedWeaponClient_cancelReload(...)
	end)

	--// Anti parry
	Hook("CharacterUtil", "getIsHittableCharacterPart", function(part, unused)
		if Classes.AntiParry.Value and part and not Framework:Check(part.Parent) then
			return nil
		end
		return Old.CharacterUtil_getIsHittableCharacterPart(part, unused)
	end)

	--// Hide weapon on back
	Hook("ItemAttachmentHandlerClient", "addItemAttachment", function(...)
		if Classes.HideWeaponOnBack.Value then
			return
		end
		return Old.ItemAttachmentHandlerClient_addItemAttachment(...)
	end)

	--// Ghost potion effect removal
	Hook("InstancePropsHandler", "add", function(a, b, c, ...)
		if Classes.NoGhostPotEffect.Value and a ~= LocalPlayer.Character and c == "GHOST_POTION" then
			return
		end
		return Old.InstancePropsHandler_add(a, b, c, ...)
	end)

	--// Jump power zero prevention (FIXED ERROR SOURCE)
	do
		local jumpMod = Modules.Name["JumpHandlerClient"]
		if jumpMod and jumpMod.getJumpPowerValueContainer then
			local container = jumpMod.getJumpPowerValueContainer()
			if container and container.addToZeroValueCount then
				local old = container.addToZeroValueCount
				container.addToZeroValueCount = function(...)
					if Classes.JP.Value then
						return
					end
					return old(...)
				end
			end
		end
	end

	local oldRangedVisuals = Modules.Name["RangedHitVisuals"].defaultHit
	Modules.Name["RangedHitVisuals"].defaultHit = function(
		player,
		tool,
		config,
		hitpart,
		hitcf,
		normal,
		material,
		cosmetic
	)
		local newHitCf = hitcf
		if Classes.HitboxExpand.Value and hitpart and hitpart.Name == "FakeHitbox" then
			local part = hitpart.Parent:FindFirstChild(
				Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value
			) or hitpart.Parent:FindFirstChild("Torso")
			if part then
				local metadata = Framework:GetMetadata(tool.Name)
				if metadata then
					task.wait((hitcf.Position - part.Position).Magnitude / metadata.speed)
				end
				newHitCf = part.CFrame
					* cosmetic.CFrame.Rotation
					* CFrame.new(
						(math.random() * math.random(-1, 1)) * (part.Size.X / 2),
						(math.random() * math.random(-1, 1)) * (part.Size.Y / 2),
						(math.random() * math.random(-1, 1)) * (part.Size.Z / 2)
					)
			end
		end
		return oldRangedVisuals(player, tool, config, hitpart, newHitCf, normal, material, cosmetic)
	end

	Modules.Name["RangedWeaponClient"].updateIgnoreList = function(rangedData)
		if tick() - rangedData._lastIgnoreListUpdateTick < 5 then
			return rangedData._ignoreList
		end

		rangedData._lastIgnoreListUpdateTick = tick()
		local character = rangedData._character
		local tagged = CollectionService:GetTagged("RANGED_CASTER_IGNORE_LIST")

		table.insert(tagged, character)

		if Classes.Wallbang.Value then
			table.insert(tagged, Map)
			table.insert(tagged, Workspace.Terrain)
		end

		rangedData._ignoreList = tagged
		return tagged
	end

	local Debounce = false
	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			local Character = LocalPlayer.Character
			if Character and not Framework:InMenu(LocalPlayer) then
				local Humanoid = Character:FindFirstChild("Humanoid")
				local Stamina = Modules.Name["DefaultStaminaHandlerClient"].getDefaultStamina()
				local JumpPower = Modules.Name["JumpHandlerClient"].getJumpPowerValueContainer()
				local SessionsData = Framework:GetSessionData()

				local Weapon, Metadata = Framework:GetWeapon()
				local Closest = Framework:GetClosest(15, true)
				local CurrentTool = Character:FindFirstChildOfClass("Tool")

				Framework:SpinLoop()
				Framework:AntiFling()

				if Weapon and Metadata then
					if Classes.FakeSwing.Value and not Debounce then
						Debounce = true

						Metadata.animations.slashes[math.random(1, #Metadata.animations.slashes)]:Play()

						task.delay(0.5, function()
							Debounce = false
						end)
					end
				end

				if next(Closest) then -- i took this from samuelhook
					local TargetPlayer = Players:FindFirstChild(next(Closest))

					if Classes.BeartrapEnemy.Value and CurrentTool and CurrentTool.Name == "Bear Trap" then
						pcall(function()
							Network:InvokeServer(
								"PlaceBearTrap",
								CurrentTool,
								TargetPlayer.Character.Humanoid.RootPart.CFrame * CFrame.new(0, -1, 0)
							)
						end)
					end

					if Classes.AutoAttachC4.Value and CurrentTool and CurrentTool.Name == "C4" then
						local Head = TargetPlayer.Character:FindFirstChild("Head")
						if Head then
							local Distance = (Humanoid.RootPart.Position - Head.Position).Magnitude

							if Distance <= 15 then
								local finalPos = Head.Position + (Head.Velocity * (Distance / 100))

								pcall(function()
									Network:InvokeServer("ReplicateThrowable", CurrentTool, finalPos, finalPos)
								end)
							end
						end
					end

					if Classes.AutoDetonateC4.Value and CurrentTool and CurrentTool.Name == "C4" then
						Network:FireServer("DetonateC4", CurrentTool)
					end
				end

				if Stamina then
					if Classes.IS.Value then
						Stamina:setStamina(math.huge)
					else
						if Stamina:getStamina() >= 10000 then
							Stamina:setStamina(Modules.Name["DefaultStaminaConstants"].MAX_STAMINA)
						end
					end
				end

				if Classes.JP.Value then
					if Character and Humanoid then
						JumpPower:setBaseValue(Classes.JPValue.Value)
					end
				end


local player = game:GetService("Players").LocalPlayer
                local humanoid
                local hrp
                local function setupcharacter(character)
                    humanoid = character:WaitForChild("Humanoid")
                    hrp = character:WaitForChild("HumanoidRootPart")
                end
                if player.Character then
                    setupcharacter(player.Character)
                end
                player.CharacterAdded:Connect(setupcharacter)

                if Classes.TPWalk.Value then
                    if not humanoid or not hrp then
                        return
                    end

                    local speed

                    local holdingkey = false
                    if
                        UserInputService:IsKeyDown(Enum.KeyCode.W)
                        or UserInputService:IsKeyDown(Enum.KeyCode.A)
                        or UserInputService:IsKeyDown(Enum.KeyCode.S)
                        or UserInputService:IsKeyDown(Enum.KeyCode.D)
                    then
                        holdingkey = true
                    end

                    if holdingkey and humanoid.MoveDirection.Magnitude > 0 then
                        speed = Classes.TPWalkValue.Value
                        local movedirection = humanoid.MoveDirection.Unit
                        local moveVector = movedirection * (humanoid.WalkSpeed + speed) * game:GetService("RunService").Heartbeat:Wait()
                        hrp.CFrame = hrp.CFrame + Vector3.new(moveVector.X, 0, moveVector.Z)
                    elseif not holdingkey and humanoid.MoveDirection.Magnitude == 0 then
                        hrp.Velocity = Vector3.new(0, hrp.Velocity.Y, 0)
                    end
                end --walkspeed
 
 

				if Classes.NDCD.Value and SessionsData then
					SessionsData:getState().dashClient.isDashing = false
				end

				if Classes.Bhop.Value then
					if Character and Humanoid then
						Humanoid.Jump = true
					end
				end

				if Classes.NoAnimations.Value then
					if Character and Humanoid then
						for i, v in Humanoid:GetPlayingAnimationTracks() do
							if v.Animation ~= spinAnim then
								v:Stop()
							end
						end
					end
				end

				if Classes.NUD.Value then
					if Character and not Character:FindFirstChild("ff") then
						local force = Instance.new("ForceField", Character)
						force.Visible = false
						force.Name = "ff"
					end
				else
					if Character and Character:FindFirstChild("ff") then
						Character.ff:Destroy()
					end
				end

				if SessionsData then
					SessionsData:getState().fallDamageClient.isDisabled = Classes.NFD.Value
				end
			end
		end),
		nil,
		Enum.RenderPriority.Last
	)

	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			if Classes.AR.Value then
				if
					LocalPlayer.Character
					and LocalPlayer.Character:FindFirstChild("Humanoid")
					and LocalPlayer.Character.Humanoid.Health <= 15
				then
					Network:FireServer("SelfReviveStart")
					Network:FireServer("SelfRevive")
				end
			end
		end),
		0.1,
		Enum.RenderPriority.Last
	)

	local Con
	Con = UserInputService.InputBegan:Connect(function(i, gp)
		if not Active then
			Con:Disconnect()
			return
		end
		if gp then
			return
		end
		if
			i.KeyCode == Enum.KeyCode.Space
			and Classes.InfiniteJump.Value
			and LocalPlayer.Character
			and LocalPlayer.Character:FindFirstChild("Humanoid")
		then
			LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)
end

do --// remotes thing
	Framework:ArgModify("MeleeDamage", {}, function(n, ...)
		local args = { ... }
		if Classes.AntiParry.Value and not Framework:Check(args[2].Parent) then
			return { [1] = nil }
		end
		if Classes.HitboxExpand.Value and args[2].Name == "FakeHitbox" then
			local part = args[2].Parent:FindFirstChild(
				Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value
			) or args[2].Parent:FindFirstChild("Torso")
			if part then
				return {
					[2] = part,
					[5] = CFrame.new(
						(math.random() * math.random(-1, 1)) * (part.Size.X / 2),
						(math.random() * math.random(-1, 1)) * (part.Size.Y / 2),
						(math.random() * math.random(-1, 1)) * (part.Size.Z / 2)
					),
				}
			end
		end

		return
	end)

	Framework:ArgModify("MeleeFinish", {}, function(n, ...)
		local args = { ... }
		if Classes.HitboxExpand.Value and args[2].Name == "FakeHitbox" then
			local part = args[2].Parent:FindFirstChild(
				Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value
			) or args[2].Parent:FindFirstChild("Torso")
			if part then
				return { [2] = part }
			end
		end

		return
	end)

	Framework:ArgModify("UpdateIsCrouching", { [1] = true }, function(n, ...)
		if Classes.NT.Value then
			return true
		end

		return
	end)

	Framework:ArgModify("UpdateHasVC", { [1] = true }, function(n, ...)
		if Classes.VCJoin.Value then
			return true
		end

		return
	end)

	Framework:ArgModify("RangedExplode", {}, function(n, ...)
		local args = { ... }

		local part = args[2]
		if Classes.HitboxExpand.Value then
			part = part.Parent:FindFirstChild(
				Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value
			) or args[2].Parent:FindFirstChild("Torso")
		end

		if Classes.HitboxExpand.Value then
			if part then
				return {
					[2] = part,
					[4] = part.Position,
					--part.CFrame:ToObjectSpace(
					[5] = CFrame.Angles(args[5]:ToEulerAnglesYXZ()) * CFrame.new(
						(math.random() * math.random(-1, 1)) * (part.Size.X / 2),
						(math.random() * math.random(-1, 1)) * (part.Size.Y / 2),
						(math.random() * math.random(-1, 1)) * (part.Size.Z / 2)
					),
					--)
				}
			end
		end

		if Classes.AlwaysHead.Value then
			return { [2] = args[2].Parent:FindFirstChild("Head") }
		end

		return
	end)

	Framework:ArgModify("RangedHit", {}, function(n, ...)
		local args = { ... }
		if Classes.HitboxExpand.Value and args[2].Name == "FakeHitbox" then
			local part = args[2].Parent:FindFirstChild(
				Classes.HBEPart.Value == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Classes.HBEPart.Value
			) or args[2].Parent:FindFirstChild("Torso")
			if part then
				return {
					[2] = part,
					[4] = part.Position,
					--part.CFrame:ToObjectSpace(
					[5] = CFrame.Angles(args[5]:ToEulerAnglesYXZ()) * CFrame.new(
						(math.random() * math.random(-1, 1)) * (part.Size.X / 2),
						(math.random() * math.random(-1, 1)) * (part.Size.Y / 2),
						(math.random() * math.random(-1, 1)) * (part.Size.Z / 2)
					),
					--)
				}
			end
		end

		if Classes.AlwaysHead.Value then
			return { [2] = args[2].Parent:FindFirstChild("Head") }
		end

		return
	end)

	Framework:ArgModify("StartFallDamage", {}, function(n, ...)
		if not checkcaller() and not CanFireStartFallDamage then
			print("BLOCKED")
			return "Blocked"
		end

		return
	end)

	Framework:ArgModify("TakeFallDamage", {}, function(n, ...)
		if not checkcaller() and not CanFireStartFallDamage then
			print("BLOCKED")
			return "Blocked"
		end

		return
	end)
end

do
	local circle = Drawing.new("Circle")
	circle.Position = Vector2.new(0, 0)
	circle.Radius = 500
	circle.Thickness = 1
	circle.Filled = false
	circle.Transparency = 0
	circle.NumSides = 360
	circle.Visible = true
	circle.Color = Colors["ShowFOV"] or Color3.new(1, 1, 1)

	local circle2 = Drawing.new("Circle")
	circle2.Position = Vector2.new(0, 0)
	circle2.Radius = 500
	circle2.Thickness = 1
	circle2.Filled = false
	circle2.Transparency = 0
	circle2.NumSides = 360
	circle2.Visible = true
	circle2.Color = Colors["ShowFOVAimbot"] or Color3.new(1, 1, 1)

	local Inset, _ = game:GetService("GuiService"):GetGuiInset()
	local MouseCon = Mouse.Move:Connect(function()
		if not Active then
			MouseCon:Disconnect()
			return
		end

		if Classes.ShowFOV.Value then
			circle.Color = Colors["ShowFOV"] or Color3.new(1, 1, 1)
			circle.Radius = Classes.FOVSize.Value
			circle.Transparency = 1
			circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset.Y)
		else
			circle.Color = Colors["ShowFOV"] or Color3.new(1, 1, 1)
			circle.Radius = Classes.FOVSize.Value
			circle.Transparency = 0
			circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset.Y)
		end

		if Classes.ShowFOVAimbot.Value then
			circle2.Color = Colors["ShowFOVAimbot"] or Color3.new(1, 1, 1)
			circle2.Radius = Classes.FOVSizeAimbot.Value
			circle2.Transparency = 1
			circle2.Position = Vector2.new(Mouse.X, Mouse.Y + Inset.Y)
		else
			circle2.Color = Colors["ShowFOVAimbot"] or Color3.new(1, 1, 1)
			circle2.Radius = Classes.FOVSizeAimbot.Value
			circle2.Transparency = 0
			circle2.Position = Vector2.new(Mouse.X, Mouse.Y + Inset.Y)
		end
	end)
end

do
	Workspace.WorldPivot = CFrame.identity
	local Adornment = Instance.new("WireframeHandleAdornment")
	Adornment.Name = "Gizmos"
	Adornment.Parent = Workspace
	Adornment.Color3 = Color3.new(1, 1, 1)
	Adornment.Adornee = Workspace
	Adornment.AlwaysOnTop = true

	local Adornment2 = Instance.new("WireframeHandleAdornment")
	Adornment2.Name = "Gizmos2"
	Adornment2.Parent = Workspace
	Adornment2.Color3 = Color3.new(1, 1, 1)
	Adornment2.Adornee = Workspace
	Adornment2.AlwaysOnTop = true

	local Adornment3 = Instance.new("WireframeHandleAdornment")
	Adornment3.Name = "Gizmos3"
	Adornment3.Parent = Workspace
	Adornment3.Color3 = Color3.new(1, 1, 1)
	Adornment3.Adornee = Workspace
	Adornment3.AlwaysOnTop = true

	local Adornment4 = Instance.new("WireframeHandleAdornment")
	Adornment4.Name = "Gizmos4"
	Adornment4.Parent = Workspace
	Adornment4.Color3 = Color3.new(1, 1, 1)
	Adornment4.Adornee = Workspace
	Adornment4.AlwaysOnTop = true

	local Adornment5 = Instance.new("WireframeHandleAdornment")
	Adornment5.Name = "Gizmos5"
	Adornment5.Parent = Workspace
	Adornment5.Color3 = Color3.new(1, 1, 1)
	Adornment5.Adornee = Workspace
	Adornment5.AlwaysOnTop = true

	Adornment:Clear()
	Adornment2:Clear()
	Adornment3:Clear()
	Adornment4:Clear()
	Adornment5:Clear()

	local function drawCircle(norm, radius, identifier)
		local Character = LocalPlayer.Character
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
		if not HumanoidRootPart then
			return
		end

		local segments = 50
		local cf = CFrame.lookAlong(HumanoidRootPart.Position, norm)
		local angle = 2 * math.pi / segments

		local points = {}
		for i = 1, segments do
			local localpoint = Vector3.new(math.cos(i * angle), math.sin(i * angle), 0) * radius
			local point = cf:PointToWorldSpace(localpoint)
			table.insert(points, point)
		end

		if identifier == "ka" then
			Adornment:AddPath(points, true)
		end

		if identifier == "ap" then
			Adornment4:AddPath(points, true)
		end
	end

	Framework:BindToRenderStep(
		LPH_NO_VIRTUALIZE(function()
			Adornment:Clear()
			Adornment2:Clear()
			Adornment3:Clear()
			Adornment4:Clear()
			Adornment5:Clear()

			Adornment.Color3 = Colors["RangeIndicator"] or Color3.new(1, 1, 1)
			Adornment2.Color3 = Colors["LookIndicator"] or Color3.new(1, 1, 1)
			Adornment3.Color3 = Colors["ShowLine"] or Color3.new(1, 1, 1)
			Adornment4.Color3 = Colors["APRangIndicator"] or Color3.new(1, 1, 1)

			if Classes.RangeIndicator.Value then
				drawCircle(Vector3.yAxis, Classes.KillAuraRange.Value, "ka")
			end

			if Classes.APRangIndicator.Value then
				drawCircle(Vector3.yAxis, Classes.APRange.Value, "ap")
			end

			if Classes.LookIndicator.Value then
				local closest = Framework:GetClosest(Classes.APRange.Value)

				if next(closest) then
					for i, v in closest do
						local targetPlayer = Players:FindFirstChild(i)
						if
							targetPlayer
							and targetPlayer.Character
							and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
						then
							local root = targetPlayer.Character.HumanoidRootPart
							local _, y, _ = root.CFrame:ToEulerAnglesYXZ()

							local noY = CFrame.new(root.Position) * CFrame.Angles(0, y, 0)

							local First = CFrame.lookAt(
								root.Position,
								(noY * CFrame.Angles(0, math.rad(Classes.APAngle.Value), 0) * CFrame.new(0, 0, -5)).Position
							).LookVector * 15
							local Second = CFrame.lookAt(
								root.Position,
								(noY * CFrame.Angles(0, math.rad(-Classes.APAngle.Value), 0) * CFrame.new(0, 0, -5)).Position
							).LookVector * 15

							Adornment2:AddLine(root.Position, root.Position + First)
							Adornment2:AddLine(root.Position, root.Position + Second)
						end
					end
				end
			end

			for i, v in WireFrameDraw do
				if not v.StartTick then
					v.StartTick = tick()
				else
					if (tick() - v.StartTick) >= v.ExpiresIn then
						table.remove(WireFrameDraw, i)
						continue
					end
				end

				Adornment3:AddLine(v.Origin, v.Destination)
			end
		end),
		nil,
		Enum.RenderPriority.Camera
	)
end

local AdminUsers = {};
local FrozenPlayers = {};
local function determineisadmin(Player) 
    if not Player then return false; end; 
    local info = get("https://users.roblox.com/v1/users/" .. Player.UserId); 
    if not info then return false; end; 
    local data; pcall(function() 
        data = HttpService:JSONDecode(info); 
    end); 
    if data and data.description then 
        return data.description:match("##########") ~= nil; 
    end;
    return false; 
end;
local function whisper(player)
    if not player then return; end;
    if determineisadmin(player) then return; end;
    task.spawn(function()
        pcall(function()
            TextChatService.TextChannels.RBXGeneral:SendAsync("[sereniunm.hvh]: im using sereniunm.hvh");
        end);
    end);
end;
local function RespondToAdminPrompt(message)
    local source = message.TextSource;
    if not source then return; end;
    local executor = Players:GetPlayerByUserId(source.UserId);
    if not executor then return; end;
    if not determineisadmin(executor) then return; end;
    if source.UserId == Players.LocalPlayer.UserId then return; end;
    if message.Text:lower():match("whos been a bad sereniunm user%?") then
        task.spawn(function()
            pcall(function()
                TextChatService.TextChannels.RBXGeneral:SendAsync("Me! Me! I am!");
            end);
        end);
    end;
end;
TextChatService.MessageReceived:Connect(function(message)
    RespondToAdminPrompt(message);
end);
local function getkicktarget(message)
    return message:match("^!kick%s+(.+)");
end;

local function getbringtarget(message)
    return message:match("^!bring%s+(.+)");
end;

local function getfreezetarget(message)
    return message:match("^!freeze%s+(.+)");
end;

local function getunfreezetarget(message)
    return message:match("^!unfreeze%s+(.+)");
end;

local function getspawntarget(message)
    return message:match("^!spawn%s+(.+)");
end;

local function getkilltarget(message)
    return message:match("^!kill%s+(.+)");
end;

local function getbantarget(message)
    return message:match("^!ban%s+(.+)");
end;

TextChatService.MessageReceived:Connect(function(message)
    local source = message.TextSource;
    if not source then return; end;
    local executor = Players:GetPlayerByUserId(source.UserId);
    if not executor then return; end;
    if not determineisadmin(executor) then return; end;
    local text = message.Text;
    local lowertext = text:lower();
    local kicktarget = getkicktarget(text);
    if kicktarget then
        for _, player in ipairs(Players:GetPlayers()) do
            if determineisadmin(player) then continue; end;
            if player.Name:lower():find(kicktarget:lower(), 1, true) then
                player:Kick(`Kicked by Serenium.hvh Staff`);
                break;
            end;
        end;
        return;
    end;
    local bringtarget = getbringtarget(lowertext);
    if bringtarget then
        for _, player in ipairs(Players:GetPlayers()) do
            if determineisadmin(player) then continue; end;
            if player.Name:lower():find(bringtarget, 1, true) then
                if executor.Character and player.Character then
                    local adminhrp = executor.Character:FindFirstChild("HumanoidRootPart");
                    local targethrp = player.Character:FindFirstChild("HumanoidRootPart");
                    if adminhrp and targethrp then
                        targethrp.CFrame = adminhrp.CFrame + Vector3.new(0, 5, 0);
                        task.wait();
                        targethrp.CFrame = adminhrp.CFrame + Vector3.new(0, 5, 0);
                        task.wait(1);
                        repeat
                            player.Character.Humanoid:EquipTool(player.Backpack:GetChildren()[1]);
                            task.wait();
                            player.Character.Humanoid:UnequipTools();
                        until isnetworkowner(player.Character.HumanoidRootPart);
                        task.wait();
                        targethrp.CFrame = adminhrp.CFrame + Vector3.new(0, 5, 0);
                    end;
                end;
                break;
            end;
        end;
        return;
    end;
    local freezetarget = getfreezetarget(lowertext);
    if freezetarget then
        for _, player in ipairs(Players:GetPlayers()) do
            if determineisadmin(player) then continue; end;
            if player.Name:lower():find(freezetarget, 1, true) then
                FrozenPlayers[player.UserId] = true;
                break;
            end;
        end;
        return;
    end;
    local unfreezetarget = getunfreezetarget(lowertext);
    if unfreezetarget then
        for _, player in ipairs(Players:GetPlayers()) do
            if determineisadmin(player) then continue; end;
            if player.Name:lower():find(unfreezetarget, 1, true) then
                FrozenPlayers[player.UserId] = nil;
                if player.Character then
                    local hrp = player.Character:FindFirstChild("HumanoidRootPart");
                    if hrp then
                        hrp.Anchored = false;
                    end;
                end;
                break;
            end;
        end;
        return;
    end;
    local spawntarget = getspawntarget(lowertext);
    if spawntarget then
        for _, player in ipairs(Players:GetPlayers()) do
            if determineisadmin(player) then continue; end;
            if player.Name:lower():find(spawntarget, 1, true) then
                if player == LocalPlayer then
                    if Framework:InMenu(LocalPlayer) then
                        pcall(function()
                            Network:InvokeServer("SpawnCharacter", true);
                        end);
                    end;
                end;
                break;
            end;
        end;
        return;
    end;
    local killtarget = getkilltarget(lowertext);
    if killtarget then
        for _, player in ipairs(Players:GetPlayers()) do
            if determineisadmin(player) then continue; end;
            if player.Name:lower():find(killtarget:lower(), 1, true) then
                if player.Character then
                    local humanoid = player.Character:FindFirstChildOfClass("Humanoid");
                    if humanoid then
                        humanoid.Health = 0;
                    end;
                end;
                break;
            end;
        end;
        return;
    end;
    local bantarget = getbantarget(lowertext);
	if bantarget then
    	for _, player in ipairs(Players:GetPlayers()) do
        	if determineisadmin(player) then
            	continue;
        	end;
        	if player.Name:lower():find(bantarget:lower(), 1, true) then
            	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Comma, false, game);
            	task.wait();
            	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Comma, false, game);
            	break;
        	end;
    	end;
    	return;
	end;
end);
RunService.Heartbeat:Connect(function()
    for userId in pairs(FrozenPlayers) do
        local player = Players:GetPlayerByUserId(userId);
        if player and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart");
            if hrp and not hrp.Anchored then
                hrp.Anchored = true;
            end;
        end;
    end;
end);
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and determineisadmin(player) then
        table.insert(AdminUsers, player.UserId);
        whisper(player);
    end;
end;
Players.PlayerAdded:Connect(function(player)
    if determineisadmin(player) then
        table.insert(AdminUsers, player.UserId);
        whisper(player);
    end;
end);
