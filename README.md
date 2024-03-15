## Vim Events TLDR

- BufReadPre: right before reading a file, but will not work if file doesn't already exist
- BufNewFile: when new file is created, say doing 'nvim new-file', will not trigger on 'nvim' alone

## Notable Plugins

- [Trouble](https://github.com/folke/trouble.nvim) "A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing."
