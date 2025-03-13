"================================================================
"########################### PLUGINS ############################
call plug#begin('~/.config/nvim/plugged')

"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'altercation/vim-colors-solarized'
"Plug 'tpope/vim-surround'
"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-commentary'
"Plug 'skammer/vim-css-color'
" Plug 'sheerun/vim-polyglot'
" Plug 'dense-analysis/ale'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
"Plug 'neoclide/jsonc.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
" Plug 'Yggdroot/indentLine'
" Plug 'jiangmiao/auto-pairs'
" Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'KabbAmine/vCoolor.vim'
Plug 'xianzhon/vim-code-runner'
" Plug 'puremourning/vimspector'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'github/copilot.vim'

call plug#end()


"================================================================
"########################### SETTERS ############################
syntax enable
set nu relativenumber
set encoding=utf-8
set termguicolors
set autoindent
set shiftround
set autoread " reload file
set expandtab smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set cursorline
set clipboard+=unnamedplus
set sidescroll=5
set ttimeout
set ttimeoutlen=1
set hlsearch
filetype plugin indent on
filetype plugin on
set ttyfast
set ignorecase
set conceallevel=2
set linebreak
set title
set showmatch
set updatetime=1000
" set showcmd
set splitbelow splitright
set signcolumn=yes:1
set foldcolumn=0
set numberwidth=1
set cmdheight=1
set textwidth=80
set colorcolumn=80
set nobackup
set noswapfile
" set shortmess+=c
set showmode
" set backupdir=/temp//,.
" set directory=/temp//,.
" set complete+=kspell
" set completeopt=menuone,longest
" set completeopt-=preview

"================================================================
"########################### MAPS ###############################

let g:coc_global_extensions = ['coc-json', 'coc-git']

" Format
nnoremap <Space>f :Format <CR>

" Tirar seleção
map <space>v :noh<CR>

" Move Line
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" CodeRunner
nmap <silent> <space>r <Plug>CodeRunner

" let g:floaterm_wintype = 'split'
" let g:floaterm_keymap_new = '<leader>n'
" let g:floaterm_keymap_prev = '<leader>h'
" let g:floaterm_keymap_next = '<leader>l'
" let g:floaterm_keymap_toggle = "<leader>t"
" " let g:floaterm_position = 'bottom'
" " let g:floaterm_borderchars = '1px'
" let g:floaterm_height = 10
" " Configuration example


" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

"================================================================
"######################### COLORS ###############################
" Color
" colorscheme dracula
" hi Normal guibg=NONE
" hi CursorLineNr guibg=NONE guifg=#eeeeee
" hi CursorLineNr guibg=NONE guifg=NONE ctermfg=NONE cterm=NONE
" hi CursorLine guibg=#111111
" hi LineNr guifg=#838383 guibg=NONE
" hi SignColumn guibg=NONE
" hi Label guifg=#e285ff
" hi Identifier guifg=#A2CBFF


if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

hi Comment cterm=italic
let g:ondedark_hide_endofbuffer=1
let g:ondedark_terminal_italics=1
let g:ondedark_termcolors=256

syntax on
colorscheme onedark

if (has("termguicolors"))
  set termguicolors
  hi LineNr guifg=NONE guibg=NONE
endif

"================================================================
"####################### CONFIGURATIONS #########################

" IndentLine
let g:indentLine_enabled = 10
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_json_conceal=0
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '.'

" Configuration Color
let g:vcoolor_lowercase = 1 "Hex colors in lowercase
let g:vcoolor_disable_mappings = 1
let g:vcoolor_map = '<leader>g'

"=============== COC CONFIGURATIONS =================
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"================================================================

" " TAB selection words
" inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"
