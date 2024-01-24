--[[
	Code written by nlurn - Github: https://github.com/swufs
	To find more DataStructures visit the repository: https://github.com/swufs/Roblox-DataStructures
]]

local Hashtable = {}

local ht = {}

function Hashtable.new()
	ht = {
		keys = {},
		values = {}
	}
	return ht
end

function Hashtable:put(item, data)
	for i = 0, #ht.keys, 1 do
		if ht.keys[i] == item then
			ht.values[i] = data
		else
			table.insert(ht.keys, item)
			table.insert(ht.values, data)
		end
	end
end

function Hashtable:remove(item)
	for i = 0, #ht.keys, 1 do
		if ht.keys[i] == item then
			table.remove(ht.keys[i])
			table.remove(ht.values[i])
		else
			print("item not found")
		end
	end
end

function Hashtable:containsKey(key)
	for i = 0, #ht.keys, 1 do
		if ht.keys[i] == key then
			return true
		end
	end
	return false
end

function Hashtable:printTable()
	return ht
end

return Hashtable
