if serenium_LOADED and not _G.serenium_DEBUG then
	return;
end;
pcall(function() getgenv().serenium_LOADED = true; end);
if not game:IsLoaded() then game.Loaded:Wait(); end;
if not LPH_OBFUSCATED then
	LPH_NO_UPVALUES = function(...) return ...; end;
	LPH_NO_VIRTUALIZE = function(...) return ...; end;
    LPH_CRASH = function(...) return ...; end;
end;
local Data = Data;
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
				"Internet says ‘how to dodge in combat warriors’",
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
	};
end;
-- variables
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xectray1/linoria-fork/refs/heads/main/linoria.lua"))();
local savemanager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/refs/heads/main/addons/SaveManager.lua"))();
local thememanager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/refs/heads/main/addons/ThemeManager.lua"))();
local window = library:CreateWindow({Title = "serenium.hvh                                    combat warriors", Center = true, AutoShow = true, TabPadding = 8, MenuFadeTime = 0});
local SERENIUM_TEXT = "serenium.hvh"
local COMBAT_TEXT   = "                                       combat warriors"
local COMBAT_RICH   = '<font color="rgb(255,0,0)">combat warriors</font>'
local function applyStaticText(label)
    label.RichText = true
    label.Text = SERENIUM_TEXT .. COMBAT_TEXT:gsub("combat warriors", COMBAT_RICH)
end
local function colorTitle(window)
    if not window then return false end
    local windowInstance = window.Instance or window.Window or window._window
    if not windowInstance then
        local libraryUI = library.Instance or library._instance
        if libraryUI then
            windowInstance = libraryUI
        end
    end
    local function isTitleLabel(label)
        return label:IsA("TextLabel")
            and label.Text
            and label.Text:find(SERENIUM_TEXT)
            and label.Text:find("combat warriors")
    end
    local candidates
    if windowInstance and windowInstance:IsA("Instance") then
        candidates = windowInstance:GetDescendants()
    else
        candidates = game:GetService("CoreGui"):GetDescendants()
    end
    for _, label in ipairs(candidates) do
        if isTitleLabel(label) then
            applyStaticText(label)
            return true
        end
    end

    return false
end
for i = 1, 30 do
    if colorTitle(window) then break end
    task.wait(0.1)
end
game:GetService("CoreGui").DescendantAdded:Connect(function(descendant)
    if descendant:IsA("TextLabel")
        and descendant.Text
        and descendant.Text:find(SERENIUM_TEXT)
        and descendant.Text:find("combat warriors") then
        applyStaticText(descendant)
    end
end)
local tabs = {main = window:AddTab('main'), ranged = window:AddTab("ranged"); charactertab = window:AddTab("character"), misc = window:AddTab("misc"), visuals = window:AddTab("visuals"), sniper = window:AddTab("sniper"), settings = window:AddTab("settings")};

-- tabs
local main = tabs.main:AddLeftGroupbox("main");
local parrysection2 = tabs.main:AddRightGroupbox("auto parry")
local parrysection = tabs.main:AddRightGroupbox("modifications")
local mmisc = tabs.misc:AddLeftGroupbox("main");
local miscauto = tabs.misc:AddLeftGroupbox("auto");
local misc = tabs.misc:AddLeftGroupbox("cosmetic");
local crates = tabs.misc:AddLeftGroupbox("crates");
local misc1 = tabs.misc:AddRightGroupbox("players");
local auto = tabs.misc:AddRightGroupbox("others")
local charactertab = tabs.charactertab:AddLeftGroupbox("character");
local othertabs = tabs.charactertab:AddLeftGroupbox("others");
local exploit = tabs.charactertab:AddRightGroupbox("exploits");
local exploit1 = tabs.charactertab:AddRightGroupbox("character exploits");
local settings = tabs.settings:AddLeftGroupbox("settings");
local sniper = tabs.sniper:AddLeftGroupbox("sniper");
local aimbot = tabs.ranged:AddLeftGroupbox("aimbot");
local gunmods = tabs.ranged:AddLeftGroupbox("gun mods");
local silentaim = tabs.ranged:AddRightGroupbox("silent aim");

-- others
local whitelist = {};
local toggles = Toggles;
local camera = workspace.CurrentCamera;
local boostmultiplier = 2;
local updown = true;
local flying = false;
local keys = {w=false, a=false, s=false, d=false, space=false, ctrl=false, lshift=false};
local driver = nil;
local runservice = game:GetService("RunService");
local repstorage = game:GetService("ReplicatedStorage");
local userinputservice = cloneref(game:GetService("UserInputService"));
local httpservice = game:GetService("HttpService");
local localplayer = game:GetService("Players").LocalPlayer;
local players = game:GetService("Players");
local character = localplayer.Character or localplayer.CharacterAdded:Wait();
local humanoidrootpart = character:WaitForChild("HumanoidRootPart");
local humanoid = character:WaitForChild("Humanoid");
local PlayerCharacters = Workspace:FindFirstChild("PlayerCharacters");
local ParryingCharacters = {};
Library.IgnoreWhileTyping = true;

--getgenv variables
getgenv().infstamina = false;
getgenv().canalwaysjump = false;
getgenv().nnt = false;
getgenv().nut = false;
getgenv().nps = false;
getgenv().nps2 = false;
getgenv().noflash = false;
getgenv().noclipenabled = false;
getgenv().desync = false;
getgenv().velocityenabled = false;
getgenv().velocityspeed = nil;
getgenv().flyenabled = false;
getgenv().nhe = false;
getgenv().ngpe = false;
getgenv().nkb = false;
getgenv().fno = false;
getgenv().spinenabled = false;
getgenv().hideweapon = false;
getgenv().walkspeedenabled = false;
getgenv().nocancel = false;
getgenv().noswim = false;
getgenv().vcenabled = false;
getgenv().fastrespawn = false;
getgenv().loopspawn = false;
getgenv().loopkillall = false;
getgenv().ar = false;
getgenv().killaura = false;
getgenv().autostompshove = false;
getgenv().autoglory = false;
getgenv().antimod = true;
getgenv().BeartrapEnemy = false;
getgenv().AutoAttachC4 = false;
getgenv().AutoDetonateC4 = false;
getgenv().hbe = false;
getgenv().showhbe = false;
getgenv().AlwaysHead = false;
getgenv().ragebot = false;
getgenv().fakeswing = false;
getgenv().swingsound = false;
getgenv().autoequip = false;
getgenv().hbe_part = "Head";
getgenv().hbesize = 1;
getgenv().stompshoverange = 10;
getgenv().glorydelay = 1;
getgenv().gloryrange = 10;
getgenv().jumppower = 50;
getgenv().walkspeed = 16;
getgenv().flyspeed = 16;
getgenv().spinspeed = 10;
getgenv().teleport = function(CFrame)
	game:GetService("TweenService"):Create(humanoidrootpart,TweenInfo.new(0),{ CFrame = CFrame }):Play();
end;

-- void hide
getgenv().clientcframe = getgenv().clientcframe or { Connections = {}, History = {}; };
local data = (getgenv()).clientcframe;
for _, conn in pairs(data.Connections) do
    if conn.Connected then conn:Disconnect(); end;
end;
data.Connections = {};
data.History = {};
local primarypart = character:WaitForChild("HumanoidRootPart");
local client_cframe = primarypart.CFrame;
if not data.IndexHook then
    local __index; __index = hookmetamethod(game, "__index", newcclosure(function(self, property)
        if not checkcaller() and self == primarypart and property == "CFrame" and is_enabled then
            return client_cframe;
        end;
        return __index(self, property);
    end));
    data.IndexHook = true;
end;
table.insert(data.Connections, localplayer.CharacterAdded:Connect(function(newchar)
    character = newchar;
    primarypart = newchar:WaitForChild("HumanoidRootPart");
    humanoid = newchar:WaitForChild("Humanoid");
    client_cframe = primarypart.CFrame;
    data.History  = {};
    task.wait(1);
end));
local function targetcframe()
    if not primarypart then return client_cframe; end;
    local basepos = primarypart.Position;
    local X = basepos.X;
	local Y = math.random(-1000, 0);
    local Z = basepos.Z;
    return CFrame.new(X, Y, Z);
end;
table.insert(data.Connections, runservice.Heartbeat:Connect(function()
    if not (primarypart and primarypart.Parent) then return; end;
    client_cframe = primarypart.CFrame;
    local humanoid = localplayer.Character:WaitForChild("Humanoid");
    if is_enabled and isnetworkowner(primarypart) then
        local target = targetcframe();
        primarypart.CFrame = target;
		humanoid:ChangeState(Enum.HumanoidStateType.Freefall);
    else
        primarypart.CFrame = client_cframe;
    end;
    runservice.RenderStepped:Wait();
    primarypart.CFrame = client_cframe;
end));

-- fly
local function connect(newchar)
    character = newchar;
    humanoidrootpart = character:WaitForChild("HumanoidRootPart");
	humanoid = character:WaitForChild("Humanoid");
end;
localplayer.CharacterAdded:Connect(connect);
userinputservice.InputBegan:Connect(function(input, gpe)
    if gpe then return; end;
    local k = input.KeyCode;
    local name = k.Name:lower();
    if keys[name] ~= nil then keys[name] = true; end;
end);
userinputservice.InputEnded:Connect(function(input, gpe)
    if gpe then return; end;
    local n = input.KeyCode.Name:lower();
    if keys[n] ~= nil then keys[n] = false; end;
end);
runservice.Heartbeat:Connect(function(dt)
    if getgenv().flyenabled ~= flying then
        flying = getgenv().flyenabled;
        if flying then
            humanoidrootpart.Anchored = true;
            task.wait();
            humanoidrootpart.Anchored = false;
            driver = Instance.new("Part");
            driver.Size = Vector3.new(1,1,1);
            driver.Transparency = 1;
            driver.Anchored = true;
            driver.CanCollide = false;
            driver.Parent = workspace;
            driver.CFrame = humanoidrootpart.CFrame;
        else
            if driver then driver:Destroy(); driver = nil; end;
            local old = humanoidrootpart:FindFirstChildOfClass("BodyVelocity");
            if old then old:Destroy(); end;
            return;
        end;
    end;
    if not flying then return; end;
    if not driver then return; end;
    local old = humanoidrootpart:FindFirstChildOfClass("BodyVelocity");
    local bv = humanoidrootpart:FindFirstChildOfClass("BodyVelocity");
    if not bv then
        bv = Instance.new("BodyVelocity", humanoidrootpart);
        bv.MaxForce = Vector3.new(1e9,1e9,1e9);
        bv.Velocity = Vector3.zero;
        task.spawn(function()
            runservice.Heartbeat:Wait();
            if bv then bv:Destroy(); end;
        end);
    end;
    local move = Vector3.zero;
    if keys.w then move += camera.CFrame.LookVector; end;
    if keys.s then move -= camera.CFrame.LookVector; end;
    if keys.a then move -= camera.CFrame.RightVector; end;
    if keys.d then move += camera.CFrame.RightVector; end;
    if updown then
        if keys.space then move += Vector3.yAxis; end;
        if keys.ctrl then move -= Vector3.yAxis; end;
    end;
    if move.Magnitude > 0 then move = move.Unit; end;
    local speed = flyspeed * (keys.lshift and boostmultiplier or 1);
    driver.CFrame = driver.CFrame + move * speed * dt;
    driver.CFrame = CFrame.new(driver.Position, driver.Position + camera.CFrame.LookVector);
    bv.Velocity = move * speed;
    humanoidrootpart.CFrame = driver.CFrame;
end);

-- velocity
runservice.Heartbeat:Connect(function()
    local velocity = humanoidrootpart.AssemblyLinearVelocity;
    if getgenv().velocityenabled and getgenv().velocityspeed then
        local moveDir = humanoid.MoveDirection;
        if moveDir.Magnitude > 0 then
            local horizontal = Vector3.new(moveDir.X, 0, moveDir.Z).Unit;
            humanoidrootpart.AssemblyLinearVelocity = Vector3.new(horizontal.X * getgenv().velocityspeed, velocity.Y, horizontal.Z * getgenv().velocityspeed);
        else
            humanoidrootpart.AssemblyLinearVelocity = Vector3.new(0, velocity.Y, 0);
        end;
    end;
end);
-- desync
local active = true;
task.spawn(function()
	while true do
		runservice.Heartbeat:Wait()
		if not active then
			runservice.Heartbeat:Wait();
			break;
		end;
		if not getgenv().desyncenabled then
			runservice.Heartbeat:Wait();
			continue;
		end;
		if not character then
			runservice.Heartbeat:Wait();
			continue;
		end;
		if not humanoidrootpart then
			runservice.Heartbeat:Wait();
			continue;
		end;
		local vel, movel = nil, 0.1;
		vel = humanoidrootpart.Velocity;
		humanoidrootpart.Velocity = Vector3.new(math.random(-1500, 1500), math.random(-300, 300), math.random(-1500, 1500));
		runservice.RenderStepped:Wait();
		if character and character.Parent and humanoidrootpart and humanoidrootpart.Parent then
			humanoidrootpart.Velocity = vel;
		end;
		runservice.Stepped:Wait();
		if character and character.Parent and humanoidrootpart and humanoidrootpart.Parent then
			humanoidrootpart.Velocity = vel + Vector3.new(0, movel, 0);
			movel = movel * -1;
		end;
	end;
end);
-- noclip
runservice.Stepped:Connect(function()
    if not getgenv().noclipenabled then return; end;
    if not character then return; end;
    for _, v in ipairs(character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false;
        end;
    end;
end);

-- game exploit setup
local modules = { Name = {}, Id = {} };
local utilityids = {};
local weaponids = {};
setthreadidentity(2);
for _, child in pairs(repstorage:GetDescendants()) do
	if child:IsA("ModuleScript") then
		local success, module = pcall(require, child);
		if success then
			modules.Name[child.Name] = module;
		end;
	end;
end;
setthreadidentity(8);
for i, v in modules.Name["UtilityIds"] do
	utilityids[i:lower()] = v
end
for i, v in modules.Name["WeaponIds"] do
	weaponids[i:lower()] = v
end
local network = modules.Name["Network"];
local eventhandler;
local remotes;
if eventhandler then
	remotes = getupvalue(eventhandler, 1);
end;
local framework = {};
local hooks = {};
local modify = {};
local signal = modules.Name["Signal"];
local onfireserver = network.FireServer;
function handle(_, Name, ...)
	local Args = { ... };
	if modify[Name] then
		local shouldhook = modify[Name].Check(Name, unpack(Args));
		if shouldhook then
			if typeof(shouldhook) == "table" then
				table.foreach(shouldhook, function(i, v)
					Args[i] = v;
				end);
			else
				if shouldhook == "Blocked" then
					return;
				end;
				for i, v in modify[Name].Args do
					Args[i] = v;
				end;
			end;
		end;
	end;
	if hooks[Name] then
		return pcall(hooks[Name], onfireserver, _, Name, ...);
	end;
	return onfireserver(_, Name, unpack(Args));
end;
network.fireserver = function(_, Name, ...)
	return handle(_, Name, ...);
end;
function framework:addhook(Name, Function)
	hooks[Name] = Function;
end;
function framework:argmodify(Name, ToModify, Check)
	modify[Name] = { Args = { ToModify }, Check = Check }
end
function framework:removehook(Name)
	table.remove(hooks, table.find(hooks, Name));
end;
function framework:removeargmodifier(Name, ToModify)
	table.remove(Modify, table.find(Modify, Name));
end;
function framework:fireserver(Name, ...)
	network:FireServer(Name, ...);
end;
function framework:invokeserver(Name, ...)
	network:InvokeServer(Name, ...);
end;
function framework:hookclient(Table, Name, NewFunction)
	if not remotes then
		return;
	end;
	local ToHook;
	for i, v in pairs(getconnections(remotes[Name].remote.OnClientEvent)) do
		ToHook = v.Function;
		break;
	end;
	local OldHook;
	OldHook = hookfunction(ToHook, LPH_NO_UPVALUES(function(...) return NewFunction(...)end));
	return OldHook;
end;
function framework:getmetadata(ItemName, ItemId)
	if not weaponids[ItemName:lower():gsub(" ", "")] then
		return;
	end;
	return ItemName and modules.Name["WeaponMetadata"][weaponids[ItemName:lower():gsub(" ", "")]] or modules.Name["WeaponMetadata"][ItemId];
end;
function framework:getutility(ItemName, ItemId)
	if not utilityids[ItemName:lower():gsub(" ", "")] then
		return;
	end;
	return ItemName and modules.Name["UtilityMetadata"][utilityids[ItemName:lower():gsub(" ", "")]] or modules.Name["UtilityMetadata"][ItemId];
end;
function framework:GetWeapon(Player)
	local Player = Player or localplayer;
	if not Player then
		return;
	end;
	local Character = Player.Character or Player.CharacterAdded:Wait();
	if not Character then
		return;
	end;
	for i, v in Character:GetChildren() do
		if not v:IsA("Tool") then
			continue;
		end;
		if v:GetAttribute("ItemType") == "weapon" and modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")] and modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")].class:lower():match("melee") then
			return v, modules.Name["MeleeWeaponClient"].getObj(v);
		end;
	end;
	return;
end;
function framework:GetRanged(Player)
	local Player = Player or localplayer;
	if not Player then
		return;
	end;
	local Character = Player.Character or Player.CharacterAdded:Wait();
	if not Character then
		return;
	end;
	for i, v in Character:GetChildren() do
		if not v:IsA("Tool") then
			continue;
		end;
		if v:GetAttribute("ItemType") == "weapon" and modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")] and modules.Name["WeaponMetadata"][v:GetAttribute("ItemId")].class:lower():match("ranged") then
			return v, modules.Name["RangedWeaponClient"].getObj(v);
		end;
	end;
	return;
end;
function framework:GetState()
	return modules.Name["RoduxStore"].store:getState();
end;
function framework:GetSessionData(player)
	return modules.Name["DataHandler"].getSessionDataRoduxStoreForPlayer(player or localplayer);
end;
function framework:InMenu(Player)
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
local cachedplayers = {}
local function updatecached()
	cachedplayers = {};
	for _, v in pairs(players:GetPlayers()) do
		if v ~= localplayer then
			table.insert(cachedplayers, v);
		end;
	end;
end;
updatecached()
players.PlayerAdded:Connect(function()
	updatecached();
end);
players.PlayerRemoving:Connect(function()
	updatecached();
end);
function framework:GetClosest(Distance, Priority, CheckFunction)
    local function whitelisted(player)
        return table.find(whitelist, player.Name) ~= nil;
    end;
    local function n(Player)
        if 
            Player.Character
            and Player.Character:FindFirstChild("HumanoidRootPart")
            and Player.Character:FindFirstChild("Humanoid")
            and Player.Character.Humanoid.Health ~= 0
            and not whitelisted(Player)
        then
            return true;
        end;
        return false;
    end;
    local Distance = Distance or math.huge;
    local CheckFunction = CheckFunction or n;
    local ClosestPlayers = {};
    for i, v in pairs(cachedplayers) do
        if v == localplayer then
            continue;
        end;
        if Ignored and table.find(Ignored, v.Name) then
            continue;
        end;
        if not CheckFunction(v) then
            continue;
        end;
        if framework:InMenu(v) then
            continue;
        end;
        local HRP = v.Character.HumanoidRootPart;
        local Magnitude = (HRP.Position - humanoidrootpart.Position).Magnitude;
        if Magnitude < Distance then
            Distance = Magnitude;
            ClosestPlayers[v.Name] = v.Character.Humanoid.Health;
        end;
    end;
    if Priority then
        local Sorted = {};
        for k, _ in pairs(ClosestPlayers) do
            table.insert(Sorted, k);
        end;
        table.sort(Sorted);
    end;

    return ClosestPlayers;
end;
function framework:GetClosest2(Distance, CheckFunction)
	local function n(Player)
		if
			Player.Character
			and Player.Character:FindFirstChild("HumanoidRootPart")
			and Player.Character:FindFirstChild("Humanoid")
			and Player.Character.Humanoid.Health ~= 0
			and not Player.Character:FindFirstChildOfClass("ForceField")
		then
			return true;
		end;
		return false;
	end;

	local Distance = Distance or math.huge;
	local CheckFunction = CheckFunction or n;
	local ClosestPlayer = nil;

	for i, v in pairs(cachedplayers) do
		if v == localplayer then
			continue;
		end;
		if not CheckFunction(v) then
			continue;
		end;
		if framework:InMenu(v) then
			continue;
		end;

		local HRP = v.Character.HumanoidRootPart;
		local Magnitude = (HRP.Position - humanoidrootpart.Position).Magnitude;

		if Magnitude < Distance then
			Distance = Magnitude;
			ClosestPlayer = v.Name;
		end;
	end;

	return ClosestPlayer and { [ClosestPlayer] = true } or nil;
end;

function framework:GetClosestToMouse(Distance, Priority, CheckFunction)
	local function n(Player)
		if
			Player.Character
			and Player.Character:FindFirstChild("HumanoidRootPart")
			and Player.Character:FindFirstChild("Humanoid")
			and Player.Character.Humanoid.Health ~= 0
		then
			return true;
		end;
		return false;
	end;

	local Distance = Distance or math.huge;
	local CheckFunction = CheckFunction or n;
	local ClosestPlayer = nil;
	local MousePosition = userinputservice:GetMouseLocation();

	for i, v in pairs(cachedplayers) do
		if v == localplayer then
			continue;
		end;
		if Ignored and table.find(Ignored, v.Name) then
			continue;
		end;
		if not CheckFunction(v) then
			continue;
		end;
		if framework:InMenu(v) then
			continue;
		end;

		local HRP = v.Character.HumanoidRootPart;
		local vector, onScreen = camera:WorldToScreenPoint(HRP.Position);
		if onScreen then
			local Magnitude = (MousePosition - Vector2.new(vector.X, vector.Y)).Magnitude;
			if Magnitude < Distance then
				Distance = Magnitude;
				ClosestPlayer = v;
			end;
		end;
	end;

	return ClosestPlayer;
