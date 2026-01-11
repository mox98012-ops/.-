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
game:GetService("Players").LocalPlayer:WaitForChild("CharacterLoaded");
game:GetService("Players").LocalPlayer:WaitForChild("DataLoadedClient");
game:GetService("Players").LocalPlayer:WaitForChild("DataLoaded");
for _, void in pairs(game.workspace:GetDescendants()) do
	if void.Name == "VoidCollidePart" and void:IsA("Part") then
		void.CanTouch = false;
	end;
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
local workspace = game:GetService("Workspace");
local PlayerCharacters = workspace:FindFirstChild("PlayerCharacters");
local ParryingCharacters = {};
library.IgnoreWhileTyping = true;

local KADebounce = false;
local OnTp = false;
local Active = true;
local AttachRoot = nil;
local Ignored = {};
local ParryingCharacters = {};

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
getgenv().ndcd = false;
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
local Players = game:GetService("Players")
local localplayer = Players.LocalPlayer
local function whitelisted(player)
    if not player then return false end
    if table.find(whitelist, player.Name) then
        return true;
    end;
    if Toggles.WhitelistFriends and Toggles.WhitelistFriends.Value then
        return localplayer:IsFriendsWith(localplayer.UserId);
    end;

    return false;
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
    local speed = getgenv().flyspeed * (keys.lshift and boostmultiplier or 1);
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
		if Toggles.WhitelistFriends.Value and localplayer:IsFriendsWith(v.UserId) then
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
			and not whitelisted(Player)
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
		if Toggles.WhitelistFriends.Value and localplayer:IsFriendsWith(v.UserId) then
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
			and not whitelisted(Player)
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
		if Toggles.WhitelistFriends.Value and localplayer:IsFriendsWith(v.UserId) then
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
		if Player and not whitelisted(Player) then
			if table.find(Ignored, v.Name) then
				continue;
			end;
		end;
		if Toggles.WhitelistFriends.Value and localplayer:IsFriendsWith(v.UserId) then
			continue;
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
		if Player and not whitelisted(Player) then
			if table.find(Ignored, v.Name) then
				continue;
			end;
		end;
		if Toggles.WhitelistFriends.Value and localplayer:IsFriendsWith(v.UserId) then
			continue;
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
local FakeHitboxes = {}
getgenv().Config = getgenv().Config or {
    HitboxSize   = 20,
    ShowHitbox   = false,
    HitboxExpand = false,
    HBEPart      = "Torso",
    HitboxColor  = Color3.fromRGB(100, 83, 255),
    Wallbang     = false,
    AlwaysHead   = false,
}

local Config = getgenv().Config   -- shortcut for cleaner code
local function ApplyHitbox(Character)
	task.wait()

	local FakeHitbox = Instance.new("Part")
	FakeHitbox.Name = "FakeHitbox"
	FakeHitbox.Size = Vector3.new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize)
	FakeHitbox.CanCollide = false
	FakeHitbox.Transparency = Config.ShowHitbox and 0.7 or 1
	FakeHitbox.Color = Config.HitboxColor
	FakeHitbox.Massless = true
	FakeHitbox.CastShadow = false
	FakeHitbox.Parent = Character
	FakeHitbox:SetAttribute("IsCharacterHitbox", Config.HitboxExpand)

	FakeHitbox:AddTag("RANGED_CASTER_IGNORE_LIST")

	local Weld = Instance.new("Weld")
	Weld.Part0 = Character:WaitForChild("HumanoidRootPart")
	Weld.Part1 = FakeHitbox
	Weld.Parent = FakeHitbox

	table.insert(FakeHitboxes, FakeHitbox)
end

for _, v in PlayerCharacters:GetChildren() do
	if v ~= localplayer.Character then
		ApplyHitbox(v)
	end
end
for _, v in players:GetPlayers() do
	if v ~= localplayer then
		v.CharacterAdded:Connect(ApplyHitbox)
	end
