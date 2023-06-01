do
	local oldOnClickHandler = OnClickHandler
	function OnClickHandler(button, modifiers)
		oldOnClickHandler(button, modifiers)
		local item = button.Data
		if item.type == "templates" then
			local activeTemplate = item.template.templateData
			local worldview = import('/lua/ui/game/worldview.lua').viewLeft
			local oldHandleEvent = worldview.HandleEvent
			worldview.HandleEvent = function(self, event)
				if event.Type == 'ButtonPress' then
					if event.Modifiers.Middle then
						ClearBuildTemplates()
						local tempTemplate = table.deepcopy(activeTemplate)
						for i = 3, table.getn(activeTemplate) do
							local index = i
							activeTemplate[index][3] = 0 - tempTemplate[index][4]
							activeTemplate[index][4] = tempTemplate[index][3]
						end
						SetActiveBuildTemplate(activeTemplate)
					elseif event.Modifiers.Shift then
					else
						worldview.HandleEvent = oldHandleEvent
					end
				end
			end
		end
	end
end
