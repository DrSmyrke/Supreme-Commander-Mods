#****************************************************************************
#**
#**  File     :  /lua/EnhancedLobby.lua
#**  Author(s): Michael Robbins aka Sorian
#**
#**  Summary  : Functions to support the Lobby Enhancement Mod.
#**
#****************************************************************************

local Mods = import('/lua/mods.lua')
local GPGrestrictedUnits = import('/lua/LEMLobbyOptions.lua').GPGrestrictedUnits
local GPGsortOrder = import('/lua/LEMLobbyOptions.lua').GPGsortOrder
local GPGOptions = import('/lua/LEMLobbyOptions.lua').GPGOptions
local versionstrings = import('/lua/LEMLobbyOptions.lua').versionstrings

#-----------------------------------------------------
#   Function: GetLEMVersion
#   Args:
#       short		- short version
#   Description:
#       Get the LEM version.
#   Returns:  
#       short or long version
#-----------------------------------------------------
function GetLEMVersion(short)
	if short then
		return 'LEM4.6.2'
	else
		return 'Lobby Enhancement Mod 4.6.2'
	end
end

#-----------------------------------------------------
#   Function: VersionLoc
#   Args:
#       la 			- language
#   Description:
#       Gets the localized text for "Version :".
#   Returns:  
#       text
#-----------------------------------------------------
function VersionLoc(la)
	if versionstrings[la] then
		return versionstrings[la]
	else
		return versionstrings['us']
	end
end

#-----------------------------------------------------
#   Function: GetActiveModLocation
#   Args:
#       mod_Id		- mod uid
#   Description:
#       Gets a mods file path.
#   Returns:  
#       The mods file path
#	Notes:
#		Based on Manimals work
#-----------------------------------------------------
function GetActiveModLocation( mod_Id )
	local activeMods = GetActiveMods()
	for i, mod in activeMods do
		if mod_Id == mod.uid then
			return mod.location
		end
	end
	return false
end

#-----------------------------------------------------
#		DEPRECATED - slated for removal
#-----------------------------------------------------
function GetActiveModLocationSim( mod_Id )
	return GetActiveModLocation( mod_Id )
end

#-----------------------------------------------------
#   Function: CheckMapHasMarkers
#   Args:
#       scenario	- scenario info
#   Description:
#       Checks a map for Land Path nodes.
#   Returns:  
#       true or false
#-----------------------------------------------------
function CheckMapHasMarkers(scenario)
	if not DiskGetFileInfo(scenario.save) then
		return false
	end
    local saveData = {}
    doscript('/lua/dataInit.lua', saveData)
    doscript(scenario.save, saveData)

	if saveData and saveData.Scenario and saveData.Scenario.MasterChain and
	saveData.Scenario.MasterChain['_MASTERCHAIN_'] and saveData.Scenario.MasterChain['_MASTERCHAIN_'].Markers then
		for marker,data in saveData.Scenario.MasterChain['_MASTERCHAIN_'].Markers do
			if string.find( string.lower(marker), 'landpn') then
				return true
			end
		end
	else
		WARN('Map '..scenario.name..' has no marker chain')
	end
	return false
end

#-----------------------------------------------------
#   Function: GetLobbyOptions
#   Args:
#		None
#   Description:
#       Loads custom lobby options.
#   Returns:  
#       Custom options
#-----------------------------------------------------
function GetLobbyOptions()
	local activeMods = GetActiveMods()
	local options = GPGOptions
	
	local OptionFiles = DiskFindFiles('/lua/CustomOptions', '*.lua')
	
	for i, v in OptionFiles do
        local tempfile = import(v).LobbyGlobalOptions
		for s, t in tempfile do	
			table.insert(options, t)
		end
	end
	for k, mod in activeMods do
		local OptionFiles = DiskFindFiles(mod.location..'/lua/CustomOptions', '*.lua')
		for i, v in OptionFiles do
			local tempfile = import(v).LobbyGlobalOptions
			for s, t in tempfile do	
				table.insert(options, t)
			end
		end
	end
	return options	
end