end;
function framework:IsParrying(Player)
	local State = self:GetSessionData():getState();
	return State.parry.isParrying;
end;

function framework:GetCurrentGameMode()
	local CurrentMap = Map:FindFirstChildOfClass("Model");
	if CurrentMap then
		local Gamemodes = CurrentMap.MapConfiguration.Gamemodes;
		for i, v in pairs(Gamemodes:GetDescendants()) do
			if v:IsA("ObjectValue") then
				return v:FindFirstAncestorOfClass("Folder");
			end;
		end;
	end;
	return nil;
end;

function framework:GetPointEnemyPoint(Gamemode)
	for i, v in pairs(Gamemode:GetDescendants()) do
		if v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("Inner") then
			if v.Value.Inner.BrickColor ~= localplayer.Team.TeamColor then
				return v.Parent;
			end;
		end;
	end;
	return nil;
end;

function framework:GetPointTeamPoint(Gamemode)
	for i, v in pairs(Gamemode:GetDescendants()) do
		if v:IsA("ObjectValue") and v.Value and v.Value:FindFirstChild("Inner") then
			if v.Value.Inner.BrickColor == localplayer.Team.TeamColor then
				return v.Parent;
			end;
		end;
	end;
	return nil;
end;

function framework:GetClosestCharacterToOrigin(Origin, Dist)
	local dis = math.huge;
	local target = nil;

	for i, v in pairs(PlayerCharacters:GetChildren()) do
		local Player = players:GetPlayerFromCharacter(v);
		if Player then
			if table.find(Ignored, v.Name) then
				continue;
			end;
		end;

		if v ~= character and v:FindFirstChild("HumanoidRootPart") then
			local magnitude = (v.HumanoidRootPart.Position - Origin).Magnitude;
			if magnitude < Dist then
				dis = magnitude;
				target = v;
			end;
		end;
	end;

	return target, dis;
end;

function framework:GetClosestCharactersToOrigin(Origin, Dist)
	local closests = {};
	for i, v in pairs(PlayerCharacters:GetChildren()) do
		local Player = players:GetPlayerFromCharacter(v);
		if Player then
			if table.find(Ignored, v.Name) then
				continue;
			end;
		end;

		if v ~= character and v:FindFirstChild("HumanoidRootPart") then
			local magnitude = (v.HumanoidRootPart.Position - Origin).Magnitude;
			if magnitude < Dist then
				table.insert(closests, v);
			end;
		end;
	end;
	return closests;
end;

function framework:Chance(number)
	return (math.floor(Random.new():NextNumber(0, 1) * 100) / 100) <= math.floor(number) / 100;
end;

function framework:IsPartClose(Part, Distance)
	if not humanoidrootpart then
		return false;
	end;
	if Part and Part:IsA("BasePart") then
		local Mag = (Part.Position - humanoidrootpart.Position).Magnitude;
		return Mag <= Distance;
	end;
	return false;
end;

function framework:GetMeleeFuncs(Table)
	local tool = Table:GetWeapon();
	if not tool then
		return { parry = function() end };
	end;
	for i, v in pairs(getconnections(tool.Equipped)) do
		if v.Function then
			local uv = getupvalues(v.Function);
			if #uv == 1 and uv[1].singleWeaponMetadata then
				return uv[1];
			end;
		end;
	end;
	return nil;
end;

function framework:Teleport(CF)
	if driver then
		driver.CFrame = CF;
	else
		teleport(CF);
	end;
	local start = os.clock();
	local maxtime = 3;
	local owned = false;
	local notowner = false;
	repeat
		local owns = isnetworkowner(humanoidrootpart);
		if owns then
			owned = true;
		elseif owned then
			notowner = true;
			local tool = localplayer.Backpack:GetChildren()[1];
			if tool then
				humanoid:EquipTool(tool);
				task.wait();
				humanoid:UnequipTools();
			end;
		end;
		task.wait();
	until notowner or (os.clock() - start) >= maxtime;
    task.wait(0.5);
	if notowner then
		if driver then
			humanoidrootpart.CFrame = CF;
		else
			teleport(CF);
		end;
	end;
end;

function framework:BindToRenderStep(toBind, delayTime, priority: Enum.RenderPriority)
	local isDelayed = false;
	runservice:BindToRenderStep(
		httpservice:GenerateGUID(true),
		(priority and priority or Enum.RenderPriority.First).Value,
		delayTime
			and function()
				if isDelayed then
					return;
				end;
				isDelayed = true;
				task.spawn(toBind);
				task.wait(delayTime);
				isDelayed = false;
			end
			or toBind
	);
end;
function framework:InMenu(Player)
	local IsMenu = true;
	local Player = Player or localplayer
	if not Player.Character then
		return IsMenu;
	end;
	for i, v in pairs(Player.Character:GetChildren()) do
		if v:GetAttribute("ParryShieldId") then
			IsMenu = false;
		end;
	end;
	return IsMenu;
end;
function framework:Check(Character)
	if not Character or table.find(ParryingCharacters, Character) then
		return;
	end;
	local Humanoid = Character:FindFirstChildOfClass("Humanoid");
	local Player = players:GetPlayerFromCharacter(Character);
	if Player then
		local Rodux = framework:GetSessionData(Player);
		if Rodux and Rodux:getState().parry.isParrying then
			return;
		end;
	end;
	if Humanoid then
		local Animator = Humanoid:FindFirstChild("Animator");
		if Animator then
			local PlayingAnimations = Animator:GetPlayingAnimationTracks();
			for i, v in pairs(PlayingAnimations) do
				if v.Animation.Name:match("Parry") then
					return;
				end;
			end;
		end;
	end;

	for i, v in pairs(Character:GetChildren()) do
		if v:GetAttribute("ParryShieldId") and #v:GetChildren() == 1 then
			return v:GetChildren()[1].Transparency == 1;
		end;
	end;

	return;
end;
function framework:WaitForDescendant(Root, Name, Condition, Timeout)
	local Descendant = nil;
	local Timedout = false;

	task.delay(Timeout or 9e9, function()
		Timedout = true;
	end);
	repeat
		local Instance = Root:FindFirstChild(Name, true);
		if Instance and Condition(Instance) then
			Descendant = Instance;
			break;
		end;
		runservice.RenderStepped:Wait();
	until Descendant or Timedout;

	return Descendant;
end;
local rangedog = {};
local weaponorder = {};
local ranged = {};
for i, v in pairs(modules.Name["WeaponsInOrder"]) do
	weaponorder[v.id] = v;
end;
for i, v in pairs(modules.Name["WeaponIds"]) do
	if weaponorder[v] and weaponorder[v].class == "ranged" then
		table.insert(ranged, i);
	end;
end;
for i, v in pairs(ranged) do
	local m = framework:getmetadata(v) or framework:getutility(v);
	if m then
		table.insert(rangedog, { name = v, og = table.clone(m) });
	end;
end;
function modifyranged(name, val)
	for i, v in pairs(rangedog) do
		local m = framework:getmetadata(v.name) or framework:getutility(v.name);
		if m[name] then
			m[name] = val;
		end;
	end;
end;
function revertranged(name)
	for i, v in pairs(rangedog) do
		local m = framework:getmetadata(v.name) or framework:getutility(v.name);
		if m[name] then
			m[name] = v.og[name];
		end;
	end;
