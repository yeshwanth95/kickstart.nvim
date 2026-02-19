local helpers = require 'personal.luasnip-helper-funcs'
local get_date = helpers.get_ISO_8601_date
local get_visual = helpers.get_visual

-- A logical OR of `line_begin` and the regTrig '[^%a]trig'
function line_begin_or_non_letter(line_to_cursor, matched_trigger)
  local line_begin = line_to_cursor:sub(1, -(#matched_trigger + 1)):match '^%s*$'
  local non_letter = line_to_cursor:sub(-(#matched_trigger + 1), -(#matched_trigger + 1)):match '[ :`=%{%(%["]'
  return line_begin or non_letter
end

return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require('luasnip').snippet({ trig = 'hi' }, { t 'Hello, world!' }),

  -- To return multiple snippets, use on 'return' statement per snippet file
  -- and return a table of Lua snippets.
  require('luasnip').snippet({ trig = 'foo' }, { t 'Another snippet.' }),

  -- Today's date in YYYY-MM-DD (ISO 8601) format
  s(
    { trig = 'iso' },
    { f(get_date) }
    -- {f(get_ISO_8601_date)}
  ),
}
