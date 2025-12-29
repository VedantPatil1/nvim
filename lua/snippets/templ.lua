local luasnip = require('luasnip')
local s = luasnip.snippet
local i = luasnip.insert_node
local fmt = require('luasnip.extras.fmt').fmt

luasnip.add_snippets('templ', {
  s('base', fmt([[
templ {name}(title string) {{
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{{ title }}</title>
        <link rel="stylesheet" href="{cssPath}">
    </head>
    <body>
        <main>
            {{ children... }}
        </main>
    </body>
    </html>
}}{0}
  ]], {
    name = i(1, "BaseLayout"),
    cssPath = i(2, "/static/css/style.css"),
    [0] = i(0)
  }, {
    strict = false,
    delimiters = "{}",
  })),
})