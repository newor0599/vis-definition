---A file object
---@class vis.file
vis.file = {}

---File name.
---The file name relative to current working directory or `nil` if not yet named
---@type string
vis.file.name = nil

---File path.
---The absolute file path or `nil` if not yet named
---@type string
vis.file.path = nil

---File state
---Whether the file contains unsaved changes
---@type boolean
vis.file.modified = nil

---Delete file range
---@param range vis.range
---@return boolean #whether the file content was successfully changed
function vis.file:delete(range) end

---Create a restore point for undo/redo.
function vis.file:snapshot() end

---Insert data at position.
---@param pos integer
---@param data string
---@return boolean #whether the file content was successfully changed
function vis.file:insert(pos, data) end

---File size in bytes.
---@type integer
vis.file.size = nil

--- Get file content of a range, or of a position and length.
---@param a vis.range|integer  a range object, OR the 0-based byte position
---@param b? integer the length in bytes (only when `a` is a number)
---@return string #the file content
function vis.file:content(a, b) end
