
function! s:ShowFactorial(num)
  echo s:Factorial(a:num)
endfunction

function! s:Factorial(num)
  return a:num > 1 ? a:num * s:Factorial(a:num - 1) : 1
endfunction

nnoremap <silent> R :call <SID>ShowFactorial(4)<CR>