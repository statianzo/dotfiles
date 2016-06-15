function! neomake#makers#ft#haxe#EnabledMakers()
    return ['haxe']
endfunction

function! neomake#makers#ft#haxe#haxe()
    return {
        \ 'exe': 'haxe',
        \ 'args': ['%:t'],
        \ 'cwd': '%:p:h',
        \ 'append_file': 0,
        \ 'errorformat': '%f:%l: characters %c-%n : %m'
        \ }
endfunction
