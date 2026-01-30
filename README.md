# mocknotes.nvim

A simple Neovim plugin for quick note-taking during your editing sessions.

## Requirements

- Neovim 0.5+

## Installation

You'll need a git repository for storing your notes. You can create a new repository on GitHub, or
any other git hosting service.

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'mockra/mocknotes',
  opts = {
      directory = "~/my_notes",
      git_repo = "git@github.com:username/notes_repo.git",
  },
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'mockra/mocknotes',
  config = function()
    require('mocknotes').setup({
      directory = "~/my_notes",
      git_repo = "git@github.com:username/notes_repo.git",
    })
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'mockra/mocknotes'

" Add to your init.vim or .vimrc after plug#end()
lua << EOF
require('mocknotes').setup({
  directory = "~/my_notes",
  git_repo = "git@github.com:username/notes_repo.git",
})
EOF
```

## License

MIT
