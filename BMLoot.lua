DEFAULT_CHAT_FRAME:AddMessage("Testing, testing", 1, 0, 1);
BMLoot = CreateFrame("Frame")
BMLoot:RegisterEvent("START_LOOT_ROLL") 
BMLoot:RegisterEvent("LOOT_BIND_CONFIRM")
BMLoot:RegisterEvent("ZONE_CHANGED_NEW_AREA")
BMLoot:SetScript("OnEvent", function()
    if event == "START_LOOT_ROLL" then
        local rollID, rollTime, rollItemLink, rollQuantity, rollPlayer = arg1, arg2, arg3, arg4, arg5
		local texture, name, count, quality = GetLootRollItemInfo(rollID)
        if name == "Corrupted Sand" or "Arcane Essence" and GetZoneText() == "The Black Morass" then
            RollOnLoot(rollID, 1)
			StaticPopup1Button1:Click()		
        end	
	elseif event == "ZONE_CHANGED_NEW_AREA" then
		if GetRealZoneText() == "The Black Morass" then
			DEFAULT_CHAT_FRAME:AddMessage("You have entered "..GetRealZoneText().." auto-needing on Corrupted Sand")
		end
	end
end)