---@meta events

---Events.
---@class vis.events
---@field START string
---@field WIN_CLOSE string
---@field WIN_HIGHLIGHT string
---@field WIN_OPEN string
---@field WIN_STATUS string
---@field TERM_CSI string
---@field PROCESS_RESPONSE string
---@field UI_DRAW string
---@field FILE_CLOSE string
---@field FILE_OPEN string
---@field FILE_SAVE_POST string
---@field FILE_SAVE_PRE string
---@field INIT string
---@field INPUT string
---@field QUIT string
vis.events = {}

---Subscribe to an event.
---Register an event handler.
---@param event string the event name
---@param handler function the event handler
---@param index? integer the index at which to insert the handler (1 is the highest priority) (optional)
function vis.events.subscribe(event, handler, index) end

---Editor startup completed. This event is emitted immediately before the main loop starts. At this point all files are loaded and corresponding windows are created. We are about to process interactive keyboard input.
vis.events.START = nil

---Unsubscribe from an event.
---Remove a registered event handler.
---@param event string
---@param handler function
---@return boolean #whether the handler was successfully removed
function vis.events.unsubscribe(event, handler) end

---Generate event.
---Invokes all event handlers in the order they were registered. Passes all arguments to the handler. The first handler which returns a non `nil` value terminates the event propagation. The other handlers will not be called.
---@param event string the event name
---@param ...  ... the remaining parameters are passed on to the handler
function vis.events.emit(event, ...) end
