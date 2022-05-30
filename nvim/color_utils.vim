" ------------------ Color Theme Utilities -------------------

" Make the gutter (and other edge visual elements) color match the rest of the editor
function GutterSame()
	highlight LineNr ctermbg=NONE guibg=NONE
	highlight TabLineFill ctermbg=NONE ctermfg=245 guibg=NONE guifg=white
	highlight StatusLine ctermbg=NONE ctermfg=245 guibg=NONE guifg=white
endfunction

" Ensure correct contrast ratio for visual selections.
function FixSelectionBackground()
	hi Visual ctermbg=236 ctermfg=NONE guibg=#272c42 guifg=NONE
	hi VisualNOS ctermbg=236 ctermfg=NONE guibg=#272c42 guifg=NONE
	hi IncSearch ctermbg=236 ctermfg=NONE guibg=#272c42 guifg=NONE
endfunction

" Creates neutral gray Pmenu, suitable for nearly any dark theme
function FixPmenuBackgroundDark()
	hi Pmenu ctermbg=236 ctermfg=251 guibg=#3d425b guifg=#c6c8d1
	hi PmenuSbar ctermbg=236 ctermfg=NONE guibg=#3d425b guifg=NONE
	hi PmenuSel ctermbg=240 ctermfg=255 guibg=#5b6389 guifg=#eff0f4
	hi PmenuThumb ctermbg=251 ctermfg=NONE guibg=#c6c8d1 guifg=NONE
endfunction

function FixErrorBackgrounds()
	hi Error ctermbg=254 ctermfg=125 guibg=#e8e9ec guifg=#cc517a
	hi ErrorMsg ctermbg=254 ctermfg=125 guibg=#e8e9ec guifg=#cc517a
endfunction

" Remove background color if you want a transparent vim
function ClearBackground()
	highlight ColorColumn ctermbg=DarkGray
	highlight Normal ctermbg=NONE guibg=NONE
	highlight NonText ctermbg=NONE guibg=NONE
	highlight EndOfBuffer ctermbg=NONE guibg=NONE
endfunction

" Some themes have a very low-contrast comment color, so fix that.
" Colors taken from gruvbox-material
function FixComments()
	highlight Comment cterm=italic ctermfg=245 gui=italic guifg=#928374
endfunction

function BrightenBlackMetal()
	" In general, I like the black metal themes, but I find them too low
	" contrast.  When I use them, call this function to brighten things up.
	hi Normal guifg=#ffffff
	hi Function guifg=#ffffff
	hi Keyword guifg=#ffffff
	call FixComments()
endfunction

function AllFixes()
	call GutterSame()
	call FixSelectionBackground()
	call FixPmenuBackgroundDark()
	"call ClearBackground()
	"call BrightenBlackMetal()
endfunction

"call AllFixes()

"call GutterSame()
"call FixComments()
"call FixSelectionBackground()
"call FixPmenuBackgroundDark()
"call ClearBackground()