end;
-- stamina
framework:BindToRenderStep(function()
    local stamina = modules.Name["DefaultStaminaHandlerClient"].getDefaultStamina();
    if stamina then
        if getgenv().infstamina then
            stamina:setStamina(math.huge);
        else
            if stamina:getStamina() >= 10000 then
                stamina:setStamina(modules.Name["DefaultStaminaConstants"].MAX_STAMINA);
            end;
        end;
    end;
end);
-- major toggles
do
	local R6BodyParts = {
		"Head",
		"Torso",
		"Left Arm",
		"Right Arm",
		"Left Leg",
		"Right Leg",
		}
		local function getRealPart(fake)
		if not fake or not fake.Parent then return end
		local partName = getgenv().hbe_part
		if partName == "Random" then
			return fake.Parent:FindFirstChild(R6BodyParts[math.random(1, #R6BodyParts)])
		end
		return fake.Parent:FindFirstChild(partName) or fake.Parent:FindFirstChild("Torso")
	end
    local old = {};
    local old1 = modules.Name["RoduxStore"].store.dispatch;
    local function hook(modulename, funcname, newfunc)
        local mod = modules.Name[modulename];
        if not mod or not mod[funcname] then
            return;
        end;
        old[modulename .. "_" .. funcname] = mod[funcname];
        mod[funcname] = function(...)
            return newfunc(old[modulename .. "_" .. funcname], ...);
        end;
    end;
	hook("JumpHandlerClient", "getCanJump", function(oldfunc, ...)
		if getgenv().canalwaysjump then
			return true;
		end;
		return oldfunc(...);
	end);
	hook("OpenBearTrapPartClient", "new", function(oldfunc, ...)
		if getgenv().nut then
			return;
		end;
		return oldfunc(...);
	end);
	local CanFireStartFallDamage = true;
	framework:argmodify("StartFallDamage", {}, function(n, ...)
		if not checkcaller() and not CanFireStartFallDamage then
			return;
		end;
		return;
	end);
	framework:argmodify("TakeFallDamage", {}, function(n, ...)
		if not checkcaller() and not CanFireStartFallDamage then
			return;
		end;
		return;
	end);
	hook("ClaymoreTrapPartClient", "new", function(oldfunc, ...)
		if getgenv().nut then
			return;
		end;
		return oldfunc(...);
	end);
	local function getRealPart(fake)
		if not fake or not fake.Parent then return end
		if getgenv().hbe_part == "Random" then
			return fake.Parent:FindFirstChild(R6BodyParts[math.random(1, #R6BodyParts)])
		end

		return fake.Parent:FindFirstChild(getgenv().hbe_part)
			or fake.Parent:FindFirstChild("Torso")
	end
	framework:argmodify("MeleeDamage", {}, function(n, ...)
		local args = { ... }
		if Classes.AntiParry.Value and args[2] and not framework:Check(args[2].Parent) then
			return { [1] = nil }
		end
		if getgenv().hbe and args[2] and args[2].Name == "FakeHitbox" then
			local part = getRealPart(args[2])
			if part then
				return {
					[2] = part,
					[5] = CFrame.new(
						(math.random() * 2 - 1) * (part.Size.X / 2),
						(math.random() * 2 - 1) * (part.Size.Y / 2),
						(math.random() * 2 - 1) * (part.Size.Z / 2)
					)
				}
			end
		end
	end)
	framework:argmodify("MeleeFinish", {}, function(n, ...)
		local args = { ... }
		if getgenv().hbe and args[2] and args[2].Name == "FakeHitbox" then
			local part = getRealPart(args[2])
			if part then
				return { [2] = part }
			end
		end
	end)
	framework:argmodify("RangedExplode", {}, function(n, ...)
		local args = { ... }
		if not getgenv().hbe or not args[2] then return end
		local part = getRealPart(args[2])
		if part then
			return {
				[2] = part,
				[4] = part.Position,
				[5] = CFrame.Angles(args[5]:ToEulerAnglesYXZ()) * CFrame.new(
					(math.random() * 2 - 1) * (part.Size.X / 2),
					(math.random() * 2 - 1) * (part.Size.Y / 2),
					(math.random() * 2 - 1) * (part.Size.Z / 2)
				)
			}
		end
	end)
	framework:argmodify("RangedHit", {}, function(n, ...)
		local args = { ... }
		if getgenv().AlwaysHead and getgenv().AlwaysHead and args[2] and args[2].Parent then
			local character = args[2].Parent
			if character:IsA("Model") then
				local head = character:FindFirstChild("Head")
				if head then
					return {
						[2] = head,
						[4] = head.Position,
						[5] = args[5] or CFrame.new()
					}
				end
			end
		end
		if getgenv().hbe and args[2] and args[2].Name == "FakeHitbox" then
			local part = getRealPart(args[2])
			if part then
				return {
					[2] = part,
					[4] = part.Position,
					[5] = CFrame.Angles(args[5]:ToEulerAnglesYXZ()) * CFrame.new(
						(math.random() * 2 - 1) * (part.Size.X / 2),
						(math.random() * 2 - 1) * (part.Size.Y / 2),
						(math.random() * 2 - 1) * (part.Size.Z / 2)
					)
				}
			end
		end
	end)
	hook("HealthHandler", "getRealHealth", function(oldfunc, ...)
		if getgenv().nhe then
			return math.huge;
		end;
		return oldfunc(...);
	end);
	hook("RangedWeaponClient", "cancelReload", function(oldfunc,...)
		if getgenv().nocancel then
			return;
		end;
		return oldfunc(...);
	end);
	hook("InstancePropsHandler", "add", function(oldfunc, a, b, c, ...)
		if getgenv().ngpe and a ~= character and c == "GHOST_POTION" then
			return;
		end;
		return oldfunc(a, b, c, ...);
	end);
	hook("ItemAttachmentHandlerClient", "addItemAttachment", function(oldfunc, ...)
        if getgenv().hideweapon then
            return;
        end;
        return oldfunc(...);
    end);
    hook("WaterHandler", "getBoundsIsInWater", function(oldfunc, ...)
        if getgenv().antiswim then
            return;
        end;
        return oldfunc(...);
    end);
	local function nkb(funckey)
		return function(part, ...)
			if part and part:IsDescendantOf(character) and getgenv().nkb then
				return;
			end;
			return old[funckey](part, ...);
		end;
	end;
	hook("KnockbackHandler", "knockbackCharacterPart", nkb("KnockbackHandler_knockbackCharacterPart"));
	hook( "KnockbackHandler", "knockbackCharacterPartAngular", nkb("KnockbackHandler_knockbackCharacterPartAngular"));
	hook("KnockbackHandler", "impulseCharacterPart", nkb("KnockbackHandler_impulseCharacterPart"));
	hook("KnockbackHandler", "impulseCharacterPartAngular", nkb("KnockbackHandler_impulseCharacterPartAngular"));
	if remotes then
		local flashbang = remotes.ApplyFlashbangEffect;
		local flashbomb = remotes.ApplyFlashbombEffect;
		if flashbang and flashbang.Callbacks then
			local old2 = flashbang.Callbacks[1]
			flashbang.Callbacks = {
				function(...)
					if getgenv().noflash then
						return;
					end;
					return old2(...);
				end,
			};
		end;
		if flashbomb and flashbomb.Callbacks then
			local old = flashbomb.Callbacks[1];
			flashbomb.Callbacks = {
				function(...)
					if getgenv().noflash then
						return;
					end;
					return old(...);
				end,
			};
		end;
	end;
    framework:argmodify("UpdateIsCrouching", { [1] = true }, function(n, ...)
        if getgenv().nnt then
            return true;
        end;
    end);
	framework:argmodify("UpdateHasVc", { [1] = true }, function(n, ...)
		if getgenv().vcenabled then
			return true;
		end;
		return;
	end);
	local store = modules.Name["RoduxStore"].store;
	local olddispatch = store.dispatch;
	store.dispatch = function(table, sigma, ...)
		if typeof(sigma) == "table" then
			if sigma.type == "PARRY_IS_PARRIED_CHANGE" or sigma.type == "PARRY_IS_KNEELED_CHANGE" then
				if getgenv().nps then
					local JumpPower = modules.Name["JumpHandlerClient"];
					local Walkspeed = modules.Name["WalkSpeedHandlerClient"];
					local AutoRotate = modules.Name["AutoRotateHandlerClient"];
					if JumpPower and Walkspeed and AutoRotate then
						local WSContainer = Walkspeed.getValueContainer();
						local JPContainer = JumpPower.getJumpPowerValueContainer();
						local ARContainer = AutoRotate.getAutoRotateToggleCounter();
						task.spawn(function()
							local tries = 0;
							while JPContainer:getValue() > 0 and tries < 10 do
								task.wait(0.05);
								tries = tries + 1;
							end;
							modules.Name["CoreGuiHandlerClient"].toggleBackpack(true);
							modules.Name["CoreGuiHandlerClient"].toggleResetButton(true);
							olddispatch(table, { type = "STUN_CLIENT_IS_STUNNED_COUNT_DECREMENT" });
							modules.Name["ToolHandlerClient"].reEquipToolSet();
							modules.Name["EnvironmentCommunication"]:Fire(
								"ToggleAnimationKind",
								"idle",
								"parried",
								false,
								{ playTransitionTime = 0.1, stopTransitionTime = 0.1 }
							);
							WSContainer:removeFromZeroValueCount();
							JPContainer:removeFromZeroValueCount();
							ARContainer:add(1000);
						end);
					end;
				end;
			elseif sigma.type == "PARRY_CLIENT_IS_AFTER_PARRY_STUNNED_CHANGE" then
				if getgenv().nps2 then
					local JumpPower = modules.Name["JumpHandlerClient"];
					local Walkspeed = modules.Name["WalkSpeedHandlerClient"];
					local AutoRotate = modules.Name["AutoRotateHandlerClient"];
					if JumpPower and Walkspeed and AutoRotate then
						local WSContainer = Walkspeed.getValueContainer();
						local JPContainer = JumpPower.getJumpPowerValueContainer();
						local ARContainer = AutoRotate.getAutoRotateToggleCounter();
						WSContainer:removeFromZeroValueCount();
						JPContainer:removeFromZeroValueCount();
						ARContainer:add(1000);
					end;
					return olddispatch(table, sigma, ...);
				end;
			end;
		end;
		return olddispatch(table, sigma, ...);
	end;
end;
local connection; connection = runservice.Heartbeat:Connect(function(dt)
    if not getgenv().spinenabled then return; end;
    if not humanoidrootpart then return; end;
    local radians = math.rad(getgenv().spinspeed) * dt * 60;
    humanoidrootpart.CFrame = humanoidrootpart.CFrame * CFrame.Angles(0, radians, 0);
end);
local function connect(char)
    character = char;
    humanoid = char:WaitForChild("Humanoid");
    humanoidrootpart = char:WaitForChild("HumanoidRootPart");
    task.wait();
end;
localplayer.CharacterAdded:Connect(connect);
if localplayer.Character then
    connect(localplayer.Character);
end;
network:BindEvents({
    CreateAntiCheatNotification = function(data)
        if data.punishType == "rectified" and getgenv().fno and humanoidrootpart then
            repeat
                local tool = localplayer.Backpack:GetChildren()[1];
                if tool then
                    humanoid:EquipTool(tool);
                    task.wait();
                    humanoid:UnequipTools();
                else
                    task.wait();
                end;
            until humanoidrootpart.ReceiveAge == 0;
        end;
    end;
});
framework:BindToRenderStep(function()
	if getgenv().nut then
		if character and not character:FindFirstChild("ff") then
			local force = Instance.new("ForceField", character);
			force.Visible = false;
			force.Name = "ff";
		end;
	else
		if character and character:FindFirstChild("ff") then
			character.ff:Destroy();
		end;
	end;
    if getgenv().fastrespawn then
        if humanoid and humanoid.Health == 0 then
            network:FireServer("StartFastRespawn");
            network:InvokeServer("CompleteFastRespawn");
        end;
    end;
    if getgenv().loopspawn and framework:InMenu(localplayer) then
        network:InvokeServer("SpawnCharacter", true);
    end; 
end);
framework:BindToRenderStep(function()
	if getgenv().ar then
		if humanoid.Health <= 15 then
			network:FireServer("SelfReviveStart");
			network:FireServer("SelfRevive");
		end;
	end;
end);
framework:BindToRenderStep(function()
	local weapon, metadata = framework:GetWeapon();
	local debounce = false;
	if weapon and metadata then
		if getgenv().fakeswing and not Debounce then
			Debounce = true;
			metadata.animations.slashes[math.random(1, #metadata.animations.slashes)]:Play();
			task.delay(0.5, function()
				Debounce = false;
			end);
		end;
	end;
end);
local roles = {
    ["Community Senior"] = true;
    ["Community Moderator"] = true;
	["Game Moderator"] = true;
    ["Senior Moderator"] = true;
    ["Developer"] = true;
    ["Analytics"] = true;
	["Studio Developer"] = true;
	["Lead"] = true;
    ["NET"] = true;
    ["NOCTOVO"] = true;
};
local kickmessage = "Staff Detected By Anti Mod\n%s (@%s) - %s";
function checkmod(Player)
	local Success, Role = pcall(function()
		return Player:GetRoleInGroupAsync(5192826);
	end);
	if Success and roles[Role] then
		localplayer:Kick(kickmessage:format(Player.DisplayName, Player.Name, Role));
		return;
	end;
end;
function antimod(Player)
	if Player then
		checkmod(Player);
	else
		for _, Player in pairs(players:GetPlayers()) do
			if Player ~= localplayer then
				checkmod(Player);
			end;
		end;
	end;
end;
runservice.Heartbeat:Connect(function()
	if getgenv().antimod then
		antimod();
	end;
end);
framework:BindToRenderStep(function() -- auto stomp
        if getgenv().autostompshove then
            local character = localplayer.Character
            local closest = framework:GetClosest(getgenv().stompshoverange, true)
            if character and character:FindFirstChild("Stomp") and closest and next(closest) then
                local metadata = modules.Name["MeleeWeaponClient"].getObj(character.Stomp)
                if metadata and metadata._cooldownProgressTimer:getValue() > 0.75 then
                    local slashData = metadata._itemConfig.slashMetadata[metadata._currSlashCount]
                    local hitbox = slashData.getHitboxInfo(metadata.tool)
                    local hitboxes = metadata:getHitboxesToUseFromHitboxParts(hitbox.hitboxPartsToUse)
                    for i, v in hitboxes do
                        if not v.HitboxPendingRemoval then
                            for playername, health in closest do
                                local targetPlayer = players:FindFirstChild(playername)
                                local data = targetPlayer and framework:GetSessionData(targetPlayer)
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
    end,
    nil,
    Enum.RenderPriority.Character
)

task.spawn(function() -- auto glory
    while runservice.RenderStepped:Wait() do
        if getgenv().autoglory then
            task.wait(getgenv().glorydelay)

            local closest = framework:GetClosest(getgenv().gloryrange, true)
            local tool = framework:GetWeapon()

            if tool and closest and next(closest) then
                local targetPlayer = players:FindFirstChild(next(closest))
                if
                    targetPlayer
                    and targetPlayer.Character
                    and targetPlayer.Character:FindFirstChild("Humanoid")
                    and targetPlayer.Character.Humanoid.Health <= 20
                then
                    network:FireServer("StartGloryKill", tool, targetPlayer.Character, CFrame.new(), Vector3.new())
                end
            end
        end
    end
end)

-- ui setup
local function UpdateFeature(toggleName, keyName, setter)
    local toggleOn = Toggles[toggleName].Value;
    local keyOn = Options[keyName]:GetState();
    setter(toggleOn and keyOn);
end;
-- main combat
main:AddToggle("KillAura", {
	Text = "kill aura";
	Default = false;
    Callback = function()
        UpdateFeature("KillAura", "killaurabind", function(state)
            getgenv().killaura = state;
        end);
    end;
}):AddKeyPicker("killaurabind", {
	Text = "kill aura";
	Default = "";
	NoUi = true;
    Callback = function()
        UpdateFeature("KillAura", "killaurabind", function(state)
            getgenv().killaura = state;
        end);
    end;
});
main:AddSlider("KillAuraRange", {
	Text = "kill aura range";
	Default = 15;
	Min = 1;
	Max = 15;
	Rounding = 0;
	Compact = true;
});
main:AddDropdown("KillAuraType", {
	Values = {"single person", "multiple people"};
	Default = "single person";
	Multi = false;
	Text = "kill aura type";
});
main:AddToggle("PlayAnimation", {
	Text = "play animation";
	Default = false;
});
main:AddToggle("TPEnemy", {
	Text = "tp to enemy";
	Default = false;
});
main:AddDropdown("TPType", {
	Values = {"Behind", "Orbit", "Above", "Below", "Attach", "Random"};
	Default = "Behind";
	Multi = false;
	Text = "tp type";
});
main:AddSlider("TPRange", {
	Text = "tp range";
	Default = 5;
	Min = 1;
	Max = 15;
	Rounding = 0;
	Compact = true;
});

-- Classes table for combat features
local Classes = {
	KillAura = Toggles.KillAura,
	KillAuraRange = Options.KillAuraRange,
	KillAuraType = Options.KillAuraType,
	PlayAnimation = Toggles.PlayAnimation,
	TPEnemy = Toggles.TPEnemy,
	TPType = Options.TPType,
	TPRange = Options.TPRange,
};

local KADebounce = false;
local OnTp = false;
local Active = true;
local AttachRoot = nil;
local Ignored = {};
local ParryingCharacters = {};

-- Helper function
local function waitUntilTimeout(signal, timeout)
	if not signal then
		return "Signal creation failed";
	end;
	local start = tick();
	local success, result = pcall(function()
		return signal:Wait();
	end);
	if not success then
		return "Wait failed";
	end;
	if tick() - start > timeout then
		return "Timed out";
	end;
	return result;
end;

-- Combat Section
framework:BindToRenderStep(function()
    if getgenv().killaura and not KADebounce then
        local weapon, metadata = framework:GetWeapon();
        if weapon and metadata then
            local closest = framework:GetClosest(Classes.KillAuraRange.Value, true);
            if closest and next(closest) then
                local onCooldown = metadata._cooldownProgressTimer:getValue() < 0.75;
                if not onCooldown then
                    KADebounce = true;
                    if not Classes.PlayAnimation.Value then
                        local slash = math.random(1, #metadata._itemConfig.slashMetadata);
                        metadata._cooldownProgressTimer:setValue(0);
                        metadata:setSlashCount(slash);
                        network:FireServer("MeleeSwing", weapon, slash);
                        metadata._lastSlashTick = tick();
                        weapon:SetAttribute("LastSlashTick", metadata._lastSlashTick);
                        task.wait(0.1);
                        for i, v in metadata.meleeHitboxes do
                            for playername, health in closest do
                                local targetPlayer = players:FindFirstChild(playername);
                                if
                                    targetPlayer
                                    and targetPlayer.Character
                                    and targetPlayer.Character:FindFirstChild("Head")
                                    and health ~= 0
                                    and framework:Check(targetPlayer.Character)
                                then
                                    if table.find(whitelist, playername) then
                                        continue
                                    end

                                    local character = targetPlayer.Character;
                                    local session = framework:GetSessionData(targetPlayer);
                                    if session and not session:getState().parry.isParrying then
                                        local data = metadata._humanoidsAlreadyHit[character];
                                        if not data then
                                            metadata._humanoidsAlreadyHit[character] = {
                                                ["hitDetectionStage"] = 0,
                                                ["amountOfTimesHit"] = 0,
                                                ["lastHitTick"] = 0,
                                            };
                                            data = metadata._humanoidsAlreadyHit[character];
                                        end;
                                        network:FireServer(
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
                                        );
                                        data.hitDetectionStage = metadata.hitDetectionStage or 1;
                                        data.amountOfTimesHit += 1;
                                        data.lastHitTick = tick();
                                        if Classes.KillAuraType.Value == "single person" then
                                            break;
                                        end;
                                    end;
                                end;
                            end;
                            break;
                        end;
                        KADebounce = false;
                    else
                        if metadata:getShouldSlash() then
                            metadata._activateSignal:Fire();
                            local anim = metadata.animations.slashes[metadata._currSlashCount];
                            task.spawn(function()
                                local success, response = pcall(function()
                                    return waitUntilTimeout(anim:GetMarkerReachedSignal("startHitDetection"), 2);
                                end);
                                if
                                    success
                                    and response ~= "Timed out"
                                    and response ~= "Wait failed"
                                    and response ~= "Signal creation failed"
                                then
                                    for i, v in metadata.meleeHitboxes do
                                        v.HitboxStopTime = 1;
                                        for playername, health in closest do
                                            local targetPlayer = players:FindFirstChild(playername);
                                            if
                                                targetPlayer
                                                and targetPlayer.Character
                                                and targetPlayer.Character:FindFirstChild("Head")
                                                and health ~= 0
                                                and framework:Check(targetPlayer.Character)
                                            then
                                                if table.find(whitelist, playername) then
                                                    continue;
                                                end;
                                                local character = targetPlayer.Character;
                                                local data = framework:GetSessionData(targetPlayer);
                                                if data and not data:getState().parry.isParrying then
                                                    v.OnHit:Fire(character.Head, character.Humanoid, {
                                                        Distance = 1,
                                                        Instance = character.Head,
                                                        Material = Enum.Material.SmoothPlastic,
                                                        Position = character.Head.Position,
                                                        Normal = Vector3.yAxis,
                                                    }, character.Head.Position, character.Head.Position);
                                                    if Classes.KillAuraType.Value == "single person" then
                                                        break;
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                            end);
                            KADebounce = false;
                        else
                            KADebounce = false;
                        end;
                    end;
                end;
            end;
        end;
    end;
end);

-- Beartrap Enemy, Auto Attach C4, Auto Detonate C4
framework:BindToRenderStep(function()
	local Character = localplayer.Character;
	if Character and not framework:InMenu(localplayer) then
		local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");
		if not HumanoidRootPart then return end;
		
		local Closest = framework:GetClosest(15, true);
		local CurrentTool = Character:FindFirstChildOfClass("Tool");
		
		if next(Closest) then
			local TargetPlayer = players:FindFirstChild(next(Closest));
			
			if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				if getgenv().BeartrapEnemy and CurrentTool and CurrentTool.Name == "Bear Trap" then
					pcall(function()
						network:InvokeServer(
							"PlaceBearTrap",
							CurrentTool,
							TargetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -1, 0)
						);
					end);
				end;
				
				if getgenv().AutoAttachC4 and CurrentTool and CurrentTool.Name == "C4" then
					local Head = TargetPlayer.Character:FindFirstChild("Head");
					if Head then
						local Distance = (HumanoidRootPart.Position - Head.Position).Magnitude;
						
						if Distance <= 15 then
							local finalPos = Head.Position + (Head.Velocity * (Distance / 100));
							
							pcall(function()
								network:InvokeServer("ReplicateThrowable", CurrentTool, finalPos, finalPos);
							end);
						end;
					end;
				end;
			end;
		end;
		
		if getgenv().AutoDetonateC4 and CurrentTool and CurrentTool.Name == "C4" then
			pcall(function()
				network:FireServer("DetonateC4", CurrentTool);
			end);
		end;
	end;
end);

local angle = 0;
local orbitCF = CFrame.new();
local Connection;
Connection = runservice.Heartbeat:Connect(function(dt)
	if not Active then
		Connection:Disconnect();
		return;
	end;
	angle = (angle + dt * 10) % (2 * math.pi);
	orbitCF = CFrame.new(math.cos(angle) * Classes.TPRange.Value, 0, math.sin(angle) * Classes.TPRange.Value);
end);

runservice.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
    local Type = Classes.TPType.Value;
    local Character = localplayer.Character;
    if Character then
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");
        if HumanoidRootPart then
            local weapon = framework:GetWeapon() or framework:GetRanged();
            local CameraSubject;
            if Character:GetAttribute("CameraSubject") then
                CameraSubject = Character:FindFirstChild(Character:GetAttribute("CameraSubject"));
            else
                CameraSubject = Character:FindFirstChildOfClass("Humanoid") or HumanoidRootPart;
            end;
            if weapon and getgenv().killaura then
                if not Classes.TPEnemy.Value then
                    return;
                end;
                local closest = framework:GetClosest(Classes.KillAuraRange.Value, true);
                if next(closest) then
                    OnTp = false;
                    local targetPlayer = players:FindFirstChild(next(closest));
                    if
                        targetPlayer
                        and targetPlayer.Character
                        and targetPlayer.Character:FindFirstChild("Head")
                    then
                        -- Whitelist check: Skip processing if player is in whitelist
                        if table.find(whitelist, targetPlayer.Name) then
                            return
                        end

                        OnTp = true;
                        HumanoidRootPart.Velocity = Vector3.zero;
                        HumanoidRootPart.RotVelocity = Vector3.zero;
                        sethiddenproperty(
                            HumanoidRootPart,
                            "PhysicsRepRootPart",
                            targetPlayer.Character.HumanoidRootPart
                        );
                        if Type == "Behind" then
                            local lookVector = -targetPlayer.Character.HumanoidRootPart.CFrame.LookVector;
                            local offset = lookVector * 5 + Vector3.new(0, Classes.TPRange.Value, 0);
                            HumanoidRootPart.CFrame = CFrame.new(
                                targetPlayer.Character.HumanoidRootPart.Position + offset,
                                targetPlayer.Character.HumanoidRootPart.Position
                            );
                        elseif Type == "Orbit" then
                            HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position) * orbitCF;
                        elseif Type == "Above" then
                            local offset = Vector3.new(0, Classes.TPRange.Value, 0);
                            HumanoidRootPart.CFrame =
                                CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + offset);
                        elseif Type == "Below" then
                            local offset = Vector3.new(0, -Classes.TPRange.Value, 0);
                            HumanoidRootPart.CFrame =
                                CFrame.new(targetPlayer.Character.HumanoidRootPart.Position + offset);
                        elseif Type == "Attach" then
                            HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position);
                        else
                            local X, Y, Z = math.random(-6, 6), math.random(-3, 3), math.random(-6, 6);
                            local XA, YA, ZA =
                                math.random(-180, 180), math.random(-180, 180), math.random(-180, 180);
                            HumanoidRootPart.CFrame = CFrame.new(targetPlayer.Character.HumanoidRootPart.Position) *
                                CFrame.new(X, Y, Z) *
                                CFrame.Angles(math.rad(XA), math.rad(YA), math.rad(ZA));
                            camera.CameraSubject = targetPlayer.Character.HumanoidRootPart;
                        end;
                        if Type ~= "Random" then
                            camera.CameraSubject = CameraSubject;
                        end;
                    end;
                else
                    OnTp = false;
                    camera.CameraSubject = CameraSubject;
                end;
            else
                OnTp = false;
                camera.CameraSubject = CameraSubject;
            end;
            if not weapon then
                if getgenv().autoequip then
                    for _, v in pairs(localplayer.Backpack:GetChildren()) do
                        if v:IsA("Tool") and (v:FindFirstChild("Hitboxes") or v:GetAttribute("IsRangedWeapon")) then
                            Character.Humanoid:EquipTool(v);
                            break;
                        end;
                    end;
                end;
            end;
        end;
    end;
end));
local function Parry(metadata)
    local apdelay = math.round(Classes.APDelay.Value or 0);
    if apdelay > 0 then
        task.wait(apdelay);
    end;

    if Classes.APType.Value == "remote" then
        network:FireServer("Parry");
    elseif Classes.APType.Value == "both" then
        network:FireServer("Parry");
        keypress(0x46);
        keyrelease(0x46);
    else
        keypress(0x46);
        keyrelease(0x46)
    end;
end;
local scraped = {};
local function getevent(animID)
    if scraped[animID] then
        return scraped[animID];
    end;
    local markers = {};
    local ks;
    local s, _ = pcall(function()
        ks = KeyframeSequenceProvider:GetKeyframeSequenceAsync(animID);
    end);
    if s and ks then
        local function recurse(parent)
            for _, child in pairs(parent:GetChildren()) do
                if child:IsA("KeyframeMarker") then
                    local kf = child:FindFirstAncestor("Keyframe");
                    if kf then
                        markers[child.Name] = kf.Time;
                    end;
                end;
                if #child:GetChildren() > 0 then
                    recurse(child);
                end;
            end;
        end;
        recurse(ks);
        scraped[animID] = markers;
        return markers;
    end;
    return nil;
end;
-- Auto Parry --
local blacklisted_IDS = {
    ["106649093705106"] = true,
    ["9745796833"] = true,
    ["9745345487"] = true,
    ["0"] = true,
    ["9745344365"] = true
};

local slashes = {};
local parries = {};

for _, obj in pairs(getgc(true)) do
    if type(obj) == "table"
        and rawget(obj, "slashMetadata")
        and rawget(obj, "parryMetadata") ~= nil
    then
        if obj.slashMetadata then
            for _, meta in ipairs(obj.slashMetadata) do
                if meta.animation and meta.animation.AnimationId then
                    local id = string.gsub(meta.animation.AnimationId, "rbxassetid://", "");
                    if not blacklisted_IDS[id] then
                        slashes[id] = "Slash";
                    end;
                end;
            end;
        end;

        if obj.parryMetadata then
            for _, meta in ipairs(obj.parryMetadata) do
                if meta.animation and meta.animation.AnimationId then
                    local id = string.gsub(meta.animation.AnimationId, "rbxassetid://", "");
                    if not blacklisted_IDS[id] then
                        parries[id] = "Parry";
                    end;
                end;
            end;
        end;
    end
end;

local blacklist = {
    "rbxassetid://106649093705106",
    "rbxassetid://6423003415",
    "rbxassetid://101463478179793",
};
local HumanoidToParry = {};
local ParryingCharacters = {};
if PlayerCharacters then
    for i, v in pairs(PlayerCharacters:GetChildren()) do
        if v ~= localplayer.Character and v:FindFirstChildOfClass("Humanoid") then
            local humanoid = v:FindFirstChildOfClass("Humanoid");
            table.insert(HumanoidToParry, humanoid);
        end;
    end;
    PlayerCharacters.ChildAdded:Connect(function(char)
        if char ~= localplayer.Character and char:FindFirstChildOfClass("Humanoid") then
            local humanoid = char:FindFirstChildOfClass("Humanoid");
            table.insert(HumanoidToParry, humanoid);
        end;
    end);
end;
local playSoundOld;
local getIsHittableCharacterPartOld;
local Classes = Classes or {};
do
    parrysection2:AddToggle("AutoParry", {
        Text = "auto parry";
        Default = false;
        Tooltip = "Uhhh what auto parry meaning?";
        Callback = function(value)
            if not Classes.AutoParry then Classes.AutoParry = {} end;
            Classes.AutoParry.Value = value;
        end;
    });
    parrysection2:AddToggle("RandomChance", {
        Text = "random chance";
        Default = false;
        Callback = function(value)
            if not Classes.RandomChance then Classes.RandomChance = {} end;
            Classes.RandomChance.Value = value;
        end;
    });
    parrysection2:AddToggle("SmartCheck", {
        Text = "smartcheck";
        Default = false;
        Tooltip = "predicts hitbox time creation";
        Callback = function(value)
            if not Classes.SmartCheck then Classes.SmartCheck = {} end;
            Classes.SmartCheck.Value = value;
        end;
    });
    parrysection2:AddToggle("LookCheck", {
        Text = "check if looking";
        Default = false;
        Callback = function(value)
            if not Classes.LookCheck then Classes.LookCheck = {} end;
            Classes.LookCheck.Value = value;
        end;
    });
    parrysection2:AddDropdown("APCheck", {
        Text = "check method";
        Default = "sounds";
        Values = {"sounds", "animation"};
        Callback = function(value)
            if not Classes.APCheck then Classes.APCheck = {} end;
            Classes.APCheck.Value = value;
        end;
    });
    parrysection2:AddDropdown("APType", {
        Text = "ap type";
        Default = "remote";
        Values = {"remote", "keypress", "both"};
        Callback = function(value)
            if not Classes.APType then Classes.APType = {} end;
            Classes.APType.Value = value;
        end;
    });
    parrysection2:AddSlider("APDelay", {
        Text = "delay";
        Default = 0;
        Min = 0;
        Max = 1;
        Rounding = 1;
		Compact = true;
        Suffix = " seconds";
        Callback = function(value)
            if not Classes.APDelay then Classes.APDelay = {} end;
            Classes.APDelay.Value = value;
        end;
    });
    parrysection2:AddSlider("APRange", {
        Text = "range";
        Default = 15;
        Min = 1;
        Max = 15;
        Rounding = 0;
		Compact = true;
        Suffix = " studs";
        Callback = function(value)
            if not Classes.APRange then Classes.APRange = {} end;
            Classes.APRange.Value = value;
        end;
    });
    parrysection2:AddSlider("APChance", {
        Text = "auto parry chance";
        Default = 100;
        Min = 1;
        Max = 100;
        Rounding = 0;
		Compact = true;
        Suffix = "%";
        Callback = function(value)
            if not Classes.APChance then Classes.APChance = {} end;
            Classes.APChance.Value = value;
        end;
    });
    parrysection2:AddSlider("APAngle", {
        Text = "look angle";
        Default = 45;
        Min = 1;
        Max = 180;
        Rounding = 0;
		Compact = true;
        Suffix = " degrees";
        Callback = function(value)
            if not Classes.APAngle then Classes.APAngle = {} end;
            Classes.APAngle.Value = value;
        end;
    });
    parrysection2:AddSlider("Threshold", {
        Text = "marker threshold";
        Default = 0.3;
        Min = 0;
        Max = 1;
        Rounding = 1;
		Compact = true;
        Suffix = " seconds";
        Callback = function(value)
            if not Classes.Threshold then Classes.Threshold = {} end;
            Classes.Threshold.Value = value;
        end;
    });
    parrysection:AddToggle("AntiParry", {
        Text = "anti parry";
        Default = false;
        Callback = function(value)
            if not Classes.AntiParry then Classes.AntiParry = {} end;
            Classes.AntiParry.Value = value;
        end;
    });
end;
parrysection:AddToggle("fakeswing", {
	Text = "fake swing";
	Default = false;
	Callback = function(v)
		getgenv().fakeswing = v;
	end;
});
parrysection:AddToggle("swingsound", {
	Text = "play swing sound";
	Default = false;
	Tooltip = "use keybind";
	Callback = function(v)
		getgenv().swingsound = v;
	end;
}):AddKeyPicker("swingsoundkey", {
	Text = "swing sound";
	Default = "";
	NoUI = true;
});
userinputservice.InputBegan:Connect(function(i, gp)
	if gp then return; end;
	if getgenv().swingsound and (i.KeyCode == Options.swingsoundkey.Value or i.UserInputType == Options.swingsoundkey.Value) then
		local weapon = framework:GetWeapon();
		if weapon then
			network:FireServer("MeleeSwing", weapon, math.random(1, 3));
		end;
	end;
end);
parrysection:AddToggle("AutoEquip", {
	Text = "auto equip";
	Default = false;
	Callback = function(v)
		getgenv().autoequip = v;
	end;
});
if not Classes.AutoParry then Classes.AutoParry = { Value = false } end;
if not Classes.RandomChance then Classes.RandomChance = { Value = false } end;
if not Classes.SmartCheck then Classes.SmartCheck = { Value = false } end;
if not Classes.LookCheck then Classes.LookCheck = { Value = false } end;
if not Classes.APCheck then Classes.APCheck = { Value = "sounds" } end;
if not Classes.APType then Classes.APType = { Value = "remote" } end;
if not Classes.APDelay then Classes.APDelay = { Value = 0 } end;
if not Classes.APRange then Classes.APRange = { Value = 15 } end;
if not Classes.APChance then Classes.APChance = { Value = 100 } end;
if not Classes.APAngle then Classes.APAngle = { Value = 45 } end;
if not Classes.Threshold then Classes.Threshold = { Value = 0.3 } end;
if not Classes.AntiParry then Classes.AntiParry = { Value = false } end;
if modules.Name["SoundHandler"] and modules.Name["SoundHandler"].playSound then
    playSoundOld = modules.Name["SoundHandler"].playSound;
    modules.Name["SoundHandler"].playSound = function(sound)
        if Classes.AutoParry.Value
            and Classes.APCheck.Value == "sounds"
            and typeof(sound.parent) == "Instance"
            and sound.parent
            and sound.parent.Parent
            and sound.parent.Parent.Parent
            and sound.parent.Parent.Parent.Parent
            and sound.parent.Name:match("Hitbox")
            and sound.parent:FindFirstAncestorOfClass("Tool")
        then
            local Weapon, Metadata = framework:GetWeapon();
            local Other = sound.parent.Parent.Parent.Parent;
            local OtherRoot = Other and Other:FindFirstChild("HumanoidRootPart");
            if Weapon and Metadata and Other and OtherRoot then
                if Other ~= localplayer.Character
                    and framework:IsPartClose(OtherRoot, Classes.APRange.Value)
                    and framework:Chance(Classes.RandomChance.Value and math.random(1, 100) or Classes.APChance.Value)
                then
                    local CanParry = false;
                    if Classes.LookCheck.Value then
                        local BadPlrPos = Other:GetPivot().Position;
                        local BadPlrDirection = (BadPlrPos - localplayer.Character.Head.Position).Unit;
                        local ToCheck = localplayer.Character.Head.CFrame.LookVector;

                        if math.deg(math.acos(BadPlrDirection:Dot(ToCheck))) <= Classes.APAngle.Value then
                            CanParry = true;
                        end;
                    else
                        CanParry = true;
                    end;

                    if CanParry then
                        task.spawn(Parry, Metadata);
                    end;
                end;
            end;
        end;
        if sound.soundObject and sound.soundObject.Name == "Parry" and typeof(sound.parent) == "Instance" then
            local parryShield = sound.parent:FindFirstAncestorOfClass("Model");
            local Character = parryShield.Parent;

            if parryShield and parryShield:GetAttribute("ParryShieldId") and Character then
                table.insert(ParryingCharacters, Character);

                if modules.Name["ParryConstants"] and modules.Name["ParryConstants"].PARRY_DURATION_IN_SECONDS then
                    task.delay(modules.Name["ParryConstants"].PARRY_DURATION_IN_SECONDS, function()
                        table.remove(ParryingCharacters, table.find(ParryingCharacters, Character));
                    end);
                end;
            end;
        end;

        return playSoundOld(sound);
    end;
end;
framework:BindToRenderStep(function()
    if not Classes.AutoParry.Value then
        return;
    end;
    if Classes.APCheck.Value == "sounds" then
        return;
    end;
    local Character = localplayer.Character;
    if not Character then return; end
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");
    if not HumanoidRootPart then return; end
    local tool, metadata = framework:GetWeapon();
    if not tool or not metadata then return; end
    for _, humanoid in pairs(HumanoidToParry) do
        local rootPart = humanoid.RootPart;
        if not rootPart then continue; end
        local Distance = (HumanoidRootPart.Position - rootPart.Position).Magnitude;
        if Distance > Classes.APRange.Value then
            continue;
        end
        local animator = humanoid:FindFirstChildOfClass("Animator");
        if not animator then continue; end
        local animations = animator:GetPlayingAnimationTracks();
        for _, anim in pairs(animations) do
            local animObj = anim.Animation;
            if not animObj or not animObj.AnimationId then
                continue;
            end
            local animId = string.gsub(animObj.AnimationId, "rbxassetid://", "");
            if not slashes[animId] then
                continue;
            end
            if animObj.Name:find("^Finish%w*") then
                continue;
            end
            local markers = getevent(animObj.AnimationId);
            if not markers then
                continue;
            end
            local hitMarker = markers.startHitDetection;
            if not hitMarker then
                continue;
            end
            if anim.TimePosition >= math.clamp(hitMarker - Classes.Threshold.Value, 0, math.huge)
                and anim.TimePosition <= hitMarker
                and framework:Chance(Classes.RandomChance.Value and math.random(1, 100) or Classes.APChance.Value)
            then
                local CanParry = false;
                if Classes.LookCheck.Value then
                    local BadPlrPos = rootPart:GetPivot().Position;
                    local BadPlrDirection = (BadPlrPos - Character.Head.Position).Unit;
                    local ToCheck = Character.Head.CFrame.LookVector;

                    if math.deg(math.acos(BadPlrDirection:Dot(ToCheck))) <= Classes.APAngle.Value then
                        CanParry = true;
                    end
                else
                    CanParry = true;
                end
                if CanParry then
                    task.spawn(Parry, metadata);
                end
            end
        end
    end
end)

-- Anti Parry --
if modules.Name["CharacterUtil"] and modules.Name["CharacterUtil"].getIsHittableCharacterPart then
    getIsHittableCharacterPartOld = modules.Name["CharacterUtil"].getIsHittableCharacterPart
    modules.Name["CharacterUtil"].getIsHittableCharacterPart = function(part, unused)
        if Classes.AntiParry.Value and part and part.Parent then
            local character = part.Parent
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                local animator = humanoid:FindFirstChildOfClass("Animator")
                if animator then
                    local playingAnimations = animator:GetPlayingAnimationTracks()
                    for _, animTrack in pairs(playingAnimations) do
                        local animObj = animTrack.Animation
                        if animObj and animObj.AnimationId then
                            local animId = string.gsub(animObj.AnimationId, "rbxassetid://", "")
                            if parries[animId] then
                                return
                            end
                        end
                    end
                end
            end
            if not framework:Check(character) then
                return
            end
        end
        return getIsHittableCharacterPartOld(part, unused)
    end
end
-- character
charactertab:AddToggle("fly", {
    Text = "fly";
    Default = false;
    Callback = function()
        UpdateFeature("fly", "flybind", function(state)
            getgenv().flyenabled = state;
        end);
    end;
}):AddKeyPicker("flybind", {
    Text = "fly";
    Default = "";
    Mode = "Toggle";
    Callback = function()
        UpdateFeature("fly", "flybind", function(state)
            getgenv().flyenabled = state;
        end);
    end;
});
charactertab:AddToggle("velocity", {
    Text = "velocity",
    Default = false,
    Callback = function()
        UpdateFeature("velocity", "velocitybind", function(state)
            getgenv().velocityenabled = state
        end)
    end
}):AddKeyPicker("velocitybind", {
    Text = "velocity";
    Default = "";
    Mode = "Toggle";
    Callback = function()
        UpdateFeature("velocity", "velocitybind", function(state)
            getgenv().velocityenabled = state;
        end);
    end;
});
charactertab:AddToggle("walkspeed", {
    Text = "walkspeed";
    Default = false;
    Callback = function(enabled)
        getgenv().walkspeedenabled = enabled;
        local wsHandler = modules.Name["WalkSpeedHandlerClient"].getValueContainer();
        if enabled then
            wsHandler:setBaseValue(getgenv().walkspeed or 16);
        else
            wsHandler:setBaseValue(16);
        end;
    end;
});
charactertab:AddToggle("jumppower", {
    Text = "jump power",
    Default = false,
    Callback = function(enabled)
        getgenv().jumppowerenabled = enabled;
        local jumppower = modules.Name["JumpHandlerClient"].getJumpPowerValueContainer();
        if enabled then
            jumppower:setBaseValue(getgenv().jumppower or 50);
        else
            jumppower:setBaseValue(50);
        end;
    end;
});
charactertab:AddToggle("spin", {
    Text = "spin";
    Default = false;
    Callback = function(Value)
        getgenv().spinenabled = Value;
    end;
});
charactertab:AddToggle("infjump", {
    Text = "infinite jump";
    Default = false;
    Callback = function(Value)
        if Value then
            Con = userinputservice.InputBegan:Connect(function(i, gp)
                if gp then return; end;
                if i.KeyCode == Enum.KeyCode.Space and humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
                end;
            end);
        else
            if Con then
                Con:Disconnect();
                Con = nil;
            end;
        end;
    end;
});
charactertab:AddSlider("flyspeed", {
    Text = "fly speed",
    Default = 16,
    Min = 16,
    Max = 5000,
    Rounding = 0,
    Compact = true,
	Callback = function(Value)
		getgenv().flyspeed = Value;
	end;
});
charactertab:AddSlider("walkspeed2", {
    Text = "walk speed";
    Default = 16;
    Min = 16;
    Max = 100;
    Rounding = 0;
    Compact = true;
    Callback = function(value)
        getgenv().walkspeed = value;
        local wsHandler = modules.Name["WalkSpeedHandlerClient"].getValueContainer();
        if getgenv().walkspeedenabled then
            wsHandler:setBaseValue(value);
        end;
    end;
});
charactertab:AddSlider("jumppower2", {
    Text = "jump power",
    Default = 50,
    Min = 50,
    Max = 200,
    Rounding = 0,
    Compact = true,
    Callback = function(value)
        getgenv().jumppower = value;
        local jumppower = modules.Name["JumpHandlerClient"].getJumpPowerValueContainer();
        if getgenv().jumppowerenabled then
            jumppower:setBaseValue(value);
        end;
    end;
});
charactertab:AddSlider("speed", {
    Text = "velocity speed";
    Default = 16;
    Min = 16;
    Max = 1000;
    Rounding = 0;
    Compact = true;
	Callback = function(Value)
		getgenv().velocityspeed = Value;
	end;
});
charactertab:AddSlider("spinspeed", {
    Text = "spin speed";
    Default = 10;
    Min = 10;
    Max = 100;
    Rounding = 0;
    Compact = true;
    Callback = function(Value)
        getgenv().spinspeed = Value;
    end;
});
-- exploits
exploit:AddToggle("infstamina", {
    Text = "infinite stamina";
    Default = false;
    Callback = function(Value)
        getgenv().infstamina = Value;
    end;
});
exploit:AddToggle("infair", {
    Text = "infinite air";
    Default = false;
    Callback = function(Value)
        if toggles.infair.Value then
            modules.Name["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = 0;
        else
            modules.Name["AirConstants"].AIR_TO_ADD_PER_SECOND_WHILE_SWIMMING = -15;
        end;
    end;
});
exploit:AddToggle("canalwaysjump", {
    Text = "can always jump";
    Default = false;
    Callback = function(Value)
        getgenv().canalwaysjump = Value;
    end;
});
exploit:AddToggle("nojumpcd", {
    Text = "no jump cooldown";
    Default = false;
    Callback = function(Value)
        if Value then
            modules.Name["JumpConstants"].JUMP_DELAY_ADD = 0;
        else
            modules.Name["JumpConstants"].JUMP_DELAY_ADD = 1;
        end;
    end;
});
exploit:AddToggle("nodashcd", {
    Text = "no dash cooldown";
    Default = false;
    Callback = function(Value)
        if Value then
            modules.Name["DashConstants"].DASH_COOLDOWN = 0;
        else
            modules.Name["DashConstants"].DASH_COOLDOWN = 3;
        end;
    end;
});
exploit:AddToggle("nnt", {
    Text = "no name tag";
    Default = false;
    Callback = function(Value)
        getgenv().nnt = Value;
    end;
});
exploit:AddToggle("nut", {
    Text = "no utility trigger";
    Default = false;
    Callback = function(Value)
        getgenv().nut = Value;
    end;
});
exploit:AddToggle("itu", {
    Text = "instant utility use";
    Default = false;
    Callback = function(Value)
        if Value then
            for i, v in modules.Name["UtilityMetadata"] do
                if v.displayName ~= "Medkit" then
                    v.cacheDur = v.preThrowDuration or 0.001;
                    v.cacheTime = v.useTime or 0;
                    v.preThrowDuration = 0.001;
                    v.useTime = 0;
                end;
            end;
        else
            for i, v in modules.Name["UtilityMetadata"] do
                if v.displayName ~= "Medkit" then
                    v.preThrowDuration = v.cacheDur or v.preThrowDuration;
                    v.useTime = v.cacheTime or v.useTime;
                end;
            end;
        end;
    end;
});
exploit:AddToggle("nkb", {
    Text = "no knockback";
    Default = false;
    Callback = function(Value)
        getgenv().nkb = toggles.nkb.Value;
    end;
});
exploit:AddToggle("noswim", {
    Text = "anti swim";
    Default = false;
    Callback = function(Value)
        getgenv().antiswim = toggles.noswim.Value;
    end;
});
exploit:AddToggle("nfd", {
    Text = "no fall damage";
    Default = false;
    Callback = function(v)
        framework:GetSessionData():getState().fallDamageClient.isDisabled = v;
    end;
});
exploit:AddToggle("nps", {
    Text = "no parry stun";
    Default = false;
    Callback = function(Value)
        getgenv().nps = Value;
    end;
});
exploit:AddToggle("nps2", {
    Text = "no parry slowdown";
    Default = false;
    Callback = function(Value)
        getgenv().nps2 = Value;
    end;
});
exploit:AddToggle("nr", {
    Text = "no ragdoll";
    Default = false;
    Callback = function(Value)
        if Value then
            local ragdoll = modules.Name["RagdollableClient"].attemptToggleActualRagdollClient; modules.Name["RagdollableClient"].attemptToggleActualRagdollClient = function(...)
                if toggles.nr.Value then
                    return;
                end;
                return ragdoll(...);
            end;
        end;
    end;
});
exploit:AddToggle("noflash", {
    Text = "no flash effects";
    Default = false;
    Callback = function(Value)
        getgenv().noflash = Value;
    end;
});
exploit:AddToggle("nhe", {
    Text = "no health effects";
    Default = false;
    Callback = function(Value)
        getgenv().nhe = Value;
    end;
});
exploit:AddToggle("ngpe", {
    Text = "no ghost potion effects";
    Default = false;
    Callback = function(Value)
        getgenv().ngpe = Value;
    end;
});
exploit:AddToggle("walkonwater", {
    Text = "walk on water";
    Default = false;
    Callback = function(Value)
        for i, v in workspace:WaitForChild("Map"):GetDescendants() do
            if v:IsA("BasePart") and v.Name == "WaterArea" then
                v.CanCollide = Value;
            end;
        end;
    end;
});
exploit:AddToggle("ragdoll",{
    Text = "ragdoll";
    Default = false;
    Callback = function(Value)
        humanoid:WaitForChild("RagdollRemoteEvent"):FireServer(Value);
    end;
});
exploit:AddToggle("speedyboi", {
    Text = "fast animation";
    Default = false;
    Tooltip = "use for instant finish lol 😂😂😂";
    Callback = function(Value)
        if animcon then
            animcon:Disconnect();
            animcon = nil;
        end;
        if charcon then
            charcon:Disconnect();
            charcon = nil;
        end;
        local function apply(char)
            local humanoid = char:WaitForChild("Humanoid");
            local animator = humanoid:FindFirstChildOfClass("Animator");
            if not animator then
                animator = Instance.new("Animator");
                animator.Parent = humanoid;
            end;
            animcon = runservice.RenderStepped:Connect(function()
                for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                    track:AdjustSpeed(15);
                end;
            end);
        end;
        if Value then
            if character then
                apply(character);
            end;
            charcon = localplayer.CharacterAdded:Connect(apply);
        else
            if animcon then
                animcon:Disconnect();
                animcon = nil;
            end;
            if charcon then
                charcon:Disconnect();
                charcon = nil;
            end;
            if character then
                if humanoid then
                    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
                        track:AdjustSpeed(1);
                    end;
                end;
            end;
        end;
    end;
});
-- exploits end

-- character exploits
exploit1:AddToggle("desync", {
    Text = "desync";
    Default = false;
    Callback = function()
        UpdateFeature("desync", "desyncbind", function(state)
            getgenv().desyncenabled = state;
        end);
    end;
}):AddKeyPicker("desyncbind", {
    Text = "desync";
    Default = "";
    Mode = "Toggle";
    Callback = function()
        UpdateFeature("desync", "desyncbind", function(state)
            getgenv().desyncenabled = state;
        end);
    end;
});
exploit1:AddToggle("voidenabled", {
    Text = "void",
    Default = false,
    Callback = function()
        UpdateFeature("voidenabled", "voidenabledkey", function(state)
            is_enabled = state
        end)
    end
}):AddKeyPicker("voidenabledkey", {
    Text = "void";
    Default = "";
    Mode = "Toggle";
    Callback = function()
        UpdateFeature("voidenabled", "voidenabledkey", function(state)
            is_enabled = state;
        end);
    end;
});
exploit1:AddToggle("noclip", {
    Text = "noclip";
    Default = false;
    Callback = function()
        UpdateFeature("noclip", "noclipbind", function(state)
            getgenv().noclipenabled = state;
        end);
    end;
}):AddKeyPicker("noclipbind", {
    Text = "noclip";
    Default = "";
    Mode = "Toggle";
    Callback = function()
        UpdateFeature("noclip", "noclipbind", function(state)
            getgenv().noclipenabled = state;
        end);
    end;
});
exploit1:AddToggle("fakeposition", {
    Text = "fake position";
    Default = false;
    Callback = function()
        UpdateFeature("fakeposition", "fakeposkey", function(state)
            setfflag("NextGenReplicatorEnabledWrite4", tostring(state));
        end);
    end;
}):AddKeyPicker("fakeposkey", {
    Text = "fake position";
    Default = "";
    Mode = "Toggle";
    Callback = function()
        UpdateFeature("fakeposition", "fakeposkey", function(state)
            setfflag("NextGenReplicatorEnabledWrite4", tostring(state));
        end);
    end;
});
exploit1:AddToggle("hideweapononback", {
    Text = "hide weapon on back";
    Default = false;
    Callback = function(Value)
        if toggles.hideweapononback.Value then
            humanoid:EquipTool(localplayer.Backpack:GetChildren()[1]);
            task.wait();
            humanoid:UnequipTools();
            getgenv().hideweapon = Value;
        end;
    end;
});

-- main misc
mmisc:AddToggle("svs", {
    Text = "spoof vc status";
    Default = false;
    Tooltip = "join vc servers without vc";
    Callback = function(Value)
        getgenv().vcenabled = Value;
        network:FireServer("UpdateHasVc", true);
    end;
});
mmisc:AddToggle("Ragebot", {
	Text = "ragebot";
	Default = false;
	Callback = function()
		UpdateFeature("Ragebot", "ragebotkey", function(state)
			getgenv().ragebot = state;
		end);
	end;
}):AddKeyPicker("ragebotkey", {
	Text = "ragebot";
	Default = "";
	Callback = function()
		UpdateFeature("Ragebot", "ragebotkey", function(state)
			getgenv().ragebot = state;
		end);
	end;
});
mmisc:AddToggle("antimod", {
    Text = "anti mod";
    Default = false;
    Callback = function(Value)
        getgenv().antimod = Value;
    end;
});
mmisc:AddToggle("ShowRageBotTarget", {
	Text = "show ragebot target";
	Default = false;
	Callback = function(value)
		if not value then
			if RagebotHighlight then
				RagebotHighlight.Adornee = nil;
			end;
		end;
	end;
});
mmisc:AddSlider("RagebotDist", {
	Text = "ragebot distance";
	Default = 19;
	Min = 1;
	Max = 1000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
});
-- misc
misc:AddButton("get cat", function()
    network:FireServer("ExecuteCommand", "getCat", {})
end);
misc:AddButton("unlock emotes", function()
	local rodux = framework:GetState()
	for i, v in modules.Name["EmotesInOrder"] do
		if typeof(v) == "table" then
			rodux.OwnedEmotes[v.id] = 1
		end;
	end;
end);
misc:AddToggle("fno", {
    Text = "force network ownership";
    Default = false;
    Tooltip = "prevents rectify from affecting you";
    Callback = function(Value)
        getgenv().fno = Value;
    end;
});
misc:AddToggle("ip", {
	Text = "include position";
	Default = false;
	Callback = function(v)
		local maxhistory = 10
		local function connect(Character)
			ignorerespawn = true;
			poshistory = {};
			notowner = true;
			hasteleported = false;
			toolonloss = nil;
			if humanoid then
				if deathconn then
					deathconn:Disconnect();
				end
				deathconn = humanoid.Died:Connect(function()
					ignorerespawn = true;
				end);
			end;
			task.delay(0.25, function()
				ignorerespawn = false;
			end);
		end;
		if v and getgenv().fno then
			if deathconnection then return; end;
			deathconnection = localplayer.CharacterAdded:Connect(connect);
			if character then
				connect(character);
			end;
			if positionconnection then
				positionconnection:Disconnect();
			end;
			positionconnection = runservice.Heartbeat:Connect(function()
				if ignorerespawn then return; end;
				if not character then return; end;
				if not humanoidrootpart or not humanoidrootpart:IsDescendantOf(workspace) then return; end;
				local success, isowner = pcall(function()
					return isnetworkowner(humanoidrootpart);
				end);
				if not success then return; end;
				if isowner then
					local currentposition = humanoidrootpart.Position;
					if #poshistory == 0 or (currentposition - poshistory[#poshistory]).Magnitude > 0.001 then
						table.insert(poshistory, currentposition);
						if #poshistory > maxhistory then
							table.remove(poshistory, 1);
						end;
					end;
					if not notowner and not hasteleported then
						local teleportposition;
						if #poshistory >= 3 then
							teleportposition = poshistory[#poshistory - 2];
						elseif #poshistory > 0 then
							teleportposition = poshistory[1];
						else
							teleportposition = humanoidrootpart.Position;
						end;
						teleport(CFrame.new(teleportposition));
						hasteleported = true;
						task.delay(0.1, function()
							if toolonloss and toolonloss:IsDescendantOf(character) and humanoid then
								humanoid:EquipTool(toolonloss);
							end;
						end);
					end;
					notowner = true;
				else
					notowner = false;
					hasteleported = false;
					toolonloss = nil;
					for _, item in ipairs(character:GetChildren()) do
						if item:IsA("Tool") then
							toolonloss = item;
							break;
						end;
					end;
				end;
			end);
		else
			if positionconnection then
				positionconnection:Disconnect();
				positionconnection = nil;
			end
			if deathConn then
				deathConn:Disconnect();
				deathConn = nil;
			end
			if deathconnection then
				deathconnection:Disconnect();
				deathconnection = nil;
			end;
		end;
	end;
});
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
};
local cratenames = {};
for name, id in pairs(Crates) do
	table.insert(cratenames, name);
end;
table.sort(cratenames);
local SelectedCrateName = cratenames[1] or "";
local selectedamount = 1;
crates:AddDropdown("crates", {
	Text = "crates";
	Values = cratenames;
	Default = SelectedCrateName;
	Multi = false;
	Callback = function(v)
		SelectedCrateName = v;
	end;
});
crates:AddSlider("amount", {
	Text = "amount";
	Default = 1;
	Min = 1;
	Max = 10;
	Rounding = 0;
	Compact = true;
	Callback = function(value)
		selectedamount = math.floor(value);
	end;
})
crates:AddButton({
	Text = "Open Case";
	Func = function()
		local caseid = Crates[SelectedCrateName];
		if caseid then
			local success, response = network:InvokeServer("PurchaseCase", caseid, selectedamount);
			if success then
				setthreadidentity(2);
				modules.Name["ToastNotificationActionsClient"].add(
					"success",
					`Opened {tostring(selectedamount)} case(s) of {SelectedCrateName}`,
					2
				)(modules.Name["RoduxStore"].store);
				modules.Name["SoundHandler"].playSound({
					soundObject = ReplicatedStorage.Shared.Assets.Sounds.Success,
					parent = Workspace.Sounds,
				});
				setthreadidentity(7);
			else
				setthreadidentity(2);
				modules.Name["ToastNotificationActionsClient"].add(
					"error",
					response,
					2,
					true
				)(modules.Name["RoduxStore"].store);
				setthreadidentity(7);
			end
		else
			setthreadidentity(2);
			modules.Name["ToastNotificationActionsClient"].add(
				"error",
				"Please select a valid case from the dropdown.",
				2,
				true
			)(modules.Name["RoduxStore"].store);
			setthreadidentity(7);
		end;
	end;
});
miscauto:AddToggle("fastrespawn", {
    Text = "fast respawn";
    Default = false;
    Callback = function(Value)
        getgenv().fastrespawn = Value;
    end;
});
miscauto:AddToggle("ar", {
    Text = "auto revive";
    Default = false;
    Callback = function(Value)
        getgenv().ar = Value;
    end;
});
miscauto:AddToggle("loopspawn", {
    Text = "loop spawn";
    Default = false;
    Callback = function(Value)
        getgenv().loopspawn = Value;
    end;
});
function bestmatch(Input)
    if not Input or Input == "" then
        return nil;
    end;
    Input = Input:lower();
    for _, plr in ipairs(players:GetPlayers()) do
        if plr ~= localplayer then
            local namematch = plr.Name:lower():find(Input);
            local displaymatch = plr.DisplayName:lower():find(Input);
            if namematch or displaymatch then
                return plr;
            end;
        end;
    end;
    return nil;
end;

local currenttarget = misc1:AddLabel("current target: none");
local SelectedPlayer = nil;
misc1:AddInput("playersearch", {
    Text = "type player";
    PlaceholderText = "type name or display";
    Default = "";
    ClearTextOnFocus = false;
    Callback = function(Text)
        Text = Text:lower()
        local target = bestmatch(Text)
        if target then
            SelectedPlayer = target
            currenttarget:SetText("current target: " .. target.DisplayName .. " (@" .. target.Name .. ")")
        else
            SelectedPlayer = nil
            currenttarget:SetText("current target: none")
        end
    end;
});
local PlayerNames = {};
local function UpdatePlayerDropdown()
    table.clear(PlayerNames);
    for _, plr in ipairs(players:GetPlayers()) do 
        if plr ~= localplayer then
            table.insert(PlayerNames, plr.Name);
        end;
    end;
    if Options.PlayerDropdown then 
        Options.PlayerDropdown:SetValues(PlayerNames);
    end;
end;

misc1:AddDropdown("PlayerDropdown", {
    Values = PlayerNames;
    Default = nil;
    Multi = false;
    AllowNull = true;
    Text = "select player";
    Callback = function(Value)
        if Value and Value ~= "" then
            SelectedPlayer = game.Players:FindFirstChild(Value);
            if SelectedPlayer then
                currenttarget:SetText("current target: " .. SelectedPlayer.DisplayName .. " (@" .. SelectedPlayer.Name .. ")");
                if Options.playersearch then
                    Options.playersearch:SetValue(SelectedPlayer.Name);
                end;
            end;
        else
            SelectedPlayer = nil;
            currenttarget:SetText("current target: none");
            if Options.playersearch then
                Options.playersearch:SetValue("");
            end;
        end;
    end;
});
UpdatePlayerDropdown();
game.Players.PlayerAdded:Connect(function()
    task.wait(0.1);
    UpdatePlayerDropdown();
end);
game.Players.PlayerRemoving:Connect(function(plr)
    UpdatePlayerDropdown();
    if SelectedPlayer and SelectedPlayer == plr then
        SelectedPlayer = nil;
        currenttarget:SetText("current target: none");
        if Options.PlayerSearch then
            Options.PlayerSearch:SetValue("");
        end;
    end;
end);
misc1:AddButton("teleport", function()
	framework:Teleport(SelectedPlayer.Character.HumanoidRootPart.CFrame);
end);
misc1:AddButton("attempt kill", function()
	local targetplayer = SelectedPlayer;
	if not targetplayer then
		return;
	end;
	local realname = targetplayer.Name or targetplayer.Character.Name;
	local isnpc = false;
	local target = nil;
	if not targetplayer:IsA("Player") then
		local npcmodel = workspace.NPCs:FindFirstChild(realname);
		if npcmodel then
			isnpc = true;
			target = {
				Character = npcmodel;
				Name = npcmodel.Name;
			};
		else
			return;
		end;
	else
		target = targetplayer;
	end;
	if framework:InMenu(localplayer) then
		repeat task.wait(); until not framework:InMenu(localplayer);
	end;
	task.wait(0.1);
	if not getgenv().falldamage then
		local hrp = localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart");
		if hrp then
			hrp.CFrame = hrp.CFrame + Vector3.new(0, 1000, 0);
			task.wait(0.2);
			network:FireServer("StartFallDamage");
			hrp.CFrame = hrp.CFrame + Vector3.new(0, -1000, 0);
		end;
		getgenv().falldamage = true;
	end;
	local desync = false;
	local desyncthreadref = nil;
	local attachactive = true;
	local function startjitter(rootpart)
		if not rootpart or desyncthreadref then return; end;
		desync = true;
		local verticaloffset = 0.1;
		desyncthreadref = task.spawn(function()
			while desync and rootpart and rootpart.Parent do
				runservice.Heartbeat:Wait();
				local prevel = rootpart.AssemblyLinearVelocity;
				rootpart.AssemblyLinearVelocity = Vector3.new(math.random(-1500,1500), math.random(-300,300), math.random(-1500,1500));
				runservice.RenderStepped:Wait();
				if rootpart.Parent then
					rootpart.AssemblyLinearVelocity = prevel;
				end;
				runservice.Stepped:Wait();
				if rootpart.Parent then
					rootpart.AssemblyLinearVelocity = prevel + Vector3.new(0, verticaloffset, 0);
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
		local char = localplayer.Character;
		if not char or not char.Parent then
			char = localplayer.CharacterAdded:Wait();
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
	local heartbeatconn; heartbeatconn = runservice.Heartbeat:Connect(function()
		if not attachactive then
			heartbeatconn:Disconnect();
			return;
		end;
		local mychar, myroot, myhumanoid = getmychar();
		local targetchar, targetroot = gettargetchar();
		if myroot and myhumanoid and targetroot then
			local rootToUse = driver or myroot;
			rootToUse.CFrame = targetroot.CFrame;
			sethiddenproperty(rootToUse, "PhysicsRepRootPart", targetroot);
			local ragdollremote = myhumanoid:FindFirstChild("RagdollRemoteEvent") 
				or myhumanoid:WaitForChild("RagdollRemoteEvent");
			if ragdollremote then
				ragdollremote:FireServer(true);
			end;
			startjitter(rootToUse);
		end;
	end);
	task.spawn(function()
		while attachactive do
			if framework:InMenu(localplayer) then break; end;
			local _, myroot, myhumanoid = getmychar();
			local _, targetroot = gettargetchar();
			if not myhumanoid or myhumanoid.Health <= 0 then
				task.wait(0.1);
			else
				for i = 1, 50 do
					if framework:InMenu(localplayer) then break; end;
					if targetroot and targetroot.Parent then
						network:FireServer("TakeFallDamage", math.huge, Vector3.new(0, -1, 0), targetroot.Position);
					end;
					task.wait();
				end;
			end;
			task.wait(0.05);
		end;
		attachactive = false;
		stopjitter();
		if heartbeatconn then heartbeatconn:Disconnect(); end;
	end);
end);
misc1:AddButton("attempt fling", function()
	local target = SelectedPlayer
	if not target then return; end;
	local fling = true;
	local hbconn, velconn;
	local connections = {}
	local function stopFling()
		if not fling then return; end;
		fling = false;
		for _, conn in ipairs(connections) do
			if conn.Connected then
				conn:Disconnect();
			end;
		end;
		connections = {};
		if humanoidrootpart and humanoidrootpart.Parent then
			sethiddenproperty(humanoidrootpart, "PhysicsRepRootPart", humanoidrootpart)
			humanoidrootpart.Velocity = Vector3.zero;
			humanoidrootpart.RotVelocity = Vector3.zero;
		end;
	end;
	local function getrootandhumanoid(player)
		local char = player.Character;
		if not char then return; end;
		local hrp = char:FindFirstChild("HumanoidRootPart");
		local hum = char:FindFirstChildOfClass("Humanoid");
		if hrp and hum then
			return hrp, hum;
		end;
	end;
	local function fling()
		local targethrp, targethumanoid = getrootandhumanoid(target)
		if not targethrp or not targethumanoid or not humanoidrootpart then
			stopFling();
			return;
		end;
		table.insert(connections, targethumanoid.Died:Once(stopFling));
		table.insert(connections, humanoid.Died:Once(stopFling));
		table.insert(connections, target.CharacterAdded:Connect(stopFling));
		table.insert(connections, localplayer.CharacterAdded:Connect(stopFling));
		table.insert(connections, runservice.Heartbeat:Connect(function()
			if not fling then return; end;
			local newhrp, _ = getrootandhumanoid(target);
			if newhrp and humanoidrootpart and humanoidrootpart.Parent then
				sethiddenproperty(humanoidrootpart, "PhysicsRepRootPart", newhrp);
				humanoidrootpart.CFrame = newhrp.CFrame;
			end;
		end));
		table.insert(connections, runservice.Heartbeat:Connect(function()
			if not fling then return; end;
			if humanoidrootpart and humanoidrootpart.Parent then
				local vel = humanoidrootpart.Velocity;
				humanoidrootpart.Velocity = vel * 10000 + Vector3.new(0, 10000, 0);
				runservice.RenderStepped:Wait();
				humanoidrootpart.Velocity = vel + Vector3.new(0, 0.1, 0);
			end;
		end));
	end;
	fling();
end);
misc1:AddButton("whitelist", function()
    local playername = SelectedPlayer.Name;
    if not table.find(whitelist, playername) then
        table.insert(whitelist, playername);
        library:Notify(playername .. " whitelisted", 4);
    else
        library:Notify(playername .. " is already whitelisted", 4);
    end;
end);
misc1:AddButton("remove from whitelist", function()
    local playername = SelectedPlayer.Name;
    local index = table.find(whitelist, playername);
    if index then
        table.remove(whitelist, index);
        library:Notify(playername .. " unwhitelisted", 4);
    else
        library:Notify(playername .. " is not whitelisted", 4);
    end;
end);
local CanKillAll = false;
auto:AddToggle("loopkillall", {
	Text = "loop attempt kill all";
	Default = false;
	Callback = function(Value)
		getgenv().loopkillall = Value;
		if Value then
			if framework:InMenu(localplayer) then
				repeat
					task.wait();
				until not framework:InMenu(localplayer);
			end;
			task.wait(0.1);
			if not humanoidrootpart then
				return;
			end;
			CanKillAll = false;
			CanFireStartFallDamage = false;
			humanoidrootpart.CFrame = humanoidrootpart.CFrame + Vector3.new(0, 1000, 0);
			task.wait(0.2);
			network:FireServer("StartFallDamage");
			humanoidrootpart.CFrame = humanoidrootpart.CFrame + Vector3.new(0, -1000, 0);
			CanKillAll = true;
		else
			CanFireStartFallDamage = true;
			CanKillAll = false;
		end;
	end;
});

local Desync = false;
local desyncThreadRef = nil;
local function Jitter(rootPart)
	if not rootPart or desyncThreadRef then
		return;
	end;
	Desync = true;
	local verticalOffset = 0.1;
	desyncThreadRef = task.spawn(function()
		while Desync and rootPart and rootPart.Parent do
			runservice.Heartbeat:Wait();
			local previousVelocity = rootPart.AssemblyLinearVelocity;
			rootPart.AssemblyLinearVelocity = Vector3.new(
				math.random(-1500, 1500),
				math.random(-300, 300),
				math.random(-1500, 1500)
			);
			runservice.RenderStepped:Wait();
			if rootPart.Parent then
				rootPart.AssemblyLinearVelocity = previousVelocity;
			end;

			runservice.Stepped:Wait();
			if rootPart.Parent then
				rootPart.AssemblyLinearVelocity = previousVelocity + Vector3.new(0, verticalOffset, 0);
				verticalOffset = -verticalOffset;
			end;
		end;

		desyncThreadRef = nil;
	end);
end;

local function StopJitter()
	Desync = false;
end;

local function AttemptKillTarget(targetPlayer)
	if not targetPlayer then
		return;
	end;
	local myCharacter = character or localplayer.CharacterAdded:Wait();
	local myRoot = myCharacter:FindFirstChild("HumanoidRootPart");
	local myHumanoid = myCharacter:FindFirstChild("Humanoid");
	local targetCharacter = targetPlayer.Character or targetPlayer;
	local targetroot = targetCharacter:FindFirstChild("HumanoidRootPart");
	local targetHumanoid = targetCharacter:FindFirstChild("Humanoid");
	if not myRoot or not myHumanoid or not targetroot or not targetHumanoid then
		return;
	end;
	local ragdollRemoteEvent = myHumanoid:FindFirstChild("RagdollRemoteEvent")
		or myHumanoid:WaitForChild("RagdollRemoteEvent", 0.5);
	if ragdollRemoteEvent then
		ragdollRemoteEvent:FireServer(true);
	end;
	Jitter(myRoot);
	if framework:InMenu(localplayer) then
		StopJitter();
		return;
	end;
	while myHumanoid.Health > 0 do
		if framework:InMenu(localplayer) then
			StopJitter();
			break;
		end;
		AttachRoot = targetroot;
		for loopIndex = 1, 50 do
			if framework:InMenu(localplayer) then
				AttachRoot = nil;
				break;
			end;
			if targetroot and targetroot.Parent then
				network:FireServer("TakeFallDamage", math.huge, Vector3.new(0, -1, 0), targetroot.Position);
			end;
			task.wait();
		end;
	end;
	AttachRoot = nil;
	StopJitter();
end;
local isAliveFlag = true;
local function whitelisted(player)
    return table.find(whitelist, player.Name) ~= nil;
end;
local function StartKillLoop(character)
	local characterRoot = character:WaitForChild("HumanoidRootPart");
	local characterHumanoid = character:WaitForChild("Humanoid");
	isAliveFlag = true;
	characterHumanoid.Died:Connect(function()
		isAliveFlag = false;
	end);
	task.spawn(function()
		while isAliveFlag and characterHumanoid.Health > 0 do
			if not CanKillAll then
				AttachRoot = nil;
				task.wait(0.1);
				continue;
			end;
			if not getgenv().loopkillall then
				AttachRoot = nil;
				task.wait(0.1);
				continue;
			end;
			if framework:InMenu(localplayer) then
				AttachRoot = nil;
				task.wait(0.2);
				continue;
			end;
			for _, targetPlayer in ipairs(players:GetPlayers()) do
				if framework:InMenu(localplayer) then
					AttachRoot = nil;
					break;
				end;
				if targetPlayer == localplayer then
					continue;
				end;
				if framework:InMenu(targetPlayer) then
					continue;
				end;
                if whitelisted(targetPlayer) then
                    continue;
                end;
				local targetChar = targetPlayer.Character;
				if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
					continue;
				end;
				if not targetChar:FindFirstChild("Humanoid") then
					continue;
				end;
				if targetChar.Humanoid.Health <= 0 then
					continue;
				end;
				if targetChar:FindFirstChildOfClass("ForceField") then
					continue;
				end;
				task.spawn(function()
					while
						isAliveFlag
						and getgenv().loopkillall
						and targetChar.Parent
						and targetChar.Humanoid.Health > 0
					do
						if framework:InMenu(localplayer) then
							break;
						end;
						local rootToUse = driver or humanoidrootpart;
						AttachRoot = targetPlayer.Character.HumanoidRootPart;
						if rootToUse and AttachRoot then
							rootToUse.CFrame = AttachRoot.CFrame;
							sethiddenproperty(rootToUse, "PhysicsRepRootPart", AttachRoot);
						end;
						AttemptKillTarget(targetPlayer);
						task.wait(0.05);
					end;
				end);
				task.wait(0.1);
			end;
			task.wait(0.2);
		end;
	end);
end;
if localplayer.Character then
	StartKillLoop(localplayer.Character);
end;
localplayer.CharacterAdded:Connect(StartKillLoop);
runservice.Heartbeat:Connect(function(dt)
	if humanoidrootpart then
		if AttachRoot then
			local rootToUse = driver or humanoidrootpart;
			rootToUse.CFrame = AttachRoot.CFrame;
			sethiddenproperty(rootToUse, "PhysicsRepRootPart", AttachRoot);
		end;
	end;
end);
local CachedPlayers = {};
local function UpdateCachedPlayers()
	CachedPlayers = {};
	for _, v in players:GetPlayers(players) do
		if v ~= localplayer then
			table.insert(CachedPlayers, v);
		end;
	end;
end;
UpdateCachedPlayers();
players.PlayerAdded:Connect(function()
	UpdateCachedPlayers();
end);
players.PlayerRemoving:Connect(function()
	UpdateCachedPlayers();
end);
auto:AddToggle("loopflingall", {
	Text = "loop attempt fling all";
	Default = false;
	Callback = function(Value)
		if Value then
			if framework:InMenu(localplayer) then
				repeat task.wait() until not framework:InMenu(localplayer);
			end;
			task.wait(0.05);
			CanFlingAll = true;
			task.spawn(function()
				while CanFlingAll do
					if framework:InMenu(localplayer) then
						repeat task.wait() until not framework:InMenu(localplayer);
					end;
					local Character = character;
					if not humanoidrootpart then
						task.wait(0.1);
						continue;
					end;
					local playercount = 0;
					for i = 1, #CachedPlayers do
						local Player = CachedPlayers[i];
						if not Player or not Player.Parent then continue; end;
						if not CanFlingAll then break; end;
						if framework:InMenu(Player) then continue; end;
						local Char = Player.Character;
						local targetroot = Char:FindFirstChild("HumanoidRootPart");
						if targetroot then
							local targetpos = targetroot.Position;
							if targetpos.Y > 280 then
								continue;
							end;
							local maxyaxis = (targetpos * Vector3.new(1, 0, 1)).Magnitude;
							if maxyaxis > 1200 then
								continue;
							end;
                            if table.find(whitelist, Player.Name) then
                                continue;
                            end;
							playercount = playercount + 1;
							local movel = 0.1;
							local start = tick();
							while CanFlingAll and tick() - start < 0.15 do
								if framework:InMenu(Framework,Player) then break; end;
								if not humanoidrootpart.Parent or not targetroot.Parent then break; end;
								humanoidrootpart.CFrame = targetroot.CFrame;
								sethiddenproperty(humanoidrootpart, "PhysicsRepRootPart", targetroot);
								local vel = humanoidrootpart.Velocity;
								humanoidrootpart.Velocity = vel * 150000 + Vector3.new(0, 150000, 0);
								runservice.RenderStepped:Wait();
								humanoidrootpart.Velocity = vel + Vector3.new(0, movel, 0);
								movel = -movel;
								runservice.Heartbeat:Wait();
							end;
						end;
					end;
					if playercount == 0 then
						task.wait(0.5);
					end;
				end;
			end);
		else
			CanFlingAll = false;
			return;
		end;
	end;
});
auto:AddToggle("autostomp", {
    Text = "auto stomp";
    Default = false;
    Callback = function(Value)
        getgenv().autostompshove = Value;
    end;
});
auto:AddToggle("autoglory", {
    Text = "auto glory";
    Default = false;
    Callback = function(Value)
        getgenv().autoglory = Value;
    end;
});
auto:AddToggle("BeartrapEnemy", {
	Text = "beartrap enemy";
	Default = false;
	Callback = function(v)
		getgenv().BeartrapEnemy = v;
	end;
});
auto:AddToggle("AutoAttachC4", {
	Text = "auto attach c4";
	Default = false;
	Callback = function(v)
		getgenv().AutoAttachC4 = v;
	end;
});
auto:AddToggle("AutoDetonateC4", {
	Text = "auto detonate c4";
	Default = false;
	Callback = function(v)
		getgenv().AutoDetonateC4 = v;
	end;
});
auto:AddSlider("stomprange", {
    Text = "stomp range";
    Default = 10;
    Min = 1;
    Max = 10;
    Rounding = 0;
    Compact = true;
	Callback = function(Value)
		getgenv().stompshoverange = Value;
	end;
});
auto:AddSlider("glorydelay", {
    Text = "glory delay";
    Default = 0.5;
    Min = 0.1;
    Max = 1;
    Rounding = 1;
    Compact = true;
	Callback = function(Value)
		getgenv().glorydelay = Value;
	end;
});
auto:AddSlider("gloryrange", {
    Text = "glory range";
    Default = 10;
    Min = 1;
    Max = 10;
    Rounding = 1;
    Compact = true;
	Callback = function(Value)
		getgenv().glorydelay = Value;
	end;
});
-- visuals tab
local visuals = tabs.visuals;
local espsection = visuals:AddLeftGroupbox("esp");
local lightingsection = visuals:AddRightGroupbox("lightning");
local lightingsection1 = visuals:AddRightGroupbox("fog")
local Lighting = game:GetService("Lighting");
local Map = workspace:FindFirstChild("Map");
if not Lighting:FindFirstChild("atmosphere") then
	Instance.new("Atmosphere", Lighting).Name = "atmosphere";
end;
local originalAtmosphere = {
	Density = Lighting.atmosphere.Density,
	Decay = Lighting.atmosphere.Decay,
	Offset = Lighting.atmosphere.Offset,
	Glare = Lighting.atmosphere.Glare,
	Haze = Lighting.atmosphere.Haze,
};

-- Skyboxes
local Skyboxes = {
	None = {},
	Nebula = {
		SkyboxBk = "rbxassetid://159454299",
		SkyboxDn = "rbxassetid://159454296",
		SkyboxFt = "rbxassetid://159454293",
		SkyboxLf = "rbxassetid://159454286",
		SkyboxRt = "rbxassetid://159454300",
		SkyboxUp = "rbxassetid://159454288",
	},
	Vaporwave = {
		SkyboxBk = "rbxassetid://1417494030",
		SkyboxDn = "rbxassetid://1417494146",
		SkyboxFt = "rbxassetid://1417494253",
		SkyboxLf = "rbxassetid://1417494402",
		SkyboxRt = "rbxassetid://1417494499",
		SkyboxUp = "rbxassetid://1417494643",
	},
	Clouds = {
		SkyboxBk = "rbxassetid://570557514",
		SkyboxDn = "rbxassetid://570557775",
		SkyboxFt = "rbxassetid://570558157",
		SkyboxLf = "rbxassetid://570551248",
		SkyboxRt = "rbxassetid://570557727",
		SkyboxUp = "rbxassetid://570558036",
	},
	Twilight = {
		SkyboxBk = "rbxassetid://2649648296",
		SkyboxDn = "rbxassetid://2649648296",
		SkyboxFt = "rbxassetid://2649648296",
		SkyboxLf = "rbxassetid://2649648296",
		SkyboxRt = "rbxassetid://2649648296",
		SkyboxUp = "rbxassetid://2649648296",
	},
};

-- Lighting UI Elements
lightingsection:AddToggle("Ambience", {
	Text = "world ambience";
	Default = false;
	Tooltip = "Changes ambience";
}):AddColorPicker("AmbienceColor", {
	Default = Color3.new(1, 1, 1);
	Title = "Ambience Color";
	Transparency = 0;
});

lightingsection:AddToggle("ColorCorrection", {
	Text = "color correction";
	Default = false;
	Tooltip = "Changes Color Correction";
}):AddColorPicker("ColorCorrectionColor", {
	Default = Color3.new(1, 1, 1);
	Title = "Color Correction Color";
	Transparency = 0;
});

lightingsection:AddDropdown("Skybox", {
	Text = "skybox";
	Default = "None";
	Values = {"None", "Nebula", "Vaporwave", "Clouds", "Twilight"};
	Tooltip = "Changes Skybox";
});

lightingsection:AddToggle("ClockTime", {
	Text = "clock time";
	Default = false;
	Tooltip = "Changes Clock Time";
});

lightingsection:AddToggle("MaxZoom", {
	Text = "max zoom";
	Default = false;
	Tooltip = "Changes Max Zoom";
});

lightingsection:AddToggle("FieldOfView", {
	Text = "field of view";
	Default = false;
	Tooltip = "Changes FOV";
	Callback = function(Value)
		if not Value then
			camera.FieldOfView = 70;
		end;
	end;
});

lightingsection:AddToggle("NoclipCam", {
	Text = "noclip cam";
	Default = false;
	Tooltip = "Enables camera noclip";
	Callback = function(Value)
		local sc = (debug and debug.setconstant) or setconstant;
		local gc = (debug and debug.getconstants) or getconstants;
		local getgc = (debug and debug.getgc) or getgc;
		local playerScripts = localplayer.PlayerScripts;
		local popper = playerScripts.PlayerModule
			and playerScripts.PlayerModule.CameraModule
			and playerScripts.PlayerModule.CameraModule.ZoomController
			and playerScripts.PlayerModule.CameraModule.ZoomController.Popper;
		local targetValueForNoclipCamOn = 0;
		local targetValueForNoclipCamOff = 0.25;
		local valueToSet = Value and targetValueForNoclipCamOn or targetValueForNoclipCamOff;
		local modified = false;
		for _, v in pairs(getgc()) do
			if type(v) == "function" and getfenv(v).script == popper then
				for i, v1 in pairs(gc(v)) do
					if tonumber(v1) == targetValueForNoclipCamOn or tonumber(v1) == targetValueForNoclipCamOff then
						if tonumber(v1) ~= valueToSet then
							sc(v, i, valueToSet);
							modified = true;
							break;
						end;
					end;
				end;
			end;
			if modified then
				break;
			end;
		end;
	end;
});

lightingsection:AddToggle("Brightness", {
	Text = "brightness";
	Default = false;
	Tooltip = "Changes Brightness";
});

lightingsection:AddToggle("Environmental", {
	Text = "environmental";
	Default = false;
	Tooltip = "Changes Environmental Effects";
});

lightingsection:AddToggle("Exposure", {
	Text = "exposure compensation";
	Default = false;
	Tooltip = "Changes Exposure Effects";
});

lightingsection:AddSlider("Time", {
	Text = "time";
	Default = 12;
	Min = 1;
	Max = 24;
	Rounding = 0;
	Compact = true;
	Tooltip = "The time for Clock Time";
});

lightingsection:AddSlider("FOVLighting", {
	Text = "fov value";
	Default = 70;
	Min = 1;
	Max = 120;
	Rounding = 0;
	Compact = true;
	Tooltip = "Your field of view";
});

lightingsection:AddSlider("BrightnessValue", {
	Text = "brightness";
	Default = 2;
	Min = 1;
	Max = 10;
	Rounding = 0;
	Compact = true;
	Tooltip = "How bright you want it to be";
});

lightingsection:AddSlider("ExposureValue", {
	Text = "exposure";
	Default = 0;
	Min = 0;
	Max = 10;
	Rounding = 1;
	Compact = true;
	Tooltip = "Exposure scale";
});

lightingsection:AddSlider("EnvironmentValue", {
	Text = "diffuse % specular";
	Default = 1;
	Min = 0;
	Max = 1;
	Rounding = 1;
	Compact = true;
	Tooltip = "Effect Scale";
});

lightingsection:AddSlider("MaxZoomVal", {
	Text = "max zoom value";
	Default = 24;
	Min = 1;
	Max = 1000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
	Tooltip = "How far you want to zoom out to";
});


lightingsection1:AddToggle("Fog", {
	Text = "fog";
	Default = false;
	Tooltip = "Enables Fog";
}):AddColorPicker("FogColor", {
	Default = Color3.new(1, 1, 1);
	Title = "Fog Color";
	Transparency = 0;
});

lightingsection1:AddSlider("Density", {
	Text = "density";
	Default = 1;
	Min = 0;
	Max = 1;
	Rounding = 2;
	Compact = true;
	Tooltip = "Fog Density";
});

lightingsection1:AddSlider("Glare", {
	Text = "glare";
	Default = 0;
	Min = 0;
	Max = 10;
	Rounding = 0;
	Compact = true;
	Tooltip = "Fog Glare";
});

lightingsection1:AddSlider("Haze", {
	Text = "haze";
	Default = 0;
	Min = 0;
	Max = 10;
	Rounding = 0;
	Compact = true;
	Tooltip = "Fog Haze";
});

-- Add lighting to Classes table
if not Classes.Ambience then
	Classes.Ambience = Toggles.Ambience;
	Classes.AmbienceColor = Options.AmbienceColor;
	Classes.ColorCorrection = Toggles.ColorCorrection;
	Classes.ColorCorrectionColor = Options.ColorCorrectionColor;
	Classes.Skybox = Options.Skybox;
	Classes.ClockTime = Toggles.ClockTime;
	Classes.MaxZoom = Toggles.MaxZoom;
	Classes.FieldOfView = Toggles.FieldOfView;
	Classes.NoclipCam = Toggles.NoclipCam;
	Classes.Brightness = Toggles.Brightness;
	Classes.Environmental = Toggles.Environmental;
	Classes.Exposure = Toggles.Exposure;
	Classes.Time = Options.Time;
	Classes.FOVLighting = Options.FOVLighting;
	Classes.BrightnessValue = Options.BrightnessValue;
	Classes.ExposureValue = Options.ExposureValue;
	Classes.EnvironmentValue = Options.EnvironmentValue;
	Classes.MaxZoomVal = Options.MaxZoomVal;
	Classes.Fog = Toggles.Fog;
	Classes.FogColor = Options.FogColor;
	Classes.Density = Options.Density;
	Classes.Glare = Options.Glare;
	Classes.Haze = Options.Haze;
end;

-- Lighting implementation
local FOVConnection;
FOVConnection = camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
	if not Active then
		FOVConnection:Disconnect();
		return;
	end;
	if Classes.FieldOfView.Value then
		camera.FieldOfView = Classes.FOVLighting.Value;
	end;
end);

local ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
	or Instance.new("ColorCorrectionEffect");
ColorCorrection.Parent = Lighting;
local OldCorrection = ColorCorrection.TintColor;
local OldAmbience = Lighting.OutdoorAmbient;
local OldAmbience2 = Lighting.Ambient;
local OldDiffuse = Lighting.EnvironmentDiffuseScale;
local OldDiffuse2 = Lighting.EnvironmentSpecularScale;
local OldBrightness = Lighting.Brightness;
local OldExposure = Lighting.ExposureCompensation;
local OldClock = Lighting.ClockTime;
local OldZoom = localplayer.CameraMaxZoomDistance;

if Map then
	Map.ChildAdded:Connect(function(map)
		task.wait(3);
		if map:GetAttribute("MapId") then
			ColorCorrection = Lighting:FindFirstChildOfClass("ColorCorrectionEffect")
				or Instance.new("ColorCorrectionEffect");
			ColorCorrection.Parent = Lighting;
			OldCorrection = ColorCorrection.TintColor;
			OldAmbience = Lighting.OutdoorAmbient;
			OldAmbience2 = Lighting.Ambient;
			OldDiffuse = Lighting.EnvironmentDiffuseScale;
			OldDiffuse2 = Lighting.EnvironmentSpecularScale;
			OldBrightness = Lighting.Brightness;
			OldExposure = Lighting.ExposureCompensation;
			OldClock = Lighting.ClockTime;
			OldZoom = localplayer.CameraMaxZoomDistance;
		end;
	end);
end;

OldCorrection = ColorCorrection.TintColor;

framework:BindToRenderStep(
	LPH_NO_VIRTUALIZE(function()
		if not Lighting:FindFirstChild("atmosphere") then
			Instance.new("Atmosphere", Lighting).Name = "atmosphere";
		end;

		local Sky = Lighting:FindFirstChildOfClass("Sky");
		if not Sky then
			return;
		end;

		local Skybox = Skyboxes[Classes.Skybox.Value];
		if Skybox then
			for i, v in next, Skybox do
				Sky[i] = v;
			end;
		end;

		if Classes.FieldOfView.Value then
			camera.FieldOfView = Classes.FOVLighting.Value;
		end;

		if Classes.Fog.Value then
			Lighting.atmosphere.Density = Classes.Density.Value;
			Lighting.atmosphere.Decay = Classes.FogColor.Value or Color3.new(1, 1, 1);
			Lighting.atmosphere.Offset = 1;
			Lighting.atmosphere.Glare = Classes.Glare.Value;
			Lighting.atmosphere.Haze = Classes.Haze.Value;
		else
			for i, v in pairs(originalAtmosphere) do
				Lighting.atmosphere[i] = v;
			end;
		end;

		if Classes.Ambience.Value then
			Lighting.OutdoorAmbient = Classes.AmbienceColor.Value or Color3.new(1, 1, 1);
			Lighting.Ambient = Classes.AmbienceColor.Value or Color3.new(1, 1, 1);
		else
			Lighting.OutdoorAmbient = OldAmbience;
			Lighting.Ambient = OldAmbience2;
		end;

		if Classes.MaxZoom.Value then
			localplayer.CameraMaxZoomDistance = Classes.MaxZoomVal.Value;
		else
			localplayer.CameraMaxZoomDistance = OldZoom;
		end;

		if Classes.ClockTime.Value then
			Lighting.ClockTime = Classes.Time.Value;
		else
			Lighting.ClockTime = OldClock;
		end;

		if Classes.ColorCorrection.Value then
			ColorCorrection.Enabled = true;
			ColorCorrection.TintColor = Classes.ColorCorrectionColor.Value or Color3.new(1, 1, 1);
		else
			ColorCorrection.Enabled = false;
			ColorCorrection.TintColor = OldCorrection;
		end;

		if Classes.Brightness.Value then
			Lighting.Brightness = Classes.BrightnessValue.Value;
		else
			Lighting.Brightness = OldBrightness;
		end;

		if Classes.Environmental.Value then
			Lighting.EnvironmentDiffuseScale = Classes.EnvironmentValue.Value;
			Lighting.EnvironmentSpecularScale = Classes.EnvironmentValue.Value;
		else
			Lighting.EnvironmentDiffuseScale = OldDiffuse;
			Lighting.EnvironmentSpecularScale = OldDiffuse2;
		end;

		if Classes.Exposure.Value then
			Lighting.ExposureCompensation = Classes.ExposureValue.Value;
		else
			Lighting.ExposureCompensation = OldExposure;
		end;
	end),
	nil,
	Enum.RenderPriority.Last
);

espsection:AddToggle("ESP", {
	Text = "enabled";
	Default = false;
	Tooltip = "Show enemies locations";
});
espsection:AddSlider("ESPMaxDistance", {
	Text = "max distance";
	Default = 5000;
	Min = 250;
	Max = 5000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
	Tooltip = "How far does the ESP goes";
});
espsection:AddToggle("Boxes", {
	Text = "box";
	Default = false;
	Tooltip = "Show enemies location as boxes";
}):AddColorPicker("BoxColor", {
	Default = Color3.new(1, 1, 1);
	Title = "Box Color";
	Transparency = 0;
});
espsection:AddToggle("Names", {
	Text = "name";
	Default = false;
	Tooltip = "Show enemies names";
}):AddColorPicker("NameColor", {
	Default = Color3.new(1, 1, 1);
	Title = "Name Color";
	Transparency = 0;
});
espsection:AddToggle("Tracer", {
	Text = "tracer";
	Default = false;
	Tooltip = "Show enemy tracers";
}):AddColorPicker("TracerColor", {
	Default = Color3.new(1, 1, 1);
	Title = "Tracer Color";
	Transparency = 0;
});
espsection:AddSlider("TracerMaxDist", {
	Text = "tracer length";
	Default = 500;
	Min = 100;
	Max = 1000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
	Tooltip = "Maximum distance to show tracer";
});
espsection:AddDropdown("TracerOrigin", {
	Text = "tracer origin";
	Default = "Bottom";
	Values = {"Bottom", "Cursor"};
	Tooltip = "Where tracers originate from";
});
espsection:AddToggle("TracerAutoSelect", {
	Text = "tracer autoselect";
	Default = false;
	Tooltip = "Only show tracer for closest player to cursor";
});
espsection:AddSlider("TracerAutoSelectDistance", {
	Text = "autoselect distance";
	Default = 500;
	Min = 100;
	Max = 2000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
	Tooltip = "Maximum distance for autoselect";
});
espsection:AddSlider("TracerLerp", {
	Text = "tracer lerp speed";
	Default = 1;
	Min = 0.01;
	Max = 1;
	Rounding = 2;
	Compact = true;
	Tooltip = "Higher is faster (1x to 0.01x)";
});
espsection:AddToggle("Health", {
	Text = "health";
	Default = false;
	Tooltip = "Show enemies health";
}):AddColorPicker("HealthColor", {
	Default = Color3.fromRGB(0, 255, 0);
	Title = "Health Color";
	Transparency = 0;
});
espsection:AddToggle("Indicators", {
	Text = "indicators";
	Default = false;
	Tooltip = "Show indicators";
});
espsection:AddToggle("SwingCooldown", {
	Text = "swing cooldown";
	Default = false;
	Tooltip = "Show swing cooldown";
});
espsection:AddToggle("ParryCooldown", {
	Text = "parry cooldown";
	Default = false;
	Tooltip = "Show parry cooldown";
});
espsection:AddDropdown("ESPTypes", {
	Text = "indicators types";
	Default = "None";
	Values = {"None", "Tool", "Distance", "Both"};
	Tooltip = "Type of Indicator";
});
espsection:AddToggle("OutOfFOV", {
	Text = "enabled";
	Default = false;
	Tooltip = "Show enemies that are out of your field of view";
});
espsection:AddSlider("OutFOVSize", {
	Text = "size";
	Default = 15;
	Min = 10;
	Max = 15;
	Rounding = 0;
	Compact = true;
	Tooltip = "How big the indicator is";
});
espsection:AddSlider("OutFOVOffset", {
	Text = "offset";
	Default = 400;
	Min = 100;
	Max = 700;
	Rounding = 0;
	Compact = true;
	Tooltip = "The offset of the indicator";
});
espsection:AddDropdown("OFFSettings", {
	Text = "settings";
	Default = "None";
	Values = {"None", "Outline", "Blinking", "Both"};
	Tooltip = "Type of indicator";
});
espsection:AddToggle("UtilityESP", {
	Text = "enabled";
	Default = false;
	Tooltip = "Show utilities locations";
});
espsection:AddSlider("UtilityESPMaxDistance", {
	Text = "max distance";
	Default = 5000;
	Min = 250;
	Max = 5000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
	Tooltip = "How far does the ESP goes";
});
espsection:AddToggle("C4", {
	Text = "c4";
	Default = false;
	Tooltip = "Show C4";
});
espsection:AddToggle("Grenade", {
	Text = "grenade";
	Default = false;
	Tooltip = "Show grenades";
});
espsection:AddToggle("Claymore", {
	Text = "claymore";
	Default = false;
	Tooltip = "Show claymore";
});
espsection:AddToggle("Beartrap", {
	Text = "bear trap";
	Default = false;
	Tooltip = "Show Bear Trap";
});

-- Global ragebot target for tracer override (shared between ESP and Ragebot)
local currentRagebotTarget = nil;

-- FOV Circles (declared globally for ESP and Ragebot access)
local FOVCircleSilent = Drawing.new("Circle");
local FOVCircleAimbot = Drawing.new("Circle");
FOVCircleSilent.Visible = false;
FOVCircleAimbot.Visible = false;
FOVCircleSilent.Transparency = 1;
FOVCircleAimbot.Transparency = 1;
FOVCircleSilent.Color = Color3.new(1, 1, 1);
FOVCircleAimbot.Color = Color3.new(1, 1, 1);
FOVCircleSilent.Thickness = 1;
FOVCircleAimbot.Thickness = 1;
FOVCircleSilent.NumSides = 64;
FOVCircleAimbot.NumSides = 64;

-- ESP Implementation
do
	-- Add ESP entries to Classes table
	if not Classes.ESP then
		Classes.ESP = Toggles.ESP;
		Classes.ESPMaxDistance = Options.ESPMaxDistance;
		Classes.Boxes = Toggles.Boxes;
		Classes.BoxColor = Options.BoxColor;
		Classes.Names = Toggles.Names;
		Classes.NameColor = Options.NameColor;
		Classes.Tracer = Toggles.Tracer;
		Classes.TracerColor = Options.TracerColor;
		Classes.TracerMaxDist = Options.TracerMaxDist;
		Classes.TracerOrigin = Options.TracerOrigin;
		Classes.TracerAutoSelect = Toggles.TracerAutoSelect;
		Classes.TracerAutoSelectDistance = Options.TracerAutoSelectDistance;
		Classes.TracerLerp = Options.TracerLerp;
		Classes.Health = Toggles.Health;
		Classes.HealthColor = Options.HealthColor;
		Classes.Indicators = Toggles.Indicators;
		Classes.SwingCooldown = Toggles.SwingCooldown;
		Classes.ParryCooldown = Toggles.ParryCooldown;
		Classes.ESPTypes = Options.ESPTypes;
		Classes.OutOfFOV = Toggles.OutOfFOV;
		Classes.OutFOVSize = Options.OutFOVSize;
		Classes.OutFOVOffset = Options.OutFOVOffset;
		Classes.OFFSettings = Options.OFFSettings;
		Classes.UtilityESP = Toggles.UtilityESP;
		Classes.UtilityESPMaxDistance = Options.UtilityESPMaxDistance;
		Classes.C4 = Toggles.C4;
		Classes.Grenade = Toggles.Grenade;
		Classes.Claymore = Toggles.Claymore;
		Classes.Beartrap = Toggles.Beartrap;
	end

	-- ESP Variables
	local PlayerDrawings = {}
	local UtilityDrawings = {}
	local PlrConnections = {}
	local TracerPoints = {}
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
			Color = Color3.new(1, 1, 1),
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

	-- Utility colors
	local UtilityColors = {
		C4 = Color3.fromRGB(255, 0, 0),
		Grenade = Color3.fromRGB(0, 255, 0),
		Claymore = Color3.fromRGB(255, 255, 0),
		Beartrap = Color3.fromRGB(255, 128, 0),
	}

	-- Animation tracking
	local animations = {}
	local blacklist = {
		"rbxassetid://106649093705106",
		"rbxassetid://6423003415",
		"rbxassetid://101463478179793",
	}

	if modules.Name["WeaponMetadata"] then
		for i, v in pairs(modules.Name["WeaponMetadata"]) do
			if v.slashMetadata then
				for _, data in pairs(v.slashMetadata) do
					if data.animation and data.animation.AnimationId and not table.find(blacklist, data.animation.AnimationId) then
						table.insert(animations, data.animation.AnimationId)
					end
				end
			end
		end
	end

	-- Base64 images for cooldowns
	local base64 = base64 or (crypt and crypt.base64)
	local SwingImage = "iVBORw0KGgoAAAANSUhEUgAAAgAAAAIACAYAAAD0eNT6AAAAAXNSR0IArs4c6QAAIABJREFUeF7t3Qn8fvWY//H31b7vlLRRhCzJEpkSBjPtuyRJJioxyjCyzISMZey0DEa2CkVopbSrZGyZSUophBCKVFqu//3R+f59+/X9fX/3fe5zzmd7necjRw465/O5rud1fr9z3fc9nHM="
	local ParryImage = "iVBORw0KGgoAAAANSUhEUgAAAaQAAAGkCAYAAAB+TFE1AAAgAElEQVR4Ae2dB7gsRdW1QXLOGUmSM0iWnAUEQYIEAZEokkSyEgxIEBMGUD8BlaAiiCAiSI4iQZGgSJQcJKgYv/8flwkrtd9qKtkAAAAASUVORK5CYII="
	
	if base64 then
		SwingImage = base64.decode(SwingImage)
		ParryImage = base64.decode(ParryImage)
	end

	-- Helper function to create drawings
	local function New(Type, Outline, Name)
		local drawing = Drawing.new(Type)
		drawing.Visible = false
		
		local settings = ESPSettings[Type]
		if settings then
			for key, value in pairs(settings) do
				if drawing[key] ~= nil then
					drawing[key] = value
				end
			end
		end
		
		if Type == "Square" then
			drawing.Size = Vector2.new(100, 100)
			drawing.Position = Vector2.new(0, 0)
		elseif Type == "Line" then
			drawing.From = Vector2.new(0, 0)
			drawing.To = Vector2.new(0, 0)
		elseif Type == "Text" then
			drawing.Text = ""
		elseif Type == "Triangle" then
			drawing.PointA = Vector2.new(0, 0)
			drawing.PointB = Vector2.new(0, 0)
			drawing.PointC = Vector2.new(0, 0)
			drawing.Transparency = 1
		elseif Type == "Image" then
			drawing.Data = ""
			drawing.Size = Vector2.new(20, 20)
			drawing.Position = Vector2.new(0, 0)
			drawing.Transparency = 1
		end
		
		if Outline and Type == "Square" then
			drawing.Color = Color3.new(0, 0, 0)
			drawing.Thickness = 3
		end
		
		return drawing
	end

	-- Add player to ESP
	local function Add(Player)
		if not PlayerDrawings[Player] then
			if not PlrConnections[Player] then
				PlrConnections[Player] = {}
			end

			local function check(char)
				if not char or char:GetAttribute("AlreadyFoundParry") then
					return
				end
				for i, v in pairs(char:GetChildren()) do
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
				local Configuration = modules.Name["WeaponMetadata"] and modules.Name["WeaponMetadata"][Tool:GetAttribute("ItemId")]
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
					local animator = Hum:FindFirstChildOfClass("Animator")
					if animator then
						table.insert(
							PlrConnections[Player],
							animator.AnimationPlayed:Connect(function(track)
								if track.Animation and track.Animation.AnimationId and table.find(animations, track.Animation.AnimationId) then
									Player:SetAttribute("LastSwing", tick())
								end
							end)
						)
					end
				end)
			)

			local Character = Player.Character
			local LastSwing = New("Image", nil, "LastSwing")
			local LastParry = New("Image", nil, "LastParry")
			if SwingImage then LastSwing.Data = SwingImage end
			if ParryImage then LastParry.Data = ParryImage end

			local Root = Character and Character:FindFirstChild("HumanoidRootPart")
			local Hum = Root and Character:FindFirstChild("Humanoid")

			if Character then
				for i, v in pairs(Character:GetChildren()) do
					OnNewTool(v)
				end
				check(Character)
				table.insert(PlrConnections[Player], Character.ChildAdded:Connect(OnNewTool))
				if Hum then
					local animator = Hum:FindFirstChildOfClass("Animator")
					if animator then
						table.insert(
							PlrConnections[Player],
							animator.AnimationPlayed:Connect(function(track)
								if track.Animation and track.Animation.AnimationId and table.find(animations, track.Animation.AnimationId) then
									Player:SetAttribute("LastSwing", tick())
								end
							end)
						)
					end
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
				Tracer = New("Line", nil, "Tracer"),
				TracerOutline = New("Line", nil, "TracerOutline"),
				Swing = LastSwing,
				Parry = LastParry,
				RootPart = Root,
				Humanoid = Hum,
			}
		end
	end

	-- Add utility to ESP
	local function AddUtility(Utility, Name)
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

	-- Initialize players
	for _, Player in pairs(players:GetPlayers()) do
		if Player ~= localplayer then
			Add(Player)
		end
	end

	players.PlayerAdded:Connect(Add)
	players.PlayerRemoving:Connect(function(Player)
		if PlayerDrawings[Player] then
			for i, v in pairs(PlayerDrawings[Player]) do
				if v and i ~= "RootPart" and i ~= "Humanoid" then
					v:Remove()
				end
			end
			if PlrConnections[Player] and next(PlrConnections[Player]) then
				for i, v in pairs(PlrConnections[Player]) do
					v:Disconnect()
				end
			end
			PlayerDrawings[Player] = nil
		end
	end)

	-- Utility detection
	local function Check(Utility)
		if Utility.Name == "PlacedClaymore" then
			AddUtility(Utility, "Claymore")
		elseif Utility.Name == "utility7Proxy" then
			AddUtility(Utility, "C4")
		elseif Utility.Name == "utility5Proxy" then
			AddUtility(Utility, "Grenade")
		elseif Utility.Name == "OpenBearTrap" then
			AddUtility(Utility, "Bear Trap")
		end
	end

	local Map = workspace:FindFirstChild("Map")
	local EffectsJunk = workspace:FindFirstChild("EffectsJunk")
	
	if Map then
		for i, v in pairs(Map:GetChildren()) do
			Check(v)
		end
		Map.ChildAdded:Connect(function(Utility)
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
	end

	if EffectsJunk then
		for i, v in pairs(EffectsJunk:GetChildren()) do
			Check(v)
		end
		EffectsJunk.ChildAdded:Connect(function(Utility)
			Check(Utility)
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
	end

	-- Rotate function for out of FOV
	local function Rotate(point, center, angle)
		angle = math.rad(angle)
		return Vector2.new(
			math.floor(math.cos(angle) * (point.X - center.X) - math.sin(angle) * (point.Y - center.Y) + center.X),
			math.floor(math.sin(angle) * (point.X - center.X) + math.cos(angle) * (point.Y - center.Y) + center.Y)
		)
	end

	-- Draw utility function
	local function DrawUtility(Name, Box, BoxOutline, Distance, ObjectName, BoxSize, BoxPos, Dist, BottomOffset, ClassName)
		local utilColor = UtilityColors[ClassName] or ESPSettings.Square.Color
		
		Name.Text = ObjectName
		Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
		Name.Color = utilColor
		Name.Size = ESPSettings.Text.Size
		Name.Visible = true
		Name.ZIndex = 1

		Box.Size = BoxSize
		Box.Position = BoxPos
		Box.Visible = true
		Box.Color = utilColor
		Box.ZIndex = 1

		BoxOutline.Size = BoxSize
		BoxOutline.Position = BoxPos
		BoxOutline.Visible = true
		BoxOutline.ZIndex = 0

		Distance.Text = math.floor(Dist) .. "m"
		Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
		Distance.Color = utilColor
		Distance.Size = ESPSettings.Text.Size
		Distance.Visible = true
		Distance.ZIndex = 1
	end

	-- FOV Circle rendering
	framework:BindToRenderStep(function()
		local mousePos = userinputservice:GetMouseLocation();
		local screenCenter = camera.ViewportSize / 2;
		
		-- Silent Aim FOV
		if Classes.ShowFOV and Classes.ShowFOV.Value then
			FOVCircleSilent.Visible = true;
			FOVCircleSilent.Position = mousePos;
			FOVCircleSilent.Radius = Classes.FOVSize.Value;
		else
			FOVCircleSilent.Visible = false;
		end;
		
		-- Aimbot FOV
		if Classes.ShowFOVAimbot and Classes.ShowFOVAimbot.Value then
			FOVCircleAimbot.Visible = true;
			FOVCircleAimbot.Position = screenCenter;
			FOVCircleAimbot.Radius = Classes.FOVSizeAimbot.Value;
		else
			FOVCircleAimbot.Visible = false;
		end;
	end);
	
	framework:BindToRenderStep(function()
		for i, v in pairs(UtilityDrawings) do
			if not v then continue end
			for i, drawing in pairs(v) do
				if i ~= "ObjectName" then
					drawing.Visible = false
				end
			end
			if not Classes.UtilityESP.Value then continue end

			local Root = i
			local Distance = (camera.CFrame.Position - Root.Position).Magnitude
			if Classes.UtilityESPMaxDistance.Value < Distance then continue end

			local Pos, OnScreen = camera:WorldToViewportPoint(Root.Position)
			if OnScreen then
				local Size = (camera:WorldToViewportPoint(Root.Position - Vector3.new(0, 3, 0)).Y - camera:WorldToViewportPoint(Root.Position + Vector3.new(0, 2.6, 0)).Y) / 2
				local BoxSize = Vector2.new(math.floor(Size), math.floor(Size))
				local BoxPos = Vector2.new(math.floor(Pos.X - Size / 2), math.floor(Pos.Y - Size / 2))
				local Name = v.Name
				local Box = v.Box
				local BoxOutline = v.BoxOutline
				local Dist = v.Distance
				local ObjectName = v.ObjectName
				local BottomOffset = BoxSize.Y + BoxPos.Y + 1

				if Classes.C4.Value and ObjectName == "C4" then
					DrawUtility(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "C4")
				elseif Classes.Grenade.Value and ObjectName == "Grenade" then
					DrawUtility(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Grenade")
				elseif Classes.Claymore.Value and ObjectName == "Claymore" then
					DrawUtility(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Claymore")
				elseif Classes.Beartrap.Value and ObjectName == "Bear Trap" then
					DrawUtility(Name, Box, BoxOutline, Dist, ObjectName, BoxSize, BoxPos, Distance, BottomOffset, "Beartrap")
				end
			end
		end
		local closestPlayerToCursor = nil
		if Classes.Tracer.Value and Classes.TracerAutoSelect.Value then
			if getgenv().ragebot and getgenv().ragebot and currentRagebotTarget then
				closestPlayerToCursor = currentRagebotTarget
			else
				local mousePos = userinputservice:GetMouseLocation()
				local closestDistance = math.huge
				for _, Player in pairs(players:GetPlayers()) do
					if Player == localplayer then continue end
					local PlayerDrawing = PlayerDrawings[Player]
					if not PlayerDrawing then continue end
					local RootPart = PlayerDrawing.RootPart
					if not Player.Character or not RootPart then continue end
					local DistanceFromCharacter = (camera.CFrame.Position - RootPart.Position).Magnitude
					if DistanceFromCharacter > Classes.TracerAutoSelectDistance.Value then continue end
					local Pos, OnScreen = camera:WorldToViewportPoint(RootPart.Position)
					if OnScreen then
						local screenDistance = (Vector2.new(Pos.X, Pos.Y) - mousePos).Magnitude
						if screenDistance < closestDistance then
							closestDistance = screenDistance
							closestPlayerToCursor = Player
						end
					end
				end
			end
		end

		for _, Player in pairs(players:GetPlayers()) do
			local PlayerDrawing = PlayerDrawings[Player]
			if not PlayerDrawing then continue end

			for Ind, Drawing in pairs(PlayerDrawing) do
				if Ind ~= "RootPart" and Ind ~= "Humanoid" and Ind ~= "SessionData" then
					if Drawing and Drawing.Visible ~= nil then
						Drawing.Visible = false
					end
				end
			end

			if not Classes.ESP.Value then continue end

			local RootPart = PlayerDrawing.RootPart
			local Humanoid = PlayerDrawing.Humanoid
			if not Player.Character or not RootPart or not Humanoid then continue end

			local DistanceFromCharacter = (camera.CFrame.Position - RootPart.Position).Magnitude
			if Classes.ESPMaxDistance.Value < DistanceFromCharacter then continue end

			local Pos, OnScreen = camera:WorldToViewportPoint(RootPart.Position)
			if not OnScreen then
				if Classes.OutOfFOV.Value then
					local RootPos = RootPart.Position
					local CameraVector = camera.CFrame.Position
					local LookVector = camera.CFrame.LookVector
					local Dot = LookVector:Dot(RootPos - CameraVector)

					if Dot <= 0 then
						RootPos = CameraVector + ((RootPos - CameraVector) - ((LookVector * Dot) * 1.01))
					end

					local ScreenPos, OnScreen = camera:WorldToScreenPoint(RootPos)
					if not OnScreen then
						local Drawing = PlayerDrawing.Offscreen
						local FOV = 800 - Classes.OutFOVOffset.Value
						local Size = Classes.OutFOVSize.Value
						local Center = camera.ViewportSize / 2
						local Direction = (Vector2.new(ScreenPos.X, ScreenPos.Y) - Center).Unit
						local Radian = math.atan2(Direction.X, Direction.Y)
						local Angle = (((math.pi * 2) / FOV) * Radian)
						local ClampedPosition = Center + (Direction * math.min(math.abs(((Center.Y - FOV) / math.sin(Angle)) * FOV), math.abs((Center.X - FOV) / (math.cos(Angle)) / 2)))
						local Point = Vector2.new(math.floor(ClampedPosition.X - (Size / 2)), math.floor((ClampedPosition.Y - (Size / 2) - 15)))

						local OFFSettings = Classes.OFFSettings.Value
						local Rotation = math.floor(-math.deg(Radian)) - 47
						Drawing.PointA = Rotate(Point + Vector2.new(Size, Size), Point, Rotation)
						Drawing.PointB = Rotate(Point + Vector2.new(-Size, -Size), Point, Rotation)
						Drawing.PointC = Rotate(Point + Vector2.new(-Size, Size), Point, Rotation)
						Drawing.Color = ESPSettings.Triangle.Color
						Drawing.Filled = not ((OFFSettings == "Outline" or OFFSettings == "Both") or false)
						Drawing.Transparency = ((OFFSettings == "Blinking" or OFFSettings == "Both") or false) and (math.sin(tick() * 5) + 1) / 2 or 1
						Drawing.Visible = true
					end
				end
			else
				local Size = (camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y - camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y) / 2
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

				local State = framework:GetSessionData(Player)
				if State then
					State = State:getState()
				else
					State = { parry = {} }
				end

				if Classes.Boxes.Value then
					Box.Size = BoxSize
					Box.Position = BoxPos
					Box.Visible = true
					Box.Color = Classes.BoxColor.Value or Color3.new(1, 1, 1)
					BoxOutline.Size = BoxSize
					BoxOutline.Position = BoxPos
					BoxOutline.Visible = true
				end

				if Classes.SwingCooldown.Value then
					LastSwing.Visible = true
					local SwingCooldown = Player:GetAttribute("SwingCooldown") or 1
					local Cooldown = Player:GetAttribute("LastSwing") and tick() - Player:GetAttribute("LastSwing") or false
					LastSwing.Position = Vector2.new((BoxSize.X + BoxPos.X + 5), BoxPos.Y)
					LastSwing.Transparency = (Cooldown and (Cooldown / SwingCooldown)) or 1
					LastSwing.Size = Vector2.new(BoxSize.X * 0.2, BoxSize.Y * 0.1579)
				end

				if Classes.ParryCooldown.Value then
					if Classes.SwingCooldown.Value then
						LastParry.Position = Vector2.new((BoxSize.X + BoxPos.X + 5), (BoxPos.Y + LastSwing.Size.Y + 5))
					else
						LastParry.Position = Vector2.new((BoxSize.X + BoxPos.X + 5), BoxPos.Y)
					end
					local parryTime = (State.parry and State.parry.lastParrySucceeded) and 0.33 or 3
					LastParry.Transparency = math.clamp((tick() - (Player:GetAttribute("LastParry") or 1)) / parryTime, 0, 1)
					LastParry.Size = Vector2.new(BoxSize.X * 0.2, BoxSize.Y * 0.1579)
					LastParry.Visible = true
				end

				if Classes.Health.Value then
					local healthPercent = Humanoid.Health / Humanoid.MaxHealth
					Health.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
					Health.To = Vector2.new(Health.From.X, Health.From.Y - healthPercent * BoxSize.Y)
					Health.Color = Classes.HealthColor.Value or Color3.new(0, 1, 0)
					Health.Visible = true
					HealthOutline.From = Vector2.new(Health.From.X, BoxPos.Y + BoxSize.Y + 1)
					HealthOutline.To = Vector2.new(Health.From.X, Health.From.Y - BoxSize.Y - 1)
					HealthOutline.Visible = true
				end

				if Classes.Names.Value then
					Name.Text = Player.Name
					Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
					Name.Color = Classes.NameColor.Value or Color3.new(1, 1, 1)
					Name.Size = ESPSettings.Text.Size
					Name.Visible = true
				end

				if Classes.Tracer.Value and DistanceFromCharacter <= Classes.TracerMaxDist.Value then
					if Classes.TracerAutoSelect.Value and Player ~= closestPlayerToCursor then
					else
						local tracer = PlayerDrawing.Tracer
						local tracerOutline = PlayerDrawing.TracerOutline
						if tracer and tracerOutline then
							local origin = Classes.TracerOrigin.Value
							local fromPos
							
							if origin == "Cursor" then
								fromPos = userinputservice:GetMouseLocation()
							else
								fromPos = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
							end
							
							local toPos = Vector2.new(Pos.X, Pos.Y)
							local lerpAlpha = math.clamp(Classes.TracerLerp.Value or 1, 0.01, 1)
							local prev = TracerPoints[Player] or { from = fromPos, to = toPos }
							fromPos = prev.from:Lerp(fromPos, lerpAlpha)
							toPos = prev.to:Lerp(toPos, lerpAlpha)
							TracerPoints[Player] = { from = fromPos, to = toPos }
							
							local tracerColor = Classes.TracerColor.Value or Color3.new(1, 1, 1)
							
							tracerOutline.From = fromPos
							tracerOutline.To = toPos
							tracerOutline.Color = Color3.new(0, 0, 0)
							tracerOutline.Thickness = 0.05
							tracerOutline.ZIndex = 0
							tracerOutline.Visible = true
							
							tracer.From = fromPos
							tracer.To = toPos
							tracer.Color = tracerColor
							tracer.Thickness = 0.75
							tracer.ZIndex = 1
							tracer.Visible = true
						end
					end
				end

				if Classes.Indicators.Value then
					local BottomOffset = BoxSize.Y + BoxPos.Y + 1
					local ESPType = Classes.ESPTypes.Value
					if ESPType == "Tool" or ESPType == "Both" then
						local tool = Player.Character:FindFirstChildOfClass("Tool")
						Tool.Text = tool and tool.Name or "None"
						Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
						Tool.Color = ESPSettings.Text.Color
						Tool.Size = ESPSettings.Text.Size
						Tool.Visible = true
						BottomOffset = BottomOffset + 15
					end
					if ESPType == "Distance" or ESPType == "Both" then
						Distance.Text = math.floor(DistanceFromCharacter) .. "m"
						Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
						Distance.Color = ESPSettings.Text.Color
						Distance.Size = ESPSettings.Text.Size
						Distance.Visible = true
					end
				end
			end
		end
	end)
end

-- ranged tab

-- aimbot
aimbot:AddToggle("Aimbot", {
	Text = "aimbot";
	Default = false;
});

aimbot:AddToggle("Smooth", {
	Text = "smooth out";
	Default = false;
});

aimbot:AddToggle("Prediction", {
	Text = "prediction";
	Default = false;
});

aimbot:AddToggle("Hold", {
	Text = "hold keybind";
	Default = false;
});

aimbot:AddToggle("ShowFOVAimbot", {
	Text = "show fov";
	Default = false;
});

aimbot:AddToggle("ShowTargetAB", {
	Text = "show target";
	Default = false;
	Callback = function(value)
		if not value then
			if AimbotHighlight then
				AimbotHighlight.Adornee = nil;
			end;
		end;
	end;
});

aimbot:AddSlider("FOVSizeAimbot", {
	Text = "fov size";
	Default = 500;
	Min = 10;
	Max = 500;
	Rounding = 0;
	Compact = true;
});

aimbot:AddDropdown("AimbotHitPart", {
	Text = "hit part";
	Default = "Head";
	Values = {"Head", "Torso"};
});

-- Silent Aim Section
silentaim:AddToggle("SilentAim", {
	Text = "silent aim";
	Default = false;
});

silentaim:AddDropdown("ClosestType", {
	Text = "check type";
	Default = "Closest To Mouse";
	Values = {"Closest To Mouse", "Closest To Arrow", "Only Redirect To Target"};
});

silentaim:AddDropdown("SilentHitPart", {
	Text = "hit part";
	Default = "Head";
	Values = {"Head", "Torso", "Random"};
});

silentaim:AddSlider("SilentAimRange", {
	Text = "range";
	Default = 19;
	Min = 1;
	Max = 1000;
	Rounding = 0;
	Compact = true;
	Suffix = " studs";
});

silentaim:AddSlider("HitChance", {
	Text = "hit chance";
	Default = 100;
	Min = 1;
	Max = 100;
	Rounding = 0;
	Compact = true;
	Suffix = "%";
});

silentaim:AddToggle("ShowFOV", {
	Text = "show fov";
	Default = false;
});

silentaim:AddSlider("FOVSize", {
	Text = "fov size";
	Default = 500;
	Min = 10;
	Max = 500;
	Rounding = 0;
	Compact = true;
});

silentaim:AddToggle("Resolver", {
	Text = "resolver";
	Default = false;
});

silentaim:AddToggle("ShowTargetSA", {
	Text = "show target";
	Default = false;
	Tooltip = "Shows silent aim target";
	Callback = function(value)
		if not value then
			if SilentAimHighlight then
				SilentAimHighlight.Adornee = nil;
			end;
		end;
	end;
});

-- Gun Mods Section
gunmods:AddToggle("NoSpread", {
	Text = "no spread";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("minSpread", 0);
			modifyranged("maxSpread", 0);
		else
			revertranged("minSpread");
			revertranged("maxSpread");
		end;
	end;
});

gunmods:AddToggle("NoRecoil", {
	Text = "no recoil";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("recoilAmount", 0);
		else
			revertranged("recoilAmount");
		end;
	end;
});

gunmods:AddToggle("NoGravity", {
	Text = "no gravity";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("gravity", Vector3.new(0, 0, 0));
		else
			revertranged("gravity");
		end;
	end;
});

gunmods:AddToggle("FastProjectiles", {
	Text = "fast projectiles";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("speed", 3000);
		else
			revertranged("speed");
		end;
	end;
});

gunmods:AddToggle("NoReloadCancel", {
	Text = "no reload cancel";
	Default = false;
	Callback = function(v)
		getgenv().nocancel = v;
	end;
});

gunmods:AddToggle("NoReloadSlow", {
	Text = "no reload slowdown";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("reloadWalkSpeedMultiplier", 1);
		else
			revertranged("reloadWalkSpeedMultiplier");
		end;
	end;
});

gunmods:AddToggle("InstantCharge", {
	Text = "instant charge";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("chargeOnDuration", 0.01);
			modifyranged("chargeOffDuration", 0.01);
		else
			revertranged("chargeOnDuration");
			revertranged("chargeOffDuration");
		end;
	end;
});

gunmods:AddToggle("InfiniteRange", {
	Text = "infinite range";
	Default = false;
	Callback = function(value)
		if value then
			modifyranged("maxDistance", 10000);
		else
			revertranged("maxDistance");
		end;
	end;
});

gunmods:AddToggle("Wallbang", {
	Text = "wallbang";
	Default = false;
});

gunmods:AddToggle("AlwaysHead", {
	Text = "always head";
	Default = false;
	Callback = function(v)
		getgenv().AlwaysHead = v;
	end;
});

gunmods:AddDropdown("HitEffect", {
	Text = "hit effect";
	Default = "None";
	Values = {"None", "Blackhole", "Bubble", "Flame", "Glow", "Ground Spiral", "Impact", "KO", "MLG", "Shock Bubble", "Shockwave", "Shockwave Explosion", "Slash", "Soul Slash", "Sparkles", "Sparks", "Spiral", "Spiral Slash", "Shine", "Summon", "Supernova", "Tornado", "Zzz"};
});

-- Add ranged to Classes table
if not Classes.Aimbot then
	Classes.Aimbot = Toggles.Aimbot;
	Classes.Smooth = Toggles.Smooth;
	Classes.Prediction = Toggles.Prediction;
	Classes.Hold = Toggles.Hold;
	Classes.ShowFOVAimbot = Toggles.ShowFOVAimbot;
	Classes.ShowTargetAB = Toggles.ShowTargetAB;
	Classes.FOVSizeAimbot = Options.FOVSizeAimbot;
	Classes.AimbotHitPart = Options.AimbotHitPart;
	Classes.SilentAim = Toggles.SilentAim;
	Classes.ClosestType = Options.ClosestType;
	Classes.SilentHitPart = Options.SilentHitPart;
	Classes.SilentAimRange = Options.SilentAimRange;
	Classes.HitChance = Options.HitChance;
	Classes.ShowFOV = Toggles.ShowFOV;
	Classes.FOVSize = Options.FOVSize;
	Classes.Resolver = Toggles.Resolver;
	Classes.ShowTargetSA = Toggles.ShowTargetSA;
	Classes.NoSpread = Toggles.NoSpread;
	Classes.NoRecoil = Toggles.NoRecoil;
	Classes.NoGravity = Toggles.NoGravity;
	Classes.FastProjectiles = Toggles.FastProjectiles;
	Classes.NoReloadCancel = Toggles.NoReloadCancel;
	Classes.NoReloadSlow = Toggles.NoReloadSlow;
	Classes.InstantCharge = Toggles.InstantCharge;
	Classes.InfiniteRange = Toggles.InfiniteRange;
	Classes.Wallbang = Toggles.Wallbang;
	getgenv().AlwaysHead = Toggles.AlwaysHead;
	Classes.HitEffect = Options.HitEffect;
	getgenv().ragebot = Toggles.Ragebot;
	Classes.ShowRageBotTarget = Toggles.ShowRageBotTarget;
	Classes.RagebotDist = Options.RagebotDist;
end;

-- Silent Aim and Ragebot Implementation
do
	
	local R6BodyParts = {
		"Head",
		"Torso",
		"Left Arm",
		"Right Arm",
		"Left Leg",
		"Right Leg",
	};
	
	local function PredictTargetPosition(origin, target, speed, ping, gravity)
		local targetPos = target.Position;
		local targetVel = target.Velocity;
		local timeToHit = (targetPos - origin).Magnitude / speed;
		local predictedPos = targetPos + (targetVel * (timeToHit + (ping / 1000)));
		if gravity and gravity.Magnitude > 0 then
			local gravityEffect = gravity * (0.5 * (timeToHit ^ 2));
			predictedPos = predictedPos + gravityEffect;
		end;
		return predictedPos;
	end;

	local function applyWallbang(metadata)
		if not metadata or not metadata._mainCasterBehavior or not metadata._mainCasterBehavior.RaycastParams then
			return;
		end;
		local params = metadata._mainCasterBehavior.RaycastParams;
		metadata._wallbangCache = metadata._wallbangCache or {
			filterType = params.FilterType,
			filterList = table.clone(params.FilterDescendantsInstances),
			ignoreWater = params.IgnoreWater,
		};

		if Classes.Wallbang and Classes.Wallbang.Value then
			params.FilterType = Enum.RaycastFilterType.Whitelist;
			params.FilterDescendantsInstances = { PlayerCharacters or workspace };
			params.IgnoreWater = true;
		else
			if metadata._wallbangCache then
				params.FilterType = metadata._wallbangCache.filterType or Enum.RaycastFilterType.Blacklist;
				params.FilterDescendantsInstances = metadata._wallbangCache.filterList or params.FilterDescendantsInstances;
				params.IgnoreWater = metadata._wallbangCache.ignoreWater;
			end;
		end;
	end;
	
	local SilentAimHighlight = Instance.new("Highlight", workspace.Terrain);
	SilentAimHighlight.FillColor = Color3.new(1, 0, 0);
	SilentAimHighlight.OutlineColor = Color3.new(1, 1, 1);
	SilentAimHighlight.Enabled = false;
	
	local AimbotHighlight = Instance.new("Highlight", workspace.Terrain);
	AimbotHighlight.FillColor = Color3.new(0, 1, 0);
	AimbotHighlight.OutlineColor = Color3.new(1, 1, 1);
	AimbotHighlight.Enabled = false;
	
	local RagebotHighlight = Instance.new("Highlight", workspace.Terrain);
	RagebotHighlight.FillColor = Color3.new(1, 1, 0);
	RagebotHighlight.OutlineColor = Color3.new(1, 1, 1);
	RagebotHighlight.Enabled = false;
	
	local function ShowInformation(player)
		if player and player.Character then
			if Classes.ShowTargetSA and Classes.ShowTargetSA.Value then
				SilentAimHighlight.Adornee = player.Character;
				SilentAimHighlight.Enabled = true;
			else
				SilentAimHighlight.Adornee = nil;
				SilentAimHighlight.Enabled = false;
			end;
		else
			SilentAimHighlight.Adornee = nil;
			SilentAimHighlight.Enabled = false;
		end;
	end;
	
	setthreadidentity(2);
	local ActiveCast = require(repstorage.Shared.Vendor.FastCast.ActiveCast);
	setthreadidentity(8);
	
	local cache = {};
	local chanceCache = {};
	local currentSilentAimTarget = nil;
	local LockedTarget = nil;
	local OldSimulateCast = getupvalue(ActiveCast.new, 6);
	local OldCalculateFire = modules.Name["RangedWeaponHandler"].calculateFireDirection;
	
	function newSimulate(...)
		local args = { ... };
		local caster = args[1];
		
		pcall(function()
			local weapon, metadata = framework:GetRanged();
			applyWallbang(metadata);
			
			local Chance = framework:Chance(Classes.HitChance.Value);
			if not Chance then
				table.insert(chanceCache, caster);
			end;
			
			if
				not table.find(chanceCache, caster)
				and Chance
				and caster
				and caster.UserData
				and caster.StateInfo
				and caster.UserData.tool == weapon
				and (Classes.SilentAim.Value or getgenv().ragebot and getgenv().ragebot)
				and weapon
				and metadata
			then
				local Player = framework:GetClosestCharacterToOrigin(caster:GetPosition(), 19);
				if Classes.ClosestType.Value == "Only Redirect To Target" then
					Player = nil;
					local Characters = framework:GetClosestCharactersToOrigin(caster:GetPosition(), 19);
					if table.find(Characters, currentSilentAimTarget) then
						Player = currentSilentAimTarget;
					end;
				end;
				local MouseClosest = framework:GetClosestToMouse(Classes.FOVSize.Value);
				
				if Player then
					local Head = Player:FindFirstChild("Head");
					local Character = localplayer.Character;
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart");
					if getgenv().ragebot and getgenv().ragebot and Head and HumanoidRootPart then
						caster.Caster.RayHit:Fire(caster, {
							Distance = 1,
							Instance = Head,
							Material = Enum.Material.SmoothPlastic,
							Position = Head.Position,
							Normal = Vector3.yAxis,
						}, nil, caster.RayInfo.CosmeticBulletObject);
						
						caster:Terminate();
					end;
				end;
				
				if Classes.SilentAim.Value then
					if Classes.ClosestType.Value == "Closest To Mouse" then
						if MouseClosest then
							local PlayerChar = MouseClosest.Character;
							if PlayerChar then
								local targetPartName = (getgenv().AlwaysHead and getgenv().AlwaysHead) and "Head" or Classes.SilentHitPart.Value;
								if targetPartName == "Random" then targetPartName = "Head" end;
								local HitPart = PlayerChar:FindFirstChild(targetPartName) or PlayerChar:FindFirstChild("Head") or PlayerChar:FindFirstChild("Torso");
								if
									HitPart
									and (HitPart.Position - caster:GetPosition()).Magnitude
										<= Classes.SilentAimRange.Value
								then
									local Vel = (HitPart.Position - caster:GetPosition()).Unit * 3000;
									caster:SetVelocity(Vel);
								end;
							end;
						end;
					elseif
						Classes.ClosestType.Value == "Closest To Arrow"
						or Classes.ClosestType.Value == "Only Redirect To Target"
					then
						if Player then
							local targetPartName = (getgenv().AlwaysHead and getgenv().AlwaysHead) and "Head" or Classes.SilentHitPart.Value;
							if targetPartName == "Random" then targetPartName = "Head" end;
							local HitPart = Player:FindFirstChild(targetPartName) or Player:FindFirstChild("Head") or Player:FindFirstChild("Torso");
							if
								HitPart
								and (HitPart.Position - caster:GetPosition()).Magnitude
									<= Classes.SilentAimRange.Value
							then
								local Vel = (HitPart.Position - caster:GetPosition()).Unit * 3000;
								caster:SetVelocity(Vel);
							end;
						end;
					end;
				end;
			end;
		end);
		
		if caster and caster.UserData and caster.StateInfo then
			return OldSimulateCast(...);
		end;
		
		return;
	end;
	
	function newCalculateFire(...)
		local args = { ... };
		local target = framework:GetClosestToMouse(Classes.FOVSize.Value);
		local ranged, metadata = framework:GetRanged();
		applyWallbang(metadata);
		
		if
			Classes.SilentAim.Value
			and target
			and ranged
			and metadata
			and framework:Chance(Classes.HitChance.Value)
			and not framework:InMenu(target)
		then
			if Classes.ShowTargetSA.Value then
				setthreadidentity(7);
				ShowInformation(target);
				SilentAimHighlight.Adornee = target.Character;
				setthreadidentity(8);
			end;
			
			local forcedPartName = (getgenv().AlwaysHead and getgenv().AlwaysHead) and "Head" or Classes.SilentHitPart.Value;
			local hitPart = target.Character:FindFirstChild(forcedPartName) or target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("Torso");
			local humanoid = target.Character:FindFirstChildOfClass("Humanoid");
			if hitPart and humanoid then
				local cheatedOrigin =
					metadata:getCheatedBackOriginIfInObject(metadata._mainCasterBehavior.RaycastParams);
				local projectileSpeed = metadata._itemConfig.speed or 200;
				local projectileGravity = metadata._itemConfig.gravity or Vector3.new(0, 0, 0);
				
				if cheatedOrigin and projectileSpeed and projectileGravity then
					currentSilentAimTarget = target.Character;
					local predictedPos = PredictTargetPosition(cheatedOrigin, {
						Position = hitPart.Position,
						Velocity = (Classes.Resolver.Value and humanoid.MoveDirection or hitPart.Velocity),
					}, projectileSpeed, localplayer:GetNetworkPing() * 1000, projectileGravity);
					args[1] = CFrame.lookAt(Vector3.new(), (predictedPos - cheatedOrigin).Unit);
				end;
			end;
		else
			ShowInformation(nil);
		end;
		
		return OldCalculateFire(unpack(args));
	end;
	
	setupvalue(ActiveCast.new, 6, function(...)
		return newSimulate(...);
	end);
	
	modules.Name["RangedWeaponHandler"].calculateFireDirection = newCalculateFire;
	
	local VisualizerFolder = Instance.new("Folder", workspace.Terrain);
	VisualizerFolder.Name = "FastCastVisualizationObjects";
	VisualizerFolder.ChildAdded:Connect(function(child)
		task.wait();
		game:GetService("Debris"):AddItem(child, 0.7);
	end);
	
	-- Ragebot
	task.spawn(function()
		while task.wait() do
			if not Active then
				break;
			end;
			
			if not getgenv().ragebot or not getgenv().ragebot then
				currentRagebotTarget = nil;
				continue;
			end;
			
			local Character = localplayer.Character;
			if not Character then
				continue;
			end;
			
			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");
			if not HumanoidRootPart then
				continue;
			end;
			
			local forcefield = Character:FindFirstChildOfClass("ForceField");
			if forcefield and forcefield.Name ~= "ff" then
				continue;
			end;
			
			local ranged, metadata = framework:GetRanged();
			if not ranged or not metadata then
				currentRagebotTarget = nil;
				continue;
			end;
			applyWallbang(metadata);
			
			local player = LockedTarget or framework:GetClosest2(Classes.RagebotDist and Classes.RagebotDist.Value or 19);
			
			if LockedTarget and not next(LockedTarget) then
				LockedTarget = nil;
				currentRagebotTarget = nil;
				continue;
			end;
			
			if not player or not next(player) then
				currentRagebotTarget = nil;
				continue;
			end;
			
			if metadata.canShootBulletssss == nil then
				metadata.canShootBulletssss = true;
			end;
			
			if metadata._clientAmmoVO.Value <= 0 then
				network:FireServer("StartRangedReload", ranged);
				task.wait(metadata._itemConfig.reloadTime - 0.2);
				if ranged then
					pcall(function()
						local reloaded, _ = network:InvokeServer("FinishedRangedReload", ranged);
						if reloaded then
							metadata._clientAmmoVO.Value = metadata._itemConfig.maxAmmo;
							metadata.canShootBulletssss = true;
						end;
					end);
				end;
				continue;
			end;
			
			if not metadata.canShootBulletssss then
				if metadata._itemConfig.maxAmmo == 1 then
					metadata.canShootBulletssss = true;
				else
					continue;
				end;
			end;
			
			if not metadata._mainCasterBehavior or not metadata._mainCaster then
				continue;
			end;
			
			local targetPlayer = players:FindFirstChild(next(player));
			if not targetPlayer or not targetPlayer.Character then
				currentRagebotTarget = nil;
				continue;
			end;
			
			local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid");
			if not targetHumanoid or targetHumanoid.Health == 0 then
				LockedTarget = nil;
				currentRagebotTarget = nil;
				continue;
			end;
			
			if framework:InMenu(targetPlayer) then
				LockedTarget = nil;
				currentRagebotTarget = nil;
				continue;
			end;
			
			local Head = targetPlayer.Character:FindFirstChild("Head");
			if not Head or targetPlayer.Character:FindFirstChildOfClass("ForceField") then
				LockedTarget = nil;
				currentRagebotTarget = nil;
				continue;
			end;
			
			currentRagebotTarget = targetPlayer;
			metadata.canShootBulletssss = false;
			
			if Classes.ShowRageBotTarget and Classes.ShowRageBotTarget.Value then
				ShowInformation(targetPlayer);
				RagebotHighlight.Adornee = targetPlayer.Character;
			end;
			
			LockedTarget = player;
			
			if not (Classes.Wallbang and Classes.Wallbang.Value) then
				metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances = {
					metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances,
					PlayerCharacters,
					Map,
					workspace.Terrain,
				};
			end;
			
			local origin = metadata:getCheatedBackOriginIfInObject(metadata._mainCasterBehavior.RaycastParams);
			local projectileSpeed = metadata._itemConfig.speed or 200;
			local projectileGravity = metadata._itemConfig.gravity or Vector3.new(0, 0, 0);
			
			local finalPos = PredictTargetPosition(
				origin,
				{ Position = Head.Position, Velocity = Head.Velocity },
				projectileSpeed,
				localplayer:GetNetworkPing() * 1000,
				projectileGravity
			);
			
			local CF = CFrame.new(Vector3.new(), (finalPos - origin).Unit);
			local dir = OldCalculateFire(CF, 0, 0, 5000);
			
			local fakeBehavior = {
				RaycastParams = metadata._mainCasterBehavior.RaycastParams,
				Acceleration = Vector3.new(),
				MaxDistance = 5000,
				HighFidelityBehavior = 1,
				HighFidelitySegmentSize = 0.5,
				CosmeticBulletContainer = workspace:FindFirstChild("EffectsJunk"),
				AutoIgnoreContainer = true,
			};
			
			local template = metadata._cosmeticProjectileTemplate;
			if typeof(fakeBehavior) == "Instance" then
				fakeBehavior.CosmeticBulletProvider = nil;
				fakeBehavior.CosmeticBulletTemplate = template;
			else
				fakeBehavior.CosmeticBulletProvider = template;
				fakeBehavior.CosmeticBulletTemplate = nil;
			end;
			
			local cast = metadata._mainCaster:Fire(origin, dir, projectileSpeed, fakeBehavior);
			metadata._cheatId = metadata._cheatId and metadata._cheatId + 1 or 1;
			cast.UserData = {
				["player"] = localplayer,
				["tool"] = ranged,
				["shotId"] = tostring(metadata._cheatId),
				["origin"] = origin,
			};
			
			network:FireServer("RangedFire", ranged, origin, {
				[tostring(metadata._cheatId)] = dir.Unit,
			}, {
				[tostring(metadata._cheatId)] = dir,
			}, {
				[1] = tostring(metadata._cheatId),
			}, nil, camera.CFrame, workspace:GetServerTimeNow());
			
			metadata._clientAmmoVO.Value = metadata._clientAmmoVO.Value - 1;
			
			local distance = (origin - Head.Position).Magnitude;
			local timeToHit = distance / projectileSpeed;
			
			if not (ranged.Name == "Longbow" or ranged.Name == "Crossbow" or ranged.Name == "Heavy Bow") then
				task.delay(timeToHit + 0.08, function()
					if cast.UserData and cast.StateInfo and cast.StateInfo.UpdateConnection then
						metadata._mainCaster.RayHit:Fire(cast, {
							Distance = 1,
							Instance = Head,
							Material = Enum.Material.SmoothPlastic,
							Position = Head.Position,
							Normal = Vector3.yAxis,
						}, nil, cast.RayInfo.CosmeticBulletObject);
						
						cast:Terminate();
					end;
				end);
			end;
			
			task.wait(metadata._itemConfig.cooldown);
			
			if metadata._clientAmmoVO.Value <= 0 then
				network:FireServer("StartRangedReload", ranged);
				task.wait(metadata._itemConfig.reloadTime - 0.2);
				
				if ranged then
					pcall(function()
						local reloaded, _ = network:InvokeServer("FinishedRangedReload", ranged);
						if reloaded then
							metadata._clientAmmoVO.Value = metadata._itemConfig.maxAmmo;
						end;
					end);
				end;
			end;
			
			metadata.canShootBulletssss = true;
		end;
	end);
end;

local snipertext = "";
local status = sniper:AddLabel("status: idle")
sniper:AddInput("sniper", {
    Text = "search username";
    PlaceholderText = "type name or display";
    Default = "";
    ClearTextOnFocus = false;
    Callback = function(Text)
        snipertext = Text;
    end;
});
sniper:AddButton({
    Text = "snipe player";
    Func = function()
        local input = snipertext;
        if not input or input == "" then
            status:SetText("status: no input (0x00)");
            return;
        end;
        local userId = tonumber(input);
        if not userId then
            local success, result = pcall(function()
                return game:GetService("Players"):GetUserIdFromNameAsync(input);
            end);
            if success then
                userId = result;
            else
                status:SetText("status: invalid username");
                return;
            end;
        end;
        status:SetText("status: searching");
        spawn(function()
            local Success, InServer, _, PlaceId, JobId = network:InvokeServer("GetPlayerPlaceInstanceInfo", userId);
            if JobId then
                local serverInfo;
                local HttpService = game:GetService("HttpService");
                local ok, res = pcall(function()
                    return HttpService:JSONDecode(HttpService:GetAsync("https://games.roblox.com/v1/games/"  .. PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"));
                end);
                if ok and res and res.data then
                    for _, v in pairs(res.data) do
                        if v.id == JobId then
                            serverInfo = v;
                            break;
                        end;
                    end;
                end;
                local msg = "status: user found, teleporting:";
                if serverInfo then
                    local players = serverInfo.playing or "?";
                    local maxPlayers = serverInfo.maxPlayers or "?";
                    local region = serverInfo.region or "unknown";
                    msg ="status: user found | " .. players .. "/" .. maxPlayers .. " | region: " .. region;
                end;
                status:SetText(msg);
                wait(1);
                game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer, "", "=");
            else
                wait(0.8);
                status:SetText("status: target not playing cw");
            end;
        end);
    end;
});
library.KeybindFrame.Visible = true; -- settings
settings:AddButton("unload", function() library:Unload(); end);
settings:AddLabel("menu bind"):AddKeyPicker("menubind", {Default = "RightAlt", NoUI = true, Text = "toggle ui"});
library.ToggleKeybind = Options.menubind;
thememanager:SetLibrary(library);
thememanager:SetFolder("serenium");
savemanager:SetLibrary(library);
savemanager:SetFolder("serenium/configs");
savemanager:BuildConfigSection(tabs.settings);
savemanager:LoadAutoloadConfig();
thememanager:ApplyToTab(tabs.settings);
