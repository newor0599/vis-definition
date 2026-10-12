---@meta vis
---@class vis
vis = {}

---@type integer
---API information.
---
---[Open in Browser](https://martanne.github.io/vis/doc/#vis.API)
--- - API int an integer revision count of the commit vis was built with. Meant for plugin authors who want to write backward compatible plugins.
vis.API = nil

---@type string
---Version information
---
---[Open in Browser](https://martanne.github.io/vis/doc/#vis.VERSION)
--- - version information in `git describe` format, same as reported by `vis -v`.
vis.VERSION = nil

---@type integer
---Current count
---
---[Open in Browser](https://martanne.github.io/vis/doc/#vis.count)
--- - count int the specified count for the current command or `nil` if none was given
vis.count = nil

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
function vis:map(mode, key, target, help) end

---Execute a `:`-command.
---@param command string the command to execute
---@return boolean # whether the command succeeded
function vis:command(command) end

---Currently active window.
---@type vis.window
vis.win = nil

---Scintillua lexer module.
---Always a table, empty if the `lexer` or `lpeg` module is not found
---@type table
vis.lexers = nil

vis.options = {}
vis.options.autoindent = false --{ai} (default false)
vis.options.changecolors = false --(default false)
vis.options.escdelay = false --Milliseconds to wait before deciding whether an escape sequence should be treated as an ⟨Escape⟩ key (default 50)
vis.options.ignorecase = false --Whether to ignore case when searching {ic} (default false)

---@alias loadmethod
---| "auto" #Tries the former for files smaller than 8Mb and the latter for  larger  ones
---| "read" #Copies the file content to an independent in-memory buffer
---| "mmap" #Memory maps the file from disk and uses OS capabilities as caching layer

---WARNING: modifying a memory mapped file in-place will cause data loss
---@type loadmethod
vis.options.loadmethod = "auto" --How  existing  files  should  be loaded (default "auto")
vis.options.shell = "/bin/bash" --User shell to use for external commands, overrides SHELL and shell field of password database /etc/passwd (default "/bin/sh")

---Display a short message.
---The single line message will be displayed at the bottom of the screen and automatically hidden once a key is pressed.
---@param vis vis
---@param message string the message to display
function vis:info(message) end

---Insert keys at all cursor positions of active window.
---This function behaves as if the keys were entered in insert mode, but in contrast to vis:feedkeys it bypasses the input queue, meaning mappings do not apply and the keys will not be recorded in macros.
---@param vis vis
---@param keys string the keys to insert
function vis:insert(keys) end

---Open new process and return its input stream (stdin). If the stream is closed (by calling the close method or by being removed by a garbage collector) the spawned process will be killed by SIGTERM. When the process will quit or will output anything to stdout or stderr, the process_response event will be fired.
---The editor core won't be blocked while the external process is running.
---@param name string  the name of subprocess (to distinguish processes in the process_response event)
---@param command string the command to execute
---@return file* #the file handle to write data to the process, in case of error the return values are equivalent to io.open error values.
function vis:communicate(name, command) end

---Push keys to input queue and interpret them.
---The keys are processed as if they were read from the keyboard.
---@param keys string the keys to interpret
function vis:feedkeys(keys) end

---Unmap a global keybinding.
---@param mode integer the mode from which the mapping should be removed
---@param key string the mapping to remove
---@return boolean #whether the mapping was successfully removed
function vis:unmap(mode, key) end

---Display a multi line message.
---Opens a new window and displays an arbitrarily long message.
---@param message string the message to display
function vis:message(message) end

---Create an iterator over all windows. 
---@return function #the new iterator
function vis:windows() end
