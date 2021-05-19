" Automate Plug installation, if not present.
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

call plug#begin()
Plug 'lervag/vimtex'
	let g:tex_flavor = 'latex'
	let g:vimtex_view_method = 'zathura'
	let g:vimtex_quickfix_mode = 0
	let g:vimtex_compiler_progname = 'nvr'
	let g:vimtex_view_general_options
   		\ = '-reuse-instance -forward-search @tex @line @pdf'
	let g:vimtex_view_general_options_latexmk = '-reuse-instance -e "$pdflatex=q/pdflatex %O -shell-escape %S/"'


Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
	set rtp+=~/notes/current-course

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'dylanaraps/wal'
call plug#end()

" LaTeX conceal settings
let g:tex_superscripts = "[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts = "[0-9aehijklmnoprstuvx,+-/().]"
let g:tex_conceal="abdgm"
let g:vim_markdown_math = 1
set conceallevel=2

colorscheme wal
set background=dark
hi clear Conceal

" inkscape-figures
inoremap <C-f> <Esc>: silent exec '!inkscape-hotkeys &' <bar> : silent exec '.!inkscape-figures create "'.getline('.').'" "'.expand('%:h').'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-hotkeys &' <bar> : silent exec '!inkscape-figures edit "'.expand('%:h').'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