end
players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(ApplyHitbox)
end)
runservice.RenderStepped:Connect(function()
	for i, v in pairs(FakeHitboxes) do
		if not v:IsDescendantOf(game) then
			table.remove(FakeHitboxes, i)
			continue
		end
		local toExpand = v.Parent:FindFirstChild(Config.HBEPart)
		if toExpand and v:FindFirstChild("Weld") and v.Weld.Part0 ~= toExpand then
			v.Weld.Part0 = toExpand
		end

		v.Transparency = (Config.HitboxExpand and Config.ShowHitbox) and 0.7 or 1
		v.Color = Config.HitboxColor
		v.Size = Vector3.new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize)
		v:SetAttribute("IsCharacterHitbox", Config.HitboxExpand)

		if not Config.HitboxExpand then
			if not v:HasTag("RANGED_CASTER_IGNORE_LIST") then
				v:AddTag("RANGED_CASTER_IGNORE_LIST")
			end
		else
			if v:HasTag("RANGED_CASTER_IGNORE_LIST") then
				v:RemoveTag("RANGED_CASTER_IGNORE_LIST")
			end
		end
	end
end)
-- major toggles
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local PlayerCharacters = Workspace:WaitForChild("PlayerCharacters")
local Map = Workspace:FindFirstChild("Map")

local FakeHitboxes = {}
local Modules = {}
local Network = nil


local R6BodyParts = {
    "Head", "Torso",
    "Left Arm", "Right Arm",
    "Left Leg", "Right Leg",
}
task.spawn(function()
    for _, child in ReplicatedStorage:GetDescendants() do
        if child:IsA("ModuleScript") then
            local success, module = pcall(require, child)
            if success then
                Modules[child.Name] = module
                if child.Name == "Network" then
                    Network = module
                end
            end
        end
    end
end)

local function GetMetadata(weaponName)
    if not Modules.WeaponMetadata or not Modules.WeaponIds then
        return nil
    end
    
    local weaponId = Modules.WeaponIds[weaponName:lower():gsub(" ", "")]
    return weaponId and Modules.WeaponMetadata[weaponId] or nil
end

-- Create FakeHitbox for a character
local function ApplyHitbox(Character)
    task.wait()
    
    if Character:FindFirstChild("FakeHitbox") then return end

    local FakeHitbox = Instance.new("Part")
    FakeHitbox.Size         = Vector3.new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize)
    FakeHitbox.CanCollide   = false
    FakeHitbox.Transparency = Config.ShowHitbox and 0.7 or 1
    FakeHitbox.Name         = "FakeHitbox"
    FakeHitbox.Color        = Config.HitboxColor
    FakeHitbox:SetAttribute("IsCharacterHitbox", Config.HitboxExpand)
    FakeHitbox.Massless     = true
    FakeHitbox.CastShadow   = false
    FakeHitbox.Parent       = Character

    FakeHitbox:AddTag("RANGED_CASTER_IGNORE_LIST")

    local Weld = Instance.new("Weld")
    Weld.Part0 = Character:WaitForChild("HumanoidRootPart")
    Weld.Part1 = FakeHitbox
    Weld.Parent = FakeHitbox

    table.insert(FakeHitboxes, FakeHitbox)
end

-- Initial existing characters
for _, v in PlayerCharacters:GetChildren() do
    if v ~= LocalPlayer.Character then
        ApplyHitbox(v)
    end
end

-- New/existing players
for _, player in Players:GetPlayers() do
    if player ~= LocalPlayer then
        if player.Character then
            ApplyHitbox(player.Character)
        end
        player.CharacterAdded:Connect(ApplyHitbox)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(ApplyHitbox)
end)

RunService.RenderStepped:Connect(function()
    for i = #FakeHitboxes, 1, -1 do
        local v = FakeHitboxes[i]
        
        if not v:IsDescendantOf(game) then
            table.remove(FakeHitboxes, i)
            continue
        end

        local toExpand = v.Parent:FindFirstChild(Config.HBEPart)
        if toExpand and v.Weld and v.Weld.Part0 ~= toExpand then
            v.Weld.Part0 = toExpand
        end

        v.Transparency = (Config.HitboxExpand and Config.ShowHitbox) and 0.7 or 1
        v.Color        = Config.HitboxColor
        v.Size         = Vector3.new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize)
        v:SetAttribute("IsCharacterHitbox", Config.HitboxExpand)
        
        if not Config.HitboxExpand then
            if not v:HasTag("RANGED_CASTER_IGNORE_LIST") then
                v:AddTag("RANGED_CASTER_IGNORE_LIST")
            end
        else
            if v:HasTag("RANGED_CASTER_IGNORE_LIST") then
                v:RemoveTag("RANGED_CASTER_IGNORE_LIST")
            end
        end
    end
