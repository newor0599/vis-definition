---A selection object.
---A selection is a non-empty, directed range with two endpoints called *cursor* and *anchor*. A selection can be anchored in which case the anchor remains fixed while only the position of the cursor is adjusted. For non-anchored selections both endpoints are updated. A singleton selection covers one character on which both cursor and anchor reside. There always exists a primary selection which remains visible (i.e. changes to its position will adjust the viewport).
---The range covered by a selection is represented as an interval whose endpoints are absolute byte offsets from the start of the file. Valid addresses are within the closed interval `[0, file.size]`.
---Selections are currently implemented using character marks into the underlying persistent [text management data structure](https://github.com/martanne/vis/wiki/Text-management-using-a-piece-chain).
---This has a few consequences you should be aware of:
---- A selection becomes invalid when the delimiting boundaries of the underlying text it is referencing is deleted:
----- leaves selection in an invalid state win.file:delete(win.selection.pos, 1) assert(win.selection.pos == nil)
---Like a regular mark it will become valid again when the text is reverted to the state before the deletion.
---- Inserts after the selection position (`> selection.pos`) will not affect the selection position.
---local pos = win.selection.pos win.file:insert(pos+1, "-") assert(win.selection.pos == pos)
---- Non-cached inserts before the selection position (`<= selection.pos`) will affect the mark and adjust the selection position by the number of bytes which were inserted.
---local pos = win.selection.pos win.file:insert(pos, "-") assert(win.selection.pos == pos+1)
---- Cached inserts before the selection position (`<= selection.pos`) will not affect the selection position because the underlying text is replaced inplace.
---For these reasons it is generally recommended to update the selection position after a modification. The general procedure amounts to:
---1. Read out the current selection position 2. Perform text modifications 3. Update the selection position
---This is what vis:insert and vis:replace do internally.
---@class vis.selection
vis.selection = {}

---The range covered by this selection.
---@type vis.range
vis.selection.range = nil

---Remove selection.
function vis.selection:remove() end

---The 1-based line the cursor of this selection resides on.
---@type integer
vis.selection.line = nil

---The 1-based column position the cursor of this selection resides on.
---@type integer
vis.selection.col = nil

---Move cursor of selection. 
---@param line number
---@param col number
function vis.selection:to(line, col) end
