setlocal commentstring=#\ %s

if !has("python3")
    finish
endif

execute 'py3file ' . expand('<sfile>:p:h') . "/../python/complete.py"

fun! GDScriptComplete(findstart, base)
    if a:findstart == 1
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '[a-zA-Z0-9_]'
            let start -= 1
        endwhile
        return start
    else
        py3 GDScriptComplete()
        if exists("gdscript_completions")
            return gdscript_completions
        else
            return []
    endif
endfun

set omnifunc=GDScriptComplete
