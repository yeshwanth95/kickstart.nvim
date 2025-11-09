local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Example: print snippet
  s('pr', {
    t 'print(',
    i(1, '"Hello, world!"'),
    t ')',
  }),

  -- Example: if __name__ == "__main__"
  s('main', {
    t { 'if __name__ == "__main__":', '\t' },
    i(1, 'main()'),
  }),

  -- Interactive debug console
  s('interact', {
    t { 'import code; code.interact(local=locals())' },
  }),
}
