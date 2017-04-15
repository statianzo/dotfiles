function! neomake#makers#ft#haxe#EnabledMakers()
    return ['haxe']
endfunction

function! neomake#makers#ft#haxe#haxe()
  return {
      \ 'exe': 'haxe',
      \ 'args': ['build.hxml'],
      \ 'append_file': 0,
      \ 'errorformat': '%f:%l: %m'
      \ }
endfunction
