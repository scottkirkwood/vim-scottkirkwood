" -----------------------------------
"  Flip between .cc and .h, etc.
" -----------------------------------
function! SmartRewritePath(path)
python << EOF
import os
import vim

path = vim.eval('a:path')
if os.path.exists(path):
  out_path = path
elif os.path.exists(path.replace('/public/', '/')):
  out_path = path.replace('/public/', '/')
else:
  split = os.path.split(path)
  candidate = os.path.join(split[0], 'public', split[1])
  if os.path.exists(candidate):
    out_path = candidate
  else:
    out_path = path

if (not os.path.exists(out_path) and
  os.path.exists(out_path.replace('_test.', '_unittest.'))):
  out_path = out_path.replace('_test.', '_unittest.')

if out_path.endswith('.pb.h') or out_path.endswith('.pb.cc'):
  out_path = '.'.join(out_path.split('.')[:-2] + ['proto'])
  out_path = out_path.replace('blaze-genfiles/', '')

vim.command('return \'%s\'' % out_path)
EOF
endfunction

"switch between .h / -inl.h / .cc / .py / .js / _test.* / _unittest.* with ,h ,i ,c ,p ,j ,t ,u
"(portion from old mail from David Reiss)
let pattern = '\(\(_\(unit\)\?test\)\?\.\(cc\|js\|py\)\|\(-inl\)\?\.h\)$'
nmap <leader>c :edit <C-R>=SmartRewritePath(substitute(expand("%"), pattern, ".cc", ""))<CR><CR>
nmap <leader>h :edit <C-R>=SmartRewritePath(substitute(expand("%"), pattern, ".h", ""))<CR><CR>
nmap <leader>t :edit <C-R>=SmartRewritePath(substitute(expand("%"), pattern, "_test.", "") .  substitute(expand("%:e"), "h", "cc", ""))<CR><CR>
nmap <leader>p :edit <C-R>=SmartRewritePath(expand("%"))<CR><CR>

