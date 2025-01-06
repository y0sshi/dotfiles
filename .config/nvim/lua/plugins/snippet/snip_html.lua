-- html snippets
local luasnip = require('luasnip')

luasnip.add_snippets(nil, {
    html = {
        luasnip.snippet({trig = 'hello'}, {
            luasnip.text_node({
                '<!DOCTYPE html>',
                '<!-- comment -->',
                '<html>',
                '<head>',
                '  <meta charset="utf-8">',
                '</head>',
                '<body>',
                '  Hello, World!!',
                '</body>',
                '</html>',
            }),
            luasnip.insert_node(0),
        }),
    },
})

