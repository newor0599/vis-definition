---@class vis.ui
vis.ui = {}

---Default style IDs
---@type table ids for all default styles
vis.ui.style_ids = nil

---Number of available colors.
---@type integer
vis.ui.colors = nil

---Current layout.
---@type vis.layouts
vis.ui.layout = nil

---Define a display style.
---@param id integer the style id to use
---@param style string the style definition
---@return boolean #whether the style definition has been successfully associated with the given id
function vis.ui:style_define(id, style) end

---Obtain a new style id from style pool
---@param style string? the initial style definition to fill the slot (optional)
---@return integer #the new style id, nil if none available
function vis.ui:style_push(style) end
