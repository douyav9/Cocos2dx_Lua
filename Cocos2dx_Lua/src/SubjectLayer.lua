--local TableViewTestLayer = class("TableViewTestLayer",function()
--    return cc.Layer:create()
--end)

local TableViewTestLayer = class("TableViewTestLayer")
TableViewTestLayer.__index = TableViewTestLayer

function TableViewTestLayer.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, TableViewTestLayer)
    return target
end

function TableViewTestLayer.scrollViewDidScroll(view)
    print("scrollViewDidScroll")
end

function TableViewTestLayer.scrollViewDidZoom(view)
    print("scrollViewDidZoom")
end

function TableViewTestLayer.tableCellTouched(table,cell)
    print("cell touched at index: " .. cell:getIdx())
end

function TableViewTestLayer.cellSizeForTable(table,idx) 
    return 60,60
end

function TableViewTestLayer.tableCellAtIndex(table, idx)
    local strValue = string.format("%d",idx)
    local cell = table:dequeueCell()
    local label = nil
    if nil == cell then
        cell = cc.TableViewCell:new()
        local sprite = cc.Sprite:create("icon.png")
        sprite:setAnchorPoint(cc.p(0,0))
        sprite:setPosition(cc.p(0, 0))
        cell:addChild(sprite)

        label = cc.Label:createWithSystemFont(strValue, "Helvetica", 20.0)
        label:setPosition(cc.p(0,0))
        label:setAnchorPoint(cc.p(0,0))
        label:setTag(123)
        cell:addChild(label)
    else
        label = cell:getChildByTag(123)
        if nil ~= label then
            label:setString(strValue)
        end
    end

    return cell
end

function TableViewTestLayer.numberOfCellsInTableView(table)
    return 25
end

function TableViewTestLayer:init()

    local winSize = cc.Director:getInstance():getWinSize()

    local tableView = cc.TableView:create(cc.size(60,winSize.height))
    tableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    tableView:setPosition(cc.p(winSize.width - 60, 0))
    tableView:setDelegate()
    self:addChild(tableView)
    --registerScriptHandler functions must be before the reloadData funtion
    tableView:registerScriptHandler(TableViewTestLayer.numberOfCellsInTableView,cc.NUMBER_OF_CELLS_IN_TABLEVIEW)  
    tableView:registerScriptHandler(TableViewTestLayer.scrollViewDidScroll,cc.SCROLLVIEW_SCRIPT_SCROLL)
    tableView:registerScriptHandler(TableViewTestLayer.scrollViewDidZoom,cc.SCROLLVIEW_SCRIPT_ZOOM)
    tableView:registerScriptHandler(TableViewTestLayer.tableCellTouched,cc.TABLECELL_TOUCHED)
    tableView:registerScriptHandler(TableViewTestLayer.cellSizeForTable,cc.TABLECELL_SIZE_FOR_INDEX)
    tableView:registerScriptHandler(TableViewTestLayer.tableCellAtIndex,cc.TABLECELL_SIZE_AT_INDEX)
    tableView:reloadData()

    return true
end

function TableViewTestLayer.create()
    local layer = TableViewTestLayer.extend(cc.Layer:create())
--    local layer = TableViewTestLayer:new()
    if nil ~= layer then
        layer:init()
    end

    return layer
end

return TableViewTestLayer