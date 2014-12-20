require "Cocos2d"
require "Cocos2dConstants"

local winWidthSize = cc.Director:getInstance():getWinSize().width
local winHeightSize = cc.Director:getInstance():getWinSize().height

local SubjectScene = class("SubjectScene",function()
    return cc.Scene:create()
end)

function SubjectScene.create()
    local scene = SubjectScene.new()
    scene:addChild(scene:createBgLayer())
    scene:addChild(scene:createItemLayer())
    return scene
end

function SubjectScene:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.schedulerID = nil
end

function SubjectScene:createBgLayer()
    local layerBg = cc.Layer:create()
    local view = require("View")
    local bg = view.create(winWidthSize,winHeightSize)
    bg:setBackground("subject_horizontal_bg.jpg")
    bg:setFocusable(false)
    bg:setAnchorPoint(0,0)

    layerBg:addChild(bg)
    return layerBg	
end

function SubjectScene:createItemLayer()
    local linearLayout = require("LinearLayout")
    local layout = linearLayout.create(winWidthSize, 60);
	for i=0, 10 do
		local imageView = require("ImageView")
        local item = imageView.create("icon.png", 60, 60);
        item.mPaddingLeft = 5
--        item:setPaddingLeft(5)
--        item:setNextFocusUpId(2)
--        cclog("item PaddingLeft"..item:getPaddingLeft())
--        cclog("item setNextFocusUpId"..item.FOCUS_UP)
        layout:addView(item)
	end
    return layout
end

return SubjectScene