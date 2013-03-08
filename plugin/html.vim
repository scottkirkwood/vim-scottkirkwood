" -----------------------------
"    HTML Releated
" -----------------------------

" VISUAL MODE (easy to add other HTML Tags)
vmap sb "zdi<b><C-R>z</b><ESC>  " wrap <b></b> around VISUALLY selected Text
vmap st "zdi<?= <C-R>z ?><ESC>  " wrap <?=   ?> around VISUALLY selected Text
vmap sa "zdi<a href="#"><C-R>z</a><ESC>  " wrap <a href="#">  </a> around VISUALLY selected Text

" type table,,, to get <table></table>
"imap ,,, <esc>bdwa<<esc>pa></<esc>pa><esc>F<i

function! ToStartOfBlock()
  if col('.') == col("'>") && line('.') == line("'>")
    normal! gvov
  endif
endfunction

function! ToEndOfBlock()
  if col('.') == col("'<") && line('.') == line("'<")
    normal! gvov
  endif
endfunction

function! WrapWithTag()
  call inputsave()
  let l:name = input('Enter tag: ')
  call inputrestore()
  if strlen(l:name) > 0
    call ToEndOfBlock()
    execute "normal! a</" . l:name . ">\<Esc>gvov"
    call ToStartOfBlock()
    execute "normal! i<" . l:name . ">\<ESC>"
    echo name
  endif
endfunction
vmap sw <ESC>:call WrapWithTag()<CR>

" Config HTML.vim
let g:html_tag_case = 'lowercase'
let g:no_html_tab_mapping = 'yes'
let g:html_authorname  = 'Scott Kirkwood'
let g:html_authoremail = 'scott@forusers.com'
