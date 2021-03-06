
--引入lua文件
require "src/game/res/Require"

-- cclog log
cclog = function(...)
    print(string.format(...))
end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
    return msg
end

local function main()
    collectgarbage("collect")
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
    
    cc.FileUtils:getInstance():addSearchPath("src")
    cc.FileUtils:getInstance():addSearchPath("res")
    
    cc.FileUtils:getInstance():addSearchPath("src/game/res")
    cc.FileUtils:getInstance():addSearchPath("src/game/start")
    cc.FileUtils:getInstance():addSearchPath("src/game/scene")
    cc.FileUtils:getInstance():addSearchPath("src/game/sprite")
    cc.FileUtils:getInstance():addSearchPath("src/game/wiget")
    cc.FileUtils:getInstance():addSearchPath("src/game/test")
    cc.FileUtils:getInstance():addSearchPath("src/game/layer")


    cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(480, 320, 0)
    cc.Director:getInstance():setDisplayStats(false)

    local scene = require("SubjectScene")
    local gameScene = scene.create()
    
    if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(gameScene)
    else
        cc.Director:getInstance():runWithScene(gameScene)
    end

end


local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    error(msg)
end
