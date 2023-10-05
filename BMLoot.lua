BMLoot = CreateFrame("Frame", nil, nil)
BMLoot:RegisterEvent("LOOT_BIND_CONFIRM")
BMLoot:RegisterEvent("START_LOOT_ROLL")
BMLoot:RegisterEvent("ZONE_CHANGED_NEW_AREA")

local active = false
local csae = false

BMLoot:SetScript("OnEvent", function()

if event == "ZONE_CHANGED_NEW_AREA" then
	if GetRealZoneText() == "The Black Morass" then
		active = true
	else
		active = false
	end
elseif event == "START_LOOT_ROLL" then
	if active == true then
		texture, name, count, quality, bindOnPickup = GetLootRollItemInfo(RollID)
		if name == "Corrupted Sand" or "Arcane Essence" then
			csae = true
			RollOnLoot(id, 1);
		else
			csae = false
		end
elseif event == "LOOT_BIND_CONFIRM" then
	if csae = true
		LootSlot(arg1)
		StaticPopup1Button1:Click()
	else
	end
end
end)
