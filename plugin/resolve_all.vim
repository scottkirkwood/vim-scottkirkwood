" Vim script to handle merge conflicts by Scott Kirkwood <scott@forusers.com>
" Example usage:
" From google3 directory:
"   gvim -p $(egrep -l '^=======$' $(git5 diff --name-only | cut -c9-)) -c ResolveAll

" Find the next merge in this file
" Uses marks x, y, z
function! ResolveFile()
  " Find next merge, if any
  let s:found = search("^=======$", "w")
  if (s:found == 0)
    return 0
  endif
  execute "mark y"

  if (search("^>>>>>>> ", "W") == 0)
    echo "Failed to find <<<<<<< line."
    return 0
  endif
  execute "mark z"

  if (search("^<<<<<<< ", "bW") == 0)
    echo "Failed to find <<<<<<< line."
    return 0
  endif
  execute "mark x"

  " Go to ======== line
  execute "normal g'y"
  " Center vertically
  execute "normal zz"

  redraw
  echo "Accept y)ours, t)heirs, b)oth; e)dit, u)ndo, q)uit: "
  let s:c = nr2char(getchar())
  if s:c == "y"
    " Delete theirs and show what's left for a bit
    execute "'y+1,'z-1d"
    redraw
    echo "Yours"
    sleep 500m

    execute "'y,'zd"
    execute "'xd"
    return 1
  elseif s:c == "t"
    " Delete yours, show what's left for a bit
    execute "'x+1,'y-1d"
    redraw
    echo "Theirs"
    execute "sleep 500m"

    execute "'x,'yd"
    execute "'zd"
    redraw
    return 2
  elseif s:c == "b"
    execute "'xd"
    execute "'yd"
    execute "'zd"
    redraw
    echo "Both"
    return 3
  elseif s:c == "n"
    echo "Next"
    return 4
  elseif s:c == "u"
    execute "normal u"
    return 5
    echo "Undo"
  elseif s:c == "e"
    echo "Edit, :ResolveAll to continue"
    return -1
  else
    redraw
    echo "Quit"
    return -2
  endif
endfunction

" Make it easier/safer to do a diff3 merge on files.
function! ResolveAll()
  let s:continue = 1
  while s:continue == 1
    " Remove normal syntax highlighting our our highlighting won't work.
    execute "syntax clear"

    " Highlight colors
    execute "highlight DiffYours ctermbg=Green guibg=#77ff77"
    execute "highlight DiffTheirs ctermbg=Red guibg=#ff7777"

    execute "syntax region DiffRegion start=/^<<<<<<< / end=/^>>>>>>> .*/ contains=DiffTheirs,DiffYours keepend"
    execute "syntax region DiffYours start=/^<<<<<<< .*/hs=e+1 end=/^=======$/he=s-1,me=s-1 contained"
    execute "syntax region DiffTheirs start=/^=======$/hs=e+1,ms=e+1 end=/^>>>>>>> /he=s-7 contained"

    let s:ok = 1
    let s:count = 0

    while s:ok > 0
      let s:ok = ResolveFile()
      let s:count = s:count + 1
    endwhile

    let s:continue = 0

    " If we we reached the end of a file
    " And user didn't hit quit...
    if (s:ok == 0 && s:count > 0)
      echo "Last one in this file w) :wq, q)uit merging: "
      let s:c = nr2char(getchar())
      if s:c == "w"
        " Write quit, maybe next buffer has more
        execute "wq"
        let s:continue = 1
      endif
    endif
  endwhile
  if s:ok != -1
    " Leave the syntax if they said 'E)dit'
    syntax clear
    syntax on
  endif
endfunction

command! ResolveAll call ResolveAll()
