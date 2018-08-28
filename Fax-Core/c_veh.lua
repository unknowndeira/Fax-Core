--[[
Fax Core, made by FAXES
Change blacklisted cars in config.lua, Do not edit this file unless you know what your doing.
]]
-- Function for staff vehicles
function isStaffVeh(veh)
	local model = GetEntityModel(veh)
	for i = 1, #vehModelsAdmin do
		local model2 = GetHashKey(vehModelsAdmin[i])
		if model == model2 then
			return true
		end
	end
	return false
end

-- Manage Restricted Vehicles
function ManageRestrictVehicles()
	local Faxped = GetPlayerPed(-1)
	local veh = nil

	if IsPedInAnyVehicle(Faxped, false) then
		veh = GetVehiclePedIsUsing(Faxped)
	else
		veh = GetVehiclePedIsTryingToEnter(Faxped)
	end
	
	if veh and DoesEntityExist(veh) then
		local model = GetEntityModel(veh)
		local driver = GetPedInVehicleSeat(veh, -1)
		if driver == Faxped then
			
			if curAuthLvlRank < authLvlRank["Admin"] and plteam ~= "Team-Admin" then
				if isStaffVeh(veh) then
					ShowInfo("~r~Restricted Vehicle Model.")
					ClearPedTasksImmediately(Faxped)
				end
			end

			if curAuthLvlRank < authLvlRank["Owner"] then
				for i = 1, #restrictedVehsGen do
					local rmodel1 = GetHashKey(restrictedVehsGen[i])
					if (model == rmodel1) or (GetVehicleClass(veh) == 19) then -- Military
						ShowInfo("~r~Restricted Vehicle Model.")
						DeleteE(veh)
						ClearPedTasksImmediately(Faxped)
					end
				end
			end	

			if curAuthLvlRank < authLvlRank["Sadmin"] then
				for i = 1, #restrictedVehsSnrAdmin do
					local rmodel2 = GetHashKey(restrictedVehsSnrAdmin[i])
					if model == rmodel2 then
						ShowInfo("~r~Restricted Vehicle Model.")
						ClearPedTasksImmediately(Faxped)
					end
				end
			end

			if curAuthLvlRank < authLvlRank["Admin"] then
				for i = 1, #restrictedVehsAdmin do
					local rmodel2 = GetHashKey(restrictedVehsAdmin[i])
					if model == rmodel2 then
						ShowInfo("~r~Restricted Vehicle Model.")
						ClearPedTasksImmediately(Faxped)
					end
				end
			end

			if curAuthLvlRank < authLvlRank["M3"] then 
				for i = 1, #restrictedVehsM3 do
					local rmodel3 = GetHashKey(restrictedVehsM3[i])
					if model == rmodel3 then
						ShowInfo("~r~Restricted Vehicle Model.")
						ClearPedTasksImmediately(Faxped)
					end
				end
			end

			if curAuthLvlRank < authLvlRank["M2"] then
				for i = 1, #restrictedVehsM2 do
					local rmodel4 = GetHashKey(restrictedVehsM2[i])
					if model == rmodel4 then
						ShowInfo("~r~Restricted Vehicle Model.")
						ClearPedTasksImmediately(Faxped)	
					end
				end
			end

			if curAuthLvlRank < authLvlRank["M1"] then 
				if GetVehicleClass(veh) == 7 then -- Motorbikes 
					ShowInfo("~r~Restricted Vehicle Model.")
					ClearPedTasksImmediately(Faxped)
				end
				if GetVehicleClass(veh) == 15 or GetVehicleClass(veh) == 16 then -- Planes / Heli's
					ShowInfo("~r~Restricted Vehicle Model.")
					ClearPedTasksImmediately(Faxped)
				end	
			end		
		end
	end
end

--[[
	List for vehicle class types.
	https://runtime.fivem.net/doc/reference.html#_0x29439776AAA00A62
]]--