#-----------------------------------------------------
#   Function: IsSim
#   Args:
#		None
#   Description:
#       Checks whether the function is in Sim or UI.
#   Returns:  
#       true or false
#-----------------------------------------------------
function IsSim()
	
	local result
	if not rawget(_G, 'GetCurrentUIState') then
		result = true
	else
		result = false
	end
	
	return result
end

#-----------------------------------------------------
#   Function: GetActiveMods
#   Args:
#		None
#   Description:
#       Gets the active mods.
#   Returns:  
#       table of mods
#-----------------------------------------------------
function GetActiveMods()
	if IsSim() then
		#LOG('*DEBUG: Sim')
		return __active_mods
	else
		#LOG('*DEBUG: UI')
		return Mods.GetGameMods()
	end
end

#-----------------------------------------------------
#   Function: GetRestrictedUnits
#   Args:
#		None
#   Description:
#       Loads custom unit restriction options.
#   Returns:  
#       Custom unit restriction options
#-----------------------------------------------------
function GetRestrictedUnits()
	local activeMods = GetActiveMods()

	local options = GPGrestrictedUnits
	
	local OptionFiles = DiskFindFiles('/lua/CustomUnitRestrictions', '*.lua')
	
	for i, v in OptionFiles do
        local tempfile = import(v).UnitRestrictions
		for s, t in tempfile do	
			options[s] = t
		end
	end
	for k, mod in activeMods do
		local OptionFiles = DiskFindFiles(mod.location..'/lua/CustomUnitRestrictions', '*.lua')
		for i, v in OptionFiles do
			local tempfile = import(v).UnitRestrictions
			for s, t in tempfile do	
				options[s] = t
			end
		end
	end
	
	return options	
end

#-----------------------------------------------------
#   Function: GetSortOrder
#   Args:
#		None
#   Description:
#       Loads custom sort orders.
#   Returns:  
#       Custom sort order
#-----------------------------------------------------
function GetSortOrder()
	local activeMods = GetActiveMods()
	local options = GPGsortOrder
	
	local OptionFiles = DiskFindFiles('/lua/CustomSortOrder', '*.lua')
	
	for i, v in OptionFiles do
        local tempfile = import(v).SortOrder
		for s, t in tempfile do	
			table.insert(options, t)
		end
	end
	for k, mod in activeMods do
		local OptionFiles = DiskFindFiles(mod.location..'/lua/CustomSortOrder', '*.lua')
		for i, v in OptionFiles do
			local tempfile = import(v).SortOrder
			for s, t in tempfile do	
				table.insert(options, t)
			end
		end
	end
	
	return options	
end

#-----------------------------------------------------
#   Function: GetAIList
#   Args:
#		None
#   Description:
#       Loads custom AIs.
#   Returns:  
#       Custom AIs
#-----------------------------------------------------
function GetAIList()
	#Table of AI Names to return
	local aitypes = {}
	
	#Defualt GPG AIs
    table.insert(aitypes, { key = 'easy', name = "<LOC lobui_0347>AI: Easy" })
    table.insert(aitypes, { key = 'medium', name = "<LOC lobui_0349>AI: Normal" })
    table.insert(aitypes, { key = 'adaptive', name = "<LOC lobui_0368>AI: Adaptive" })
    table.insert(aitypes, { key = 'rush', name = "<LOC lobui_0360>AI: Rush" })
    table.insert(aitypes, { key = 'turtle', name = "<LOC lobui_0372>AI: Turtle" })
    table.insert(aitypes, { key = 'tech', name = "<LOC lobui_0370>AI: Tech" })
	table.insert(aitypes, { key = 'random', name = "<LOC lobui_0374>AI: Random" })
	
	local AIFiles = DiskFindFiles('/lua/AI/CustomAIs_v2', '*.lua')
	local AIFilesold = DiskFindFiles('/lua/AI/CustomAIs', '*.lua')
	
	#Load Custom AIs - old style
	for i, v in AIFilesold do
        local tempfile = import(v).AIList
		for s, t in tempfile do	
			table.insert(aitypes, { key = t.key, name = t.name })
		end
	end
	
	#Load Custom AIs
	for i, v in AIFiles do
        local tempfile = import(v).AI
		if tempfile.AIList then
			for s, t in tempfile.AIList do	
				table.insert(aitypes, { key = t.key, name = t.name })
			end
		end
	end
	
	#Default GPG Cheating AIs
    table.insert(aitypes, { key = 'adaptivecheat', name = "<LOC lobui_0379>AIx: Adaptive" })
    table.insert(aitypes, { key = 'rushcheat', name = "<LOC lobui_0380>AIx: Rush" })
    table.insert(aitypes, { key = 'turtlecheat', name = "<LOC lobui_0384>AIx: Turtle" })
    table.insert(aitypes, { key = 'techcheat', name = "<LOC lobui_0385>AIx: Tech" })
    table.insert(aitypes, { key = 'randomcheat', name = "<LOC lobui_0395>AIx: Random" })
	
    #Load Custom Cheating AIs - old style
	for i, v in AIFilesold do
        local tempfile = import(v).CheatAIList
		for s, t in tempfile do	
			table.insert(aitypes, { key = t.key, name = t.name })
		end
	end
	
	#Load Custom Cheating AIs
    for i, v in AIFiles do
        local tempfile = import(v).AI
		if tempfile.CheatAIList then
			for s, t in tempfile.CheatAIList do	
				table.insert(aitypes, { key = t.key, name = t.name })
			end
		end
	end
	
	return aitypes
