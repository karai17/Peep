--[[
------------------------------------------------------------------------------
Peep is licensed under the MIT Open Source License.
(http://www.opensource.org/licenses/mit-license.html)
------------------------------------------------------------------------------

Copyright (c) 2014 Landon Manning - LManning17@gmail.com - LandonManning.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]--

-- Peep v0.1.1

local Debug	= {}
local Peep	= {}
local path	= ({...})[1]:gsub("[%.\\/]init$", "") .. '.'

require(path .. "LoveFrames")

function Debug.new(key, value)
	local peep = setmetatable({}, {__index = Peep})
	peep:newFrame(key, value)
	
	return peep
end

function Peep:newFrame(key, value, from)
	local frame = loveframes.Create("frame")
	frame:SetName(key .. " = " .. tostring(value))
	frame:SetSize(200, love.graphics.getHeight())
	frame:SetDockable(true)
	
	if from then
		local x, y = from:GetPos()
		local w, h = from:GetSize()
		
		frame:SetPos(x+w, 0)
	end
	
	local list = loveframes.Create("list", frame)
	list:SetPos(5, 30)
	list:SetSize(190, frame:GetHeight() - 35)
	list:SetPadding(5)
	list:SetSpacing(3)
	
	if type(value) == "table" then
		
		for k, v in pairs(value) do
			self:addItem(list, k, v)
		end
	end
end

function Peep:addItem(list, key, value)
	local item
	
	if type(value) == "table" then
		item = loveframes.Create("button", list)
		item.OnClick = function()
			self:newFrame(key, value, list:GetParent())
		end
	else
		item = loveframes.Create("textinput", list)
		item:SetEditable(false)
	end
	
	item:SetText(key .. " = " .. tostring(value))
	list:AddItem(item)
end

function Peep:update(dt)
	loveframes.update(dt)
end

function Peep:draw()
	loveframes.draw()
end

function Peep:mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
end

function Peep:mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end

return Debug