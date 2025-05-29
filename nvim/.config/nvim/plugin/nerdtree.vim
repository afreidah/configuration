"--------------------------------------------------------------
" Hide files from NERDTree with 'dd'
let g:MyNERDTreeIgnore=[] " List of ignored files
let ignoreSingleKeyMap = {
    \ 'key':           'dd',
    \ 'callback':      'MyNERDTreeIgnoreSingle',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Hide(ignore) the selected file' }
let unignoreAllKeyMap = {
    \ 'key':           'dua',
    \ 'callback':      'MyNERDTreeUnignoreAll',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Unhide all hidden(ignored) files' }
let unignoreSingleKeyMap = {
    \ 'key':           'dus',
    \ 'callback':      'MyNERDTreeUnignoreSingle',
    \ 'scope':         'Node',
    \ 'quickhelpText': 'Unhide a single hidden(ignored) file' }
augroup NERDTreeHide
  autocmd!
  autocmd VimEnter *  call NERDTreeAddKeyMap(ignoreSingleKeyMap) |
                    \ call NERDTreeAddKeyMap(unignoreAllKeyMap) |
                    \ call NERDTreeAddKeyMap(unignoreSingleKeyMap) |
                    \ call NERDTreeAddPathFilter('MyFilter') 
augroup END
"--------------------------------------------------------------------
" Ignore Single
function MyNERDTreeIgnoreSingle(node)
  setlocal modifiable
  let path = a:node['path'].str()
  if index(g:MyNERDTreeIgnore, path) != -1 | setlocal nomodifiable | return | endif
  call add(g:MyNERDTreeIgnore, path)
  call NERDTreeRender()
  setlocal nomodifiable
endfunction
"--------------------------------------------------------------------
" Unignore all
function MyNERDTreeUnignoreAll(node)
  setlocal modifiable
  let g:MyNERDTreeIgnore=[]
  call NERDTreeRender()
  setlocal nomodifiable
endfunction
"--------------------------------------------------------------------
" Unignore Single

function MyNERDTreeUnignoreSingle(node)
  setlocal modifiable
  let promptlist = ['Select File to Unhide:', '-------------------------']
  let cntr = 1
  for i in g:MyNERDTreeIgnore
    call add(promptlist, cntr . '. ' . i) | let cntr += 1
  endfor
  call inputsave() | let fileindex = (inputlist(promptlist) - 1) | call inputrestore()
  if fileindex < 0
    echom "Invalid number (Too low)" | return
  elseif fileindex > (len(g:MyNERDTreeIgnore) - 1)
    echom "Invalid number (Too high)" | return
  endif
  call remove(g:MyNERDTreeIgnore, fileindex) | call NERDTreeRender()
endfunction
"--------------------------------------------------------------------
" Ignore Filter Function
function! MyFilter(params)
  return (index(g:MyNERDTreeIgnore, a:params['path'].str()) != -1)
endfunction
