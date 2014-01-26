Peep
==
Peep is a library designed for the *awesome* [**LÖVE**][LOVE] framework. Piggybacking off of [**LoveFrames**][LF], Peep allows you to interactively look through the contents of a Lua variable--most notably tables.

Quick Example
--
```lua     
local STI	= require "libs.sti"
local Peep	= require "libs.Peep.init"

function love.load()
	map = STI.new("assets/maps/map02")
	peep_map = Peep.new("map", map)
end

function love.update(dt)
	map:update(dt)
	peep_map:update(dt)
end

function love.draw()
	map:draw()
	peep_map:draw()
end

function love.mousepressed(x, y, button)
	peep_map:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	peep_map:mousereleased(x, y, button)
end
```

License
--
This code is licensed under the [**MIT Open Source License**][MIT]. Check out the LICENSE file for more information.

[LOVE]: https://www.love2d.org/
[LF]: https://github.com/NikolaiResokav/LoveFrames
[MIT]: http://www.opensource.org/licenses/mit-license.html