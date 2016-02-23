
function! s:ShowFactorial(num)
  echo s:Factorial(a:num)
endfunction

function! s:Factorial(num)
  return a:num > 1 ? a:num * s:Factorial(a:num - 1) : 1
endfunction

command! -nargs=1 Fact :call <SID>ShowFactorial(<f-args>)
command! -nargs=1 Hello echo "Hello! ". <q-args> 



command! -nargs=? Artisan :call <SID>Artisan(<f-args>)

function! s:Artisan(...)
  let line = 'php artisan'
  for m in a:000
     let line .= " " . m
  endfor
  let res = system(line)
  echo res
endfunction