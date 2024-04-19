-- cpp snippets
local luasnip = require('luasnip')

luasnip.add_snippets(nil, {
    cpp = {
        luasnip.snippet({trig = 'hello'}, {
            luasnip.text_node({
                '#include <iostream>',
                '',
                'int main(void) {',
                '    std::cout << "hello, world!!" << std::endl;',
                '    return 0;',
                '}',
            }),
            luasnip.insert_node(0),
        }),
    },
})

