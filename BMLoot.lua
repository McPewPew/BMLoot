DEFAULT_CHAT_FRAME:AddMessage("BMLoot has not let you down yet...", 1, 0, 1);
BMLoot = CreateFrame("Frame")
BMLoot:RegisterEvent("START_LOOT_ROLL") 
BMLoot:RegisterEvent("LOOT_BIND_CONFIRM")
BMLoot:RegisterEvent("ZONE_CHANGED_NEW_AREA")
BMLoot:SetScript("OnEvent", function()
if event == "START_LOOT_ROLL" then
	local rollID, rollTime, rollItemLink, rollQuantity, rollPlayer = arg1, arg2, arg3, arg4, arg5
	local texture, name, count, quality = GetLootRollItemInfo(rollID)
        if GetZoneText() == "The Black Morass" and (name == "Corrupted Sand" or name == "Arcane Essence") then
        	RollOnLoot(rollID, 1)
		for i=1,STATICPOPUP_NUMDIALOGS do -- for i=1 to (I think this is always 4 - STATICPOPUP_NUMDIALOGS)
			local frame = getglobal("StaticPopup"..i)  -- set frame to be = StaticPopup1, StaticPopup2 etc
			if frame:IsShown() and frame.which = "CONFIRM_LOOT_ROLL" then -- what is the StaticPopup for 
				getglobal("StaticPopup"..i.."Button1"):Click(); --click StaticPopup..i..Button1:Click()
			end
		end
        end	
	elseif event == "ZONE_CHANGED_NEW_AREA" then
		if GetRealZoneText() == "The Black Morass" then
			DEFAULT_CHAT_FRAME:AddMessage("You have entered "..GetRealZoneText().." auto-needing on Corrupted Sand and Arcane Essence")
		end
	end
end)

--If not UnitIsDeadOrGhost("player") then 
--something to test later
