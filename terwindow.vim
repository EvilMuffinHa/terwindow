if exists("loaded_tersplit")
	finish
endif
let loaded_tersplit = 1

let s:TerWindow = {}


let g:TerWindow = s:TerWindow

function! s:TerWindow.GetWinTabNum()
	for tabnr in range(1, tabpagenr('$'))
		for winnr in range(1, tabpagewinnr(tabnr, '$'))
			if gettabwinvar(tabnr, winnr, 'id') is "terwindow"
				return [tabnr, winnr]
			endif
		endfor
	endfor
	return ["", ""]
endfunction

function! s:TerWindow.New()
	rightb vert term
	let w:id = "terwindow"
endfunction

function! s:TerWindow.Focus()
	let [l:tab, l:win] = s:TerWindow.GetWinTabNum()
	if l:tab ==# "" && l:win ==# ""
		call s:TerWindow.New()
	else
		execute "tabnext" l:tab
		execute l:win."wincmd w"
	endif
endfunction

function! s:TerWindow.Close()
	let [l:tab, l:win] = s:TerWindow.GetWinTabNum()
	if l:tab ==# "" && l:win ==# ""
		return
	endif
	echo s:TerWindow.GetWinTabNum()
	execute s:TerWindow.GetWinTabNum()[1] . ' wincmd w '
	execute "close"

endfunction

function! s:TerWindow.Toggle()
	let [l:tab, l:win]= s:TerWindow.GetWinTabNum()
	if l:tab ==# "" && l:win ==# ""
		call s:TerWindow.New()
	else
		call s:TerWindow.Close()
	endif

endfunction

command TerWindowClose :call g:TerWindow.Close()
command TerWindowToggle :call g:TerWindow.Toggle()
command TerWindowNew :call g:TerWindow.New()
command TerWindowFocus :call g:TerWindow.Focus()
