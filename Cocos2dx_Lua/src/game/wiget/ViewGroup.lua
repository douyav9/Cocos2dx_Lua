
local ViewGroup = class("ViewGroup",function(width, height)
    local super = require("View")
    return super.create(width, height)
end)

function ViewGroup:ctor()
    self.mCurFocus = nil
end

function ViewGroup.create(width, height)
    local viewGroup = ViewGroup.new(width, height)
    local function init()
    end

    init()
    return viewGroup
end

function ViewGroup:addView(child)
    self:addChild(child)
end

function ViewGroup:requestFocus()
	
end

--function ViewGroup:addView(child, zOrder)
--    self:addChild(child, zOrder)
--end

return ViewGroup