" mocknotes.vim - Simple note-taking plugin
" Maintainer: David Ratajczzak
" License: MIT

if exists('g:loaded_mocknotes')
  finish
endif
let g:loaded_mocknotes = 1

command! -range MockNotesYank lua require('mocknotes.yank').yank_to_note()
command! MockNotesSave lua require('mocknotes.save').save_all()
command! MockNotesNew lua require('mocknotes.new_note').new_note()
