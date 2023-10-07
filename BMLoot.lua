DEFAULT_CHAT_FRAME:AddMessage("Testing, testing", 1, 0, 1);
BMLoot = CreateFrame("Frame")
BMLoot:RegisterEvent("START_LOOT_ROLL") 
BMLoot:RegisterEvent("LOOT_BIND_CONFIRM")
BMLoot:RegisterEvent("ZONE_CHANGED_NEW_AREA")
BMLoot:SetScript("OnEvent", function()
    if event == "START_LOOT_ROLL" then
		DEFAULT_CHAT_FRAME:AddMessage("START_LOOT_ROLL event triggered") -- just for debug
		DEFAULT_CHAT_FRAME:AddMessage(arg1, arg2, arg3, arg4, arg5) -- just for debug
        local rollID, rollTime, rollItemLink, rollQuantity, rollPlayer = arg1, arg2, arg3, arg4, arg5
		local texture, name, count, quality = GetLootRollItemInfo(rollID)
		DEFAULT_CHAT_FRAME:AddMessage("START LOOT ROLL, roll ID = "..rollID.."item Name = "..name) -- just for debug
        if name == "Corrupted Sand" and GetZoneText() == "The Black Morass" then
            DEFAULT_CHAT_FRAME:AddMessage("Rolling 'need' on "..name)  -- just for debug
            RollOnLoot(rollID, 1)
			StaticPopup1Button1:Click()		-- this doesn't check what you're confirming BoP on. Is that possible? I tried bellow, but not luck.	
			-- the Sand is needed on and BoP is confirmed, but the roll window does not close and can't be closed by clicking
        end	
	elseif event == "ZONE_CHANGED_NEW_AREA" then
		if GetRealZoneText() == "The Black Morass" then
			DEFAULT_CHAT_FRAME:AddMessage("You have entered "..GetRealZoneText().." auto-needing on Corrupted Sand")
		end
--	elseif event == "LOOT_BIND_CONFIRM" then
--		DEFAULT_CHAT_FRAME:AddMessage("LOOT_BIND_CONFIRM event triggered")  -- just for debug
--        local itemName = GetLootSlotLink(arg1)
--		DEFAULT_CHAT_FRAME:AddMessage(itemName)   -- just for debug
--        if itemName == "Corrupted Sand" then
--            LootSlot(arg1)
--            StaticPopup1Button1:Click()
--        end
--	end
end)
