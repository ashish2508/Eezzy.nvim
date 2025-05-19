# PurpleILike Theme

<a href="https://dotfyle.com/plugins/ashish2508/PurpleILike.nvim">
  <img src="https://dotfyle.com/plugins/ashish2508/PurpleILike.nvim/shield" />
</a>

## Preview

### Light Theme

![Light Theme](./assets/preview-light.png)

### Dark Theme

![Dark Theme](./assets/preview-dark.png)

## Installation

1. Using `Lazy`:

```lua
{ 'ashish2508/PurpleILike.nvim' },
```

2. Using `Packer`:

```lua
use 'ashish2508/PurpleILike.nvim'
```

## Configuration

To configure the plugin, you can call require('PurpleILike').setup({}), passing the table with the values in it. The following are the **defaults**:

```lua
require('PurpleILike').setup({
    -- NOTE: if your configuration sets vim.o.background in your configuration for Neovim,
    -- the following setting will do nothing, since it'll be overriden.
    transparent = false, -- Boolean: Sets the background to transparent
    italics = {
        comments = true, -- Boolean: Italicizes comments
        keywords = true, -- Boolean: Italicizes keywords
        functions = true, -- Boolean: Italicizes functions
        strings = true, -- Boolean: Italicizes strings
        variables = true, -- Boolean: Italicizes variables
    },
    overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
})
```

- **The `colorscheme()` function**

This function can be used to set the colorscheme in your editor, however, if it doesn't work for you, you can always use `vim.cmd.colorscheme('PurpleILike')`.

### Specifics for Some Plugins

#### Bufferline.nvim

To use the theme with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim), you can use the following configuration:

```lua
require('bufferline').setup({
    highlights = require('PurpleILike').highlights.bufferline,
})
```

#### Neo-tree.nvim

For better experience with this theme, I recommend changing the folder icons to:

```lua
require('neo-tree').setup({
  default_component_configs = {
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
    },
  }
}
```

## Contributing

Contributions are welcome, please open an issue if you encounter any bug or if you find any improvements are needed for the code, also feel free to open a PR.

## Special Thanks

- This project is based on [nvim-colorscheme-template](https://github.com/datsfilipe/nvim-colorscheme-template) by @datsfilipe, used under the MIT License.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
