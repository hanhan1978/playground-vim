
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


inoremap <F5> <C-R>=<SID>MyFunc()<CR>
function! s:MyFunc()
  call complete(col('.'), ['Laravel\Socialite\SocialiteServiceProvider','Laravel\Socialite\Two\InvalidStateException', 'Larovel'])
  return ''
endfunction

fun! CompleteMonths(findstart, base)
  echomsg 'mes1 => ' . string(a:base)
  echomsg 'mes2 => ' . string(a:findstart)
  echomsg 'unko1'
  if a:findstart
    echomsg 'unko2'
    " 単語の始点を検索する
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    echomsg 'mes3 => ' . string(a:base)
    let res = []
    for m in split('Laravel\Socialite\SocialiteServiceProvider Laravel\Socialite\Two\InvalidStateException Larovel')
      if m =~ '^\v' . a:base
        echomsg 'mes4 => ' . string(a:base)
        call add(res, m)
      endif
    endfor
    return res
  endif
endfun

set completefunc=CompleteMonths