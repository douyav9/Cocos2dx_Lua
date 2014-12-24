
local ImageView = class("ImageView",function(width, height)
    local super = require("View")
    return super.create(width, height)
end)

local  imageZorder = 1

function ImageView:ctor()
    self.mCurFocus = nil
end

function ImageView.create(image, width, height)
    local imageView = ImageView.new(width, height)
    local function init()
        local image = cc.Sprite:create(image)
        local imageWidthSize = image:getTextureRect().width
        local imageHeightSize = image:getTextureRect().height
        image:setAnchorPoint(cc.p(0,0))
        image:setScale(width / imageWidthSize, height / imageHeightSize)
        
        imageView:addChild(image, imageZorder);
    end

    init()
    return imageView
end

function ImageView:requestFocus()

end

return ImageView