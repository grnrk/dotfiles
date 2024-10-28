-- Markdown prview in terminal
require('glow').setup()

require("nvim-web-devicons").setup()
-- Render-markdown settings
require('render-markdown').setup({
    heading = {
        sign = false,
        icons = { ' ', ' ', ' ', ' ', ' ' },
        -- width can be set to string of block/full to apply to all levels
        width = { 'full', 'full', 'block', 'block', 'block' },
        -- Show current settings: :so $VIMRUNTIME/syntax/hitest.vim
        -- See also: :highlight
        backgrounds = {
            -- 'RenderMarkdownH1Bg',
            'Headline3',
            'SpellRare',
            'SpellCap',
            'SpellLocal',
            'SpellLocal',
            'SpellLocal',
        },
    },
    code = {
        sign = false,
        highlight = 'BufferTabpageFill',
        highlight_inline = 'BufferTabpageFill',
    },
    link = {
        hyperlink = ' ',
        custom = {
            web = { pattern = '^http[s]?://', icon = ' ', highlight = 'RenderMarkdownLink' },
        },
    },
})

-- TreeSitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "vim", "vimdoc", "markdown", "markdown_inline", "html" },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
  },
}
