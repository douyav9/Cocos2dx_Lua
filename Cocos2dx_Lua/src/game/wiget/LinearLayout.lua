
local LinearLayout = class("LinearLayout",function(width, height)
    local super = require("ViewGroup")
    return super.create(width, height)
end)

function LinearLayout:ctor()
    self.mCurFocus = nil
    self.childRight = 0;
end

function LinearLayout.create(width, height)
    local linearLayout = LinearLayout.new(width, height)
    local function init()
    end

    init()
    return linearLayout
end

function LinearLayout:addView(child)
--    cclog("child PaddingLeft"..child.mPaddingLeft)
    child:setPosition(self.childRight,0)
    self.childRight = self.childRight + child:getContentSize().width + child.mPaddingLeft
    self:addChild(child)
end

function LinearLayout:requestFocus()

end

return LinearLayout