end)

task.wait(2)
-- Visuals override
if Modules.RangedHitVisuals and Modules.RangedHitVisuals.defaultHit then
    local old = Modules.RangedHitVisuals.defaultHit
    
    Modules.RangedHitVisuals.defaultHit = function(player, tool, cfg, hitpart, hitcf, normal, material, cosmetic)
        local newHitCf = hitcf
        
        if Config.HitboxExpand and hitpart and hitpart.Name == "FakeHitbox" then
            local part = hitpart.Parent:FindFirstChild(
                Config.HBEPart == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Config.HBEPart
            ) or hitpart.Parent:FindFirstChild("Torso")
            
            if part then
                local metadata = GetMetadata(tool.Name)
                if metadata and metadata.speed then
                    task.wait((hitcf.Position - part.Position).Magnitude / metadata.speed)
                end
                
                newHitCf = part.CFrame
                    * cosmetic.CFrame.Rotation
                    * CFrame.new(
                        math.random(-1,1) * (part.Size.X / 2),
                        math.random(-1,1) * (part.Size.Y / 2),
                        math.random(-1,1) * (part.Size.Z / 2)
                    )
            end
        end
        
        return old(player, tool, cfg, hitpart, newHitCf, normal, material, cosmetic)
    end
end
if Modules.RangedWeaponClient and Modules.RangedWeaponClient.updateIgnoreList then
    Modules.RangedWeaponClient.updateIgnoreList = function(rangedData)
        if tick() - (rangedData._lastIgnoreListUpdateTick or 0) < 5 then
            return rangedData._ignoreList
        end

        rangedData._lastIgnoreListUpdateTick = tick()
        local character = rangedData._character
        local tagged = CollectionService:GetTagged("RANGED_CASTER_IGNORE_LIST")

        table.insert(tagged, character)

        if Config.Wallbang and Map then
            table.insert(tagged, Map)
            table.insert(tagged, Workspace.Terrain)
        end

        rangedData._ignoreList = tagged
        return tagged
    end
