local PriorityQueue = {}

local MAX_SIZE = 15
local heap = {}
local size

function PriorityQueue.new()
	size = 1
end

function PriorityQueue:parent(i)
	local num = math.ceil((i - 1) / 2)
	if num == 0 then
		num = 1
	end
	return num
end

function PriorityQueue:leftChild(i)
	return 2*i
end

function PriorityQueue:rightChild(i)
	return 2*i + 1
end

function PriorityQueue:size()
	return size
end

function PriorityQueue:enqueue(data)
	if size >= MAX_SIZE then
		print("The queue is full. Cannot insert")
		return
	end
	
	-- first insert the time at the last position of the array and move it up
	heap[size] = data
	size = size + 1
	
	-- move up until the heap property satisfies
	local i = size - 1
	
	while i ~= 1 and heap[self:parent(i)] > heap[i] do
		local temp = heap[i]
		heap[i] = heap[self:parent(i)]
		heap[self:parent(i)] = temp
		i = self:parent(i)
	end
end

function PriorityQueue:maxHeapify(i)
	-- find left child node
	local left = self:leftChild(i)
	
	-- find right child node
	local right = self:rightChild(i)
	
	-- find the largest among 3 nodes
	local largest = i
	
	-- check if the left node is larger than the current node
	if left <= size and heap[left] > heap[largest] then
		largest = left
	end
	
	-- check if the right node is larger than the current node and left node
	if right <= size and heap[right] > heap[largest] then
		largest = right
	end
	
	-- swap the largest node with the current node 
	-- and repeat this process until the current node is larger 
	--than the right and the left node
	if largest ~= i then
		local temp = heap[i]
		heap[i] = heap[largest]
		heap[largest] = temp
		self:maxHeapify(largest)
	end
end

-- returns the maximum item of the heap
function PriorityQueue:peek()
	return heap[1]
end

-- deletes the max item and return
function PriorityQueue:dequeue()
	local maxItem = heap[1]
	
	-- replace the first item with the last item
	heap[1] = heap[size - 1]
	size = size - 1
	
	-- maintain the heap property by heapifying the first item
	if size < 1 then
		return nil
	end
	
	self:maxHeapify(1)
	return maxItem
end

function PriorityQueue:printQueue()
	local returnString = ""
	for i = 1, size - 1, 1 do
		returnString = returnString.." "..tostring(heap[i])
	end
	print(returnString)
end

return PriorityQueue