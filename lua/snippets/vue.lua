local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('vue', {
  s(
    'setup',
    fmt(
      [[
        <script setup lang="ts">
          {}
        </script>
      ]],
      { i(0) }
    ),
    {
      condition = function()
        return vim.bo.filetype == 'vue'
      end,
    }
  ),

  s(
    'template',
    fmt(
      [[
        <template>{}</template>
      ]],
      { i(0) }
    ),
    {
      condition = function()
        return vim.bo.filetype == 'vue'
      end,
    }
  ),

  s(
    'style',
    fmt(
      [[
        <style lang="scss" scoped>{}</style>
      ]],
      { i(0) }
    ),
    {
      condition = function()
        return vim.bo.filetype == 'vue'
      end,
    }
  ),

  s(
    'ref',
    fmt(
      [[
        const {} = ref{}
       ]],
      {
        i(1, 'varName'),
        i(0, '()'),
      }
    ),
    {
      condition = function()
        return vim.bo.filetype == 'vue'
      end,
    }
  ),
})