end
if Network and Network.FireServer then
    local OldFireServer = Network.FireServer

    Network.FireServer = function(self, remoteName, ...)
        local args = {...}

        if remoteName == "MeleeDamage" then
            if Config.HitboxExpand
                and args[2]
                and args[2].Name == "FakeHitbox"
                and args[2].Parent
            then
                local partName = Config.HBEPart
                local parent = args[2].Parent

                local targetPart =
                    parent:FindFirstChild(
                        partName == "Random"
                            and R6BodyParts[math.random(#R6BodyParts)]
                            or partName
                    )
                    or parent:FindFirstChild("Torso")

                if targetPart then
                    args[2] = targetPart

                    local function rand()
                        return math.random() * 2 - 1
                    end

                    args[5] = CFrame.new(
                        rand() * (targetPart.Size.X / 2),
                        rand() * (targetPart.Size.Y / 2),
                        rand() * (targetPart.Size.Z / 2)
                    )
                end
            end

            return OldFireServer(self, remoteName, unpack(args))
        end
        return OldFireServer(self, remoteName, ...)
    end
end

-- Public API
getgenv().FakeHitbox = {
    Toggle     = function() Config.HitboxExpand = not Config.HitboxExpand return Config.HitboxExpand end,
    Enable     = function() Config.HitboxExpand = true end,
    Disable    = function() Config.HitboxExpand = false end,
    
    SetSize    = function(v) Config.HitboxSize   = math.clamp(tonumber(v) or 20, 1, 50) end,
    SetVisible = function(v) Config.ShowHitbox   = v and true or false end,
    SetColor   = function(c) if typeof(c) == "Color3" then Config.HitboxColor = c end end,
    SetPart    = function(p) Config.HBEPart      = tostring(p) end,
    
    Wallbang   = function(v) Config.Wallbang     = v and true or false end,
    AlwaysHead = function(v) Config.AlwaysHead   = v and true or false end,
    
    GetConfig  = function() return table.clone(Config) end,
    GetHitboxes = function() return FakeHitboxes end,
    
    Status     = function()
        return string.format(
            "HBE: %s | Size: %.1f | Part: %s | Visible: %s | Wallbang: %s",
            Config.HitboxExpand and "ON" or "OFF",
            Config.HitboxSize,
            Config.HBEPart,
            Config.ShowHitbox and "YES" or "NO",
            Config.Wallbang and "ON" or "OFF"
        )
    end
}
do
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
	framework:argmodify("RangedExplode", {}, function(n, ...)
		local args = { ... }
		local part = args[2]
		if Config.HitboxExpand then
			part = part.Parent:FindFirstChild(
				Config.HBEPart == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Config.HBEPart
			) or args[2].Parent:FindFirstChild("Torso")
		end

		if Config.HitboxExpand then
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

		if getgenv().AlwaysHead then
			return { [2] = args[2].Parent:FindFirstChild("Head") }
		end

		return
	end)
	framework:argmodify("RangedHit", {}, function(n, ...)
		local args = { ... }
		if Config.HitboxExpand and args[2].Name == "FakeHitbox" then
			local part = args[2].Parent:FindFirstChild(
				Config.HBEPart == "Random" and R6BodyParts[math.random(1, #R6BodyParts)] or Config.HBEPart
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

		if getgenv().AlwaysHead then
			return { [2] = args[2].Parent:FindFirstChild("Head") }
		end

		return
	end)
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
			if typeof(part) == "Instance" and part:IsDescendantOf(character) and getgenv().nkb then
				return;
			end;
			return old[funckey](part, ...)
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
    end,
    KilledPlayer = function(statData)
        local diedPlayer = modules.Name["MockHandler"].getPlayerOrMockFromPlayerOrMockUserId(statData.playerOrMockUserIdThatDied)
        local killType = statData.singleKillType
        local killStreak = statData.killStreak
        local headShot = statData.isHeadshot
        local collat = statData.isCollat
        local multiplier = statData.xpMult
        local baseXp = statData.baseXpToGive
        local baseCredits = statData.baseCreditsToGive

        if diedPlayer and Toggles.Killsay.Value then
            local PickFrom = Data.KillSayStuff.Normal
            local GotXp = baseXp
            local GotCredits = baseCredits

            if killType == "2" then
                PickFrom = Data.KillSayStuff.Assist
            elseif killType == "3" then
                PickFrom = Data.KillSayStuff.Finish
                GotXp = statData.finishXpToGive
                GotCredits = statData.finishCreditsToGive
            elseif killType == "4" then
                PickFrom = Data.KillSayStuff.Glory
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

            local killStreakData = killStreak > 1 and (Data.KillStreak[killStreak - 1] or Data.KillStreak[#Data.KillStreak])
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

            local Weapon = framework:GetWeapon() or framework:GetRanged()
            if Weapon then
                Message = Message:gsub("%%Weapon%%", Weapon.Name)
            end

            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(Message)
        end
    end
})
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
	Max = 12;
	Rounding = 0;
	Compact = true;
});
local Classes = {
	KillAura = Toggles.KillAura,
	KillAuraRange = Options.KillAuraRange,
	KillAuraType = Options.KillAuraType,
	PlayAnimation = Toggles.PlayAnimation,
	TPEnemy = Toggles.TPEnemy,
	TPType = Options.TPType,
	TPRange = Options.TPRange,
};

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

-- local blacklist = {
--     "rbxassetid://106649093705106",
--     "rbxassetid://6423003415",
--     "rbxassetid://101463478179793",
-- };

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
if not Toggles.WhitelistFriends then
	Toggles.WhitelistFriends = { Value = false };
end;
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
        Max = 20;
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
charactertab:AddToggle('NoAnimations', {
    Text = 'no animations',
    Default = false,
    Tooltip = 'stops all character animations',
    Callback = function()
        if Toggles.NoAnimations.Value then
            task.spawn(function()
                while Toggles.NoAnimations.Value do
                    if character and humanoid then
                        for i, v in humanoid:GetPlayingAnimationTracks() do
                            if v.Animation ~= spinAnim then
                                v:Stop()
                            end
                        end
                    end
                    runservice.RenderStepped:Wait()
                end
            end)
        end
    end
})
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
		getgenv().ndcd = Value; 
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
othertabs:AddToggle("HitboxExpand", {
    Text = "hitbox expander",
    Default = Config.HitboxExpand,
    Callback = function(value)
        Config.HitboxExpand = value
    end,
})
othertabs:AddToggle("ShowHitbox", {
    Text = "show expanded hitbox",
    Default = Config.ShowHitbox,
    Callback = function(value)
        Config.ShowHitbox = value
    end,
})

othertabs:AddDropdown("HBEPart", {
    Text = "hit part",
    Default = Config.HBEPart,
    Values = R6BodyParts,
    Callback = function(value)
        Config.HBEPart = value
    end,
})
othertabs:AddSlider("HitboxSize", {
    Text = "hitbox size",
    Default = Config.HitboxSize,
    Min = 1,
    Max = 20,
    Rounding = 0,
    Compact = true,
    Suffix = " studs",
    Callback = function(value)
        Config.HitboxSize = value
    end,
})

-- main misc
mmisc:AddToggle("killsay", {
    Text = "killsay";
    Default = false;
});
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
mmisc:AddToggle("ShowLine", {
	Text = "show line";
	Default = false;
}):AddColorPicker("linecolor", {
	Default = Color3.new(1, 1, 1);
	Title = "line color";
	Transparency = 0;
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
local TextChatService = game:GetService("TextChatService");
local CanSend = true
TextChatService.MessageReceived:Connect(function(message)
	if message.Text:match("You must wait before sending another message.") and CanSend then
		CanSend = false
		task.delay(4.5, function()
			CanSend = true
		end)
	end
end)
network:BindEvents({
	KilledPlayer = function(statData)
		local KillSayStuff = Data.KillSayStuff
		local MockHandler = modules.Name["MockPlayerHandler"]
		local KillStreak = modules.Name["KillStreakConfigs"]
		local diedPlayer = MockHandler.getPlayerOrMockFromPlayerOrMockUserId(statData.playerOrMockUserIdThatDied)
		local killType = statData.singleKillType
		local killStreak = statData.killStreak
		local headShot = statData.isHeadshot
		local collat = statData.isCollat
		local multiplier = statData.xpMult
		local baseXp = statData.baseXpToGive
		local baseCredits = statData.baseCreditsToGive
		if diedPlayer and Toggles.killsay.Value then
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
			local Weapon = framework:GetWeapon() or framework:GetRanged()
			if Weapon then
				Message = Message:gsub("%%Weapon%%", Weapon.Name)
			end
			if CanSend then
				TextChatService.TextChannels.RBXGeneral:SendAsync(Message)
			end
		end
	end
})

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
local FlingThread;
local CanFlingAll = false;
auto:AddToggle("loopflingall", {
    Text = "loop attempt fling all";
    Default = false;
    Callback = function(Value)
        if not Value then
            CanFlingAll = false;

            if FlingThread then
                task.cancel(FlingThread);
                FlingThread = nil;
            end;

            return;
        end;
        CanFlingAll = true;
        FlingThread = task.spawn(function()
            while CanFlingAll do
                while CanFlingAll and framework:InMenu(localplayer) do
                    task.wait();
                end;
                if not CanFlingAll then break; end;

                if not humanoidrootpart then
                    task.wait(0.1);
                    continue;
                end;
                local playercount = 0;
                for i = 1, #CachedPlayers do
                    if not CanFlingAll then break; end;
                    local Player = CachedPlayers[i];
                    if not Player or not Player.Parent then continue; end;
                    if framework:InMenu(Player) then continue; end;
                    if table.find(whitelist, Player.Name) then continue; end;
                    local Char = Player.Character;
                    local targetroot = Char and Char:FindFirstChild("HumanoidRootPart");
                    if not targetroot then continue; end;
                    local targetpos = targetroot.Position;
                    if targetpos.Y > 280 then continue; end;
                    if (targetpos * Vector3.new(1, 0, 1)).Magnitude > 1200 then continue; end;
                    playercount = playercount + 1;
                    local movel = 0.1;
                    local start = tick();
                    while CanFlingAll and tick() - start < 0.15 do
                        if not humanoidrootpart.Parent or not targetroot.Parent then break; end;
                        if framework:InMenu(Player) then break; end;

                        humanoidrootpart.CFrame = targetroot.CFrame;
                        sethiddenproperty(humanoidrootpart, "PhysicsRepRootPart", targetroot);

                        local vel = humanoidrootpart.Velocity;
                        humanoidrootpart.Velocity = vel * 150000 + Vector3.new(0, 150000, 0);

                        runservice.RenderStepped:Wait();
                        if not CanFlingAll then break; end;

                        humanoidrootpart.Velocity = vel + Vector3.new(0, movel, 0);
                        movel = -movel;

                        runservice.Heartbeat:Wait();
                    end;
                end;
                if playercount == 0 then
                    task.wait(0.5);
                end;
            end;
        end);
    end;
});
auto:AddToggle("WhitelistFriends", {
	Text = "whitelist friends";
	Default = false;
	Callback = function(value)
		Toggles.WhitelistFriends.Value = value;
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
auto:AddToggle('SpamBioRepairSound', {
    Text = 'spam bio-repair pen sound',
    Default = false,
    Tooltip = 'spams bio-repair pen sound',
    Callback = function()
        if Toggles.SpamBioRepairSound.Value then
            workspace.ChildAdded:Connect(function(child)
                if child:IsA("Sound") and child.Name == "jab" then
                    child:Destroy()
                end
            end)
            task.spawn(function()
                local stomp = { Torso = workspace }
                while Toggles.SpamBioRepairSound.Value do
                    modules.Name["VFXClient"].runAndReplicateEffect("HealthPen", {
                        stomp,
                    }, "jab")
                    task.wait(0.5)
                end
            end)
        end
    end
})
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
	local SwingImage = "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"
	local ParryImage = "iVBORw0KGgoAAAANSUhEUgAAAaQAAAGkCAYAAAB+TFE1AAAgAElEQVR4Ae2dB7gsRdW1QXLOGUmSM0iWnAUEQYIEAZEokkSyEgxIEBMGUD8BlaAiiCAiSI4iQZGgSJQcJKgYv/9fXy3OnjtzzpmZ012dqqpXP8997pyZDtVvVVd11d577ckm0yYCIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACIiACItBWAgDmBrAagFUBrAxgRQArAFgOwDIAlgKwJIDFASwGYFEACwNYCMCCAOYHMC+AeQDMBWBOALMDmBXALABmAjAjgOkBTAtgGgBTAZgCwDvayl33LQIiIAIiMIYAgM0AXAfg1wDucH/fDuBWALcAuAnADQB+Zfv8EsA1AK52g9hVAK4EcAWAy91AdhmAS91A9mM3kP3QDWQXu4HsIgAXAvi+G8guAHC+G8i+6way7wD4NoBzAZxgg98UY4qmP0VABERABNpEAMD2AF5Ac9vfAdwJ4KOcNbWJve5VBERABESghwCAHQC82Nx49PaV/z+Af9vMaysAM2s5r6eS9FEEREAE2kAAwAcAvNTwgNR7+VecPeqbbrlwQwAztKEOdI8iIAIiIAKTTTYZgB3dctnLvSNCAJ//nxsofw/gk3SqUEWJgAiIgAi0gACAnQBwVhLi9jdzptiT3nstqA7dogiIgAi0lwCAnQG8GuJoZGXibOk18+LbAMDU7a0t3bkIiIAIJEwAwAcB/CXgAam3aG+5GKevWnzU9AlXi25NBERABNpHAMCuAF7v7fUD//y/AO4FcCSApQFM2b5a0x2LgAiIQIIEAOwG4I3AB6F+xeMgej2AD1MRIsGq0S2JgAiIQLsIANgdwJv9evxIvmNQ7/dcDNMa7ao53a0IiIAIJEYAwB4A/hrJ4DOomFzGe9rFLZ1p2nvTJFZNuh0REAERSJ8AALpU0706le0BtwR5uAnAyr6UfhPWHYqACKRCAMBeAKgnl9L2LxN6pUv77KnUle5DBERABJImAGBvAHSnTm3rLONRUXyDpCtRNycCIiAC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zNX7pogHJM6GngfwK3PKYM6h2VXBIiACIiACkREw6Zu/Rjog3eiysJ5m97CEkt9F1vhUXBEQARHoELCMsBeavSWWMek5AN8CsCOAdzFvU+d+9L8IiIAIiECEBCwQdmsATwQ8EnE57u8WL0R9PQqZUjVhWtmGImx0KrIIiIAI9CNgs6OzAw2EpYfcgwCuAnAEgGW0HNevFvWdCIiACCRAwDTafhfY7IiirpwJMXX6Ohw0E0CtWxABERABERhEgHYXAJ+y5HIhjEm3OUHX4wEwy+oibkBSrNCgytP3IiACIpASAQCLArijoZGIdiGm+uZsiAnu6Ka9ILOspsRY9yICIiACIjABAXNmOLbmwYiD0BsA/gjgMhuEZpigqPpZBERABEQgZQImE3R3jQPSAwAutgR3S8k5IeXWpXsTAREQgRwEAOxUQ9wRcwv9EMBxTkFhXQAz5yiidhUBERABEUidgMv7M4tTur60wtnRvaaLRw+5BeSckHqL0v2JgAiIgCcBANua7lsZYxLzCtEu9CiAsyyf0mwApvIsng4TAREQARFoAwFLvfBtt4xGRWzfjc4JrwO4x5bktpR3XBtaj+5RBERABEokAGAjAA/7jkROtofOCecC+BiAJeWcUGLl6FQiIAIi0BYCZjv6vEcg7F8AUHz1QFN2kJBpWxqN7lMEREAEqiBgKbvzZIR9xNma9gewnAtenUuzoSpqRecUAREQgZYRoI0HwIlOKohOCP02fv+i2YVOB7AYlbQZQNsyVLpdERABERCBKgmYNly/2RE95G5xv58P4P0ApqmyHDq3CIiACIhAywkA2AfAP3umRlyOo5v2vuacICHTlrcR3b4IiIAIVE4AwAwArnE5hd4EcAmA3V2OodWUZbVy9LqACIiACIhALwEAm7jA1d1cyu/5zdNuit7f9VkEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAEREAERKA2Av8HNUDh8/6XipQAAAAASUVORK5CYII="
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

	-- Add player to ESP
	local PlrConnections = {}
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
			LastSwing.Data = SwingImage
			LastParry.Data = ParryImage

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
	Max = 1000;
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
	Callback = function(v)
		Config.Wallbang = v;
		getgenv().Wallbang = v;
	end;
});

gunmods:AddToggle("AlwaysHead", {
	Text = "always head";
	Default = false;
	Callback = function(v)
		Config.AlwaysHead = v
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
local Camera = workspace.CurrentCamera
do -- Silent Aim
	setthreadidentity(2)
	local ActiveCast = require(repstorage.Shared.Vendor.FastCast.ActiveCast)
	setthreadidentity(7)

	local cache = {}
	local chanceCache = {}
	local currentSilentAimTarget = nil
	local OldSimulateCast = getupvalue(ActiveCast.new, 6)
	local OldCalculateFire = modules.Name["RangedWeaponHandler"].calculateFireDirection
	function newSimulate(...)
		local args = { ... }
		local caster = args[1]

		pcall(function()
			local weapon, metadata = framework:GetRanged()

			local Chance = framework:Chance(Classes.HitChance.Value)
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
				and (Classes.SilentAim.Value or getgenv().ragebot)
				and weapon
				and metadata
			then
				local Player = framework:GetClosestCharacterToOrigin(caster:GetPosition(), 19)
				if Classes.ClosestType.Value == "Only Redirect To Target" then
					Player = nil
					local Characters = framework:GetClosestCharactersToOrigin(caster:GetPosition(), 19)
					if table.find(Characters, currentSilentAimTarget) then
						Player = currentSilentAimTarget
					end
				end
				
				local MouseClosest = framework:GetClosestToMouse(Classes.FOVSize.Value)

				if Player then
					local Head = Player:FindFirstChild("Head")
					local Character = LocalPlayer.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
					if getgenv().ragebot and Head and HumanoidRootPart then
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
			end
		end)

		if caster and caster.UserData and caster.StateInfo then
			return OldSimulateCast(...)
		end

		return
	end
	function newCalculateFire(...)
		local args = { ... }
		local target = framework:GetClosestToMouse(Classes.FOVSize.Value)
		local ranged, metadata = framework:GetRanged()

		if
			Classes.SilentAim.Value
			and target
			and ranged
			and metadata
			and framework:Chance(Classes.HitChance.Value)
			and not framework:InMenu(target)
		then

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
		end

		return OldCalculateFire(unpack(args))
	end

	setupvalue(ActiveCast.new, 6, function(...)
    	local args = {...}
    	return newSimulate(unpack(args))
	end)

	modules.Name["RangedWeaponHandler"].calculateFireDirection = newCalculateFire

	local VisualizerFolder = Instance.new("Folder", game.Workspace.Terrain)
	VisualizerFolder.Name = "FastCastVisualizationObjects"
	VisualizerFolder.ChildAdded:Connect(function(child)
		task.wait()
		local Debris = game:GetService("Debris")
		Debris:AddItem(child, 0.7)
	end)
	
	task.spawn(function()
		while task.wait() do
			if not Active then
				break
			end

			if not getgenv().ragebot then
				continue
			end

			local Character = localplayer.Character
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

			local ranged, metadata = framework:GetRanged()
			if not ranged or not metadata then
				continue
			end

			local player = LockedTarget or framework:GetClosest2(Classes.RagebotDist.Value)

			if LockedTarget and not next(LockedTarget) then
				LockedTarget = nil
				continue
			end

			if not player or not next(player) then
				continue
			end

			if metadata.canShootBulletssss == nil then
				metadata.canShootBulletssss = true
			end

			if metadata._clientAmmoVO.Value <= 0 then
				network:FireServer("StartRangedReload", ranged)
				task.wait(metadata._itemConfig.reloadTime - 0.2)
				if ranged then
					pcall(function()
						local reloaded, _ = network:InvokeServer("FinishedRangedReload", ranged)
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

			local targetPlayer = players:FindFirstChild(next(player))
			if not targetPlayer or not targetPlayer.Character then
				continue
			end

			local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")
			if not targetHumanoid or targetHumanoid.Health == 0 then
				LockedTarget = nil
				continue
			end

			if framework:InMenu(targetPlayer) then
				LockedTarget = nil
				continue
			end

			local Head = targetPlayer.Character:FindFirstChild("Head")
			if not Head or targetPlayer.Character:FindFirstChildOfClass("ForceField") then
				LockedTarget = nil
				continue
			end

			metadata.canShootBulletssss = false

			LockedTarget = player

			metadata._mainCasterBehavior.RaycastParams.FilterDescendantsInstances = {
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

			network:FireServer("RangedFire", ranged, origin, {
				[tostring(metadata._cheatId)] = dir.Unit,
			}, {
				[tostring(metadata._cheatId)] = dir,
			}, {
				[1] = tostring(metadata._cheatId),
			}, nil, Camera.CFrame, Workspace:GetServerTimeNow())

			metadata._clientAmmoVO.Value = metadata._clientAmmoVO.Value - 1

			local distance = (origin - Head.Position).Magnitude
			local timeToHit = distance / projectileSpeed

			if not (ranged.Name == "Longbow" or ranged.Name == "Crossbow" or ranged.Name == "Heavy Bow") then
				task.delay(timeToHit + 0.08, function()
					if cast.UserData and cast.StateInfo and cast.StateInfo.UpdateConnection then
						if Toggles.ShowLine.Value then
							local part = Instance.new("Part")
							part.Anchored = true
							part.CanCollide = false
							part.Material = Enum.Material.Neon
							part.Color = Options.linecolor.Value
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
			task.wait(metadata._itemConfig.cooldown)

			if metadata._clientAmmoVO.Value <= 0 then
				network:FireServer("StartRangedReload", ranged)
				task.wait(metadata._itemConfig.reloadTime - 0.2)

				if ranged then
					pcall(function()
						local reloaded, _ = network:InvokeServer("FinishedRangedReload", ranged)
						if reloaded then
							metadata._clientAmmoVO.Value = metadata._itemConfig.maxAmmo
						end
					end)
				end
			end
			metadata.canShootBulletssss = true
		end
	end)
end
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
