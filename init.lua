--[[
------------------------------------------------------------------------------
LÖVE Table Viewer is licensed under the MIT Open Source License.
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

-- LÖVE Table Viewer v0.1.0

local Debug	= {}
local View	= {}
local path	= ({...})[1]:gsub("[%.\\/]init$", "") .. '.'

require(path .. "LoveFrames")

function Debug.new(key, value)
	local view = setmetatable({}, {__index = View})
	view:newFrame(key, value)
	
	return view
end

function View:newFrame(key, value)
	local frame = loveframes.Create("frame")
	frame:SetName(key .. ": " .. tostring(value))
	frame:SetSize(200, love.graphics.getHeight())
	frame:SetDockable(true)
	
	local list = loveframes.Create("list", frame)
	list:SetPos(5, 30)
	list:SetSize(190, frame:GetHeight() - 35)
	list:SetPadding(5)
	list:SetSpacing(3)
	
	if type(value) == "table" then
		for k, v in spairs(value) do
			self:addItem(list, k, v)
		end
	end
end

function View:addItem(list, key, value)
	local item
	
	if type(value) == "table" then
		item = loveframes.Create("button", list)
		item.OnClick = function()
			self:newFrame(key, value)
		end
	else
		item = loveframes.Create("textinput", list)
		item:SetEditable(false)
	end
	
	item:SetText(key .. ": " .. tostring(value))
	list:AddItem(item)
end

function View:update(dt)
	loveframes.update(dt)
end

function View:draw()
	loveframes.draw()
end

function View:mousepressed(x, y, button)
	loveframes.mousepressed(x, y, button)
end

function View:mousereleased(x, y, button)
	loveframes.mousereleased(x, y, button)
end

-- http://stackoverflow.com/questions/15706270/sort-a-table-in-lua
function spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

return Debug