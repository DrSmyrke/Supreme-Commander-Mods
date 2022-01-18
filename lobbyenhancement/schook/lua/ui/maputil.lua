do

-- given a scenario, determines if it can be played in skirmish mode
function IsScenarioPlayable(scenario)
    if not scenario.Configurations.standard.teams[1].armies then
		local mapName = 'Unknown' or scenario.name
		WARN('Map '..mapName..' has no armies table!')
        return false
	elseif not DiskGetFileInfo(scenario.save) then
		local mapName = 'Unknown' or scenario.name
		WARN('Map '..mapName..' is missing a save file!')
		return false
	end

    return true
end

end