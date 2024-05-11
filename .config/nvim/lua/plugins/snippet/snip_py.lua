-- py snippets
local luasnip = require('luasnip')

luasnip.add_snippets(nil, {
    python = {
        luasnip.snippet({trig = 'hello'}, {
            luasnip.text_node({
                '#!/usr/local/bin/python3',
                '',
                '# ==================================================',
                '# Function',
                '# ==================================================',
                'def main():',
                '   """',
                '   Hello, World 表示プログラム',
                '',
                '   Args:',
                '      void',
                '   """',
                '',
                '   print("Hello, World")',
                '',
                '# ==================================================',
                '# Script',
                '# ==================================================',
                'if __name__ == "__main__":',
                '    main()',
                '',
            }),
            luasnip.insert_node(0),
        }),
    },
})

