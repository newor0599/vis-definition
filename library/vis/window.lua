---A window object.
---@class vis.window
vis.window = {}

---Close window.
---After a successful call the Window reference becomes invalid and must no longer be used. Attempting to close the last window will always fail.
---@param force? boolean whether unsaved changes should be discarded
---@return boolean # whether the window was closed
function vis.window:close(force) end

---@class vis.window.options
---@field breakat string {brk} (default "")
---@field colorcolumn integer {cc} (default 0)
---@field cursorline boolean {cul} (default false)
---@field expandtab boolean {et} (default false)
---@field numbers boolean {nu} (default false)
---@field relativenumbers boolean {rnu} (default false)
---@field numberwidth integer (default 0)
---@field showeof boolean (default true)
---@field shownewlines boolean (default false)
---@field showspaces boolean (default false)
---@field showtabs boolean (default false)
---@field statusbar boolean (default true)
---@field tabwidth integer {tw} (default 8)
---@field wrapcolumn integer {wc} (default 0)
vis.window.options = nil

---The file being displayed in this window. Changing the value to a file path will replace the current file with a new one for the specified path.
---@type vis.file
vis.window.file = nil

---Set up a window local key mapping.
---Map a key to a Lua function, or set up a recursive alias.
---
---When `target` is a function, a new mapping is created.
---When `target` is a string, it is equivalent to `vis:command('map! mode key target')`.
---Mappings are always recursive!
---
---@param mode integer   the mode to which the mapping should be added
---@param key string     the key to map
---@param target function|string  the Lua handler, or the key alias to map to
---@param help? string   single-line help text displayed in `:help` (optional)
---@return boolean # whether the mapping was successfully established
function vis.window:map(mode, key, target, help) end

---Remove a window local key mapping.
---@param mode integer the mode from which the mapping should be removed
---@param key string the mapping to remove
---@return boolean #whether the mapping was successfully removed
function vis.window:unmap(mode, key) end

---Style a window range.
---The style will be cleared after every window redraw.
---@param id integer the display style as registered with style_define
---@param start integer the absolute file position in bytes
---@param finish integer the end position
function vis.window:style(id, start, finish) end

---Set window status line.
---@param left string the left aligned part of the status line
---@param right? string the right aligned part of the status line (optional)
function vis.window:status(left, right) end

---Redraw window content.
function vis.window:draw() end

---The primary selection of this window.
---@type vis.selection
vis.window.selection = nil

---@class viewport
---@field bytes vis.range file bytes, from 0, at the start and end of the viewport
---@field lines vis.range file lines, from 1, at the top and bottom of the viewport
---@field height integer lines in viewport, accounting for window decoration
---@field width integer columns in viewport, accounting for window decoration
vis.window.viewport = {}

---Style the single terminal cell at the given coordinates, relative to this window.
---Completely independent of the file buffer, and can be used to style UI elements, such as the status bar. The style will be cleared after every window redraw.
---@param id integer
---@param x integer
---@param y integer
---@return boolean #false if the coordinates would be outside the window's dimensions
function vis.window:style_pos(id, x, y) end