end

#-----------------------------------------------------
#   Function: GetCustomTooltips
#   Args:
#		None
#   Description:
#       Loads custom tooltips.
#   Returns:  
#       Custom tooltips
#-----------------------------------------------------
function GetCustomTooltips()
	#Table of AI Names to return
	local activeMods = GetActiveMods()
	local tooltips = {}
	
	local AIFiles = DiskFindFiles('/lua/AI/CustomAITooltips', '*.lua')
	
	#Load Custom AI Tooltips
	for i, v in AIFiles do
        local tempfile = import(v)
		if tempfile.Tooltips then
			for s, t in tempfile.Tooltips do	
				tooltips[s] = t
			end
		end
	end
	for k, mod in activeMods do
		local OptionFiles = DiskFindFiles(mod.location..'/lua/AI/CustomAITooltips', '*.lua')
		for i, v in OptionFiles do
			local tempfile = import(v)
			if tempfile.Tooltips then
				for s, t in tempfile.Tooltips do	
					tooltips[s] = t
				end
			end
		end
	end
	
	return tooltips
end

#-----------------------------------------------------
#   Function: BroadcastAIInfo
#   Args:
#		None
#   Description:
#       Broadcasts AI version info into the game lobby.
#   Returns:  
#       nil
#-----------------------------------------------------
function BroadcastAIInfo()
	#Add chat message for each custom AI
	local AIFiles = DiskFindFiles('/lua/AI/CustomAIs_v2', '*.lua')
	
	local broadchat = ""
    for i, v in AIFiles do
        local tempfile = import(v).AI
		if tempfile.Name and tempfile.Version then
			broadchat = broadchat..tempfile.Name.." "..tempfile.Version.."; "
		end
	end
	if broadchat != "" then
		import('/lua/ui/lobby/lobby.lua').PublicChat("("..GetLEMVersion(true)..") Is using: "..broadchat)
	else
		import('/lua/ui/lobby/lobby.lua').PublicChat("("..GetLEMVersion(true)..") Is not using any AIs")
	end
end

#-----------------------------------------------------
#   Function: GetLEMData
#   Args:
#		None
#   Description:
#       Gets data about LEM version and installed AIs.
#   Returns:  
#       LEM version and AI info
#-----------------------------------------------------
function GetLEMData()
	#Add chat message for each custom AI
	local AIFiles = DiskFindFiles('/lua/AI/CustomAIs_v2', '*.lua')
	
	local data = {}
	table.insert(data, GetLEMVersion(true))
    for i, v in AIFiles do
        local tempfile = import(v).AI
		if tempfile.Name and tempfile.Version then
			table.insert(data, tempfile.Name..' '..tempfile.Version)
		end
	end
	return data
end