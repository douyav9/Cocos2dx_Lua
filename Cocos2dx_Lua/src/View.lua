
local View = class("View",function()
    return cc.Node:create()
end)

function View:ctor()
    self.FOCUS_UP = nil
    self.FOCUS_DOWN = nil
    self.FOCUS_LEFT = nil
    self.FOCUS_RIGHT = nil
    self.focusable = false
    self.hasFocus = false
    self.mPaddingLeft = 0
    self.mPaddingRight = 0
    self.mPaddingTop = 0
    self.mPaddingBottom = 0
end

local  backgroundZorder = 0

local function onKeyReleased(keyCode)
    if keyCode == cc.KeyCode.KEY_DPAD_LEFT then --left
        cclog("KEY_DPAD_LEFT")
    elseif keyCode == cc.KeyCode.KEY_DPAD_RIGHT then --right
        cclog("KEY_DPAD_RIGHT")
    elseif keyCode == cc.KeyCode.KEY_DPAD_UP then --up
        cclog("KEY_DPAD_UP")
    elseif keyCode == cc.KeyCode.KEY_DPAD_DOWN then --down
        cclog("KEY_DPAD_DOWN")
    elseif keyCode == cc.KeyCode.KEY_DPAD_CENTER then --center
        cclog("KEY_DPAD_CENTER")
    elseif keyCode == cc.KeyCode.KEY_ENTER then --center
        cclog("KEY_ENTER")
    elseif keyCode == cc.KeyCode.KEY_BACK_TAB then --back
        cclog("KEY_BACK_TAB")
    else
        cclog("keyCode="..keyCode)
    end
end

function View:setFocusable(focusable)
    self.focusable = focusable
end

function View:setNextFocusUpId(nextFocusUp)
    self.FOCUS_UP = nextFocusUp
end

function View:setNextFocusDownId(nextFocusDown)
    self.FOCUS_DOWN = nextFocusDown
end

function View:setNextFocusLeftId(nextFocusLeft)
    self.FOCUS_LEFT = nextFocusLeft
end

function View:setNextFocusRightId(nextFocusRight)
    self.FOCUS_RIGHT = nextFocusRight
end

function View:setPaddingLeft(paddingLeft)
    self.mPaddingLeft = paddingLeft
end

function View:getPaddingLeft()
    return self.mPaddingLeft
end

function View:setPaddingRight(paddingRight)
    self.mPaddingRight = paddingRight
end

function View:setPaddingTop(paddingTop)
    self.mPaddingTop = paddingTop
end

function View:setPaddingLeft(paddingBottom)
    self.mPaddingBottom = paddingBottom
end

function View:setBackground(image)
    local background = cc.Sprite:create(image)
    local imageWidthSize = background:getTextureRect().width
    local imageHeightSize = background:getTextureRect().height
    local viewWidth = self:getContentSize().width
    local viewHeight = self:getContentSize().height
    background:setAnchorPoint(cc.p(0,0))
    background:setScale(viewWidth / imageWidthSize, viewHeight / imageHeightSize)

    self:addChild(background,backgroundZorder)
end

function View:requestFocus()
	
end

function View:missFocus()

end

function View:onClick()
	
end

--function View:setBackground9Sprite(image)
--    local background = cc.Scale9Sprite:create(image)
--    local imageWidthSize = background:getTextureRect().width
--    local imageHeightSize = background:getTextureRect().height
--    local width = self:getContentSize()
--    local height = self:getContentSize()
--    background:setScale(width / imageWidthSize, height / imageHeightSize)
--
--    view:addChild(background,backgroundZorder)
--end

function View.create(width, height)
    local view = View.new()
    local function init()
        view:setContentSize(cc.size(width,height))

        local keylistener = cc.EventListenerKeyboard:create()
        keylistener:registerScriptHandler(onKeyReleased, cc.Handler.EVENT_KEYBOARD_RELEASED )

        local eventDispatcher = view:getEventDispatcher()
        eventDispatcher:addEventListenerWithSceneGraphPriority(keylistener, view)
    end

    init()
    return view
end

return View