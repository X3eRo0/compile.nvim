if exists("g:loaded_compile_nvim")
  finish
endif
let g:loaded_compile_nvim = 1

" Highlights
function! s:HL(name, link)
    if !hlexists(a:name)
        execute "highlight! link ".a:name." ".a:link
    endif

    return 1
endfunction

call s:HL("compileBad", "ErrorMsg")
call s:HL("compileLint", "WarningMsg")
call s:HL("compileGood", "Function")
call s:HL("compileLabel", "Identifier")
call s:HL("compileFile", "Underlined")
call s:HL("compileCommand", "Function")
call s:HL("compilePrompt", "Question")

" Variables
if !exists("g:compile#open_command")
    let g:compile#open_command = "split"
endif

if !exists("g:compile#previous_command")
    let g:compile#previous_command = ""
endif

if !exists("g:compile#auto_save")
    let g:compile#auto_save = 1
endif

sign define CompilationCurrent text=> texthl=Error linehl=CursorLine

command! -nargs=0 CompileNext call compile#jump(0)
command! -nargs=0 CompilePrev call compile#jump(1)
command! -nargs=0 Recompile call compile#restart()
command! -nargs=* -complete=file Compile call compile#start(<q-args>)
