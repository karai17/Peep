LÖVE Table Viewer
==
LÖVE Table Viewer is a library designed for the *awesome* [**LÖVE**][LOVE] framework. Piggybacking off of [**LoveFrames**][LF], LÖVE Table Viewer allows you to interactively dig into the contents of a Lua variable--most notably tables.

Quick Example
--
```lua     
local STI	= require "libs.sti"
local View	= require "libs.View.init"

function love.load()
	map = STI.new("assets/maps/map02")
	view_map = View.new("map", map)
end

function love.update(dt)
	map:update(dt)
	view_map:update(dt)
end

function love.draw()
	map:draw()
	view_map:draw()
end

function love.mousepressed(x, y, button)
	view_map:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	view_map:mousereleased(x, y, button)
end
```

License
--
This code is licensed under the [**MIT Open Source License**][MIT]. Check out the LICENSE file for more information.

[LOVE]: https://www.love2d.org/
[LF]: https://github.com/NikolaiResokav/LoveFrames
[MIT]: http://www.opensource.org/licenses/mit-license.html